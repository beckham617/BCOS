package com.bcos.bo;

import java.util.List;

import com.bcos.page.PageBean;
import com.bcos.po.ClientToSeries;

public interface ClientToSeriesManageBO extends BaseBO {
	public List<ClientToSeries> queryAll(PageBean pageBean,ClientToSeries clientToSeries);
	public PageBean getPageBean(int currPage,ClientToSeries clientToSeries);
	public void saveClientToSeries(ClientToSeries clientToSeries);
	public ClientToSeries editClientToSeries(String id);
}
