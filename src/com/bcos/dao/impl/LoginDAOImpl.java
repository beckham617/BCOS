package com.bcos.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bcos.dao.LoginDAO;
import com.bcos.po.User;

public class LoginDAOImpl extends BaseDAOImpl implements LoginDAO {

	public List<User> checkUser(User user){
		List<User> list = new ArrayList();
		try{
			if(user!=null && user.getUserCode()!=null && user.getPassword()!=null){
				String hql="from User where deleted = 0 and userCode='"+user.getUserCode()+"'"; 
				list =  this.getHibernateTemplate().find(hql);
				this.getHibernateTemplate().getSessionFactory().close(); 
				if(list.size()>0){//存在该用户，进行密码匹配校验
					hql="from User where deleted = 0 and" +
							" userCode='"+user.getUserCode()+
							"' and password = '"+user.getPassword()+
							"'"; 
					list =  this.getHibernateTemplate().find(hql);
					this.getHibernateTemplate().getSessionFactory().close(); 
				}else{
					return null;//无此用户
				}
			}else{
				return null;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
}
