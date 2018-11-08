package com.bcos.bo.impl;

import java.util.List;

import com.bcos.bo.ClientManageBO;
import com.bcos.dao.ClientManageDAO;
import com.bcos.po.Client;
import com.bcos.util.Constant;

public class ClientManageBOImpl extends BaseBOImpl implements ClientManageBO {
	
	private ClientManageDAO clientManageDAO;
	
	public ClientManageDAO getClientManageDAO() {
		return clientManageDAO;
	}

	public void setClientManageDAO(ClientManageDAO clientManageDAO) {
		this.clientManageDAO = clientManageDAO;
	}

	public List<Client> queryAll(){
		try{
			clientManageDAO  = Constant.getClientManageDAO();
			return clientManageDAO.queryAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public Client editClient(String id){
		try{
			clientManageDAO  = Constant.getClientManageDAO();
			return clientManageDAO.editClient(id); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveClient(Client client){
		try{
			clientManageDAO  = Constant.getClientManageDAO();
			clientManageDAO.saveClient(client); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//判断是否被占用
	public boolean isUsed(Long id){
		try{
			clientManageDAO  = Constant.getClientManageDAO();
			return clientManageDAO.isUsed(id); 
		}catch(Exception e){
			e.printStackTrace();
			return true;
		}
	}
}
