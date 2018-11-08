package com.bcos.bo;

import java.util.List;

import com.bcos.po.Brand;
import com.bcos.po.Usage;

public interface UsageManageBO extends BaseBO {
	public List<Usage> queryAll();
	public Usage editUsage(String id);
	public void saveUsage(Usage usage);
	public boolean isUsed(Long id);
	public List<Usage> queryListByClient(Long clientId);
}
