/**
 * 
 */
package com.yxb.cms.architect.constant;

/**
 * 后台管理系统平台业返回状态码和状态描述<br>
 * 状态码概况:  状态码为4位    分割为2部分 状态码第一位为 模块信息，后面三位为 范围信息<br>
 * 模块信息:    0.通用（如系统）  1.系统管理(角色、资源、用户)等<br>
 * 范围信息:    1.操作成功范围 001-500，2.操作失败范围 501-999 特殊：0000 成功，9999异常<br>
 * 
 * @author yangxiaobing
 * @date   2016/8/15
 *
 *
 */
public enum BussinessCode {
	// 成功
	GLOBAL_SUCCESS("0000","成功"),
	//失败
	GLOBAL_ERROR("9999", "系统正在维护中,请稍后再试!"),



	/**通用 */
    GLOBAL_LOGIN_NAME_NULL("0501","用户名不能为空"),
    GLOBAL_LOGIN_PASS_NULL("0502","密码不能为空"),

	GLOBAL_LOGIN_FAIL("0503","用户名或密码不匹配"),

	GLOBAL_LOGIN_ERROR("0504","系统登录异常"),




	RES_SAVE_ERROR("1501","资源信息保存失败"),
	ROLE_SAVE_ERROR("1502","角色信息保存失败"),
	USER_SAVE_ERROR("1503","用户信息保存失败"),
	USER_ROLE_SAVE_ERROR("1504","用户分配角色信息失败"),
	USER_FAIL_ERROR("1505","失效用户失败,程序异常"),
	ROLE_FAILK_ERROR("1506","失效角色失败,程序异常"),
	RES_FAILK_ERROR("1507","失效资源失败,程序异常")
	;

	BussinessCode(String code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	private String code;

	private String msg;
	

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

}
