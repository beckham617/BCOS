package com.bcos.dao;

import java.util.List;

import com.bcos.po.User;

public interface UserManageDAO extends BaseDAO {
	public List<User> queryAll(Long clientId,int userLevelId);
	public void saveUser(User user);
	public User editUser(String id);
	public boolean isUsed(Long id);
	public boolean isExistSameCode(User user);
	public User getUserByCode(String userCode);
}
