package com.bcos.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.bcos.dao.OrderListManageDAO;
import com.bcos.page.PageBean;
import com.bcos.page.PageMessage;
import com.bcos.po.Model;
import com.bcos.po.OrderList;
import com.bcos.po.OrderListDetail;
import com.bcos.util.Constant;
import com.bcos.util.PropertyUtil;
import com.bcos.util.Tool_common;

public class OrderListManageDAOImpl extends BaseDAOImpl implements
		OrderListManageDAO {
	public PageBean getPageBean(int currPage,OrderList orderList) throws Exception{
		StringBuffer hql= new StringBuffer();
		hql.append("select count(*) from OrderList where deleted = 0 and listType in (1,3) and client.id = "+orderList.getClient().getId()); 
		//录入日期（起始）
		if(orderList!=null && orderList.getSOrderDate()!=null){
			hql.append(" and orderDate >= '"+Tool_common.Dateformat(orderList.getSOrderDate())+"'");
		}else if(orderList!=null && orderList.getSOrderDateStr()!=null){
			hql.append(" and orderDate >= '"+orderList.getSOrderDateStr()+"'");
		}
		//录入日期（结束）
		if(orderList!=null && orderList.getEOrderDate()!=null){
			hql.append(" and orderDate <= '"+Tool_common.Dateformat(orderList.getEOrderDate())+"'");
		}else if(orderList!=null && orderList.getEOrderDateStr()!=null){
			hql.append(" and orderDate <= '"+orderList.getEOrderDateStr()+"'");
		}
		//复核状态
		if(orderList!=null && orderList.getCheckStatus()>=0){
			hql.append(" and checkStatus = "+orderList.getCheckStatus());
		}
		//订单类型
		if(orderList!=null && orderList.getListType()>0){
			hql.append(" and listType = "+orderList.getListType());
		}
		hql.append(" order by checkStatus , orderListCode desc ");
		PageBean pageBean = PageMessage.getPageMessage(currPage, this.gettotalSize(hql.toString())); 
		return pageBean;
	}
	
	public PageBean getSumListPageBean(int currPage,OrderList orderList) throws Exception{
		StringBuffer hql= new StringBuffer();
		hql.append("select count(*) from OrderList where deleted = 0 and listType = 2 "); 
		//录入日期（起始）
		if(orderList!=null && orderList.getSSumDate()!=null){
			hql.append(" and sumDate >= '"+Tool_common.Dateformat(orderList.getSSumDate())+"'");
		}else if(orderList!=null && orderList.getSSumDateStr()!=null){
			hql.append(" and sumDate >= '"+orderList.getSSumDateStr()+"'");
		}
		//录入日期（结束）
		if(orderList!=null && orderList.getESumDate()!=null){
			hql.append(" and sumDate <= '"+Tool_common.Dateformat(orderList.getESumDate())+"'");
		}else if(orderList!=null && orderList.getESumDateStr()!=null){
			hql.append(" and sumDate <= '"+orderList.getESumDateStr()+"'");
		}
		hql.append(" order by sumDate desc,orderListCode desc ");
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
            throw new Exception("查询订单总数失败", e);  
        }  
        return totalsize;  
    }  
	
	public List<OrderList> queryAll(PageBean pageBean ,OrderList orderList){

		List<OrderList> list = new ArrayList<OrderList>();
		try{
			StringBuffer hql= new StringBuffer();
			//未删除、订单类型为客户订单、本公司的订单
			hql.append("from OrderList where deleted = 0 and listType in (1,3) and client.id = "+orderList.getClient().getId());
			//录入日期（起始）
			if(orderList!=null && orderList.getSOrderDate()!=null){
				hql.append(" and orderDate >= '"+Tool_common.Dateformat(orderList.getSOrderDate())+"'");
			}else if(orderList!=null && orderList.getSOrderDateStr()!=null){
				hql.append(" and orderDate >= '"+orderList.getSOrderDateStr()+"'");
			}
			//录入日期（结束）
			if(orderList!=null && orderList.getEOrderDate()!=null){
				hql.append(" and orderDate <= '"+Tool_common.Dateformat(orderList.getEOrderDate())+"'");
			}else if(orderList!=null && orderList.getEOrderDateStr()!=null){
				hql.append(" and orderDate <= '"+orderList.getEOrderDateStr()+"'");
			}
			//复核状态
			if(orderList!=null && orderList.getCheckStatus()>=0){
				hql.append(" and checkStatus = "+orderList.getCheckStatus());
			}
			//订单类型
			if(orderList!=null && orderList.getListType()>0){
				hql.append(" and listType = "+orderList.getListType());
			}
			hql.append(" order by checkStatus , orderListCode desc ");
			list = (List<OrderList>) this.getHibernateTemplate()
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
	
	public List<OrderList> queryAllSumList(PageBean pageBean ,OrderList orderList){

		List<OrderList> list = new ArrayList<OrderList>();
		try{
			StringBuffer hql= new StringBuffer();
			//未删除、订单类型为客户订单、本公司的订单
			hql.append("from OrderList where deleted = 0 and listType = 2 "); 
			//录入日期（起始）
			if(orderList!=null && orderList.getSSumDate()!=null){
				hql.append(" and sumDate >= '"+Tool_common.Dateformat(orderList.getSSumDate())+"'");
			}else if(orderList!=null && orderList.getSSumDateStr()!=null){
				hql.append(" and sumDate >= '"+orderList.getSSumDateStr()+"'");
			}
			//录入日期（结束）
			if(orderList!=null && orderList.getESumDate()!=null){
				hql.append(" and sumDate <= '"+Tool_common.Dateformat(orderList.getESumDate())+"'");
			}else if(orderList!=null && orderList.getESumDateStr()!=null){
				hql.append(" and sumDate <= '"+orderList.getESumDateStr()+"'");
			}
			hql.append(" order by sumDate desc,orderListCode desc ");
			list = (List<OrderList>) this.getHibernateTemplate()
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
	
	public List<OrderList> queryClientList4AdminManage(OrderList orderList){
		List<OrderList> list = new ArrayList<OrderList>();
		try{
			StringBuffer hql= new StringBuffer();
			//未删除、订单类型为客户订单、本公司的订单
			hql.append("from OrderList where deleted = 0 and listType in (1,3) ");
			//录入日期（起始）
			if(orderList!=null && orderList.getSOrderDate()!=null){
				hql.append(" and orderDate >= '"+Tool_common.Dateformat(orderList.getSOrderDate())+"'");
			}
			//录入日期（结束）
			if(orderList!=null && orderList.getEOrderDate()!=null){
				hql.append(" and orderDate <= '"+Tool_common.Dateformat(orderList.getEOrderDate())+"'");
			}
			//汇总日期
			if(orderList!=null && orderList.getSumDate()!=null){
				hql.append(" and sumDate = '"+Tool_common.Dateformat(orderList.getSumDate())+"'");
			}
			//复核状态
			if(orderList!=null && orderList.getCheckStatus()>=0){
				hql.append(" and checkStatus = "+orderList.getCheckStatus());
			}
			//汇总状态
			if(orderList!=null && orderList.getSumStatus()>=0){
				hql.append(" and sumStatus = "+orderList.getSumStatus());
			}
			//订单类型
			if(orderList!=null && orderList.getListType()>0){
				hql.append(" and listType = "+orderList.getListType());
			}
			//客户公司
			if(orderList!=null && orderList.getClient()!=null && orderList.getClient().getId()>0){
				hql.append(" and client.id = "+orderList.getClient().getId());
			}
			hql.append(" order by sumStatus asc,checkStatus asc,orderDate desc,orderListCode desc ");
			list = this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public List<OrderList> queryClientListByCheckedIds(String checkedIds){
		List<OrderList> list = new ArrayList<OrderList>();
		try{
			StringBuffer hql= new StringBuffer();
			//未删除、订单类型为客户订单、本公司的订单
			hql.append("from OrderList where deleted = 0 and listType in (1,3) and checkStatus = 1 and sumStatus = 0 ");
			if(checkedIds!=null){
				hql.append(" and id in ("+checkedIds+")");
			}else{
				return null;
			}
			list = this.getHibernateTemplate().find(hql.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public String getCurrentMaxClientListCode(){
		String code = "";
		StringBuffer sb = new StringBuffer();
		sb.append("select orderListCode from OrderList where orderListCode like '%"+Constant.getCodeP2ClientList()+"%' order by ID desc ");
		List list = this.getHibernateTemplate().find(sb.toString());
		//List list = getListFromNationSQL(sb.toString());
		this.getHibernateTemplate().getSessionFactory().close();
		if(list!=null && list.size()>0){
			code = String.valueOf(list.get(0));
		}
		return code; 
	}
	
	public String getCurrentMaxSumListCode(){
		String code = "";
		StringBuffer sb = new StringBuffer();
		sb.append("select orderListCode from OrderList where orderListCode like '%"+Constant.getCodeP2SumList()+"%' order by ID desc ");
		List list = this.getHibernateTemplate().find(sb.toString());
		//List list = getListFromNationSQL(sb.toString());
		this.getHibernateTemplate().getSessionFactory().close();
		if(list!=null && list.size()>0){
			code = String.valueOf(list.get(0));
		}
		return code; 
	}
	
	public void saveClientList(OrderList orderList){
		// TODO Auto-generated method stub
		try{
			this.getHibernateTemplate().saveOrUpdate(orderList);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void saveClientListDetail(OrderListDetail orderListDetail){
		try{
			this.getHibernateTemplate().saveOrUpdate(orderListDetail);
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public OrderList editClientList(String id){
		try{
			Long clientListId = Long.parseLong(id);
			OrderList resultPO = (OrderList)this.getHibernateTemplate().get(OrderList.class,clientListId);
			this.getHibernateTemplate().getSessionFactory().close(); 
			return resultPO;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public OrderListDetail editClientListDetail(String id){
		try{
			Long clientListDetailId = Long.parseLong(id);
			OrderListDetail resultPO = (OrderListDetail)this.getHibernateTemplate().get(OrderListDetail.class,clientListDetailId);
			this.getHibernateTemplate().getSessionFactory().close(); 
			return resultPO;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public List<OrderListDetail> queryClientListDetail(Long orderListId){
		List<OrderListDetail> list = new ArrayList<OrderListDetail>();
		try{
			StringBuffer sb = new StringBuffer();
			sb.append("from OrderListDetail where deleted = 0 and orderList.id = "+orderListId+" order by brand.brandName,usage.usageName,model.modelName desc ");
			list = this.getHibernateTemplate().find(sb.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public List<OrderListDetail> queryClientListDetailByOrderListDetail(OrderListDetail orderListDetail){
		List<OrderListDetail> list = new ArrayList<OrderListDetail>();
		try{
			StringBuffer sb = new StringBuffer();
			sb.append("from OrderListDetail where deleted = 0 and orderList.listType in (1,3)");
			//录入日期（起始）
			if(orderListDetail!=null && orderListDetail.getOrderList()!=null && orderListDetail.getOrderList().getSOrderDate()!=null){
				sb.append(" and orderList.orderDate >= '"+Tool_common.Dateformat(orderListDetail.getOrderList().getSOrderDate())+"'");
			}
			//录入日期（结束）
			if(orderListDetail!=null && orderListDetail.getOrderList()!=null && orderListDetail.getOrderList().getEOrderDate()!=null){
				sb.append(" and orderList.orderDate <= '"+Tool_common.Dateformat(orderListDetail.getOrderList().getEOrderDate())+"'");
			}
			//品牌
			if(orderListDetail!=null && orderListDetail.getBrand()!=null && orderListDetail.getBrand().getId()!=null && orderListDetail.getBrand().getId()>0){
				sb.append(" and brand.id = "+orderListDetail.getBrand().getId());
			}
			//用途
			if(orderListDetail!=null && orderListDetail.getUsage()!=null && orderListDetail.getUsage().getId()!=null && orderListDetail.getUsage().getId()>0){
				sb.append(" and usage.id = "+orderListDetail.getUsage().getId());
			}
			//系列
			if(orderListDetail!=null && orderListDetail.getSeries()!=null && orderListDetail.getSeries().getId()!=null && orderListDetail.getSeries().getId()>0){
				sb.append(" and series.id = "+orderListDetail.getSeries().getId());
			}
			//名称
			if(orderListDetail!=null && orderListDetail.getModel()!=null && orderListDetail.getModel().getId()!=null && orderListDetail.getModel().getId()>0){
				sb.append(" and model.id = "+orderListDetail.getModel().getId());
			}
			//医用功能分类
			if(orderListDetail!=null && orderListDetail.getSize()!=null && orderListDetail.getSize().getId()!=null && orderListDetail.getSize().getId()>0){
				sb.append(" and size.id = "+orderListDetail.getSize().getId());
			}
			//客户公司
			if (orderListDetail != null
					&& orderListDetail.getOrderList() != null
					&& orderListDetail.getOrderList().getClient() != null
					&& orderListDetail.getOrderList().getClient().getId() != null
					&& orderListDetail.getOrderList().getClient().getId()>0 ) {
				sb.append(" and orderList.client.id = "+orderListDetail.getOrderList().getClient().getId());
			}
			sb.append(" order by brand.id,usage.id,series.id,model.id,size.id,orderList.client.id desc ");
			list = this.getHibernateTemplate().find(sb.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	
	public List getSumListDetail(String strCheckedIds){
		List list = new ArrayList();
		try{
			if(!(strCheckedIds.length()>0)){
				return null;
			}
			StringBuffer sb = new StringBuffer();
			sb.append("select brand.id,usage.id,series.id,size.id,model.id,sum(number) " +
					"from OrderListDetail " +
					"where deleted = 0 " +
					"and orderList.id in ("+strCheckedIds+") " +
					"group by model.id ");
			list = this.getHibernateTemplate().find(sb.toString());
			this.getHibernateTemplate().getSessionFactory().close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
}
