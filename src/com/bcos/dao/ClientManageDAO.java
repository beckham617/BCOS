package com.bcos.dao;

import java.util.List;

import com.bcos.po.Client;

public interface ClientManageDAO {
	public List<Client> queryAll();
	public Client editClient(String id);
	public void saveClient(Client client);
	public boolean isUsed(Long id);
}
