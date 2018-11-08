package com.bcos.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bcos.dao.UsageManageDAO;
import com.bcos.po.Brand;
import com.bcos.po.Usage;
import com.bcos.po.Series;

public class UsageManageDAOImpl extends BaseDAOImpl implements UsageManageDAO {
	public List<Usage> queryAll(){
		List<Usage> list = new ArrayList();
		try{
			String hql="from Usage where deleted = 0 order by usageName"; 
			list =  this.getHibernateTemplate().find(hql);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public Usage editUsage(String id){
		try{
			Long usageId = Long.parseLong(id);
			Usage resultPO = (Usage)this.getHibernateTemplate().get(Usage.class,usageId);
			this.getHibernateTemplate().getSessionFactory().close(); 
			return resultPO;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveUsage(Usage usage){
		// TODO Auto-generated method stub
		try{
			this.getHibernateTemplate().saveOrUpdate(usage);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public boolean isUsed(Long id){
		List<Series> list = new ArrayList();
		boolean isUsed = false;
		try{
			StringBuffer hql= new StringBuffer();
			//查看产品系列表中是否有关联到该产品品牌下的记录
			hql.append("from Series where deleted = 0 and usage.id = "+id); 
			list =  (List<Series>)this.getHibernateTemplate().find(hql.toString());
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
	
	public List<Usage> queryListByClient(Long clientId){
		List<Usage> list = new ArrayList();
		try{
			String hql="select distinct u from Usage u,Model m,ClientToSeries c " +
					"where u.deleted = 0 " +
					"and c.deleted = 0 " +
					"and m.deleted = 0 " +
					"and u.id = m.usage.id " +
					"and m.id = c.model.id " +
					"and c.client.id="+clientId+
							" order by u.usageName"; 
			list =  this.getHibernateTemplate().find(hql);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
}
