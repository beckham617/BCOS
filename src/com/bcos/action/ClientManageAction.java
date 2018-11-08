package com.bcos.action;

import java.util.List;

import com.bcos.bo.ClientManageBO;
import com.bcos.bo.impl.ClientManageBOImpl;
import com.bcos.po.Client;
import com.bcos.util.Tool_common;

public class ClientManageAction extends BaseAction {
	
	private ClientManageBO clientManageBO;
	private Client client;
	private String saveResult;
	private String selectId;
	private List<Client> resultList;
	private String alertFlag;

	
	/**
	 * 客户公司管理查询
	 * @return
	 */
	
	@Override
	public String execute(){
		try{
			clientManageBO = new ClientManageBOImpl();
			resultList = clientManageBO.queryAll();
			if(alertFlag!=null && alertFlag.equals("1")){
				addActionMessage("<script>alert('删除成功！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("2")){
				addActionMessage("<script>alert('删除失败！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("3")){
				addActionMessage("<script>alert('该客户公司已被使用，不能删除！')</script>");
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
	 * 新建客户公司
	 * @return
	 */
	public String addClient(){
		
		return SUCCESS;
	}
	
	/**
	 * 修改客户公司（查询单条记录）
	 * @return
	 */
	public String editClient()throws Exception{
		try{
			clientManageBO = new ClientManageBOImpl();
			client = clientManageBO.editClient(selectId);
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 保存客户公司
	 * @return
	 */
	public String saveClient()throws Exception{
		try{
			clientManageBO = new ClientManageBOImpl();
			//修改保存
			if(client.getId()!=null){
				client.setClientName(Tool_common.toCHN(client.getClientName()));
				clientManageBO.saveClient(client);
				alertFlag = "4";
				return "edit";
			}
			//新增保存
			client.setClientName(Tool_common.toCHN(client.getClientName()));
			clientManageBO.saveClient(client);
			client = new Client();
			addActionMessage("<script>alert('保存成功！')</script>");
			
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('保存失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 删除客户公司（将状态置为0）
	 * @return
	 */
	public String deleteClient()throws Exception{
		try{
			clientManageBO = new ClientManageBOImpl();
			client = clientManageBO.editClient(selectId);//读取该条记录
			client.setDeleted(1);
			boolean isUsed = false;
			isUsed = clientManageBO.isUsed(client.getId());//查看是否有“用途”占用
			if(isUsed){//该条记录被占用
				alertFlag = "3";
				//addActionMessage("<script>alert('该客户公司已被使用，不能删除！')</script>");
			}else{
				clientManageBO.saveClient(client);
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

	public ClientManageBO getClientManageBO() {
		return clientManageBO;
	}


	public void setClientManageBO(ClientManageBO clientManageBO) {
		this.clientManageBO = clientManageBO;
	}


	public Client getClient() {
		return client;
	}


	public void setClient(Client client) {
		this.client = client;
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


	public List<Client> getResultList() {
		return resultList;
	}


	public void setResultList(List<Client> resultList) {
		this.resultList = resultList;
	}


	public String getAlertFlag() {
		return alertFlag;
	}


	public void setAlertFlag(String alertFlag) {
		this.alertFlag = alertFlag;
	}
}
