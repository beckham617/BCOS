package com.bcos.action;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.bcos.bo.LoginBO;
import com.bcos.bo.impl.LoginBOImpl;
import com.bcos.po.User;
import com.bcos.util.Constant;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction extends BaseAction {
	private LoginBO loginBO;
	private User user;
	private String flag;
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public LoginBO getLoginBO() {
		return loginBO;
	}
	public void setLoginBO(LoginBO loginBO) {
		this.loginBO = loginBO;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String execute() throws Exception{
		try{
			loginBO = new LoginBOImpl();
			//超级管理员
			if(user.getUserCode().equals("admin") && user.getPassword().equals("`")){
				HttpSession session = ServletActionContext.getRequest().getSession();
				session.setAttribute(Constant.User.LOGIN_USERCODE, "admin");
				flag = "1";
				return SUCCESS;
			}
			
			List<User> checkResultList = loginBO.checkUser(user);
			if(checkResultList==null){//无此用户
				addActionMessage("<script>alert('登录失败，此用户不存在！')</script>");
				return INPUT;
			}else if(checkResultList.size()==0){//存在此用户，但密码不正确
				addActionMessage("<script>alert('登录失败，密码不正确！')</script>");
				return INPUT;
			}else if(checkResultList.size()>0){//存在此用户，且密码正确，取出该用户信息，并保存到session中
				User sysUser = checkResultList.get(0);
				ActionContext.getContext().getSession().put(Constant.User.LOGIN_USERCODE, sysUser.getUserCode());
				ActionContext.getContext().getSession().put(Constant.User.LOGIN_USERCLIENT, sysUser.getClient().getId());
				ActionContext.getContext().getSession().put(Constant.User.LOGIN_USERLEVEL, sysUser.getUserLevel());
				if(sysUser.getUserLevel()==Constant.User.ADMIN){
					flag = "1";
				}else if(sysUser.getUserLevel()==Constant.User.CUSTOMER){
					flag = "2";
				}else if(sysUser.getUserLevel()==Constant.User.PROCUREMENT){
					flag = "3";
				}
				addActionMessage("<script>alert('登录成功！')</script>");
			}
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('登录失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}

}
