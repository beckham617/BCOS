package com.bcos.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bcos.dao.UserManageDAO;
import com.bcos.po.Model;
import com.bcos.po.User;

public class UserManageDAOImpl extends BaseDAOImpl implements UserManageDAO {
	public List<User> queryAll(Long clientId,int userLevelId){
		List<User> list = new ArrayList();
		try{
			StringBuffer hql= new StringBuffer();
			hql.append("from User where deleted = 0 "); 
			if(clientId!=null && clientId>0){
				hql.append(" and client.id = "+clientId);
			}
			if(userLevelId>0){
				hql.append(" and userLevel = "+userLevelId);
			}
			hql.append(" order by userLevel,client.clientName,userName ");
			list =  (List<User>)this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public void saveUser(User user){
		try{
			this.getHibernateTemplate().saveOrUpdate(user);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public User editUser(String id){
		try{
			Long userId = Long.parseLong(id);
			User resultPO = (User)this.getHibernateTemplate().get(User.class,userId);
			this.getHibernateTemplate().getSessionFactory().close(); 
			return resultPO;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean isUsed(Long id){
		List<Model> list = new ArrayList();
		boolean isUsed = false;
		try{
			StringBuffer hql= new StringBuffer();
			//查看产品系列表中是否有关联到该产品品牌下的记录
			hql.append("from Model where deleted = 0 and user.id = "+id); 
			list =  (List<Model>)this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
			if(list!=null && list.size()>0){//该记录被占用
				isUsed = true;
				return isUsed;
			}
			//该记录未被占用
			return isUsed;
		}catch(Exception e){
			e.printStackTrace();
			return true;
		}
	}
	
	public boolean isExistSameCode(User user){
		List<User> list = new ArrayList();
		boolean isExist = false;
		try{
			StringBuffer hql= new StringBuffer();
			//查看产品系列表中是否有关联到该产品品牌下的记录
			hql.append("from User where deleted = 0 and userCode = '"+user.getUserCode()+"' and id is not "+user.getId()); 
			list =  (List<User>)this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
			if(list!=null && list.size()>0){//该记录被占用
				isExist = true;
				return isExist;
			}
			//该记录未被占用
			return isExist;
		}catch(Exception e){
			e.printStackTrace();
			return true;
		}
	}
	
	public User getUserByCode(String userCode){
		List<User> list = new ArrayList();
		User user = new User();
		try{
			StringBuffer hql= new StringBuffer();
			hql.append("from User where deleted = 0 and userCode = '"+userCode+"'"); 
			list =  (List<User>)this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
			if(list!=null && list.size()>0){//该记录被占用
				user = list.get(0);
				return user;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
}
