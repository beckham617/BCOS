package com.bcos.bo.impl;

import java.util.List;

import com.bcos.bo.BrandManageBO;
import com.bcos.dao.BrandManageDAO;
import com.bcos.po.Brand;
import com.bcos.util.Constant;

public class BrandManageBOImpl extends BaseBOImpl implements BrandManageBO {
	
	private BrandManageDAO brandManageDAO;
	
	public BrandManageDAO getBrandManageDAO() {
		return brandManageDAO;
	}

	public void setBrandManageDAO(BrandManageDAO brandManageDAO) {
		this.brandManageDAO = brandManageDAO;
	}

	public List<Brand> queryAll(){
		try{
			brandManageDAO  = Constant.getBrandManageDAO();
			return brandManageDAO.queryAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public Brand editBrand(String id){
		try{
			brandManageDAO  = Constant.getBrandManageDAO();
			return brandManageDAO.editBrand(id); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveBrand(Brand brand){
		try{
			brandManageDAO  = Constant.getBrandManageDAO();
			brandManageDAO.saveBrand(brand); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//判断是否被占用
	public boolean isUsed(Long id){
		try{
			brandManageDAO  = Constant.getBrandManageDAO();
			return brandManageDAO.isUsed(id); 
		}catch(Exception e){
			e.printStackTrace();
			return true;
		}
	}
	
	public List<Brand> queryListByClient(Long clientId){
		try{
			brandManageDAO  = Constant.getBrandManageDAO();
			return brandManageDAO.queryListByClient(clientId); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
}
