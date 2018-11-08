package com.bcos.bo;

import java.util.List;

import com.bcos.po.Client;

public interface ClientManageBO extends BaseBO {
	public List<Client> queryAll();
	public Client editClient(String id);
	public void saveClient(Client client);
	public boolean isUsed(Long id);
}
