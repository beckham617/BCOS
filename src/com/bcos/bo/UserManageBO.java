package com.bcos.bo;

import java.util.List;

import com.bcos.po.User;

public interface UserManageBO extends BaseBO {
	public List<User> queryAll(Long clientId,int userLevelId);
	public User editUser(String id);
	public void saveUser(User user);
	public boolean isUsed(Long id);
	public boolean isExistSameCode(User user);
	public User getUserByCode(String userCode);
}
