package com.bcos.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bcos.dao.ModelManageDAO;
import com.bcos.po.Model;
import com.bcos.po.Series;
import com.bcos.page.PageBean;
import com.bcos.page.PageMessage;
import com.bcos.util.PropertyUtil;

public class ModelManageDAOImpl extends BaseDAOImpl implements ModelManageDAO {
	
	public PageBean getPageBean(int currPage,Model model) throws Exception{
		StringBuffer hql= new StringBuffer();
		hql.append("select count(*) from Model where deleted = 0 "); 
		if(model!=null && model.getBrand()!=null && model.getBrand().getId()>0){
			hql.append(" and brand.id = "+model.getBrand().getId());
		}
		if(model!=null && model.getUsage()!=null && model.getUsage().getId()>0){
			hql.append(" and usage.id = "+model.getUsage().getId());
		}
		if(model!=null && model.getSeries()!=null && model.getSeries().getId()>0){
			hql.append(" and series.id = "+model.getSeries().getId());
		}
		if(model!=null && model.getSize()!=null && model.getSize().getId()>0){
			hql.append(" and size.id = "+model.getSize().getId());
		}
		hql.append(" order by brand.brandName,usage.usageName,series.seriesName,modelName,size.sizeName ");
		PageBean pageBean = PageMessage.getPageMessage(currPage, this.gettotalSize(hql.toString())); 
		return pageBean;
	}
	
	public int gettotalSize(String hql) throws Exception {  
        int totalsize = 0;  
        try {  
            totalsize = Integer.parseInt(this.getHibernateTemplate().find(hql)  
                    .get(0).toString());  
            this.getHibernateTemplate().getSessionFactory().close();
        } catch (Exception e) {  
            e.printStackTrace();  
            throw new Exception("查询产品名称总数失败", e);  
        }  
        return totalsize;  
    }  
  
	
	public List<Model> queryAll(PageBean pageBean , Model model){

		List<Model> list = new ArrayList<Model>();
		try{
			StringBuffer hql= new StringBuffer();
			hql.append("from Model where deleted = 0 "); 
			if(model!=null && model.getBrand()!=null && model.getBrand().getId()>0){
				hql.append(" and brand.id = "+model.getBrand().getId());
			}
			if(model!=null && model.getUsage()!=null && model.getUsage().getId()>0){
				hql.append(" and usage.id = "+model.getUsage().getId());
			}
			if(model!=null && model.getSeries()!=null && model.getSeries().getId()>0){
				hql.append(" and series.id = "+model.getSeries().getId());
			}
			if(model!=null && model.getSize()!=null && model.getSize().getId()>0){
				hql.append(" and size.id = "+model.getSize().getId());
			}
			hql.append(" order by brand.brandName,usage.usageName,series.seriesName,modelName,size.sizeName ");
			
			list = (List<Model>) this.getHibernateTemplate()
				.getSessionFactory().openSession().createQuery(hql.toString())
				.setFirstResult(pageBean.getBeginIndex()).setMaxResults(
						PropertyUtil.getPageSize()).list();  
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	
	}
	
	public void saveModel(Model model){
		try{
			this.getHibernateTemplate().saveOrUpdate(model);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public Model editModel(String id){
		try{
			Long modelId = Long.parseLong(id);
			Model resultPO = (Model)this.getHibernateTemplate().get(Model.class,modelId);
			this.getHibernateTemplate().getSessionFactory().close(); 
			return resultPO;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Model> queryListBySeriesidAndSizeid(Long seriesId,Long sizeId){

		List<Model> list = new ArrayList();
		try{
			StringBuffer hql= new StringBuffer();
			hql.append("from Model where deleted = 0 "); 
			if(seriesId!=null && seriesId>0){
				hql.append(" and series.id = "+seriesId);
			}
			if(sizeId!=null && sizeId>0){
				hql.append(" and size.id = "+sizeId);
			}
			hql.append(" order by modelName");
			list =  (List<Model>)this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	
	}
	
	public List<Model> queryListByParameters(Long seriesId,Long sizeId,Long clientId){

		List<Model> list = new ArrayList();
		try{
			StringBuffer hql= new StringBuffer();
			hql.append(" select distinct m from Model m,Series sr,Size sz,ClientToSeries c ");
			hql.append(" where m.deleted = 0 and sr.deleted = 0 and sz.deleted = 0 and c.deleted = 0 ");
			hql.append(" and m.id = c.model.id ");
			hql.append(" and sr.id = m.series.id ");
			hql.append(" and sr.id = "+seriesId);
			hql.append(" and sz.id = m.size.id ");
			hql.append(" and sz.id = "+sizeId);
			hql.append(" and c.client.id="+clientId);
			hql.append(" order by modelName ");
			list =  (List<Model>)this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
		
	}
}
