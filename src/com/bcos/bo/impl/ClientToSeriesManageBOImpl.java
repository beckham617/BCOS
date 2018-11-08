package com.bcos.bo.impl;

import java.util.List;

import com.bcos.bo.ClientToSeriesManageBO;
import com.bcos.dao.ClientToSeriesManageDAO;
import com.bcos.page.PageBean;
import com.bcos.po.ClientToSeries;
import com.bcos.util.Constant;

public class ClientToSeriesManageBOImpl extends BaseBOImpl implements
		ClientToSeriesManageBO {
	private ClientToSeriesManageDAO clientToSeriesManageDAO;
	
	public PageBean getPageBean(int currPage,ClientToSeries clientToSeries){
		try{
			clientToSeriesManageDAO = Constant.getClientToSeriesManageDAO();
			return clientToSeriesManageDAO.getPageBean(currPage,clientToSeries);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public List<ClientToSeries> queryAll(PageBean pageBean ,ClientToSeries clientToSeries){
		clientToSeriesManageDAO = Constant.getClientToSeriesManageDAO();
		return clientToSeriesManageDAO.queryAll(pageBean,clientToSeries);
	}
	
	public ClientToSeries editClientToSeries(String id){
		try{
			clientToSeriesManageDAO = Constant.getClientToSeriesManageDAO();
			return clientToSeriesManageDAO.editClientToSeries(id); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveClientToSeries(ClientToSeries clientToSeries){
		clientToSeriesManageDAO = Constant.getClientToSeriesManageDAO();
		clientToSeriesManageDAO.saveClientToSeries(clientToSeries);
	}

	
	public ClientToSeriesManageDAO getClientToSeriesManageDAO() {
		return clientToSeriesManageDAO;
	}

	public void setClientToSeriesManageDAO(ClientToSeriesManageDAO clientToSeriesManageDAO) {
		this.clientToSeriesManageDAO = clientToSeriesManageDAO;
	}

}
