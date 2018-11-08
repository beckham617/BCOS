package com.bcos.action;

import java.util.ArrayList;
import java.util.List;

import com.bcos.bo.BrandManageBO;
import com.bcos.bo.ModelManageBO;
import com.bcos.bo.SeriesManageBO;
import com.bcos.bo.SizeManageBO;
import com.bcos.bo.UsageManageBO;
import com.bcos.bo.impl.BrandManageBOImpl;
import com.bcos.bo.impl.ModelManageBOImpl;
import com.bcos.bo.impl.SeriesManageBOImpl;
import com.bcos.bo.impl.SizeManageBOImpl;
import com.bcos.bo.impl.UsageManageBOImpl;
import com.bcos.po.Brand;
import com.bcos.po.Model;
import com.bcos.po.Series;
import com.bcos.po.Size;
import com.bcos.po.Usage;
import com.bcos.util.Tool_common;
import com.bcos.page.PageBean;


public class ModelManageAction extends BaseAction {
	private ModelManageBO modelManageBO;
	private SeriesManageBO seriesManageBO;
	private BrandManageBO brandManageBO;
	private UsageManageBO usageManageBO;
	private SizeManageBO sizeManageBO;
	private Model model;
	private List<Brand> brandList;
	private List<Usage> usageList;
	private List<Series> seriesList;
	private List<Size> sizeList;
	private List<Model> resultList;
	private String selectId;
	private String alertFlag;
	
	//分页参数
	private int currPage;  
    private String urlPath;  
    private PageBean pageBean;
    private String ptInfo;
    
	public String getPtInfo() {
		return ptInfo;
	}

