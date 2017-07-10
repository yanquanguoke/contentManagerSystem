/**
 * 
 */
package com.yxb.cms.architect.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONObject;


/**
 * 综合系统管理平台业返回状态码和状态描述<br>
 * 状态码概况:  状态码为4位    分割为2部分 状态码第一位为 模块信息，后面三位为 范围信息<br>
 * 模块信息:    0.通用（如系统）  1.系统管理(角色、资源、用户)等<br>
 * 范围信息:    1.操作成功范围 001-299，2.操作失败范围 301-599，3.异常范围 601-999	 特殊：0000 成功，9999异常<br>
 * 如: 状态码  1001  代表的是系统管理相关 001 代表操作成功信息<br>
 * 			 1301    代表的是系统管理相关 301  代表操作失败信息<br>
 *           1601  代表的是系统管理相关 601 代表操作异常信息 
 * 
 * 
 * @date   2016年8月15日 下午2:48:11
 * @author yangxiaobing@tomstaff.com
 *
 */
public enum BussinessCodeUtil {
	// 成功    
	GLOBAL_SUCCESS("0000","成功"),
	//失败
	GLOBAL_ERROR("9999", "系统正在维护中,请稍后再试!"),
	
	/**通用 */
	GLOBAL_LOGIN_FAIL("0301","用户名或密码不匹配"),
	
	GLOBAL_LOGIN_ERROR("0601","系统登录异常"),

	
	
	
	RES_SAVE_ERROR("1601","资源信息保存失败"),
	ROLE_SAVE_ERROR("1602","角色信息保存失败"),
	USER_SAVE_ERROR("1603","用户信息保存失败"),
	USER_ROLE_SAVE_ERROR("1604","用户分配角色信息失败"),
	USER_FAIL_ERROR("1605","失效用户失败,程序异常"),
	ROLE_FAILK_ERROR("1606","失效角色失败,程序异常"),
	RES_FAILK_ERROR("1607","失效资源失败,程序异常")
	;
	
	

	private BussinessCodeUtil(String code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	private String code;

	private String msg;
	

	
	
	public String toJson(){						
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code",code);
		result.put("msg",msg);
		result.put("flag",getFalg());	
		return JSONObject.fromObject(result).toString();		
	}
	
	/**
	 * 返回json格式{code:xxxx,msg:xxxx,data:xxxx}
	 * @param data 其他补充信息
	 * @return
	 */
	public  String toJson(Object data){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code",code);
		result.put("msg",msg);
		result.put("returnData",data);
		result.put("flag",getFalg());	
		return JSONObject.fromObject(result).toString();				
	}
	
	
	/**
	 * 
	 * @return
	 */
	public Map<String, Object> toMap(){						
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code",code);
		result.put("msg",msg);
		result.put("flag",getFalg());	
		return result;		
	}
	
	/**
	 *  MAP
	 * @param data 其他补充信息
	 * @return
	 */
	public  Map<String, Object> toMap(Object data){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code",code);
		result.put("msg",msg);
		result.put("returnData",data);
		result.put("flag",getFalg());	
		return result;				
	}
	
	
	/**
	 * 返回指定数据flag信息
	 * flag信息  success,fail,error
	 * @return
	 */
	public  String getFalg(){
		String flag = null;
		Integer codeInfo = Integer.parseInt(code.substring(1));
		if(codeInfo < 300){
			flag="success";
		}else if (codeInfo >300 && codeInfo < 600){
			flag="fail";
		}else if(codeInfo > 600){
			flag="error";
		}		
		return flag;			
	}
	
	
	
	public static  BussinessCodeUtil getByCode(String code){
		for(BussinessCodeUtil mc : values()){
			if(mc.getCode().equals(code)){
				return mc;
			}
		}
		return null;
	}
	
	
	public static String getMsgByCode(String code){
		for(BussinessCodeUtil mc : values()){
			if(mc.getCode().equals(code)){
				return mc.getMsg();
			}
		}
		return null;
	}
			
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	//带有占位符的描述处理
	public  String toJsonStr(String[] arr){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code",code);
		result.put("msg",fillStringByArgs(msg,arr));
		result.put("flag",getFalg());	
		return JSONObject.fromObject(result).toString();				
	}
	
	//带有占位符的描述处理
	public static String fillStringByArgs(String str,String[] arr){
        Matcher m=Pattern.compile("\\{(\\d)\\}").matcher(str);
        while(m.find()){
            str=str.replace(m.group(),arr[Integer.parseInt(m.group(1))]);
        }
        return str;
    }
	
	
	
	
	public static void main(String[] args){
		
		for (BussinessCodeUtil msg : values()) {
			System.out.println(msg.toJson());
			
			
			
		}			
	}
}
