package com.bcos.bo.impl;

import java.util.List;

import com.bcos.bo.SeriesManageBO;
import com.bcos.dao.SeriesManageDAO;
import com.bcos.po.Series;
import com.bcos.util.Constant;

public class SeriesManageBOImpl extends BaseBOImpl implements SeriesManageBO {
	private SeriesManageDAO seriesManageDAO;
	
	public List<Series> queryAll(Long brandId,Long usageId){
		seriesManageDAO = Constant.getSeriesManageDAO();
		return seriesManageDAO.queryAll(brandId,usageId);
	}
	
	public List<Series> queryListByParameters(Long brandId,Long usageId,Long clientId){
		seriesManageDAO = Constant.getSeriesManageDAO();
		return seriesManageDAO.queryListByParameters(brandId,usageId,clientId);
	}
	
	public Series editSeries(String id){
		try{
			seriesManageDAO = Constant.getSeriesManageDAO();
			return seriesManageDAO.editSeries(id); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveSeries(Series series){
		seriesManageDAO = Constant.getSeriesManageDAO();
		seriesManageDAO.saveSeries(series);
	}

	//判断是否被占用
	public boolean isUsed(Long id){
		try{
			seriesManageDAO = Constant.getSeriesManageDAO();
			return seriesManageDAO.isUsed(id); 
		}catch(Exception e){
			e.printStackTrace();
			return true;
		}
	}
	public SeriesManageDAO getSeriesManageDAO() {
		return seriesManageDAO;
	}

	public void setSeriesManageDAO(SeriesManageDAO seriesManageDAO) {
		this.seriesManageDAO = seriesManageDAO;
	}
	
}
