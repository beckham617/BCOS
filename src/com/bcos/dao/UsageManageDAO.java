package com.bcos.dao;

import java.util.List;

import com.bcos.po.Usage;

public interface UsageManageDAO extends BaseDAO {
	public List<Usage> queryAll();
	public Usage editUsage(String id);
	public void saveUsage(Usage usage);
	public boolean isUsed(Long id);
	public List<Usage> queryListByClient(Long clientId);
}
