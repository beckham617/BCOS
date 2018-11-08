package com.bcos.dao;

import java.util.List;

import com.bcos.po.User;

public interface LoginDAO extends BaseDAO {
	public List<User> checkUser(User user);
}
