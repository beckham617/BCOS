package com.bcos.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bcos.dao.BrandManageDAO;
import com.bcos.po.Brand;
import com.bcos.po.Series;

public class BrandManageDAOImpl extends BaseDAOImpl implements BrandManageDAO {
	public List<Brand> queryAll(){
		List<Brand> list = new ArrayList();
		try{
			String hql="from Brand where deleted = 0 order by brandName"; 
			list =  this.getHibernateTemplate().find(hql);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public Brand editBrand(String id){
		try{
			Long brandId = Long.parseLong(id);
			Brand resultPO = (Brand)this.getHibernateTemplate().get(Brand.class,brandId);
			this.getHibernateTemplate().getSessionFactory().close(); 
			return resultPO;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveBrand(Brand brand){
		// TODO Auto-generated method stub
		try{
			this.getHibernateTemplate().saveOrUpdate(brand);
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
			hql.append("from Series where deleted = 0 and brand.id = "+id); 
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
	
	public List<Brand> queryListByClient(Long clientId){
		List<Brand> list = new ArrayList();
		try{
			String hql="select distinct b  from Brand b,Model m,ClientToSeries c " +
					"where b.deleted = 0 " +
					"and c.deleted = 0 " +
					"and m.deleted = 0 " +
					"and b.id = m.brand.id " +
					"and m.id = c.model.id " +
					"and c.client.id="+clientId+
							" order by b.brandName"; 
			list = (List<Brand>) this.getHibernateTemplate().find(hql);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
}
