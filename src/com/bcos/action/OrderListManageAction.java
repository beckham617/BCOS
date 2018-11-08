package com.bcos.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bcos.bo.BrandManageBO;
import com.bcos.bo.ClientManageBO;
import com.bcos.bo.ModelManageBO;
import com.bcos.bo.OrderListManageBO;
import com.bcos.bo.SeriesManageBO;
import com.bcos.bo.SizeManageBO;
import com.bcos.bo.UsageManageBO;
import com.bcos.bo.UserManageBO;
import com.bcos.bo.impl.BrandManageBOImpl;
import com.bcos.bo.impl.ClientManageBOImpl;
import com.bcos.bo.impl.ModelManageBOImpl;
import com.bcos.bo.impl.OrderListManageBOImpl;
import com.bcos.bo.impl.SeriesManageBOImpl;
import com.bcos.bo.impl.SizeManageBOImpl;
import com.bcos.bo.impl.UsageManageBOImpl;
import com.bcos.bo.impl.UserManageBOImpl;
import com.bcos.page.PageBean;
import com.bcos.po.Brand;
import com.bcos.po.Client;
import com.bcos.po.Model;
import com.bcos.po.OrderList;
import com.bcos.po.OrderListDetail;
import com.bcos.po.Series;
import com.bcos.po.Size;
import com.bcos.po.Usage;
import com.bcos.po.User;
import com.bcos.util.Constant;
import com.bcos.util.Tool_common;
import com.opensymphony.xwork2.ActionContext;

public class OrderListManageAction extends BaseAction {
	private OrderListManageBO orderListManageBO;
	private UserManageBO userManageBO;
	private ClientManageBO clientManageBO;
	private ModelManageBO modelManageBO;
	private SeriesManageBO seriesManageBO;
	private BrandManageBO brandManageBO;
	private UsageManageBO usageManageBO;
	private SizeManageBO sizeManageBO;
	private OrderList orderList;
	private OrderListDetail orderListDetail;
	private List<OrderList> checkStatusList;
	private List<OrderList> sumStatusList;
	private List<OrderList> listTypeList;
	private List<Brand> brandList;
	private List<Usage> usageList;
	private List<Series> seriesList;
	private List<Size> sizeList;
	private List<Model> modelList;
	private List<Client> clientList;
	private List<OrderList> resultList;
	private List<OrderListDetail> detailResultList;
	private String selectId;
	private String selectDetailId;
	private String strCheckedIds;
	private String alertFlag;
	private String opUserName;
	private String currentDate;
	//分页参数
	private int currPage;  
    private String urlPath;  
    private PageBean pageBean;

	public ClientManageBO getClientManageBO() {
		return clientManageBO;
	}

	public void setClientManageBO(ClientManageBO clientManageBO) {
		this.clientManageBO = clientManageBO;
	}

	public UserManageBO getUserManageBO() {
		return userManageBO;
	}

