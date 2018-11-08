package com.bcos.po;

import java.util.Date;

import com.bcos.util.Constant;
import com.bcos.util.Tool_common;

public class OrderList extends BasePO {
	private String orderListCode;
	private Client client;
	private User inputUser;
	private Date orderDate;
	private Date sumDate;
	private int listType;
	private double totalPrice;
	private String memo;
	private Long parentListId;
	private int checkStatus;
	private int sumStatus;
	
	private String strTotalPrice;
	private String strCheckStatus;
	private String strSumStatus;
	private String strListType;
	
	private Date sOrderDate;
	private Date eOrderDate;
	private String sOrderDateStr;
	private String eOrderDateStr;
	
	private Date sSumDate;
	private Date eSumDate;
	private String sSumDateStr;
	private String eSumDateStr;
	
	
	public Date getSSumDate() {
		return sSumDate;
	}
	public void setSSumDate(Date sumDate) {
		sSumDate = sumDate;
	}
	public Date getESumDate() {
		return eSumDate;
	}
	public void setESumDate(Date sumDate) {
		eSumDate = sumDate;
	}
	public String getSSumDateStr() {
		return sSumDateStr;
	}
	public void setSSumDateStr(String sumDateStr) {
		sSumDateStr = sumDateStr;
	}
	public String getESumDateStr() {
		return eSumDateStr;
	}
	public void setESumDateStr(String sumDateStr) {
		eSumDateStr = sumDateStr;
	}
	public String getSOrderDateStr() {
		return sOrderDateStr;
	}
	public void setSOrderDateStr(String orderDateStr) {
		sOrderDateStr = orderDateStr;
	}
	public String getEOrderDateStr() {
		return eOrderDateStr;
	}
	public void setEOrderDateStr(String orderDateStr) {
		eOrderDateStr = orderDateStr;
	}
	public Date getSOrderDate() {
		return sOrderDate;
	}
	public void setSOrderDate(Date orderDate) {
		sOrderDate = orderDate;
	}
	public Date getEOrderDate() {
		return eOrderDate;
	}
	public void setEOrderDate(Date orderDate) {
		eOrderDate = orderDate;
	}
	public String getOrderListCode() {
		return orderListCode;
	}
	public void setOrderListCode(String orderListCode) {
		this.orderListCode = orderListCode;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public User getInputUser() {
		return inputUser;
	}
	public void setInputUser(User inputUser) {
		this.inputUser = inputUser;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getListType() {
		return listType;
	}
	public void setListType(int listType) {
		this.listType = listType;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Long getParentListId() {
		return parentListId;
	}
	public void setParentListId(Long parentListId) {
		this.parentListId = parentListId;
	}
	public int getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(int checkStatus) {
		this.checkStatus = checkStatus;
	}
	public int getSumStatus() {
		return sumStatus;
	}
	public void setSumStatus(int sumStatus) {
		this.sumStatus = sumStatus;
	}
	public String getStrCheckStatus() {
		this.strCheckStatus = Constant.Checked.getName(this.checkStatus);
		return strCheckStatus;
	}
	public void setStrCheckStatus(String strCheckStatus) {
		this.strCheckStatus = strCheckStatus;
	}
	public String getStrSumStatus() {
		this.strSumStatus = Constant.Summarized.getName(this.sumStatus);
		return strSumStatus;
	}
	public void setStrSumStatus(String strSumStatus) {
		this.strSumStatus = strSumStatus;
	}
	public Date getSumDate() {
		return sumDate;
	}
	public void setSumDate(Date sumDate) {
		this.sumDate = sumDate;
	}
	public String getStrTotalPrice() {
		if (this.totalPrice>=0) {
			this.strTotalPrice = Tool_common.formatNumber(totalPrice, 2);
		}
		return strTotalPrice;
	}
	public void setStrTotalPrice(String strTotalPrice) {
		this.strTotalPrice = strTotalPrice;
	}
	public String getStrListType() {
		this.strListType = Constant.OrderingListType.getName(this.listType);
		return strListType;
	}
	public void setStrListType(String strListType) {
		this.strListType = strListType;
	}
	
	
	
}
