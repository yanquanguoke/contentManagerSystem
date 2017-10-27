/**
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
 *
 * Copyright 2017 © yangxiaobing, 873559947@qq.com
 *
 * This file is part of contentManagerSystem.
 * contentManagerSystem is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * contentManagerSystem is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with contentManagerSystem.  If not, see <http://www.gnu.org/licenses/>.
 *
 * 这个文件是contentManagerSystem的一部分。
 * 您可以单独使用或分发这个文件，但请不要移除这个头部声明信息.
 * contentManagerSystem是一个自由软件，您可以自由分发、修改其中的源代码或者重新发布它，
 * 新的任何修改后的重新发布版必须同样在遵守GPL3或更后续的版本协议下发布.
 * 关于GPL协议的细则请参考COPYING文件，
 * 您可以在contentManagerSystem的相关目录中获得GPL协议的副本，
 * 如果没有找到，请连接到 http://www.gnu.org/licenses/ 查看。
 *
 * - Author: yangxiaobing
 * - Contact: 873559947@qq.com
 * - License: GNU Lesser General Public License (GPL)
 * - source code availability: http://git.oschina.net/yangxiaobing_175/contentManagerSystem
 */
package com.yxb.cms.architect.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpClientParams;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.httpclient.protocol.Protocol;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


/**
 *  处理http和https协议请求,根据请求url判断协议类型
 *
 * @author yangxiaobing
 * @date 2017/9/6
 */
public class HttpUtil {



	private static Logger logger = LogManager.getLogger(HttpUtil.class);
	private static final int HTTP_DEFAULT_TIMEOUT  = 15000;               //超时时间默认为15秒  
	private static final int HTTP_SOCKET_TIMEOUT  =  30000;               //连接状态下没有收到数据的话强制断时间为30秒  
	private static final int MAX_TOTAL_CONNECTIONS = 500;                 //最大连接数
	private static final int CONN_MANAGER_TIMEOUT = 500;                  //该值就是连接不够用的时候等待超时时间，一定要设置，而且不能太大
	
