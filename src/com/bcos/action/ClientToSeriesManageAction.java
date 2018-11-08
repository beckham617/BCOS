package com.bcos.action;

import java.util.ArrayList;
import java.util.List;

import com.bcos.bo.BrandManageBO;
import com.bcos.bo.ClientManageBO;
import com.bcos.bo.ClientToSeriesManageBO;
import com.bcos.bo.ModelManageBO;
import com.bcos.bo.SeriesManageBO;
import com.bcos.bo.SizeManageBO;
import com.bcos.bo.UsageManageBO;
import com.bcos.bo.impl.BrandManageBOImpl;
import com.bcos.bo.impl.ClientManageBOImpl;
import com.bcos.bo.impl.ClientToSeriesManageBOImpl;
import com.bcos.bo.impl.ModelManageBOImpl;
import com.bcos.bo.impl.SeriesManageBOImpl;
import com.bcos.bo.impl.SizeManageBOImpl;
import com.bcos.bo.impl.UsageManageBOImpl;
import com.bcos.page.PageBean;
import com.bcos.po.Brand;
import com.bcos.po.Client;
import com.bcos.po.ClientToSeries;
import com.bcos.po.Model;
import com.bcos.po.Series;
import com.bcos.po.Size;
import com.bcos.po.Usage;
import com.bcos.util.Tool_common;

public class ClientToSeriesManageAction extends BaseAction {
	private ClientToSeriesManageBO clientToSeriesManageBO;
	private BrandManageBO brandManageBO;
	private UsageManageBO usageManageBO;
	private SeriesManageBO seriesManageBO;
	private SizeManageBO sizeManageBO;
	private ModelManageBO modelManageBO;
	private ClientManageBO clientManageBO;
	private List<Brand> brandList;
	private List<Usage> usageList;
	private List<Series> seriesList;
	private List<Size> sizeList;
	private List<Model> modelList;
	private List<Client> clientList;
	private List<ClientToSeries> resultList;
	private String selectId;
	private String alertFlag;
	private ClientToSeries clientToSeries;
	
	//分页参数
	private int currPage;  
    private String urlPath;  
    private PageBean pageBean;
    
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


