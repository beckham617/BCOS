package com.bcos.dao;

import java.util.List;

import com.bcos.page.PageBean;
import com.bcos.po.OrderList;
import com.bcos.po.OrderListDetail;

public interface OrderListManageDAO extends BaseDAO {
	public PageBean getPageBean(int currPage,OrderList orderList) throws Exception;
	public PageBean getSumListPageBean(int currPage,OrderList orderList) throws Exception;
	public List<OrderList> queryAll(PageBean pageBean ,OrderList orderList);
	public List<OrderList> queryAllSumList(PageBean pageBean ,OrderList orderList);
	public List<OrderList> queryClientList4AdminManage(OrderList orderList);
	public List<OrderList> queryClientListByCheckedIds(String checkedIds);
	public String getCurrentMaxClientListCode();
	public String getCurrentMaxSumListCode();
	public void saveClientList(OrderList orderList);
	public void saveClientListDetail(OrderListDetail orderListDetail);
	public OrderList editClientList(String id);
	public OrderListDetail editClientListDetail(String id);
	public List<OrderListDetail> queryClientListDetail(Long orderListId);
	public List<OrderListDetail> queryClientListDetailByOrderListDetail(OrderListDetail orderListDetail);
	public List getSumListDetail(String strCheckedIds);
}
