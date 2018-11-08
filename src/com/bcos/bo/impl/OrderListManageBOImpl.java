package com.bcos.bo.impl;

import java.util.ArrayList;
import java.util.List;

import com.bcos.bo.OrderListManageBO;
import com.bcos.dao.OrderListManageDAO;
import com.bcos.page.PageBean;
import com.bcos.po.Brand;
import com.bcos.po.Model;
import com.bcos.po.OrderList;
import com.bcos.po.OrderListDetail;
import com.bcos.po.Series;
import com.bcos.po.Size;
import com.bcos.po.Usage;
import com.bcos.util.Constant;
import com.bcos.util.PropertyUtil;
import com.bcos.util.Tool_common;

public class OrderListManageBOImpl extends BaseBOImpl implements
		OrderListManageBO {
	private OrderListManageDAO orderListManageDAO;
	
	public PageBean getPageBean(int currPage,OrderList orderList){
		try{
			orderListManageDAO = Constant.getOrderListManageDAO();
			return orderListManageDAO.getPageBean(currPage,orderList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public PageBean getSumListPageBean(int currPage,OrderList orderList){
		try{
			orderListManageDAO = Constant.getOrderListManageDAO();
			return orderListManageDAO.getSumListPageBean(currPage,orderList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public List<OrderList> queryAll(PageBean pageBean ,OrderList orderList){
		orderListManageDAO = Constant.getOrderListManageDAO();
		return orderListManageDAO.queryAll(pageBean,orderList);
	
	}
	
	public List<OrderList> queryAllSumList(PageBean pageBean ,OrderList orderList){
		orderListManageDAO = Constant.getOrderListManageDAO();
		return orderListManageDAO.queryAllSumList(pageBean,orderList);
	
	}
	
	public List<OrderList> queryClientList4AdminManage(OrderList orderList){
		orderListManageDAO = Constant.getOrderListManageDAO();
		return orderListManageDAO.queryClientList4AdminManage(orderList);
	}
	
	public List<OrderList> queryClientListByCheckedIds(String checkedIds){
		orderListManageDAO = Constant.getOrderListManageDAO();
		return orderListManageDAO.queryClientListByCheckedIds(checkedIds);
	}
	
	public String createClientListCode(){
		orderListManageDAO = Constant.getOrderListManageDAO();
		String code = "";
		//BCOS-
		String part1 = Constant.getBcosCode();
		//CL-
		String part2 = Constant.getCodeP2ClientList();
		//6位年月日
		String part3 = String.valueOf(Tool_common.getCurrentSysTime(4)).substring(2,4)
						+String.valueOf(Tool_common.getCurrentSysTime(4)).substring(5,7)
						+String.valueOf(Tool_common.getCurrentSysTime(4)).substring(8);
		//4位顺序号
		String part4 = "";
		//获取当前存在最大代码
		String currentMaxCode = orderListManageDAO.getCurrentMaxClientListCode();
		String currentMaxPart4 = null;
		//获取当前最大代码顺序号
		//判断逻辑用于处理首次取值为空的情况
		if(currentMaxCode == null || "".equals(currentMaxCode)){
			currentMaxPart4 = "0000";
		}else{
			//实例：code组成为：BCOS-CL-1103310001，数字部分为6位年月日“110331”和4位顺序号“0001”，part4截下部分为最后4位顺序号
			currentMaxPart4 = currentMaxCode.substring(14);
		}
		part4 = String.valueOf(Long.parseLong(currentMaxPart4)+1);//将当前最大顺序号递增生成新顺序号
		if(part4.length()>0 && part4.length()<=4){//4位及4位以内顺序号
			switch(part4.length()){//补0处理
				case 1:
					part4 = "000"+part4;
					break;
				case 2:	
					part4 = "00"+part4;
					break;
				case 3:	
					part4 = "0"+part4;
					break;
				case 4:	
					break;
			}
		}else{//“10000”截取为“0000”处理		
			part4 = "0000";
		}
		code = part1+part2+part3+part4;
		return code;
	}
	
	public String createSumListCode(){
		orderListManageDAO = Constant.getOrderListManageDAO();
		String code = "";
		//BCOS-
		String part1 = Constant.getBcosCode();
		//SL-
		String part2 = Constant.getCodeP2SumList();
		//6位年月日
		String part3 = String.valueOf(Tool_common.getCurrentSysTime(4)).substring(2,4)
						+String.valueOf(Tool_common.getCurrentSysTime(4)).substring(5,7)
						+String.valueOf(Tool_common.getCurrentSysTime(4)).substring(8);
		//4位顺序号
		String part4 = "";
		//获取当前存在最大代码
		String currentMaxCode = orderListManageDAO.getCurrentMaxSumListCode();
		String currentMaxPart4 = null;
		//获取当前最大代码顺序号
		//判断逻辑用于处理首次取值为空的情况
		if(currentMaxCode == null || "".equals(currentMaxCode)){
			currentMaxPart4 = "0000";
		}else{
			//实例：code组成为：BCOS-SL-1103310001，数字部分为6位年月日“110331”和4位顺序号“0001”，part4截下部分为最后4位顺序号
			currentMaxPart4 = currentMaxCode.substring(14);
		}
		part4 = String.valueOf(Long.parseLong(currentMaxPart4)+1);//将当前最大顺序号递增生成新顺序号
		if(part4.length()>0 && part4.length()<=4){//4位及4位以内顺序号
			switch(part4.length()){//补0处理
				case 1:
					part4 = "000"+part4;
					break;
				case 2:	
					part4 = "00"+part4;
					break;
				case 3:	
					part4 = "0"+part4;
					break;
				case 4:	
					break;
			}
		}else{//“10000”截取为“0000”处理		
			part4 = "0000";
		}
		code = part1+part2+part3+part4;
		return code;
	}
	
	public void saveClientList(OrderList orderList){
		try{
			orderListManageDAO = Constant.getOrderListManageDAO();
			orderListManageDAO.saveClientList(orderList); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void saveClientListDetail(OrderListDetail orderListDetail){
		try{
			orderListManageDAO = Constant.getOrderListManageDAO();
			orderListManageDAO.saveClientListDetail(orderListDetail); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public OrderList editClientList(String id){
		try{
			orderListManageDAO = Constant.getOrderListManageDAO();
			return orderListManageDAO.editClientList(id); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public OrderListDetail editClientListDetail(String id){
		try{
			orderListManageDAO = Constant.getOrderListManageDAO();
			return orderListManageDAO.editClientListDetail(id); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public List<OrderListDetail> queryClientListDetail(Long orderListId){
		try{
			orderListManageDAO = Constant.getOrderListManageDAO();
			return orderListManageDAO.queryClientListDetail(orderListId);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public List<OrderListDetail> queryClientListDetailByOrderListDetail(OrderListDetail orderListDetail){
		try{
			orderListManageDAO = Constant.getOrderListManageDAO();
			return orderListManageDAO.queryClientListDetailByOrderListDetail(orderListDetail);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public List<OrderListDetail> getSumListDetail(String strCheckedIds){
		try{
			orderListManageDAO = Constant.getOrderListManageDAO();
			List<OrderListDetail> resultList = new ArrayList<OrderListDetail>();
			List<Object> list = orderListManageDAO.getSumListDetail(strCheckedIds);
			if(list!=null && list.size()>0){
				for(int i=0;i<list.size();i++){
					Object[] objs = (Object[]) list.get(i);
					OrderListDetail tempPO = new OrderListDetail();
					Brand tempBrand = new Brand();
					Usage tempUsage = new Usage();
					Series tempSeries = new Series();
					Size tempSize = new Size();
					Model tempModel = new Model();
					tempPO.setBrand(tempBrand);
					tempPO.setUsage(tempUsage);
					tempPO.setSeries(tempSeries);
					tempPO.setSize(tempSize);
					tempPO.setModel(tempModel);
					tempPO.getBrand().setId((Long)objs[0]);
					tempPO.getUsage().setId((Long)objs[1]);
					tempPO.getSeries().setId((Long)objs[2]);
					tempPO.getSize().setId((Long)objs[3]);
					tempPO.getModel().setId((Long)objs[4]);
					tempPO.setNumber(Integer.valueOf(((Long)objs[5]).toString()));
					//tempPO.setPrice(Tool_common.formatDataScale((Double)objs[6]));
					resultList.add(tempPO);
				}
			}
			return resultList;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	public String getCurrentMaxClientListCode(){
		orderListManageDAO = Constant.getOrderListManageDAO();
		return orderListManageDAO.getCurrentMaxClientListCode();
	}
	
	public OrderListManageDAO getOrderListManageDAO() {
		return orderListManageDAO;
	}

	public void setOrderListManageDAO(OrderListManageDAO orderListManageDAO) {
		this.orderListManageDAO = orderListManageDAO;
	}
	
	

}
