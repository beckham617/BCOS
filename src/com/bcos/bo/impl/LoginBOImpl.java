package com.bcos.bo.impl;

import java.util.List;

import com.bcos.bo.LoginBO;
import com.bcos.dao.LoginDAO;
import com.bcos.po.User;
import com.bcos.util.Constant;

public class LoginBOImpl extends BaseBOImpl implements LoginBO {
	private LoginDAO loginDAO;
	
	public LoginDAO getLoginDAO() {
		return loginDAO;
	}

	public void setLoginDAO(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}

	public List<User> checkUser(User user){
		loginDAO = Constant.getLoginDAO();
		return loginDAO.checkUser(user);
	}
}