	public void setPtInfo(String ptInfo) {
		this.ptInfo = ptInfo;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public String getUrlPath() {
		return urlPath;
	}

	public void setUrlPath(String urlPath) {
		this.urlPath = urlPath;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public List<Series> getSeriesList() {
		return seriesList;
	}

	public void setSeriesList(List<Series> seriesList) {
		this.seriesList = seriesList;
	}

	public void setResultList(List<Model> resultList) {
		this.resultList = resultList;
	}

	/**
	 * 查询产品名称列表
	 * @return
	 */
	@Override
	public String execute(){
		try{
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			seriesManageBO = new SeriesManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			Long brandId = -1l;
			Long usageId = -1l;
			Long seriesId = -1l;
			Long sizeId = -1l;
			if(model!=null && model.getBrand()!=null && model.getBrand().getId()!=null){//产品品牌查询条件
				brandId = model.getBrand().getId();
			}
			if(model!=null && model.getUsage()!=null && model.getUsage().getId()!=null){//产品品牌查询条件
				usageId = model.getUsage().getId();
			}
			if(model!=null && model.getSeries()!=null && model.getSeries().getId()!=null){//产品系列查询条件
				seriesId = model.getSeries().getId();
			}
			if(model!=null && model.getSize()!=null && model.getSize().getId()!=null){//产品医用功能分类查询条件
				sizeId = model.getSize().getId();
			}
			if(!(brandId==-1l && usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));//当产品品牌和用途选择其一的时候，查询产品系列列表
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
			
			//分页查询
			if (currPage == 0) {  
	            currPage = 1;  
	        } 
			modelManageBO = new ModelManageBOImpl();
			pageBean = modelManageBO.getPageBean(currPage,model);
			//通过查询条件查询产品名称记录
			resultList = modelManageBO.queryAll(pageBean,model);
			//带有参数的URL 
			StringBuffer sb = new StringBuffer();  
	        sb.append("productModelManage.action?model.brand.id=").append(brandId);
	        sb.append("&model.usage.id=").append(usageId);
	        sb.append("&model.series.id=").append(seriesId);
	        sb.append("&model.size.id=").append(sizeId);
	        sb.append("&");
	        urlPath = sb.toString();  
	        
	        //ptInfo = Tool_common.ptInfo(pageBean,urlPath);
			//返回提示信息
			if(alertFlag!=null && alertFlag.equals("1")){
				addActionMessage("<script>alert('删除成功！')</script>");
			}else if(alertFlag!=null && alertFlag.equals("2")){
				addActionMessage("<script>alert('删除失败！')</script>");
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
	 * 新建产品名称
	 * @return
	 */
	public String addModel(){
		brandManageBO = new BrandManageBOImpl();
		usageManageBO = new UsageManageBOImpl();
		seriesManageBO = new SeriesManageBOImpl();
		sizeManageBO = new SizeManageBOImpl();
		this.setBrandList(brandManageBO.queryAll());
		this.setUsageList(usageManageBO.queryAll());
		this.setSizeList(sizeManageBO.queryAll());
		List<Series> tempList = new ArrayList();
		this.setSeriesList(tempList);
		model = new Model();
		return SUCCESS;
	}
	
	/**
	 * 修改产品名称
	 * @return
	 */
	public String editModel()throws Exception{
		try{
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			//查询需要修改的单条model记录
			modelManageBO = new ModelManageBOImpl();
			model = modelManageBO.editModel(selectId);
			//根据该model记录的品牌和用途，查找对应的seriesList系列列表
			seriesManageBO = new SeriesManageBOImpl();
			this.setSeriesList(seriesManageBO.queryAll(model.getBrand().getId(), model.getUsage().getId()));
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 保存产品名称
	 * @return
	 */
	public String saveModel()throws Exception{
		try{
			modelManageBO = new ModelManageBOImpl();
			//修改保存
			if(model.getId()!=null){
				model.setModelName(Tool_common.toCHN(model.getModelName()));//产品名称名称
				modelManageBO.saveModel(model);
				alertFlag = "4";
				return "edit";
			}
			
			//新增保存
			model.setModelName(Tool_common.toCHN(model.getModelName()));//产品名称名称
			modelManageBO.saveModel(model);
			model = new Model();
			//跳转回新增页面，设定页面各属性列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			seriesManageBO = new SeriesManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			List<Series> tempList = new ArrayList();
			this.setSeriesList(tempList);
			addActionMessage("<script>alert('保存成功！')</script>");
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('保存失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 逻辑删除产品名称
	 * @return
	 */
	public String deleteModel()throws Exception{
		try{
			//查询需要修改的单挑model记录
			modelManageBO = new ModelManageBOImpl();
			model = modelManageBO.editModel(selectId);
			model.setDeleted(1);
			modelManageBO.saveModel(model);
			alertFlag = "1";
		}catch(Exception e){
			e.printStackTrace();
			alertFlag = "2";
			//addActionMessage("<script>alert('删除失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	
	/**
	 * 显示产品系列列表
	 * @return
	 */
	public String displaySeriesList() throws Exception{
		try{
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			seriesManageBO = new SeriesManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			Long brandId = -1l;
			Long usageId = -1l;
			if(model!=null && model.getBrand()!=null && model.getBrand().getId()!=null){//产品品牌查询条件
				brandId = model.getBrand().getId();
			}
			if(model!=null && model.getUsage()!=null && model.getUsage().getId()!=null){//产品品牌查询条件
				usageId = model.getUsage().getId();
			}
			if(!(brandId==-1l && usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));//当产品品牌和用途选择其一的时候，查询产品系列列表
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
		}catch(Exception e){
			e.printStackTrace();
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
	public List<Brand> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
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
		
	public ModelManageBO getModelManageBO() {
		return modelManageBO;
	}

	public void setModelManageBO(ModelManageBO modelManageBO) {
		this.modelManageBO = modelManageBO;
	}

	public Model getModel() {
		return model;
	}

	public void setModel(Model model) {
		this.model = model;
	}

	public List<Model> getResultList() {
		return resultList;
	}

	public SizeManageBO getSizeManageBO() {
		return sizeManageBO;
	}

	public void setSizeManageBO(SizeManageBO sizeManageBO) {
		this.sizeManageBO = sizeManageBO;
	}

	public List<Size> getSizeList() {
		return sizeList;
	}

	public void setSizeList(List<Size> sizeList) {
		this.sizeList = sizeList;
	}
	
	
}
