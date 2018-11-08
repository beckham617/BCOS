package com.bcos.action;

import java.util.List;

import com.bcos.bo.BrandManageBO;
import com.bcos.bo.SeriesManageBO;
import com.bcos.bo.UsageManageBO;
import com.bcos.bo.impl.BrandManageBOImpl;
import com.bcos.bo.impl.SeriesManageBOImpl;
import com.bcos.bo.impl.UsageManageBOImpl;
import com.bcos.po.Brand;
import com.bcos.po.Series;
import com.bcos.po.Usage;
import com.bcos.util.Tool_common;

public class SeriesManageAction extends BaseAction {
	private SeriesManageBO seriesManageBO;
	private BrandManageBO brandManageBO;
	private UsageManageBO usageManageBO;
	private Series series;
	private List<Brand> brandList;
	private List<Usage> usageList;
	private List<Series> resultList;
	private String selectId;
	private String alertFlag;
	
	/**
	 * 查询产品系列列表
	 * @return
	 */
	@Override
	public String execute(){
		try{
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			seriesManageBO = new SeriesManageBOImpl();
			Long brandId = -1l;
			Long usageId = -1l;
			if(series!=null && series.getBrand()!=null && series.getBrand().getId()!=null){//产品品牌查询条件
				brandId = series.getBrand().getId();
			}
			if(series!=null && series.getUsage()!=null &&  series.getUsage().getId()!=null){//产品品牌查询条件
				usageId = series.getUsage().getId();
			}
			//通过查询条件查询产品系列记录
			resultList = seriesManageBO.queryAll(brandId,usageId);
			if(alertFlag!=null && alertFlag.equals("1")){
				addActionMessage("<script>alert('删除成功！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("2")){
				addActionMessage("<script>alert('删除失败！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("3")){
				addActionMessage("<script>alert('该系列已被使用，不能删除！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("4")){
				addActionMessage("<script>alert('保存成功！')</script>");
			}
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 新建产品系列
	 * @return
	 */
	public String addSeries(){
		brandManageBO = new BrandManageBOImpl();
		usageManageBO = new UsageManageBOImpl();
		this.setBrandList(brandManageBO.queryAll());
		this.setUsageList(usageManageBO.queryAll());
		series.getBrand().setId(-1l);//将查询出的品牌列表置到“请选择”处
		series.getUsage().setId(-1l);
		return SUCCESS;
	}
	
	/**
	 * 修改产品系列
	 * @return
	 */
	public String editSeries()throws Exception{
		try{
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			seriesManageBO = new SeriesManageBOImpl();
			series = seriesManageBO.editSeries(selectId);
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 保存产品系列
	 * @return
	 */
	public String saveSeries()throws Exception{
		try{
			seriesManageBO = new SeriesManageBOImpl();
			//修改保存
			if(series.getId()!=null){
				series.setSeriesName(Tool_common.toCHN(series.getSeriesName()));//产品系列名称
				seriesManageBO.saveSeries(series);
				alertFlag = "4";
				return "edit";
			}
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			//新增保存
			series.setSeriesName(Tool_common.toCHN(series.getSeriesName()));//产品系列名称
			seriesManageBO.saveSeries(series);
			series = new Series();
			addActionMessage("<script>alert('保存成功！')</script>");
			
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('保存失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 逻辑删除产品系列
	 * @return
	 */
	public String deleteSeries()throws Exception{
		try{
			seriesManageBO = new SeriesManageBOImpl();
			series = seriesManageBO.editSeries(selectId);//读取该条记录
			series.setDeleted(1);
			boolean isUsed = false;
			isUsed = seriesManageBO.isUsed(series.getId());//查看是否有“用途”占用
			if(isUsed){//该条记录被占用
				alertFlag = "3";
			}else{
				seriesManageBO.saveSeries(series);
				alertFlag = "1";
			}
			
		}catch(Exception e){
			e.printStackTrace();
			alertFlag = "2";
			//addActionMessage("<script>alert('删除失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	
	public SeriesManageBO getSeriesManageBO() {
		return seriesManageBO;
	}
	public void setSeriesManageBO(SeriesManageBO seriesManageBO) {
		this.seriesManageBO = seriesManageBO;
	}
	public BrandManageBO getBrandManageBO() {
		return brandManageBO;
	}
	public void setBrandManageBO(BrandManageBO brandManageBO) {
		this.brandManageBO = brandManageBO;
	}
	public Series getSeries() {
		return series;
	}
	public void setSeries(Series series) {
		this.series = series;
	}
	public List<Brand> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}
	public List<Series> getResultList() {
		return resultList;
	}
	public void setResultList(List<Series> resultList) {
		this.resultList = resultList;
	}
	public String getSelectId() {
		return selectId;
	}
	public void setSelectId(String selectId) {
		this.selectId = selectId;
	}
	public String getAlertFlag() {
		return alertFlag;
	}
	public void setAlertFlag(String alertFlag) {
		this.alertFlag = alertFlag;
	}

	public UsageManageBO getUsageManageBO() {
		return usageManageBO;
	}

	public void setUsageManageBO(UsageManageBO usageManageBO) {
		this.usageManageBO = usageManageBO;
	}

	public List<Usage> getUsageList() {
		return usageList;
	}

	public void setUsageList(List<Usage> usageList) {
		this.usageList = usageList;
	}
	
		
}
