/**
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
 * <p>
 * Copyright 2017 © yangxiaobing, 873559947@qq.com
 * <p>
 * This file is part of contentManagerSystem.
 * contentManagerSystem is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * <p>
 * contentManagerSystem is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * <p>
 * You should have received a copy of the GNU Lesser General Public License
 * along with contentManagerSystem.  If not, see <http://www.gnu.org/licenses/>.
 * <p>
 * 这个文件是contentManagerSystem的一部分。
 * 您可以单独使用或分发这个文件，但请不要移除这个头部声明信息.
 * contentManagerSystem是一个自由软件，您可以自由分发、修改其中的源代码或者重新发布它，
 * 新的任何修改后的重新发布版必须同样在遵守GPL3或更后续的版本协议下发布.
 * 关于GPL协议的细则请参考COPYING文件，
 * 您可以在contentManagerSystem的相关目录中获得GPL协议的副本，
 * 如果没有找到，请连接到 http://www.gnu.org/licenses/ 查看。
 * <p>
 * - Author: yangxiaobing
 * - Contact: 873559947@qq.com
 * - License: GNU Lesser General Public License (GPL)
 * - source code availability: http://git.oschina.net/yangxiaobing_175/contentManagerSystem
 */
package com.yxb.cms.service;

import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.dao.DataCleaningMapper;
import com.yxb.cms.dao.SystemLogMapper;
import com.yxb.cms.domain.dto.DataCollectDto;
import com.yxb.cms.domain.vo.DataCleaning;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据清洗Service
 *
 * @author yangxiaobing
 * @date 2017/9/18
 */

@Service
public class DataCleaningService {

    private Logger log = LogManager.getLogger(DataCleaningService.class);

    @Autowired
    private DataCleaningMapper dataCleaningMapper;

    @Autowired
    private SystemLogMapper systemLogMapper;

    /**
     * 批量插入用户访问量清洗数据
     * @throws Exception
     */
    @Transactional
    public void insertDataCleanBatchByLogin() throws Exception {
        long start = System.currentTimeMillis();
        try {
            //查询7天用户登陆数据量
            List<DataCollectDto> listDto = systemLogMapper.selectDataCollectListByLog();
            log.info("用户访问量数据清洗开始,数据量:"+listDto.size());
            if(null != listDto && !listDto.isEmpty()){
                List<DataCleaning> list = new ArrayList<>();
                for (DataCollectDto dataCollectDto : listDto) {
                    DataCleaning clean = new DataCleaning();
                    clean.setDataType(BusinessConstants.CLEAN_DATA_TYPE_1.getCode());
                    clean.setDataTime(dataCollectDto.getDataTime());
                    clean.setDataCount(dataCollectDto.getDataCount());
                    list.add(clean);
                }
                dataCleaningMapper.insertDataCleanBatch(list);
            }

        } catch (Exception e) {
            log.error("用户访问量数据清洗方法内部错误", e);
            throw e;
        } finally {
            log.info("用户访问量数据清洗结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }

    }

    /**
     * 查询用户访问量,echart图表展示
     * @return
     */
    public String selectEchartsByLoginInfo(){
        Map<String,Object> map = new HashMap<>();
        List<DataCleaning> dataCleanings =  dataCleaningMapper.selectDataCleanListByLoginInfo();
        if(null != dataCleanings && !dataCleanings.isEmpty()){
            List xAxisDatas = new ArrayList();
            List seriesDatas = new ArrayList();
            for (DataCleaning dataCleaning : dataCleanings) {
                xAxisDatas.add(dataCleaning.getDataTime());
                seriesDatas.add(dataCleaning.getDataCount());
            }
            map.put("xAxisData",xAxisDatas);
            map.put("seriesData",seriesDatas);
        }
        return Json.toJson(map);
    }

}
