package com.bcos.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bcos.dao.SizeManageDAO;
import com.bcos.po.Model;
import com.bcos.po.Size;

public class SizeManageDAOImpl extends BaseDAOImpl implements SizeManageDAO {
	public List<Size> queryAll(){
		List<Size> list = new ArrayList();
		try{
			String hql="from Size where deleted = 0 order by sizeName"; 
			list =  this.getHibernateTemplate().find(hql);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public Size editSize(String id){
		try{
			Long sizeId = Long.parseLong(id);
			Size resultPO = (Size)this.getHibernateTemplate().get(Size.class,sizeId);
			this.getHibernateTemplate().getSessionFactory().close(); 
			return resultPO;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveSize(Size size){
		// TODO Auto-generated method stub
		try{
			this.getHibernateTemplate().saveOrUpdate(size);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public boolean isUsed(Long id){
		List<Model> list = new ArrayList();
		boolean isUsed = false;
		try{
			StringBuffer hql= new StringBuffer();
			//查看产品系列表中是否有关联到该产品品牌下的记录
			hql.append("from Model where deleted = 0 and size.id = "+id); 
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
	
	public List<Size> queryListByClient(Long clientId){
		List<Size> list = new ArrayList();
		try{
			String hql="select distinct s from Size s,Model m,ClientToSeries c " +
					"where s.deleted = 0 " +
					"and c.deleted = 0 " +
					"and m.deleted = 0 " +
					"and s.id = m.size.id " +
					"and m.id = c.model.id " +
					"and c.client.id="+clientId+
							" order by s.sizeName"; 
			list =  this.getHibernateTemplate().find(hql);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
}
