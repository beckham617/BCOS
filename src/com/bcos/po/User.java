package com.bcos.po;

import com.bcos.util.Constant;

public class User extends BasePO {
	private String userCode;
	private String userName;
	private String password;
	private int userLevel;
	private Client client;
	
	private String newPassword;
	private String reNewPassword;
	
	private String strUserLevel;
	
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public String getStrUserLevel() {
		this.strUserLevel = Constant.User.getName(this.userLevel);
		return strUserLevel;
	}
	public void setStrUserLevel(String strUserLevel) {
		this.strUserLevel = strUserLevel;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getReNewPassword() {
		return reNewPassword;
	}
	public void setReNewPassword(String reNewPassword) {
		this.reNewPassword = reNewPassword;
	}
	
}
