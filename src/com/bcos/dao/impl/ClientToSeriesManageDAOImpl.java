package com.bcos.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bcos.dao.ClientToSeriesManageDAO;
import com.bcos.page.PageBean;
import com.bcos.page.PageMessage;
import com.bcos.po.ClientToSeries;
import com.bcos.util.PropertyUtil;

public class ClientToSeriesManageDAOImpl extends BaseDAOImpl implements
		ClientToSeriesManageDAO {
	
	public PageBean getPageBean(int currPage,ClientToSeries clientToSeries)  throws Exception{
		StringBuffer hql= new StringBuffer();
		hql.append("select count(*) from ClientToSeries where deleted = 0 "); 
		if(clientToSeries!=null && clientToSeries.getBrand()!=null && clientToSeries.getBrand().getId()>0){
			hql.append(" and brand.id = "+clientToSeries.getBrand().getId());
		}
		if(clientToSeries!=null && clientToSeries.getUsage()!=null && clientToSeries.getUsage().getId()>0){
			hql.append(" and usage.id = "+clientToSeries.getUsage().getId());
		}
		if(clientToSeries!=null && clientToSeries.getSeries()!=null && clientToSeries.getSeries().getId()>0){
			hql.append(" and series.id = "+clientToSeries.getSeries().getId());
		}
		if(clientToSeries!=null && clientToSeries.getSize()!=null && clientToSeries.getSize().getId()>0){
			hql.append(" and size.id = "+clientToSeries.getSize().getId());
		}
		if(clientToSeries!=null && clientToSeries.getModel()!=null && clientToSeries.getModel().getId()>0){
			hql.append(" and model.id = "+clientToSeries.getModel().getId());
		}
		if(clientToSeries!=null && clientToSeries.getClient()!=null && clientToSeries.getClient().getId()>0){
			hql.append(" and client.id = "+clientToSeries.getClient().getId());
		}
		hql.append(" order by client.clientName,brand.brandName,usage.usageName,series.seriesName,size.sizeName,model.modelName ");
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
            throw new Exception("查询客户-产品系列授权记录总数失败", e);  
        }  
        return totalsize;  
    }  
  
	
	public List<ClientToSeries> queryAll(PageBean pageBean,ClientToSeries clientToSeries){

		List<ClientToSeries> list = new ArrayList<ClientToSeries>();
		try{
			StringBuffer hql= new StringBuffer();
			hql.append("from ClientToSeries where deleted = 0 "); 
			if(clientToSeries!=null && clientToSeries.getBrand()!=null && clientToSeries.getBrand().getId()>0){
				hql.append(" and brand.id = "+clientToSeries.getBrand().getId());
			}
			if(clientToSeries!=null && clientToSeries.getUsage()!=null && clientToSeries.getUsage().getId()>0){
				hql.append(" and usage.id = "+clientToSeries.getUsage().getId());
			}
			if(clientToSeries!=null && clientToSeries.getSeries()!=null && clientToSeries.getSeries().getId()>0){
				hql.append(" and series.id = "+clientToSeries.getSeries().getId());
			}
			if(clientToSeries!=null && clientToSeries.getSize()!=null && clientToSeries.getSize().getId()>0){
				hql.append(" and size.id = "+clientToSeries.getSize().getId());
			}
			if(clientToSeries!=null && clientToSeries.getModel()!=null && clientToSeries.getModel().getId()>0){
				hql.append(" and model.id = "+clientToSeries.getModel().getId());
			}
			if(clientToSeries!=null && clientToSeries.getClient()!=null && clientToSeries.getClient().getId()>0){
				hql.append(" and client.id = "+clientToSeries.getClient().getId());
			}
			hql.append(" order by client.clientName,brand.brandName,usage.usageName,series.seriesName,size.sizeName,model.modelName ");
			list = (List<ClientToSeries>) this.getHibernateTemplate()
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
	
	public void saveClientToSeries(ClientToSeries clientToSeries){
		try{
			this.getHibernateTemplate().saveOrUpdate(clientToSeries);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ClientToSeries editClientToSeries(String id){
		try{
			Long clientToSeriesId = Long.parseLong(id);
			ClientToSeries resultPO = (ClientToSeries)this.getHibernateTemplate().get(ClientToSeries.class,clientToSeriesId);
			this.getHibernateTemplate().getSessionFactory().close(); 
			return resultPO;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
}
