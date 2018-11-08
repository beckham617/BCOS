package com.bcos.dao;

import java.util.List;

import com.bcos.page.PageBean;
import com.bcos.po.ClientToSeries;
import com.bcos.po.ClientToSeries;

public interface ClientToSeriesManageDAO extends BaseDAO {
	public List<ClientToSeries> queryAll(PageBean pageBean,ClientToSeries clientToSeries);
	public PageBean getPageBean(int currPage,ClientToSeries clientToSeries)  throws Exception;
	public void saveClientToSeries(ClientToSeries clientToSeries);
	public ClientToSeries editClientToSeries(String id);
}
