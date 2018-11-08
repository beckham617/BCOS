package com.bcos.bo.impl;

import java.util.List;

import com.bcos.bo.ModelManageBO;
import com.bcos.dao.ModelManageDAO;
import com.bcos.dao.SeriesManageDAO;
import com.bcos.po.Model;
import com.bcos.po.Series;
import com.bcos.util.Constant;
import com.bcos.page.PageBean;

public class ModelManageBOImpl extends BaseBOImpl implements ModelManageBO {
	private ModelManageDAO modelManageDAO;
	
	public PageBean getPageBean(int currPage,Model model){
		try{
			modelManageDAO = Constant.getModelManageDAO();
			return modelManageDAO.getPageBean(currPage,model);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Model> queryAll(PageBean pageBean ,Model model){
		modelManageDAO = Constant.getModelManageDAO();
		return modelManageDAO.queryAll(pageBean,model);
	}
	
	public Model editModel(String id){
		try{
			modelManageDAO = Constant.getModelManageDAO();
			return modelManageDAO.editModel(id); 
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void saveModel(Model model){
		modelManageDAO = Constant.getModelManageDAO();
		modelManageDAO.saveModel(model);
	}

	public List<Model> queryListBySeriesidAndSizeid(Long seriesId,Long sizeId){
		modelManageDAO = Constant.getModelManageDAO();
		return modelManageDAO.queryListBySeriesidAndSizeid(seriesId,sizeId);
	}
	
	public List<Model> queryListByParameters(Long seriesId,Long sizeId,Long clientId){
		modelManageDAO = Constant.getModelManageDAO();
		return modelManageDAO.queryListByParameters(seriesId,sizeId,clientId);
	}
	
	public ModelManageDAO getModelManageDAO() {
		return modelManageDAO;
	}

	public void setModelManageDAO(ModelManageDAO modelManageDAO) {
		this.modelManageDAO = modelManageDAO;
	}
	
	
}
