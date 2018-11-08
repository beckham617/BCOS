package com.bcos.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bcos.dao.ClientManageDAO;
import com.bcos.po.Client;
import com.bcos.po.OrderList;
import com.bcos.po.Series;

public class ClientManageDAOImpl extends BaseDAOImpl implements ClientManageDAO {
	public List<Client> queryAll(){
		List<Client> list = new ArrayList();
		try{
			String hql="from Client where deleted = 0 order by clientName"; 
			list =  this.getHibernateTemplate().find(hql);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public Client editClient(String id){
		try{
			Long clientId = Long.parseLong(id);
			Client resultPO = (Client)this.getHibernateTemplate().get(Client.class,clientId);
			this.getHibernateTemplate().getSessionFactory().close(); 
			return resultPO;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveClient(Client client){
		// TODO Auto-generated method stub
		try{
			this.getHibernateTemplate().saveOrUpdate(client);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public boolean isUsed(Long id){
		List<Series> list1 = new ArrayList();
		List<OrderList> list2 = new ArrayList();
		boolean isUsed = false;
		try{
			StringBuffer hql= new StringBuffer();
			//查看产品系列表中是否有关联到该产品品牌下的记录
			hql.append("from User where deleted = 0 and client.id = "+id); 
			list1 =  (List<Series>)this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
			if(list1!=null && list1.size()>0){//该记录被占用
				isUsed = true;
				return isUsed;
			}
			hql.append("from OrderList where deleted = 0 and client.id = "+id); 
			list2 =  (List<OrderList>)this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
			if(list2!=null && list2.size()>0){//该记录被占用
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
}
