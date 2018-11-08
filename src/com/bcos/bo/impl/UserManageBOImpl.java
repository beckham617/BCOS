package com.bcos.bo.impl;

import java.util.List;

import com.bcos.bo.UserManageBO;
import com.bcos.dao.UserManageDAO;
import com.bcos.po.User;
import com.bcos.util.Constant;

public class UserManageBOImpl extends BaseBOImpl implements UserManageBO {
	private UserManageDAO userManageDAO;
	
	public List<User> queryAll(Long clientId,int userLevelId){
		userManageDAO = Constant.getUserManageDAO();
		return userManageDAO.queryAll(clientId,userLevelId);
	}
	
	public User editUser(String id){
		try{
			userManageDAO = Constant.getUserManageDAO();
			return userManageDAO.editUser(id); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveUser(User user){
		userManageDAO = Constant.getUserManageDAO();
		userManageDAO.saveUser(user);
	}

	//判断是否被占用
	public boolean isUsed(Long id){
		try{
			userManageDAO = Constant.getUserManageDAO();
			return userManageDAO.isUsed(id); 
		}catch(Exception e){
			e.printStackTrace();
			return true;
		}
	}
	
	//判断登录名是否重复
	public boolean isExistSameCode(User user){
		try{
			userManageDAO = Constant.getUserManageDAO();
			return userManageDAO.isExistSameCode(user); 
		}catch(Exception e){
			e.printStackTrace();
			return true;
		}
	}
	
	public User getUserByCode(String userCode){
		try{
			userManageDAO = Constant.getUserManageDAO();
			return userManageDAO.getUserByCode(userCode); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public UserManageDAO getUserManageDAO() {
		return userManageDAO;
	}

	public void setUserManageDAO(UserManageDAO userManageDAO) {
		this.userManageDAO = userManageDAO;
	}
	
}
