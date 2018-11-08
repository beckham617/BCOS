package com.bcos.action;

import java.util.List;

import com.bcos.bo.UsageManageBO;
import com.bcos.bo.impl.UsageManageBOImpl;
import com.bcos.po.Usage;
import com.bcos.util.Tool_common;

public class UsageManageAction extends BaseAction {
	private UsageManageBO usageManageBO;
	private Usage usage;
	private String saveResult;
	private String selectId;
	private List<Usage> resultList;
	private String alertFlag;
	
	/**
	 * 产品用途管理查询
	 * @return
	 */
	
	@Override
	public String execute(){
		try{
			usageManageBO = new UsageManageBOImpl();
			resultList = usageManageBO.queryAll();
			if(alertFlag!=null && alertFlag.equals("1")){
				addActionMessage("<script>alert('删除成功！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("2")){
				addActionMessage("<script>alert('删除失败！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("3")){
				addActionMessage("<script>alert('该用途已被使用，不能删除！')</script>");
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
	 * 新建产品用途
	 * @return
	 */
	public String addUsage(){
		
		return SUCCESS;
	}
	
	/**
	 * 修改产品用途（查询单条记录）
	 * @return
	 */
	public String editUsage()throws Exception{
		try{
			usageManageBO = new UsageManageBOImpl();
			usage = usageManageBO.editUsage(selectId);
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 保存产品用途
	 * @return
	 */
	public String saveUsage()throws Exception{
		try{
			usageManageBO = new UsageManageBOImpl();
			//修改保存
			if(usage.getId()!=null){
				usage.setUsageName(Tool_common.toCHN(usage.getUsageName()));
				usageManageBO.saveUsage(usage);
				alertFlag = "4";
				return "edit";
			}
			//新增保存
			usage.setUsageName(Tool_common.toCHN(usage.getUsageName()));
			usageManageBO.saveUsage(usage);
			usage = new Usage();
			addActionMessage("<script>alert('保存成功！')</script>");
			
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('保存失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 删除产品用途（将状态置为0）
	 * @return
	 */
	public String deleteUsage()throws Exception{
		try{
			usageManageBO = new UsageManageBOImpl();
			usage = usageManageBO.editUsage(selectId);//读取该条记录
			usage.setDeleted(1);
			boolean isUsed = false;
			isUsed = usageManageBO.isUsed(usage.getId());//查看是否有“用途”占用
			if(isUsed){//该条记录被占用
				alertFlag = "3";
				//addActionMessage("<script>alert('该品牌已被使用，不能删除！')</script>");
			}else{
				usageManageBO.saveUsage(usage);
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
	
	
	public UsageManageBO getUsageManageBO() {
		return usageManageBO;
	}
	public void setUsageManageBO(UsageManageBO usageManageBO) {
		this.usageManageBO = usageManageBO;
	}
	public Usage getUsage() {
		return usage;
	}
	public void setUsage(Usage usage) {
		this.usage = usage;
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
	public List<Usage> getResultList() {
		return resultList;
	}
	public void setResultList(List<Usage> resultList) {
		this.resultList = resultList;
	}
	public String getAlertFlag() {
		return alertFlag;
	}
	public void setAlertFlag(String alertFlag) {
		this.alertFlag = alertFlag;
	}
	
	
	
}
