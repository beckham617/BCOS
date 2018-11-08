package com.bcos.bo;

import java.util.List;

import com.bcos.po.Model;
import com.bcos.page.PageBean;

public interface ModelManageBO extends BaseBO {
	public List<Model> queryAll(PageBean pageBean,Model model);
	public PageBean getPageBean(int currPage,Model model);
	public void saveModel(Model model);
	public Model editModel(String id);
	public List<Model> queryListBySeriesidAndSizeid(Long seriesId,Long sizeId);
	public List<Model> queryListByParameters(Long seriesId,Long sizeId,Long clientId);
}
