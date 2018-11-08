package com.bcos.bo.impl;

import java.util.List;

import com.bcos.bo.UsageManageBO;
import com.bcos.dao.UsageManageDAO;
import com.bcos.po.Brand;
import com.bcos.po.Usage;
import com.bcos.util.Constant;

public class UsageManageBOImpl extends BaseBOImpl implements UsageManageBO {
	private UsageManageDAO usageManageDAO;
	
	public UsageManageDAO getUsageManageDAO() {
		return usageManageDAO;
	}

	public void setUsageManageDAO(UsageManageDAO usageManageDAO) {
		this.usageManageDAO = usageManageDAO;
	}

	public List<Usage> queryAll(){
		try{
			usageManageDAO  = Constant.getUsageManageDAO();
			return usageManageDAO.queryAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public Usage editUsage(String id){
		try{
			usageManageDAO  = Constant.getUsageManageDAO();
			return usageManageDAO.editUsage(id); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveUsage(Usage usage){
		try{
			usageManageDAO  = Constant.getUsageManageDAO();
			usageManageDAO.saveUsage(usage); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//判断是否被占用
	public boolean isUsed(Long id){
		try{
			usageManageDAO  = Constant.getUsageManageDAO();
			return usageManageDAO.isUsed(id); 
		}catch(Exception e){
			e.printStackTrace();
			return true;
		}
	}
	
	public List<Usage> queryListByClient(Long clientId){
		try{
			usageManageDAO  = Constant.getUsageManageDAO();
			return usageManageDAO.queryListByClient(clientId); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
