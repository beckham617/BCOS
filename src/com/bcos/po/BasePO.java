package com.bcos.po;

import java.io.Serializable;

import com.bcos.util.Constant;

/**
 * BasePO 
 * 
 * @author liliang
 */
@SuppressWarnings("serial")
public class BasePO implements Serializable {

	private Long id;
	private int deleted;
	private String strDeleted;
	
	public String getStrDeleted() {
		this.strDeleted = Constant.Deleted.getName(this.deleted);
		return strDeleted;
	}

	public void setStrDeleted(String strDeleted) {
		this.strDeleted = strDeleted;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
}
