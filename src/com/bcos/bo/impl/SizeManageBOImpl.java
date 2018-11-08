package com.bcos.bo.impl;

import java.util.List;

import com.bcos.bo.SizeManageBO;
import com.bcos.dao.SizeManageDAO;
import com.bcos.po.Size;
import com.bcos.po.Usage;
import com.bcos.util.Constant;

public class SizeManageBOImpl extends BaseBOImpl implements SizeManageBO {
	
	private SizeManageDAO sizeManageDAO;
	
	public SizeManageDAO getSizeManageDAO() {
		return sizeManageDAO;
	}

	public void setSizeManageDAO(SizeManageDAO sizeManageDAO) {
		this.sizeManageDAO = sizeManageDAO;
	}

	public List<Size> queryAll(){
		try{
			sizeManageDAO  = Constant.getSizeManageDAO();
			return sizeManageDAO.queryAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public Size editSize(String id){
		try{
			sizeManageDAO  = Constant.getSizeManageDAO();
			return sizeManageDAO.editSize(id); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveSize(Size size){
		try{
			sizeManageDAO  = Constant.getSizeManageDAO();
			sizeManageDAO.saveSize(size); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//判断是否被占用
	public boolean isUsed(Long id){
		try{
			sizeManageDAO  = Constant.getSizeManageDAO();
			return sizeManageDAO.isUsed(id); 
		}catch(Exception e){
			e.printStackTrace();
			return true;
		}
	}
	
	public List<Size> queryListByClient(Long clientId){
		try{
			sizeManageDAO  = Constant.getSizeManageDAO();
			return sizeManageDAO.queryListByClient(clientId); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