	public void setUserManageBO(UserManageBO userManageBO) {
		this.userManageBO = userManageBO;
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

	/**
	 * 查询客户订单列表
	 * @return
	 */
	public String clientListManage() throws Exception{
		try{
			//得到当前登录人的客户公司ID
			String clientId = String.valueOf(ActionContext.getContext().getSession().get(Constant.User.LOGIN_USERCLIENT));
			//实例化对象
			if(orderList==null){
				orderList = new OrderList();
				//为订单对象实例化一个客户公司属性
				Client tempClient = new Client();
				orderList.setClient(tempClient);
				//将当前用户的客户公司ID赋值到订单当中
				orderList.getClient().setId(Long.parseLong(clientId));
				orderList.setCheckStatus(-1);
			}else if(orderList.getClient()==null){
				//为订单对象实例化一个客户公司属性
				Client tempClient = new Client();
				orderList.setClient(tempClient);
				//将当前用户的客户公司ID赋值到订单当中
				orderList.getClient().setId(Long.parseLong(clientId));
			}
			//分页查询
			if (currPage == 0) {  
	            currPage = 1;  
	        } 
			orderListManageBO = new OrderListManageBOImpl();
			pageBean = orderListManageBO.getPageBean(currPage,orderList);
			//通过查询条件查询客户订单记录
			resultList = orderListManageBO.queryAll(pageBean,orderList);
			//带有参数的URL 
			StringBuffer sb = new StringBuffer();  
	        sb.append("clientListManage.action?");
	        if(orderList.getSOrderDate()!=null){
	        	sb.append("orderList.sOrderDateStr=").append(Tool_common.Dateformat(orderList.getSOrderDate())).append("&");
	        }else if(orderList.getSOrderDateStr()!=null){
	        	sb.append("orderList.sOrderDateStr=").append(orderList.getSOrderDateStr()).append("&");
	        	orderList.setSOrderDate(Tool_common.StrdateFormatToDate(orderList.getSOrderDateStr()));
	        }
	        if(orderList.getEOrderDate()!=null){
	        	sb.append("orderList.eOrderDateStr=").append(Tool_common.Dateformat(orderList.getEOrderDate())).append("&");
	        }else if(orderList.getEOrderDateStr()!=null){
	        	sb.append("orderList.eOrderDateStr=").append(orderList.getEOrderDateStr()).append("&");
	        	orderList.setEOrderDate(Tool_common.StrdateFormatToDate(orderList.getEOrderDateStr()));
	        }
	        sb.append("orderList.checkStatus=").append(orderList.getCheckStatus()).append("&");
	        sb.append("orderList.listType=").append(orderList.getListType()).append("&");
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
	 * 新建客户订单
	 * @return
	 */
	public String newClientList() throws Exception{
		try{
			userManageBO = new UserManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			orderListManageBO = new OrderListManageBOImpl();
			//得到当前登录人的登录名
			String inputUserCode = String.valueOf(ActionContext.getContext().getSession().get(Constant.User.LOGIN_USERCODE));
			//得到当前登录人的客户公司ID
			String clientId = String.valueOf(ActionContext.getContext().getSession().get(Constant.User.LOGIN_USERCLIENT));
			User currentUser = userManageBO.getUserByCode(inputUserCode);
			Client currentClient = clientManageBO.editClient(clientId);
			//实例化客户订单，并组装信息
			orderList = new OrderList();
			orderList.setInputUser(currentUser);//录入人
			orderList.setClient(currentClient);//客户公司
			orderList.setOrderDate(new Date(System.currentTimeMillis()));//录入日期
			//orderList.setListType(Constant.OrderingListType.NORMAL_LIST);//订单类型
			orderList.setCheckStatus(Constant.Checked.CHECKED_NO);//复核状态
			orderList.setSumStatus(Constant.Summarized.SUMMARIZED_NO);//汇总状态
			//自动生成订单号
			String clientListCode = orderListManageBO.createClientListCode();
			orderList.setOrderListCode(clientListCode);//订单号
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 保存客户订单，并跳转到明细管理页面
	 * @return
	 */
	public String saveClientList()throws Exception{
		try{
			orderListManageBO = new OrderListManageBOImpl();
			
			//新增保存
			orderList.getClient().setClientName(Tool_common.toCHN(orderList.getClient().getClientName()));
			orderList.getInputUser().setUserName(Tool_common.toCHN(orderList.getInputUser().getUserName()));
			orderList.setMemo(Tool_common.toCHN(orderList.getMemo()));
			//为防止订单号冲突，重新检查一下订单号
			String orderListCode = orderListManageBO.getCurrentMaxClientListCode();//获得当前存在最新订单号
			if(orderList.getOrderListCode().equals(orderListCode)){//比较新建订单号是否被其他人提前保存，如果冲突，则新生成一个订单号
				String newOrderListCode = orderListManageBO.createClientListCode();//重新生成订单号
				orderList.setOrderListCode(newOrderListCode);
			}
			orderListManageBO.saveClientList(orderList);
			//跳转回新增页面，设定页面各属性列表
			
			//跳转到页面，只有品牌、用途、医用功能分类3个列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			this.setBrandList(brandManageBO.queryListByClient(orderList.getClient().getId()));
			this.setUsageList(usageManageBO.queryListByClient(orderList.getClient().getId()));
			this.setSizeList(sizeManageBO.queryListByClient(orderList.getClient().getId()));
			//将系列和名称列表置空
			seriesManageBO = new SeriesManageBOImpl();
			List<Series> tempSeriesList = new ArrayList();
			this.setSeriesList(tempSeriesList);
			modelManageBO = new ModelManageBOImpl();
			List<Model> tempModelList = new ArrayList();
			this.setModelList(tempModelList);
			
			//实例化一个订单明细对象
			orderListDetail = new OrderListDetail();
			Model tempModel = new Model();
			orderListDetail.setModel(tempModel);
			
			addActionMessage("<script>alert('订单保存成功！请管理所订购产品明细。')</script>");
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('订单保存失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改客户订单，跳转到明细页面
	 * @return
	 */
	public String editClientList()throws Exception{
		try{
			//查询需要修改的单条orderList记录
			orderListManageBO = new OrderListManageBOImpl();
			//根据所选订单id查询出该条订单信息
			orderList = orderListManageBO.editClientList(selectId);
			
			//跳转到页面，只有品牌、用途、医用功能分类3个列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			seriesManageBO = new SeriesManageBOImpl();
			modelManageBO = new ModelManageBOImpl();
			this.setBrandList(brandManageBO.queryListByClient(orderList.getClient().getId()));
			this.setUsageList(usageManageBO.queryListByClient(orderList.getClient().getId()));
			this.setSizeList(sizeManageBO.queryListByClient(orderList.getClient().getId()));
			//将系列和名称列表置空
			List<Series> tempSeriesList = new ArrayList();
			this.setSeriesList(tempSeriesList);
			List<Model> tempModelList = new ArrayList();
			this.setModelList(tempModelList);
			
			//实例化一个“新增明细”的对象
			orderListDetail = new OrderListDetail();
			Model tempModel = new Model();
			orderListDetail.setModel(tempModel);
			
			//通过主订单id查找订单明细记录
			if(orderList!=null && orderList.getId()!=null){
				detailResultList = orderListManageBO.queryClientListDetail(orderList.getId());
			}
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	
	}
	
	/**
	 * 保存客户订单明细，并返回到明细管理页面
	 * @return
	 */
	public String saveClientListDetail()throws Exception{
		try{
			orderListManageBO = new OrderListManageBOImpl();
			
			//对主信息的中文进行编码处理
			orderList.getClient().setClientName(Tool_common.toCHN(orderList.getClient().getClientName()));
			orderList.getInputUser().setUserName(Tool_common.toCHN(orderList.getInputUser().getUserName()));
			orderList.setMemo(Tool_common.toCHN(orderList.getMemo()));
//			//单品总价 = 单价（元/规格）*数量
//			double singleSumPrice = orderListDetail.getModel().getPrice()*orderListDetail.getNumber();
//			//对主订单信息更新总价
//			orderList.setTotalPrice(orderList.getTotalPrice()+singleSumPrice);
			//保存主信息和明细
			orderListManageBO.saveClientList(orderList);
			
//			orderListDetail.setPrice(singleSumPrice);
			orderListDetail.setOrderList(orderList);
			orderListManageBO.saveClientListDetail(orderListDetail);
			
			//跳转到页面，只有品牌、用途、医用功能分类3个列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			this.setBrandList(brandManageBO.queryListByClient(orderList.getClient().getId()));
			this.setUsageList(usageManageBO.queryListByClient(orderList.getClient().getId()));
			this.setSizeList(sizeManageBO.queryListByClient(orderList.getClient().getId()));
			//将系列和名称列表置空
			seriesManageBO = new SeriesManageBOImpl();
			List<Series> tempSeriesList = new ArrayList();
			this.setSeriesList(tempSeriesList);
			modelManageBO = new ModelManageBOImpl();
			List<Model> tempModelList = new ArrayList();
			this.setModelList(tempModelList);
			//实例化一个“新增明细”的对象
			orderListDetail = new OrderListDetail();
			Model tempModel = new Model();
			orderListDetail.setModel(tempModel);
			
			//通过主订单id查找订单明细记录
			if(orderList!=null && orderList.getId()!=null){
				detailResultList = orderListManageBO.queryClientListDetail(orderList.getId());
			}
			
			addActionMessage("<script>alert('订单明细保存成功！')</script>");
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('订单明细保存失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	
	/**
	 * 显示客户订单明细中的系列列表
	 * @return
	 */
	public String displaySeriesList4Detail() throws Exception{
		try{
			//对主信息的中文进行编码处理
			orderList.getClient().setClientName(Tool_common.toCHN(orderList.getClient().getClientName()));
			orderList.getInputUser().setUserName(Tool_common.toCHN(orderList.getInputUser().getUserName()));
			orderList.setMemo(Tool_common.toCHN(orderList.getMemo()));
			
			orderListManageBO = new OrderListManageBOImpl();
			//通过主订单id查找订单明细记录
			if(orderList!=null && orderList.getId()!=null){
				detailResultList = orderListManageBO.queryClientListDetail(orderList.getId());
			}
			
			//品牌、用途、医用功能分类列表应该可以带入带出
			//跳转到页面，只有品牌、用途、医用功能分类3个列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			this.setBrandList(brandManageBO.queryListByClient(orderList.getClient().getId()));
			this.setUsageList(usageManageBO.queryListByClient(orderList.getClient().getId()));
			this.setSizeList(sizeManageBO.queryListByClient(orderList.getClient().getId()));
			
			//根据所选的品牌和用途，查询系列列表
			seriesManageBO = new SeriesManageBOImpl();
			Long brandId = -1l;
			Long usageId = -1l;
			if(orderListDetail!=null && orderListDetail.getBrand()!=null && orderListDetail.getBrand().getId()!=null){//产品品牌查询条件
				brandId = orderListDetail.getBrand().getId();
			}
			if(orderListDetail!=null && orderListDetail.getUsage()!=null && orderListDetail.getUsage().getId()!=null){//产品品牌查询条件
				usageId = orderListDetail.getUsage().getId();
			}
			if(!(brandId==-1l || usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryListByParameters(brandId, usageId,orderList.getClient().getId()));//通过品牌、用途、客户公司筛选系列列表
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
	 * 显示客户订单明细中的名称列表
	 * @return
	 */
	public String displayModelList4Detail() throws Exception{
		try{
			//对主信息的中文进行编码处理
			orderList.getClient().setClientName(Tool_common.toCHN(orderList.getClient().getClientName()));
			orderList.getInputUser().setUserName(Tool_common.toCHN(orderList.getInputUser().getUserName()));
			orderList.setMemo(Tool_common.toCHN(orderList.getMemo()));
			
			orderListManageBO = new OrderListManageBOImpl();
			//通过主订单id查找订单明细记录
			if(orderList!=null && orderList.getId()!=null){
				detailResultList = orderListManageBO.queryClientListDetail(orderList.getId());
			}
			
			//品牌、用途、医用功能分类列表应该可以带入带出
			//跳转到页面，只有品牌、用途、医用功能分类3个列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			this.setBrandList(brandManageBO.queryListByClient(orderList.getClient().getId()));
			this.setUsageList(usageManageBO.queryListByClient(orderList.getClient().getId()));
			this.setSizeList(sizeManageBO.queryListByClient(orderList.getClient().getId()));
			//根据所选的品牌和用途，查询系列列表
			seriesManageBO = new SeriesManageBOImpl();
			Long brandId = -1l;
			Long usageId = -1l;
			if(orderListDetail!=null && orderListDetail.getBrand()!=null && orderListDetail.getBrand().getId()!=null){//产品品牌查询条件
				brandId = orderListDetail.getBrand().getId();
			}
			if(orderListDetail!=null && orderListDetail.getUsage()!=null && orderListDetail.getUsage().getId()!=null){//产品品牌查询条件
				usageId = orderListDetail.getUsage().getId();
			}
			if(!(brandId==-1l || usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryListByParameters(brandId, usageId,orderList.getClient().getId()));//当选择产品品牌和用途选的时候，查询产品系列列表
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
			//根据所选的系列和医用功能分类，查询名称列表
			modelManageBO = new ModelManageBOImpl();
			Long seriesId = -1l;
			Long sizeId = -1l;
			if(orderListDetail!=null && orderListDetail.getSeries()!=null && orderListDetail.getSeries().getId()!=null){//产品系列查询条件
				seriesId = orderListDetail.getSeries().getId();
			}
			if(orderListDetail!=null && orderListDetail.getSize()!=null && orderListDetail.getSize().getId()!=null){//产品医用功能分类查询条件
				sizeId = orderListDetail.getSize().getId();
			}
			if(!(seriesId==-1l || sizeId==-1l)){
				this.setModelList(modelManageBO.queryListByParameters(seriesId, sizeId,orderList.getClient().getId()));//当选择产品系列和医用功能分类的时候，查询产品名称列表
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
	
//	/**
//	 * 显示客户订单明细中的价格
//	 * @return
//	 */
//	public String displayPrice4Detail() throws Exception{
//		try{
//			//对主信息的中文进行编码处理
//			orderList.getClient().setClientName(Tool_common.toCHN(orderList.getClient().getClientName()));
//			orderList.getInputUser().setUserName(Tool_common.toCHN(orderList.getInputUser().getUserName()));
//			orderList.setMemo(Tool_common.toCHN(orderList.getMemo()));
//			
//			orderListManageBO = new OrderListManageBOImpl();
//			//通过主订单id查找订单明细记录
//			if(orderList!=null && orderList.getId()!=null){
//				detailResultList = orderListManageBO.queryClientListDetail(orderList.getId());
//			}
//			
//			//品牌、用途、医用功能分类列表应该可以带入带出
//			//跳转到页面，只有品牌、用途、医用功能分类3个列表
//			brandManageBO = new BrandManageBOImpl();
//			usageManageBO = new UsageManageBOImpl();
//			sizeManageBO = new SizeManageBOImpl();
//			this.setBrandList(brandManageBO.queryListByClient(orderList.getClient().getId()));
//			this.setUsageList(usageManageBO.queryListByClient(orderList.getClient().getId()));
//			this.setSizeList(sizeManageBO.queryListByClient(orderList.getClient().getId()));
//			//根据所选的品牌和用途，查询系列列表
//			seriesManageBO = new SeriesManageBOImpl();
//			Long brandId = -1l;
//			Long usageId = -1l;
//			if(orderListDetail!=null && orderListDetail.getBrand()!=null && orderListDetail.getBrand().getId()!=null){//产品品牌查询条件
//				brandId = orderListDetail.getBrand().getId();
//			}
//			if(orderListDetail!=null && orderListDetail.getUsage()!=null && orderListDetail.getUsage().getId()!=null){//产品品牌查询条件
//				usageId = orderListDetail.getUsage().getId();
//			}
//			if(!(brandId==-1l && usageId==-1l)){
//				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));//当选择产品品牌和用途选的时候，查询产品系列列表
//			}else{
//				List<Series> tempList = new ArrayList();
//				this.setSeriesList(tempList);
//			}
//			//根据所选的系列和医用功能分类，查询名称列表
//			modelManageBO = new ModelManageBOImpl();
//			Long seriesId = -1l;
//			Long sizeId = -1l;
//			if(orderListDetail!=null && orderListDetail.getSeries()!=null && orderListDetail.getSeries().getId()!=null){//产品系列查询条件
//				seriesId = orderListDetail.getSeries().getId();
//			}
//			if(orderListDetail!=null && orderListDetail.getSize()!=null && orderListDetail.getSize().getId()!=null){//产品医用功能分类查询条件
//				sizeId = orderListDetail.getSize().getId();
//			}
//			if(!(seriesId==-1l && sizeId==-1l)){
//				this.setModelList(modelManageBO.queryListBySeriesidAndSizeid(seriesId, sizeId));//当选择产品系列和医用功能分类的时候，查询产品名称列表
//			}else{
//				List<Model> tempModelList = new ArrayList();
//				this.setModelList(tempModelList);
//			}
//			//根据所选的名称，查询名称单条记录，从而带出价格
//			Long modelId = -1l;
//			if(orderListDetail!=null && orderListDetail.getModel()!=null && orderListDetail.getModel().getId()!=null){//产品名称查询条件
//				modelId = orderListDetail.getSeries().getId();
//			}
//			orderListDetail.setModel(modelManageBO.editModel(String.valueOf(orderListDetail.getModel().getId()))); 
//			
//		}catch(Exception e){
//			e.printStackTrace();
//			return INPUT;
//		}
//		return SUCCESS;
//	}
	
	public String deleteClientList() throws Exception{
		try{
			//通过所选id查询单挑明细记录
			orderListManageBO = new OrderListManageBOImpl();
			orderList = orderListManageBO.editClientList(selectId);
			orderList.setDeleted(1);
			orderListManageBO.saveClientList(orderList);
			alertFlag = "1";
		}catch(Exception e){
			e.printStackTrace();
			alertFlag = "2";
			return INPUT;
		}
		return SUCCESS;
	}
	
	
	public String deleteClientListDetail() throws Exception{
		try{
			//通过所选id查询单挑明细记录
			orderListManageBO = new OrderListManageBOImpl();
			orderListDetail = orderListManageBO.editClientListDetail(selectDetailId);
			//对主信息的中文进行编码处理
			orderList.getClient().setClientName(Tool_common.toCHN(orderList.getClient().getClientName()));
			orderList.getInputUser().setUserName(Tool_common.toCHN(orderList.getInputUser().getUserName()));
			orderList.setMemo(Tool_common.toCHN(orderList.getMemo()));
//			//对主订单信息更新总价
//			orderList.setTotalPrice(orderList.getTotalPrice()-orderListDetail.getPrice());
			orderListManageBO.saveClientList(orderList);
			//执行逻辑删除
			orderListDetail.setDeleted(1);
			orderListManageBO.saveClientListDetail(orderListDetail);
			
			//跳转到页面，只有品牌、用途、医用功能分类3个列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			this.setBrandList(brandManageBO.queryListByClient(orderList.getClient().getId()));
			this.setUsageList(usageManageBO.queryListByClient(orderList.getClient().getId()));
			this.setSizeList(sizeManageBO.queryListByClient(orderList.getClient().getId()));
			//将系列和名称列表置空
			seriesManageBO = new SeriesManageBOImpl();
			List<Series> tempSeriesList = new ArrayList();
			this.setSeriesList(tempSeriesList);
			modelManageBO = new ModelManageBOImpl();
			List<Model> tempModelList = new ArrayList();
			this.setModelList(tempModelList);
			//实例化一个“新增明细”的对象
			orderListDetail = new OrderListDetail();
			Model tempModel = new Model();
			orderListDetail.setModel(tempModel);
			
			//通过主订单id查找订单明细记录
			if(orderList!=null && orderList.getId()!=null){
				detailResultList = orderListManageBO.queryClientListDetail(orderList.getId());
			}
			
			addActionMessage("<script>alert('删除成功！')</script>");
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('删除失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 进入管理员订单列表
	 * @return
	 */
	public String adminListManage() throws Exception{
		try{
			clientManageBO = new ClientManageBOImpl();
			this.setClientList(clientManageBO.queryAll());
			//实例化对象
			orderList = new OrderList();
			//为订单对象实例化一个客户公司属性
			Client tempClient = new Client();
			Long clientId = -1l;
			orderList.setClient(tempClient);
			//将当前用户的客户公司ID赋值到订单当中
			orderList.getClient().setId(clientId);
			orderList.setCheckStatus(-1);
			//默认查询未汇总的记录
			orderList.setSumStatus(Constant.Summarized.SUMMARIZED_NO);
			//通过查询条件查询产品名称记录
			orderListManageBO = new OrderListManageBOImpl();
			resultList = orderListManageBO.queryClientList4AdminManage(orderList);
			//返回提示信息
			if(alertFlag!=null && alertFlag.equals("5")){
				addActionMessage("<script>alert('汇总客户订单成功，请到汇总订单查询页面查看！')</script>");
			}
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询管理员订单列表
	 * @return
	 */
	public String queryAdminList() throws Exception{
		try{
			clientManageBO = new ClientManageBOImpl();
			this.setClientList(clientManageBO.queryAll());
			
			//通过查询条件查询产品名称记录
			orderListManageBO = new OrderListManageBOImpl();
			resultList = orderListManageBO.queryClientList4AdminManage(orderList);
	        
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
	 * 查看客户订单，跳转到明细页面
	 * @return
	 */
	public String viewClientList()throws Exception{
		try{
			//查询需要修改的单条orderList记录
			orderListManageBO = new OrderListManageBOImpl();
			//根据所选订单id查询出该条订单信息
			orderList = orderListManageBO.editClientList(selectId);
			
			//通过主订单id查找订单明细记录
			detailResultList = new ArrayList<OrderListDetail>();
			if(orderList!=null && orderList.getId()!=null){
				detailResultList = orderListManageBO.queryClientListDetail(orderList.getId());
			}
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	
	}
	
	/**
	 * 对订单进行复核或销复核
	 * @return
	 */
	public String checkAndUncheckClientList()throws Exception{
		try{
			//查询需要修改的单条orderList记录
			orderListManageBO = new OrderListManageBOImpl();
			//根据所选订单id查询出该条订单信息
			//orderList = orderListManageBO.editClientList(selectId);
			//复核
			if(orderList.getCheckStatus()==Constant.Checked.CHECKED_NO){
				orderList.setCheckStatus(Constant.Checked.CHECKED_YES);
				addActionMessage("<script>alert('订单复核成功！')</script>");
			}else if(orderList.getCheckStatus()==Constant.Checked.CHECKED_YES){//销复核
				orderList.setCheckStatus(Constant.Checked.CHECKED_NO);
				addActionMessage("<script>alert('订单销复核成功！')</script>");
			}
			//对主信息的中文进行编码处理
			orderList.getClient().setClientName(Tool_common.toCHN(orderList.getClient().getClientName()));
			orderList.getInputUser().setUserName(Tool_common.toCHN(orderList.getInputUser().getUserName()));
			orderList.setMemo(Tool_common.toCHN(orderList.getMemo()));
			//保存订单
			orderListManageBO.saveClientList(orderList);
			//通过主订单id查找订单明细记录
			detailResultList = new ArrayList<OrderListDetail>();
			if(orderList!=null && orderList.getId()!=null){
				detailResultList = orderListManageBO.queryClientListDetail(orderList.getId());
			}
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('订单复核/销复核失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	
	/**
	 * 打印客户订单
	 */
	public String clientListPrt() throws Exception{
		try{
			//查询需要修改的单条orderList记录
			orderListManageBO = new OrderListManageBOImpl();
			//根据所选订单id查询出该条订单信息
			orderList = orderListManageBO.editClientList(String.valueOf(orderList.getId()));
			
			//通过主订单id查找订单明细记录
			detailResultList = new ArrayList<OrderListDetail>();
			if(orderList!=null && orderList.getId()!=null){
				detailResultList = orderListManageBO.queryClientListDetail(orderList.getId());
			}
			
			//操作员
			userManageBO = new UserManageBOImpl();
			String inputUserCode = String.valueOf(ActionContext.getContext().getSession().get(Constant.User.LOGIN_USERCODE));
			User currentUser = userManageBO.getUserByCode(inputUserCode);
			this.setOpUserName(currentUser.getUserName());
			
			//当前日期
			this.setCurrentDate(Tool_common.getCurrentSysTime(4));
			
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	
	/**
	 * 汇总客户订单
	 * @return
	 * @throws Exception
	 */
	public String sumClientList() throws Exception{
		try{
			
			//生成汇总主订单信息、订单类型listtype=2
			userManageBO = new UserManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			orderListManageBO = new OrderListManageBOImpl();
			//得到当前登录人的客户公司ID
			String inputUserCode = String.valueOf(ActionContext.getContext().getSession().get(Constant.User.LOGIN_USERCODE));
			//得到当前登录人的客户公司ID
			String clientId = String.valueOf(ActionContext.getContext().getSession().get(Constant.User.LOGIN_USERCLIENT));
			User currentUser = userManageBO.getUserByCode(inputUserCode);
			Client currentClient = clientManageBO.editClient(clientId);
			//实例化客户订单，并组装信息
			orderList = new OrderList();
			//自动生成订单号
			String sumListCode = orderListManageBO.createSumListCode();
			orderList.setOrderListCode(sumListCode);//订单号
			orderList.setClient(currentClient);//客户公司
			orderList.setInputUser(currentUser);//录入人
			orderList.setSumDate(new Date(System.currentTimeMillis()));//汇总日期
			orderList.setListType(Constant.OrderingListType.SUM_LIST);//订单类型:汇总订单
			orderList.setCheckStatus(Constant.Checked.CHECKED_YES);//复核状态
			orderList.setSumStatus(Constant.Summarized.SUMMARIZED_YES);//汇总状态
			//存入备注
			orderList.setMemo(orderList.getClient().getClientName()+"-"+orderList.getInputUser().getUserName()+"-汇总日期："+Tool_common.Dateformat(orderList.getSumDate()));
			//第一次保存汇总主订单，从而生成id，用于客户订单进行关联
			orderListManageBO.saveClientList(orderList);
			
			//为所选"客户订单"设置父订单id、汇总状态、汇总日期
			List<OrderList> lists4Sum = orderListManageBO.queryClientListByCheckedIds(strCheckedIds);
			if(lists4Sum!=null && lists4Sum.size()>0){
				for(int i=0;i<lists4Sum.size();i++){
					OrderList tempClientList = lists4Sum.get(i);
					//汇总主订单id为需要汇总的客户订单的parentid
					tempClientList.setParentListId(orderList.getId());
					//汇总状态设置为“已汇总”
					tempClientList.setSumStatus(Constant.Summarized.SUMMARIZED_YES);
					//汇总日期设定为服务器当前时间
					tempClientList.setSumDate(new Date(System.currentTimeMillis()));
					//逐条保存每条客户订单记录
					orderListManageBO.saveClientList(tempClientList);
				}
			}
			
			//★汇总所选“客户订单”对应的所有“订单明细”，转存为新的“汇总订单明细”，并将“订单id”设置为新生成的汇总订单id
//			double sumedTotalPrice = 0.0;
			List<OrderListDetail> sumListDetail = orderListManageBO.getSumListDetail(strCheckedIds);
			if(sumListDetail!=null && sumListDetail.size()>0){
				for(int i=0;i<sumListDetail.size();i++){
					OrderListDetail tempDetail = sumListDetail.get(i);
					tempDetail.setOrderList(orderList);
//					//为汇总主信息逐条累加价格
//					sumedTotalPrice+=tempDetail.getPrice();
					//逐条保存每条“客户订单明细记录”
					orderListManageBO.saveClientListDetail(tempDetail);
				}
			}
//			//为汇总主订单设置总金额数
//			orderList.setTotalPrice(sumedTotalPrice);
//			//存入备注
//			orderList.setMemo(orderList.getClient().getClientName()+"-"+orderList.getInputUser().getUserName()+"-汇总日期："+Tool_common.Dateformat(orderList.getSumDate())+"-总价格："+orderList.getStrTotalPrice());
//			//第二次保存汇总主订单，为之设置总金额
//			orderListManageBO.saveClientList(orderList);
			
			alertFlag = "5";
			
		}catch(Exception e){
			e.printStackTrace();
			addActionMessage("<script>alert('汇总客户订单失败！')</script>");
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询汇总订单列表
	 * @return
	 */
	public String sumListManage() throws Exception{
		try{

			//分页查询
			if (currPage == 0) {  
	            currPage = 1;  
	        } 
			orderListManageBO = new OrderListManageBOImpl();
			pageBean = orderListManageBO.getSumListPageBean(currPage,orderList);
			//通过查询条件查询产品名称记录
			resultList = orderListManageBO.queryAllSumList(pageBean,orderList);
			//带有参数的URL 
			StringBuffer sb = new StringBuffer();  
	        sb.append("clientListManage.action?");
	        if(orderList!=null && orderList.getSSumDate()!=null){
	        	sb.append("orderList.sSumDateStr=").append(Tool_common.Dateformat(orderList.getSSumDate())).append("&");
	        }else if(orderList!=null && orderList.getSSumDateStr()!=null){
	        	sb.append("orderList.sSumDateStr=").append(orderList.getSSumDateStr()).append("&");
	        	orderList.setSSumDate(Tool_common.StrdateFormatToDate(orderList.getSSumDateStr()));
	        }
	        if(orderList!=null && orderList.getESumDate()!=null){
	        	sb.append("orderList.eSumDateStr=").append(Tool_common.Dateformat(orderList.getESumDate())).append("&");
	        }else if(orderList!=null && orderList.getESumDateStr()!=null){
	        	sb.append("orderList.eSumDateStr=").append(orderList.getESumDateStr()).append("&");
	        	orderList.setESumDate(Tool_common.StrdateFormatToDate(orderList.getESumDateStr()));
	        }
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
	 * 查看汇总明细
	 * @return
	 */
	public String viewSumList()throws Exception{
		try{
			
			//查询需要修改的单条orderList记录
			orderListManageBO = new OrderListManageBOImpl();
			//根据所选订单id查询出该条订单信息
			orderList = orderListManageBO.editClientList(selectId);
			
			//通过主订单id查找订单明细记录
			if(orderList!=null && orderList.getId()!=null){
				detailResultList = orderListManageBO.queryClientListDetail(orderList.getId());
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	
	}
	
	/**
	 * 进入产品订购分析查询页面
	 * @return
	 */
	public String entryDetailAnalyseManage()throws Exception{
		try{
			orderListManageBO = new OrderListManageBOImpl();
			
			//跳转到页面，只有品牌、用途、医用功能分类、客户公司4个列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			this.setClientList(clientManageBO.queryAll());
			//根据所选的品牌和用途，查询系列列表
			seriesManageBO = new SeriesManageBOImpl();
			Long brandId = -1l;
			Long usageId = -1l;
			if(orderListDetail!=null && orderListDetail.getBrand()!=null && orderListDetail.getBrand().getId()!=null){//产品品牌查询条件
				brandId = orderListDetail.getBrand().getId();
			}
			if(orderListDetail!=null && orderListDetail.getUsage()!=null && orderListDetail.getUsage().getId()!=null){//产品品牌查询条件
				usageId = orderListDetail.getUsage().getId();
			}
			if(!(brandId==-1l && usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));//当选择产品品牌和用途选的时候，查询产品系列列表
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
			//根据所选的系列和医用功能分类，查询名称列表
			modelManageBO = new ModelManageBOImpl();
			Long seriesId = -1l;
			Long sizeId = -1l;
			if(orderListDetail!=null && orderListDetail.getSeries()!=null && orderListDetail.getSeries().getId()!=null){//产品系列查询条件
				seriesId = orderListDetail.getSeries().getId();
			}
			if(orderListDetail!=null && orderListDetail.getSize()!=null && orderListDetail.getSize().getId()!=null){//产品医用功能分类查询条件
				sizeId = orderListDetail.getSize().getId();
			}
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
	
	/**
	 * 产品订购分析查询
	 * @return
	 */
	public String detailAnalyseManage()throws Exception{
		try{
			orderListManageBO = new OrderListManageBOImpl();
			
			//跳转到页面，只有品牌、用途、医用功能分类、客户公司4个列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			this.setClientList(clientManageBO.queryAll());
			//根据所选的品牌和用途，查询系列列表
			seriesManageBO = new SeriesManageBOImpl();
			Long brandId = -1l;
			Long usageId = -1l;
			if(orderListDetail!=null && orderListDetail.getBrand()!=null && orderListDetail.getBrand().getId()!=null){//产品品牌查询条件
				brandId = orderListDetail.getBrand().getId();
			}
			if(orderListDetail!=null && orderListDetail.getUsage()!=null && orderListDetail.getUsage().getId()!=null){//产品品牌查询条件
				usageId = orderListDetail.getUsage().getId();
			}
			if(!(brandId==-1l && usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));//当选择产品品牌和用途选的时候，查询产品系列列表
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
			//根据所选的系列和医用功能分类，查询名称列表
			modelManageBO = new ModelManageBOImpl();
			Long seriesId = -1l;
			Long sizeId = -1l;
			if(orderListDetail!=null && orderListDetail.getSeries()!=null && orderListDetail.getSeries().getId()!=null){//产品系列查询条件
				seriesId = orderListDetail.getSeries().getId();
			}
			if(orderListDetail!=null && orderListDetail.getSize()!=null && orderListDetail.getSize().getId()!=null){//产品医用功能分类查询条件
				sizeId = orderListDetail.getSize().getId();
			}
			if(!(seriesId==-1l && sizeId==-1l)){
				this.setModelList(modelManageBO.queryListBySeriesidAndSizeid(seriesId, sizeId));//当选择产品系列和医用功能分类的时候，查询产品名称列表
			}else{
				List<Model> tempModelList = new ArrayList();
				this.setModelList(tempModelList);
			}
			
			detailResultList = orderListManageBO.queryClientListDetailByOrderListDetail(orderListDetail);
			
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	
	}
	
	/**
	 * 显示客户订单明细中的系列列表
	 * @return
	 */
	public String displaySeriesList4Analyse() throws Exception{
		try{
			
			orderListManageBO = new OrderListManageBOImpl();
			
			//跳转到页面，只有品牌、用途、医用功能分类、客户公司4个列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			this.setClientList(clientManageBO.queryAll());
			
			//根据所选的品牌和用途，查询系列列表
			seriesManageBO = new SeriesManageBOImpl();
			Long brandId = -1l;
			Long usageId = -1l;
			if(orderListDetail!=null && orderListDetail.getBrand()!=null && orderListDetail.getBrand().getId()!=null){//产品品牌查询条件
				brandId = orderListDetail.getBrand().getId();
			}
			if(orderListDetail!=null && orderListDetail.getUsage()!=null && orderListDetail.getUsage().getId()!=null){//产品品牌查询条件
				usageId = orderListDetail.getUsage().getId();
			}
			if(!(brandId==-1l && usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));//当产品品牌和用途选择其一的时候，查询产品系列列表
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
			//名称列表为空
			List<Model> tempModelList = new ArrayList();
			this.setModelList(tempModelList);
			
			detailResultList = orderListManageBO.queryClientListDetailByOrderListDetail(orderListDetail);
			
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	
	/**
	 * 显示客户订单明细中的名称列表
	 * @return
	 */
	public String displayModelList4Analyse() throws Exception{
		try{
			
			orderListManageBO = new OrderListManageBOImpl();
			
			//跳转到页面，只有品牌、用途、医用功能分类、客户公司4个列表
			brandManageBO = new BrandManageBOImpl();
			usageManageBO = new UsageManageBOImpl();
			sizeManageBO = new SizeManageBOImpl();
			clientManageBO = new ClientManageBOImpl();
			this.setBrandList(brandManageBO.queryAll());
			this.setUsageList(usageManageBO.queryAll());
			this.setSizeList(sizeManageBO.queryAll());
			this.setClientList(clientManageBO.queryAll());
			//根据所选的品牌和用途，查询系列列表
			seriesManageBO = new SeriesManageBOImpl();
			Long brandId = -1l;
			Long usageId = -1l;
			if(orderListDetail!=null && orderListDetail.getBrand()!=null && orderListDetail.getBrand().getId()!=null){//产品品牌查询条件
				brandId = orderListDetail.getBrand().getId();
			}
			if(orderListDetail!=null && orderListDetail.getUsage()!=null && orderListDetail.getUsage().getId()!=null){//产品品牌查询条件
				usageId = orderListDetail.getUsage().getId();
			}
			if(!(brandId==-1l && usageId==-1l)){
				this.setSeriesList(seriesManageBO.queryAll(brandId, usageId));//当选择产品品牌和用途选的时候，查询产品系列列表
			}else{
				List<Series> tempList = new ArrayList();
				this.setSeriesList(tempList);
			}
			//根据所选的系列和医用功能分类，查询名称列表
			modelManageBO = new ModelManageBOImpl();
			Long seriesId = -1l;
			Long sizeId = -1l;
			if(orderListDetail!=null && orderListDetail.getSeries()!=null && orderListDetail.getSeries().getId()!=null){//产品系列查询条件
				seriesId = orderListDetail.getSeries().getId();
			}
			if(orderListDetail!=null && orderListDetail.getSize()!=null && orderListDetail.getSize().getId()!=null){//产品医用功能分类查询条件
				sizeId = orderListDetail.getSize().getId();
			}
			if(!(seriesId==-1l && sizeId==-1l)){
				this.setModelList(modelManageBO.queryListBySeriesidAndSizeid(seriesId, sizeId));//当选择产品系列和医用功能分类的时候，查询产品名称列表
			}else{
				List<Model> tempModelList = new ArrayList();
				this.setModelList(tempModelList);
			}
			
			detailResultList = orderListManageBO.queryClientListDetailByOrderListDetail(orderListDetail);
			
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	public List<OrderList> getResultList() {
		return resultList;
	}

	public void setResultList(List<OrderList> resultList) {
		this.resultList = resultList;
	}
	
	public OrderListManageBO getOrderListManageBO() {
		return orderListManageBO;
	}

	public void setOrderListManageBO(OrderListManageBO orderListManageBO) {
		this.orderListManageBO = orderListManageBO;
	}

	public OrderList getOrderList() {
		return orderList;
	}

	public void setOrderList(OrderList orderList) {
		this.orderList = orderList;
	}

	public List<OrderList> getCheckStatusList() {
		//创建复核状态下拉单列表
		List<OrderList> checkStatusList = new ArrayList();
	 	int[] tempArray= Constant.Checked.getAllCode();
	 	for(int i =0;i<2;i++){
	 		OrderList orderList = new OrderList();
	 		orderList.setCheckStatus(tempArray[i]);
	 		orderList.setStrCheckStatus(Constant.Checked.getName(tempArray[i]));
	 		checkStatusList.add(orderList);
	 	}
		return checkStatusList;
	}

	public void setCheckStatusList(List<OrderList> checkStatusList) {
		this.checkStatusList = checkStatusList;
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

	public ModelManageBO getModelManageBO() {
		return modelManageBO;
	}

	public void setModelManageBO(ModelManageBO modelManageBO) {
		this.modelManageBO = modelManageBO;
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

	public UsageManageBO getUsageManageBO() {
		return usageManageBO;
	}

	public void setUsageManageBO(UsageManageBO usageManageBO) {
		this.usageManageBO = usageManageBO;
	}

	public SizeManageBO getSizeManageBO() {
		return sizeManageBO;
	}

	public void setSizeManageBO(SizeManageBO sizeManageBO) {
		this.sizeManageBO = sizeManageBO;
	}

	public List<Brand> getBrandList() {
		return brandList;
	}

	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}

	public List<Usage> getUsageList() {
		return usageList;
	}

	public void setUsageList(List<Usage> usageList) {
		this.usageList = usageList;
	}

	public List<Series> getSeriesList() {
		return seriesList;
	}

	public void setSeriesList(List<Series> seriesList) {
		this.seriesList = seriesList;
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

	public OrderListDetail getOrderListDetail() {
		return orderListDetail;
	}

	public void setOrderListDetail(OrderListDetail orderListDetail) {
		this.orderListDetail = orderListDetail;
	}

	public List<OrderListDetail> getDetailResultList() {
		return detailResultList;
	}

	public void setDetailResultList(List<OrderListDetail> detailResultList) {
		this.detailResultList = detailResultList;
	}

	public String getSelectDetailId() {
		return selectDetailId;
	}

	public void setSelectDetailId(String selectDetailId) {
		this.selectDetailId = selectDetailId;
	}

	public List<OrderList> getSumStatusList() {
		//创建汇总状态下拉单列表
		List<OrderList> sumStatusList = new ArrayList();
	 	int[] tempArray= Constant.Summarized.getAllCode();
	 	for(int i =0;i<2;i++){
	 		OrderList orderList = new OrderList();
	 		orderList.setSumStatus(tempArray[i]);
	 		orderList.setStrSumStatus(Constant.Summarized.getName(tempArray[i]));
	 		sumStatusList.add(orderList);
	 	}
		return sumStatusList;
	}

	public void setSumStatusList(List<OrderList> sumStatusList) {
		this.sumStatusList = sumStatusList;
	}

	public List<Client> getClientList() {
		return clientList;
	}

	public void setClientList(List<Client> clientList) {
		this.clientList = clientList;
	}

	public String getStrCheckedIds() {
		return strCheckedIds;
	}

	public void setStrCheckedIds(String strCheckedIds) {
		this.strCheckedIds = strCheckedIds;
	}

	public List<OrderList> getListTypeList() {
		//创建订单类型下拉单列表
		List<OrderList> listTypeList = new ArrayList();
	 	int[] tempArray= Constant.OrderingListType.getCodeExSum();
	 	for(int i =0;i<2;i++){
	 		OrderList orderList = new OrderList();
	 		orderList.setListType(tempArray[i]);
	 		orderList.setStrListType(Constant.OrderingListType.getName(tempArray[i]));
	 		listTypeList.add(orderList);
	 	}
		return listTypeList;
	}

	public void setListTypeList(List<OrderList> listTypeList) {
		this.listTypeList = listTypeList;
	}

	public String getOpUserName() {
		return opUserName;
	}

	public void setOpUserName(String opUserName) {
		this.opUserName = opUserName;
	}

	public String getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}

	

}
