package com.bcos.bo;

import java.util.List;

import com.bcos.po.User;


public interface LoginBO extends BaseBO {
	public List<User> checkUser(User user);
}