	public List<ClientToSeries> getResultList() {
		return resultList;
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
			modelManageBO = new ModelManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			this.setClientList(clientManageBO.queryAll());
			Long brandId = -1l;
			Long usageId = -1l;
			Long seriesId = -1l;
			Long sizeId = -1l;
			Long modelId = -1l;
			Long clientId = -1l;
			if(clientToSeries!=null && clientToSeries.getBrand()!=null && clientToSeries.getBrand().getId()!=null){//产品品牌查询条件
				brandId = clientToSeries.getBrand().getId();
			}
			if(clientToSeries!=null && clientToSeries.getUsage()!=null && clientToSeries.getUsage().getId()!=null){//产品品牌查询条件
				usageId = clientToSeries.getUsage().getId();
			}
			if(clientToSeries!=null && clientToSeries.getSeries()!=null && clientToSeries.getSeries().getId()!=null){//产品系列查询条件
				seriesId = clientToSeries.getSeries().getId();
			}
			if(clientToSeries!=null && clientToSeries.getSize()!=null && clientToSeries.getSize().getId()!=null){//产品系列查询条件
				sizeId = clientToSeries.getSize().getId();
			}
			if(clientToSeries!=null && clientToSeries.getModel()!=null && clientToSeries.getModel().getId()!=null){//产品系列查询条件
				modelId = clientToSeries.getModel().getId();
			}
			if(clientToSeries!=null && clientToSeries.getClient()!=null && clientToSeries.getClient().getId()!=null){//客户公司查询条件
				clientId = clientToSeries.getClient().getId();
			}
			//根据所选的品牌和用途，查询系列列表
			if(!(brandId==-1l && usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
			//根据所选的系列和医用功能分类，查询名称列表
			if(!(seriesId==-1l && sizeId==-1l)){
				this.setModelList(modelManageBO.queryListBySeriesidAndSizeid(seriesId, sizeId));
			}else{
				List<Model> tempModelList = new ArrayList();
				this.setModelList(tempModelList);
			}
			//分页查询
			if (currPage == 0) {  
	            currPage = 1;  
	        } 
			clientToSeriesManageBO = new ClientToSeriesManageBOImpl();
			pageBean = clientToSeriesManageBO.getPageBean(currPage,clientToSeries);
			//通过查询条件查询产品名称记录
			resultList = clientToSeriesManageBO.queryAll(pageBean,clientToSeries);
			//带有参数的URL 
			StringBuffer sb = new StringBuffer();  
	        sb.append("clientToSeriesManage.action?clientToSeries.brand.id=").append(brandId);
	        sb.append("&clientToSeries.usage.id=").append(usageId);
	        sb.append("&clientToSeries.series.id=").append(seriesId);
	        sb.append("&clientToSeries.size.id=").append(sizeId);
	        sb.append("&clientToSeries.model.id=").append(modelId);
	        sb.append("&clientToSeries.client.id=").append(clientId);
	        sb.append("&");
	        urlPath = sb.toString();  
	        
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
	 * 显示客户-产品系列授权中的系列列表-管理页面
	 * @return
	 */
	public String displaySeriesList4CTSManage(){
		try{
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			seriesManageBO = new SeriesManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			this.setClientList(clientManageBO.queryAll());
			Long brandId = -1l;
			Long usageId = -1l;
			Long sizeId = -1l;
			Long clientId = -1l;
			if(clientToSeries!=null && clientToSeries.getBrand()!=null && clientToSeries.getBrand().getId()!=null){//产品品牌查询条件
				brandId = clientToSeries.getBrand().getId();
			}
			if(clientToSeries!=null && clientToSeries.getUsage()!=null && clientToSeries.getUsage().getId()!=null){//产品用途查询条件
				usageId = clientToSeries.getUsage().getId();
			}
			if(clientToSeries!=null && clientToSeries.getSize()!=null && clientToSeries.getSize().getId()!=null){//产品系列查询条件
				sizeId = clientToSeries.getSize().getId();
			}
			if(clientToSeries!=null && clientToSeries.getClient()!=null && clientToSeries.getClient().getId()!=null){//客户公司查询条件
				clientId = clientToSeries.getClient().getId();
			}
			//根据所选的品牌和用途，查询系列列表
			if(!(brandId==-1l && usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
			//名称列表为空
			List<Model> tempModelList = new ArrayList();
			this.setModelList(tempModelList);
			
			//分页查询
			if (currPage == 0) {  
	            currPage = 1;  
	        } 
			clientToSeriesManageBO = new ClientToSeriesManageBOImpl();
			pageBean = clientToSeriesManageBO.getPageBean(currPage,clientToSeries);
			//通过查询条件查询产品名称记录
			resultList = clientToSeriesManageBO.queryAll(pageBean,clientToSeries);
			//带有参数的URL 
			StringBuffer sb = new StringBuffer();  
	        sb.append("clientToSeriesManage.action?clientToSeries.brand.id=").append(brandId);
	        sb.append("&clientToSeries.usage.id=").append(usageId);
	        sb.append("&clientToSeries.size.id=").append(sizeId);
	        sb.append("&clientToSeries.client.id=").append(clientId);
	        sb.append("&");
	        urlPath = sb.toString();  
	        
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
	 * 显示客户-产品系列授权中的名称列表-管理页面
	 * @return
	 */
	public String displayModelList4CTSManage(){
		try{
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			seriesManageBO = new SeriesManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			modelManageBO = new ModelManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			this.setClientList(clientManageBO.queryAll());
			Long brandId = -1l;
			Long usageId = -1l;
			Long seriesId = -1l;
			Long sizeId = -1l;
			Long clientId = -1l;
			if(clientToSeries!=null && clientToSeries.getBrand()!=null && clientToSeries.getBrand().getId()!=null){//产品品牌查询条件
				brandId = clientToSeries.getBrand().getId();
			}
			if(clientToSeries!=null && clientToSeries.getUsage()!=null && clientToSeries.getUsage().getId()!=null){//产品品牌查询条件
				usageId = clientToSeries.getUsage().getId();
			}
			if(clientToSeries!=null && clientToSeries.getSeries()!=null && clientToSeries.getSeries().getId()!=null){//产品系列查询条件
				seriesId = clientToSeries.getSeries().getId();
			}
			if(clientToSeries!=null && clientToSeries.getSize()!=null && clientToSeries.getSize().getId()!=null){//产品系列查询条件
				sizeId = clientToSeries.getSize().getId();
			}
			if(clientToSeries!=null && clientToSeries.getClient()!=null && clientToSeries.getClient().getId()!=null){//客户公司查询条件
				clientId = clientToSeries.getClient().getId();
			}
			//根据所选的品牌和用途，查询系列列表
			if(!(brandId==-1l && usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
			//根据所选的系列和医用功能分类，查询名称列表
			if(!(seriesId==-1l && sizeId==-1l)){
				this.setModelList(modelManageBO.queryListBySeriesidAndSizeid(seriesId, sizeId));//当选择产品系列和医用功能分类的时候，查询产品名称列表
			}else{
				List<Model> tempModelList = new ArrayList();
				this.setModelList(tempModelList);
			}
			//分页查询
			if (currPage == 0) {  
	            currPage = 1;  
	        } 
			clientToSeriesManageBO = new ClientToSeriesManageBOImpl();
			pageBean = clientToSeriesManageBO.getPageBean(currPage,clientToSeries);
			//通过查询条件查询产品名称记录
			resultList = clientToSeriesManageBO.queryAll(pageBean,clientToSeries);
			//带有参数的URL 
			StringBuffer sb = new StringBuffer();  
	        sb.append("clientToSeriesManage.action?clientToSeries.brand.id=").append(brandId);
	        sb.append("&clientToSeries.usage.id=").append(usageId);
	        sb.append("&clientToSeries.series.id=").append(seriesId);
	        sb.append("&clientToSeries.size.id=").append(sizeId);
	        sb.append("&clientToSeries.client.id=").append(clientId);
	        sb.append("&");
	        urlPath = sb.toString();  
	        
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
	 * 新建客户-产品授权
	 * @return
	 */
	public String addClientToSeries(){
		brandManageBO = new BrandManageBOImpl();
		usageManageBO = new UsageManageBOImpl();
		seriesManageBO = new SeriesManageBOImpl();
		sizeManageBO = new SizeManageBOImpl();
		modelManageBO = new ModelManageBOImpl();
		clientManageBO = new ClientManageBOImpl();
		this.setBrandList(brandManageBO.queryAll());
		this.setUsageList(usageManageBO.queryAll());
		this.setSizeList(sizeManageBO.queryAll());
		this.setClientList(clientManageBO.queryAll());
		List<Series> tempList = new ArrayList();
		this.setSeriesList(tempList);
		List<Model> tempModelList = new ArrayList();
		this.setModelList(tempModelList);
		
		clientToSeries = new ClientToSeries();
		return SUCCESS;
	}
	
	/**
	 * 修改产品客户-产品授权
	 * @return
	 */
	public String editClientToSeries()throws Exception{
		try{
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			seriesManageBO = new SeriesManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			modelManageBO = new ModelManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			this.setClientList(clientManageBO.queryAll());
			//查询需要修改的单条clientToSeries记录
			clientToSeriesManageBO = new ClientToSeriesManageBOImpl();
			clientToSeries = clientToSeriesManageBO.editClientToSeries(selectId);
			//根据该clientToSeries记录的品牌和用途，查找对应的seriesList系列列表
			seriesManageBO = new SeriesManageBOImpl();
			this.setSeriesList(seriesManageBO.queryAll(clientToSeries.getBrand().getId(), clientToSeries.getUsage().getId()));
			this.setModelList(modelManageBO.queryListBySeriesidAndSizeid(clientToSeries.getSeries().getId(), clientToSeries.getSize().getId()));
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 保存产品客户-产品授权
	 * @return
	 */
	public String saveClientToSeries()throws Exception{
		try{
			clientToSeriesManageBO = new ClientToSeriesManageBOImpl();
			//修改保存
			if(clientToSeries.getId()!=null){
				clientToSeriesManageBO.saveClientToSeries(clientToSeries);
				alertFlag = "4";
				return "edit";
			}
			
			//新增保存
			clientToSeriesManageBO.saveClientToSeries(clientToSeries);
			clientToSeries = new ClientToSeries();
			//跳转回新增页面，设定页面各属性列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			seriesManageBO = new SeriesManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			modelManageBO = new ModelManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			this.setClientList(clientManageBO.queryAll());
			List<Series> tempList = new ArrayList();
			this.setSeriesList(tempList);
			List<Model> tempModelList = new ArrayList();
			this.setModelList(tempModelList);
			addActionMessage("<script>alert('保存成功！')</script>");
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('保存失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 逻辑删除产品客户-产品授权
	 * @return
	 */
	public String deleteClientToSeries()throws Exception{
		try{
			//查询需要修改的单挑clientToSeries记录
			clientToSeriesManageBO = new ClientToSeriesManageBOImpl();
			clientToSeries = clientToSeriesManageBO.editClientToSeries(selectId);
			clientToSeries.setDeleted(1);
			clientToSeriesManageBO.saveClientToSeries(clientToSeries);
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
	 * 显示客户-产品系列授权中的系列列表-修改页面
	 * @return
	 */
	public String displaySeriesList4CTS(){
		try{
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			seriesManageBO = new SeriesManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			this.setClientList(clientManageBO.queryAll());
			Long brandId = -1l;
			Long usageId = -1l;
			Long sizeId = -1l;
			Long clientId = -1l;
			if(clientToSeries!=null && clientToSeries.getBrand()!=null && clientToSeries.getBrand().getId()!=null){//产品品牌查询条件
				brandId = clientToSeries.getBrand().getId();
			}
			if(clientToSeries!=null && clientToSeries.getUsage()!=null && clientToSeries.getUsage().getId()!=null){//产品用途查询条件
				usageId = clientToSeries.getUsage().getId();
			}
			if(clientToSeries!=null && clientToSeries.getSize()!=null && clientToSeries.getSize().getId()!=null){//产品系列查询条件
				sizeId = clientToSeries.getSize().getId();
			}
			if(clientToSeries!=null && clientToSeries.getClient()!=null && clientToSeries.getClient().getId()!=null){//客户公司查询条件
				clientId = clientToSeries.getClient().getId();
			}
			//根据所选的品牌和用途，查询系列列表
			if(!(brandId==-1l && usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
			//名称列表为空
			List<Model> tempModelList = new ArrayList();
			this.setModelList(tempModelList);
			
		
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示客户-产品系列授权中的名称列表-修改页面
	 * @return
	 */
	public String displayModelList4CTS(){
		try{
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			seriesManageBO = new SeriesManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			modelManageBO = new ModelManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			this.setClientList(clientManageBO.queryAll());
			Long brandId = -1l;
			Long usageId = -1l;
			Long seriesId = -1l;
			Long sizeId = -1l;
			Long clientId = -1l;
			if(clientToSeries!=null && clientToSeries.getBrand()!=null && clientToSeries.getBrand().getId()!=null){//产品品牌查询条件
				brandId = clientToSeries.getBrand().getId();
			}
			if(clientToSeries!=null && clientToSeries.getUsage()!=null && clientToSeries.getUsage().getId()!=null){//产品品牌查询条件
				usageId = clientToSeries.getUsage().getId();
			}
			if(clientToSeries!=null && clientToSeries.getSeries()!=null && clientToSeries.getSeries().getId()!=null){//产品系列查询条件
				seriesId = clientToSeries.getSeries().getId();
			}
			if(clientToSeries!=null && clientToSeries.getSize()!=null && clientToSeries.getSize().getId()!=null){//产品系列查询条件
				sizeId = clientToSeries.getSize().getId();
			}
			if(clientToSeries!=null && clientToSeries.getClient()!=null && clientToSeries.getClient().getId()!=null){//客户公司查询条件
				clientId = clientToSeries.getClient().getId();
			}
			//根据所选的品牌和用途，查询系列列表
			if(!(brandId==-1l && usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
			//根据所选的系列和医用功能分类，查询名称列表
			if(!(seriesId==-1l && sizeId==-1l)){
				this.setModelList(modelManageBO.queryListBySeriesidAndSizeid(seriesId, sizeId));//当选择产品系列和医用功能分类的时候，查询产品名称列表
			}else{
				List<Model> tempModelList = new ArrayList();
				this.setModelList(tempModelList);
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
		

	public ClientToSeriesManageBO getClientToSeriesManageBO() {
		return clientToSeriesManageBO;
	}

	public void setClientToSeriesManageBO(
			ClientToSeriesManageBO clientToSeriesManageBO) {
		this.clientToSeriesManageBO = clientToSeriesManageBO;
	}

	public void setResultList(List<ClientToSeries> resultList) {
		this.resultList = resultList;
	}

	public ClientManageBO getClientManageBO() {
		return clientManageBO;
	}

	public void setClientManageBO(ClientManageBO clientManageBO) {
		this.clientManageBO = clientManageBO;
	}

	public List<Client> getClientList() {
		return clientList;
	}

	public void setClientList(List<Client> clientList) {
		this.clientList = clientList;
	}

	public ClientToSeries getClientToSeries() {
		return clientToSeries;
	}

	public void setClientToSeries(ClientToSeries clientToSeries) {
		this.clientToSeries = clientToSeries;
	}

	public SizeManageBO getSizeManageBO() {
		return sizeManageBO;
	}

	public void setSizeManageBO(SizeManageBO sizeManageBO) {
		this.sizeManageBO = sizeManageBO;
	}

	

	public ModelManageBO getModelManageBO() {
		return modelManageBO;
	}

	public void setModelManageBO(ModelManageBO modelManageBO) {
		this.modelManageBO = modelManageBO;
	}

	public List<Size> getSizeList() {
		return sizeList;
	}

	public void setSizeList(List<Size> sizeList) {
		this.sizeList = sizeList;
	}

	public List<Model> getModelList() {
		return modelList;
	}

	public void setModelList(List<Model> modelList) {
		this.modelList = modelList;
	}
	
	
}
