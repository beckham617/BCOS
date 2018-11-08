package com.bcos.dao;

import java.util.List;

import com.bcos.po.Size;

public interface SizeManageDAO extends BaseDAO {
	public List<Size> queryAll();
	public Size editSize(String id);
	public void saveSize(Size size);
	public boolean isUsed(Long id);
	public List<Size> queryListByClient(Long clientId);
}
