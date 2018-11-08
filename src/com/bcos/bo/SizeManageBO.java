package com.bcos.bo;

import java.util.List;

import com.bcos.po.Size;

public interface SizeManageBO extends BaseBO {
	public List<Size> queryAll();
	public Size editSize(String id);
	public void saveSize(Size size);
	public boolean isUsed(Long id);
	public List<Size> queryListByClient(Long clientId);
}
