package com.bcos.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bcos.dao.SeriesManageDAO;
import com.bcos.po.Model;
import com.bcos.po.Series;

public class SeriesManageDAOImpl extends BaseDAOImpl implements SeriesManageDAO {
	public List<Series> queryAll(Long brandId,Long usageId){
		List<Series> list = new ArrayList();
		try{
			StringBuffer hql= new StringBuffer();
			hql.append("from Series where deleted = 0 "); 
			if(brandId!=null && brandId>0){
				hql.append(" and brand.id = "+brandId);
			}
			if(usageId!=null && usageId>0){
				hql.append(" and usage.id = "+usageId);
			}
			hql.append(" order by brand.brandName,usage.usageName,seriesName ");
			list =  (List<Series>)this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public List<Series> queryListByParameters(Long brandId,Long usageId,Long clientId){
		List<Series> list = new ArrayList();
		try{
			StringBuffer hql= new StringBuffer();
			hql.append(" select distinct s from Series s,Model m,Brand b,Usage u,ClientToSeries c ");
			hql.append(" where s.deleted = 0 and m.deleted = 0  and b.deleted = 0 and u.deleted = 0 and c.deleted = 0 ");
			hql.append(" and s.id = m.series.id ");
			hql.append(" and m.id = c.model.id ");
			hql.append(" and b.id = m.brand.id ");
			hql.append(" and b.id = "+brandId);
			hql.append(" and u.id = m.usage.id ");
			hql.append(" and u.id = "+usageId);
			hql.append(" and c.client.id="+clientId);
			hql.append(" order by seriesName ");
			list =  (List<Series>)this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public void saveSeries(Series series){
		try{
			this.getHibernateTemplate().saveOrUpdate(series);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public Series editSeries(String id){
		try{
			Long seriesId = Long.parseLong(id);
			Series resultPO = (Series)this.getHibernateTemplate().get(Series.class,seriesId);
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
			hql.append("from Model where deleted = 0 and series.id = "+id); 
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
}
