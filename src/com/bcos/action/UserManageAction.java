package com.bcos.action;

import java.util.ArrayList;
import java.util.List;

import com.bcos.bo.BrandManageBO;
import com.bcos.bo.ClientManageBO;
import com.bcos.bo.UserManageBO;
import com.bcos.bo.UsageManageBO;
import com.bcos.bo.impl.BrandManageBOImpl;
import com.bcos.bo.impl.ClientManageBOImpl;
import com.bcos.bo.impl.UserManageBOImpl;
import com.bcos.bo.impl.UsageManageBOImpl;
import com.bcos.po.Brand;
import com.bcos.po.Client;
import com.bcos.po.User;
import com.bcos.po.Usage;
import com.bcos.util.Constant;
import com.bcos.util.Tool_common;
import com.opensymphony.xwork2.ActionContext;

public class UserManageAction extends BaseAction {
	private UserManageBO userManageBO;
	private ClientManageBO clientManageBO;
	private Client client;
	private User user;
	private List<Client> clientList;
	private List<User> userLevelList;
	private List<User> resultList;
	private String selectId;
	private String alertFlag;
	
	/**
	 * 查询用户列表
	 * @return
	 */
	@Override
	public String execute(){
		try{
			clientManageBO = new ClientManageBOImpl();
			this.setClientList(clientManageBO.queryAll());
			userManageBO = new UserManageBOImpl();
			Long clientId = -1l;
			int userLevelId = -1;
			if(user!=null && user.getClient()!=null && user.getClient().getId()!=null){//客户公司查询条件
				clientId = user.getClient().getId();
			}
			if(user!=null && user.getUserLevel()>0){//客户公司查询条件
				userLevelId = user.getUserLevel();
			}
			//通过查询条件查询用户
			resultList = userManageBO.queryAll(clientId,userLevelId);
			if(alertFlag!=null && alertFlag.equals("1")){
				addActionMessage("<script>alert('删除成功！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("2")){
				addActionMessage("<script>alert('删除失败！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("3")){
				addActionMessage("<script>alert('该用户已被使用，不能删除！')</script>");
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
	 * 新建用户
	 * @return
	 */
	public String addUser(){
		clientManageBO = new ClientManageBOImpl();
		this.setClientList(clientManageBO.queryAll());
		user.getClient().setId(-1l);//将查询出的品牌列表置到“请选择”处
		return SUCCESS;
	}
	
	/**
	 * 修改用户
	 * @return
	 */
	public String editUser()throws Exception{
		try{
			clientManageBO = new ClientManageBOImpl();
			this.setClientList(clientManageBO.queryAll());
			userManageBO = new UserManageBOImpl();
			user = userManageBO.editUser(selectId);
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 保存用户
	 * @return
	 */
	public String saveUser()throws Exception{
		try{
			clientManageBO = new ClientManageBOImpl();
			this.setClientList(clientManageBO.queryAll());
			userManageBO = new UserManageBOImpl();
			//判断是否"登录名"重复
			if(userManageBO.isExistSameCode(user)){
				addActionMessage("<script>alert('该登录名已被使用，请重新录入！');var userCode1 = document.getElementById('user.userCode');userCode1.focus();</script>");
				return "sameCode";
			}
			//修改保存
			if(user.getId()!=null){
				user.setUserName(Tool_common.toCHN(user.getUserName()));//用户名称
				userManageBO.saveUser(user);
				alertFlag = "4";
				return "edit";
			}
			//新增保存
			user.setUserName(Tool_common.toCHN(user.getUserName()));//用户名称
			userManageBO.saveUser(user);
			user = new User();
			addActionMessage("<script>alert('保存成功！')</script>");
			
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('保存失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 逻辑删除用户
	 * @return
	 */
	public String deleteUser()throws Exception{
		try{
			userManageBO = new UserManageBOImpl();
			user = userManageBO.editUser(selectId);//读取该条记录
			user.setDeleted(1);
//			boolean isUsed = false;
//			isUsed = userManageBO.isUsed(user.getId());//查看是否有“用途”占用
//			if(isUsed){//该条记录被占用
//				alertFlag = "3";
//			}else{
				userManageBO.saveUser(user);
				alertFlag = "1";
//			}
			
		}catch(Exception e){
			e.printStackTrace();
			alertFlag = "2";
			//addActionMessage("<script>alert('删除失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 逻辑删除用户
	 * @return
	 */
	public String passwordManage()throws Exception{
		try{
			userManageBO = new UserManageBOImpl();
			//得到当前登录人的登录名
			String inputUserCode = String.valueOf(ActionContext.getContext().getSession().get(Constant.User.LOGIN_USERCODE));
			User currentUser = userManageBO.getUserByCode(inputUserCode);
			//输入密码与当前登录人密码一致
			if(user.getPassword().equals(currentUser.getPassword())){
				String newPassword = user.getNewPassword();
				user = currentUser;
				user.setPassword(newPassword);
				userManageBO.saveUser(user);
			}else{
				addActionMessage("<script>alert('修改密码失败，旧密码不正确！')</script>");
				return INPUT;
			}
			
			addActionMessage("<script>alert('修改密码成功！')</script>");
			
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('修改密码失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	public UserManageBO getUserManageBO() {
		return userManageBO;
	}
	public void setUserManageBO(UserManageBO userManageBO) {
		this.userManageBO = userManageBO;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<User> getResultList() {
		return resultList;
	}
	public void setResultList(List<User> resultList) {
		this.resultList = resultList;
	}
	public String getSelectId() {
		return selectId;
	}
	public void setSelectId(String selectId) {
		this.selectId = selectId;
	}
	public String getAlertFlag() {
		return alertFlag;
	}
	public void setAlertFlag(String alertFlag) {
		this.alertFlag = alertFlag;
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

	public List<Client> getClientList() {
		return clientList;
	}

	public void setClientList(List<Client> clientList) {
		this.clientList = clientList;
	}

	public List<User> getUserLevelList() {
		//创建用户等级下拉单列表
		List<User> userLevelList = new ArrayList();
	 	int[] tempArray= Constant.User.getAllCode();
	 	for(int i =0;i<3;i++){
	 		User user = new User();
	 		user.setUserLevel(tempArray[i]);
	 		user.setStrUserLevel(Constant.User.getName(tempArray[i]));
	 		userLevelList.add(user);
	 	}
		return userLevelList;
	}

	public void setUserLevelList(List<User> userLevelList) {
		this.userLevelList = userLevelList;
	}

		
}
