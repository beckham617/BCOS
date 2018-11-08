package com.bcos.action;

import java.util.List;

import com.bcos.bo.SizeManageBO;
import com.bcos.bo.impl.SizeManageBOImpl;
import com.bcos.po.Size;
import com.bcos.util.Tool_common;

public class SizeManageAction extends BaseAction {
	
	private SizeManageBO sizeManageBO;
	private Size size;
	private String saveResult;
	private String selectId;
	private List<Size> resultList;
	private String alertFlag;

	
	/**
	 * 产品医用功能分类管理查询
	 * @return
	 */
	
	@Override
	public String execute(){
		try{
			sizeManageBO = new SizeManageBOImpl();
			resultList = sizeManageBO.queryAll();
			if(alertFlag!=null && alertFlag.equals("1")){
				addActionMessage("<script>alert('删除成功！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("2")){
				addActionMessage("<script>alert('删除失败！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("3")){
				addActionMessage("<script>alert('该医用功能分类已被使用，不能删除！')</script>");
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
	 * 新建医用功能分类
	 * @return
	 */
	public String addSize(){
		
		return SUCCESS;
	}
	
	/**
	 * 修改医用功能分类（查询单条记录）
	 * @return
	 */
	public String editSize()throws Exception{
		try{
			sizeManageBO = new SizeManageBOImpl();
			size = sizeManageBO.editSize(selectId);
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 保存医用功能分类
	 * @return
	 */
	public String saveSize()throws Exception{
		try{
			sizeManageBO = new SizeManageBOImpl();
			//修改保存
			if(size.getId()!=null){
				size.setSizeName(Tool_common.toCHN(size.getSizeName()));
				sizeManageBO.saveSize(size);
				alertFlag = "4";
				return "edit";
			}
			//新增保存
			size.setSizeName(Tool_common.toCHN(size.getSizeName()));
			sizeManageBO.saveSize(size);
			size = new Size();
			addActionMessage("<script>alert('保存成功！')</script>");
			
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('保存失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 删除医用功能分类（将状态置为0）
	 * @return
	 */
	public String deleteSize()throws Exception{
		try{
			sizeManageBO = new SizeManageBOImpl();
			size = sizeManageBO.editSize(selectId);//读取该条记录
			size.setDeleted(1);
			boolean isUsed = false;
			isUsed = sizeManageBO.isUsed(size.getId());//查看是否有“用途”占用
			if(isUsed){//该条记录被占用
				alertFlag = "3";
				//addActionMessage("<script>alert('该医用功能分类已被使用，不能删除！')</script>");
			}else{
				sizeManageBO.saveSize(size);
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

	public SizeManageBO getSizeManageBO() {
		return sizeManageBO;
	}


	public void setSizeManageBO(SizeManageBO sizeManageBO) {
		this.sizeManageBO = sizeManageBO;
	}


	public Size getSize() {
		return size;
	}


	public void setSize(Size size) {
		this.size = size;
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


	public List<Size> getResultList() {
		return resultList;
	}


	public void setResultList(List<Size> resultList) {
		this.resultList = resultList;
	}


	public String getAlertFlag() {
		return alertFlag;
	}


	public void setAlertFlag(String alertFlag) {
		this.alertFlag = alertFlag;
	}


}
