package com.bcos.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bcos.bo.BrandManageBO;
import com.bcos.bo.impl.BrandManageBOImpl;
import com.bcos.po.Brand;
import com.bcos.util.Constant;
import com.bcos.util.Tool_common;
import com.opensymphony.xwork2.ActionContext;


public class BrandManageAction extends BaseAction {
	
	private BrandManageBO brandManageBO;
	private Brand brand;
	private String saveResult;
	private String selectId;
	private List<Brand> resultList;
	private String alertFlag;
	
	
	/**
	 * 产品品牌管理查询
	 * @return
	 */
	
	@Override
	public String execute(){
		try{
			brandManageBO = new BrandManageBOImpl();
			resultList = brandManageBO.queryAll();
			if(alertFlag!=null && alertFlag.equals("1")){
				addActionMessage("<script>alert('删除成功！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("2")){
				addActionMessage("<script>alert('删除失败！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("3")){
				addActionMessage("<script>alert('该品牌已被使用，不能删除！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("4")){
				addActionMessage("<script>alert('保存成功！')</script>");
			}
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 新建品牌
	 * @return
	 */
	public String addBrand(){
		
		return SUCCESS;
	}
	
	/**
	 * 修改品牌（查询单条记录）
	 * @return
	 */
	public String editBrand()throws Exception{
		try{
			brandManageBO = new BrandManageBOImpl();
			brand = brandManageBO.editBrand(selectId);
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 保存品牌
	 * @return
	 */
	public String saveBrand()throws Exception{
		try{
			brandManageBO = new BrandManageBOImpl();
			//修改保存
			if(brand.getId()!=null){
				brand.setBrandName(Tool_common.toCHN(brand.getBrandName()));
				brandManageBO.saveBrand(brand);
				alertFlag = "4";
				return "edit";
			}
			//新增保存
			brand.setBrandName(Tool_common.toCHN(brand.getBrandName()));
			brandManageBO.saveBrand(brand);
			brand = new Brand();
			addActionMessage("<script>alert('保存成功！')</script>");
			
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('保存失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 删除品牌（将状态置为0）
	 * @return
	 */
	public String deleteBrand()throws Exception{
		try{
			brandManageBO = new BrandManageBOImpl();
			brand = brandManageBO.editBrand(selectId);//读取该条记录
			brand.setDeleted(1);
			boolean isUsed = false;
			isUsed = brandManageBO.isUsed(brand.getId());//查看是否有“用途”占用
			if(isUsed){//该条记录被占用
				alertFlag = "3";
				//addActionMessage("<script>alert('该品牌已被使用，不能删除！')</script>");
			}else{
				brandManageBO.saveBrand(brand);
				alertFlag = "1";
				//addActionMessage("<script>alert('删除成功！')</script>");
			}
		}catch(Exception e){
			e.printStackTrace();
			alertFlag = "2";
			//addActionMessage("<script>alert('删除失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}

	public BrandManageBO getBrandManageBO() {
		return brandManageBO;
	}


	public void setBrandManageBO(BrandManageBO brandManageBO) {
		this.brandManageBO = brandManageBO;
	}


	public Brand getBrand() {
		return brand;
	}


	public void setBrand(Brand brand) {
		this.brand = brand;
	}


	public String getSaveResult() {
		return saveResult;
	}


	public void setSaveResult(String saveResult) {
		this.saveResult = saveResult;
	}


	public String getSelectId() {
		return selectId;
	}


	public void setSelectId(String selectId) {
		this.selectId = selectId;
	}


	public List<Brand> getResultList() {
		return resultList;
	}


	public void setResultList(List<Brand> resultList) {
		this.resultList = resultList;
	}


	public String getAlertFlag() {
		return alertFlag;
	}


	public void setAlertFlag(String alertFlag) {
		this.alertFlag = alertFlag;
	}
}