	private static MultiThreadedHttpConnectionManager httpConnectionManager = new MultiThreadedHttpConnectionManager();
	//接口调用频繁，结果出现了很多ConnectTimeoutException 配置优化，共用HttpClient，减少开销
	static {              
	    //每主机最大连接数和总共最大连接数，通过hosfConfiguration设置host来区分每个主机  
	    //client.getHttpConnectionManager().getParams().setDefaultMaxConnectionsPerHost(8);
		httpConnectionManager.getParams().setMaxTotalConnections(MAX_TOTAL_CONNECTIONS);      
		httpConnectionManager.getParams().setConnectionTimeout(HTTP_DEFAULT_TIMEOUT);//连接超时时间
		httpConnectionManager.getParams().setSoTimeout(HTTP_SOCKET_TIMEOUT);         //连接状态下没有收到数据的话强制断时间
		httpConnectionManager.getParams().setLongParameter(HttpClientParams.CONNECTION_MANAGER_TIMEOUT, CONN_MANAGER_TIMEOUT);
		//是否计算节省带宽
		httpConnectionManager.getParams().setTcpNoDelay(true);		 
	    //延迟关闭时间
		httpConnectionManager.getParams().setLinger(0);
	    //失败的情况下会默认进行3次尝试,成功之后不会再尝试    ------关闭
		httpConnectionManager.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(0,false));		
	}
    	
	
	/**
	 * 构建 httpsclient 请求
	 * @param reqType  1.http  2.https
	 * @return
	 */
	private static HttpClient getHttpClient(){
		HttpClient httpClient =  new HttpClient(httpConnectionManager);		
		httpClient.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,"UTF-8");
       return httpClient;		
	}
	
	
    
    
    /**
     * POST请求统一入口
     */
	public static String post(String url, Map<String, Object> paramMap) {
		logger.info("===>>>调用[post]接口开始...===>>> URL:"+url);
    	Long beginTime = System.currentTimeMillis();	
        if (StringUtils.isEmpty(url)) {
            return null;
        }
        String result = null;
        if (startsWithIgnoreCase(url, "https")) {
            result = httpsPost(url, paramMap,"UTF-8");
        } else if (startsWithIgnoreCase(url, "http")) {
            result = httpPost(url, paramMap,"UTF-8");
        } else {
            logger.warn("http url format error!");
        }
        logger.info("===>>>调用[post]接口结束   ===>>>URL:"+url+",耗时:"+ (System.currentTimeMillis() - beginTime)+ "毫秒");  
        return result;
    }

 
    /**
     * GET请求统一入口
     */
	public static String get(String url) {
		logger.info("===>>>调用[get]接口开始...===>>> URL:"+url);
    	Long beginTime = System.currentTimeMillis();	
        if (StringUtils.isEmpty(url)) {
            return null;
        }
        String result = null;
        if (startsWithIgnoreCase(url, "https")) {
            result = httpsGet(url,"UTF-8");
        } else if (startsWithIgnoreCase(url, "http")) {
            result = httpGet(url,"UTF-8");
        } else {
            logger.warn("http url format error!");
        }
        logger.info("===>>>调用[get]接口结束   ===>>>URL:"+url+",耗时:"+ (System.currentTimeMillis() - beginTime)+ "毫秒");  
        return result;
    }

    private static String httpPost(String url, Map<String, Object> paramMap, String encoding) {   	
        String content = null;
        if (paramMap == null) {
            paramMap = new HashMap<String, Object>();
        }
        logger.info("http param:" + paramMap.toString());
        HttpClient httpClient = getHttpClient();
        PostMethod method = new PostMethod(url);

        if (!paramMap.isEmpty()) {
            for (Map.Entry<String, ?> entry : paramMap.entrySet()) {
                method.addParameter(new NameValuePair(entry.getKey(), entry.getValue().toString()));
            }
        }
        try {
            httpClient.executeMethod(method);
            logger.info("http status : " + method.getStatusLine().getStatusCode());
            content = new String(method.getResponseBody(), encoding);
            logger.info("http response : [" + content + "]");
        } catch (Exception e) {
            logger.error("发起http请求失败[" + url + "]" + ",param" + paramMap.toString(), e);
        } finally {
            method.releaseConnection();
            httpClient.getHttpConnectionManager().closeIdleConnections(0);
        }
        return content;
    }

    private static String httpsPost(String url, Map<String, Object> paramMap, String encoding) {
        String content = null;
        HttpClient httpsClient = getHttpClient();
        Protocol myhttps = new Protocol("https", new MySSLProtocolSocketFactory(), 443);
        Protocol.registerProtocol("https", myhttps);
        PostMethod method = new PostMethod(url);
        if (paramMap != null && !paramMap.isEmpty()) {
            for (Map.Entry<String, Object> entry : paramMap.entrySet()) {
                if (null != entry.getValue()) {
                    method.addParameter(new NameValuePair(entry.getKey(), entry.getValue().toString()));
                }
            }
            logger.info("https param : " + paramMap.toString());
        }
        try {
            httpsClient.executeMethod(method);
            logger.info("https status :" + method.getStatusLine().getStatusCode());
            if (method.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                content = new String(method.getResponseBody(), encoding);
                logger.info("https response : [" + content + "]");
            }
        } catch (Exception e) {
            logger.error("https request failed. url : [" + url + "]" + ", param : [" + paramMap + "]", e);
        } finally {
            method.releaseConnection();
            httpsClient.getHttpConnectionManager().closeIdleConnections(0);
        }        
        return content;
    }

    
    
    private static String httpGet(String url, String encoding) {
        HttpClient httpClient = getHttpClient();
        GetMethod method = new GetMethod(url);
        String result = null;
        try {
            httpClient.executeMethod(method);
            int status = method.getStatusCode();
            if (status == HttpStatus.SC_OK) {
                result = method.getResponseBodyAsString();
            } else {
                logger.error("Method failed: " + method.getStatusLine());
            }
        } catch (HttpException e) {
            // 发生致命的异常，可能是协议不对或者返回的内容有问题
            logger.error("Please check your provided http address!");
            logger.error(e, e);
        } catch (IOException e) {
            // 发生网络异常
            logger.error("发生网络异常！");
            logger.error(e, e);
        } finally {
            // 释放连接
            method.releaseConnection();
            httpClient.getHttpConnectionManager().closeIdleConnections(0);
        }
        return result;
    }

    private static String httpsGet(String url, String encoding) {
        HttpClient httpsClient = getHttpClient();//HttpConnectionManager.alwaysClose=true
        Protocol myhttps = new Protocol("https", new MySSLProtocolSocketFactory(), 443);
        Protocol.registerProtocol("https", myhttps);
        GetMethod method = new GetMethod(url);
        String content = null;
        try {
            httpsClient.executeMethod(method);
            logger.info("https status : " + method.getStatusLine().getStatusCode());
            if (method.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                content = new String(method.getResponseBody(), encoding);
                logger.info("https response : [" + content + "]");
            }
        } catch (Exception e) {
            logger.error("https request failed. url : [" + url + "]", e.getCause());
        } finally {
            method.releaseConnection();
            httpsClient.getHttpConnectionManager().closeIdleConnections(0);
        }
        return content;
    }

    
    
    private static boolean startsWithIgnoreCase(String origin, String prefix) {
        int len = prefix.length();
        if (len == 0 || origin.length() < len) {
            return false;
        }
        while (len-- > 0) {
            char a = origin.charAt(len);
            char b = prefix.charAt(len);
            if (a == b || Character.toUpperCase(a) == Character.toUpperCase(b)) {
                continue;
            }
            return false;
        }
        return true;
    }


    
}
