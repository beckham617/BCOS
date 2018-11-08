package com.bcos.util;


import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bcos.dao.BrandManageDAO;
import com.bcos.dao.ClientManageDAO;
import com.bcos.dao.ClientToSeriesManageDAO;
import com.bcos.dao.LoginDAO;
import com.bcos.dao.ModelManageDAO;
import com.bcos.dao.OrderListManageDAO;
import com.bcos.dao.SeriesManageDAO;
import com.bcos.dao.SizeManageDAO;
import com.bcos.dao.UsageManageDAO;
import com.bcos.dao.UserManageDAO;



public class Constant {
	
	public static final LoginDAO getLoginDAO(){
		ApplicationContext ac =  new ClassPathXmlApplicationContext("/com/bcos/conf/spring/applicationContext.xml");
		return (LoginDAO)ac.getBean("loginDAO"); 
	}
	public static final BrandManageDAO getBrandManageDAO(){
		ApplicationContext ac =  new ClassPathXmlApplicationContext("/com/bcos/conf/spring/applicationContext.xml");
		return (BrandManageDAO)ac.getBean("brandManageDAO"); 
	}
	public static final UsageManageDAO getUsageManageDAO(){
		ApplicationContext ac =  new ClassPathXmlApplicationContext("/com/bcos/conf/spring/applicationContext.xml");
		return (UsageManageDAO)ac.getBean("usageManageDAO"); 
	}
	public static final SeriesManageDAO getSeriesManageDAO(){
		ApplicationContext ac =  new ClassPathXmlApplicationContext("/com/bcos/conf/spring/applicationContext.xml");
		return (SeriesManageDAO)ac.getBean("seriesManageDAO"); 
	}
	
	public static final SizeManageDAO getSizeManageDAO(){
		ApplicationContext ac =  new ClassPathXmlApplicationContext("/com/bcos/conf/spring/applicationContext.xml");
		return (SizeManageDAO)ac.getBean("sizeManageDAO"); 
	}
	
	public static final ModelManageDAO getModelManageDAO(){
		ApplicationContext ac =  new ClassPathXmlApplicationContext("/com/bcos/conf/spring/applicationContext.xml");
		return (ModelManageDAO)ac.getBean("modelManageDAO"); 
	}
	
	public static final ClientManageDAO getClientManageDAO(){
		ApplicationContext ac =  new ClassPathXmlApplicationContext("/com/bcos/conf/spring/applicationContext.xml");
		return (ClientManageDAO)ac.getBean("clientManageDAO"); 
	}
	
	public static final UserManageDAO getUserManageDAO(){
		ApplicationContext ac =  new ClassPathXmlApplicationContext("/com/bcos/conf/spring/applicationContext.xml");
		return (UserManageDAO)ac.getBean("userManageDAO"); 
	}
	
	public static final ClientToSeriesManageDAO getClientToSeriesManageDAO(){
		ApplicationContext ac =  new ClassPathXmlApplicationContext("/com/bcos/conf/spring/applicationContext.xml");
		return (ClientToSeriesManageDAO)ac.getBean("clientToSeriesManageDAO"); 
	}
	
	public static final OrderListManageDAO getOrderListManageDAO(){
		ApplicationContext ac =  new ClassPathXmlApplicationContext("/com/bcos/conf/spring/applicationContext.xml");
		return (OrderListManageDAO)ac.getBean("orderListManageDAO"); 
	}
	
	//订单号编码头
	private static Properties p = new Properties() ;
	private static InputStream inputStream = null ;  
	static {  
		inputStream = PropertyUtil.class.getResourceAsStream("/bcos.properties")  ;  
		try {  
			p.load(inputStream) ;  
		} catch (IOException e) {  
			e.printStackTrace();  
		}
	}
	public static String getBcosCode(){  
	        return p.getProperty("bcosCode");  
	} 
	public static String getCodeP2ClientList(){  
        return p.getProperty("codeP2ClientList");  
} 
	public static String getCodeP2SumList(){  
        return p.getProperty("codeP2SumList");  
} 
	
	//用户常量
	public static class User{
		//登录常量
		//登录用户的用户代码
		public static final String LOGIN_USERCODE = "loginUserCode";
		//登录用户的客户公司
		public static final String LOGIN_USERCLIENT = "loginUserClient";
		//登录用户的用户代码
		public static final String LOGIN_USERLEVEL = "loginUserLevel";
		//用户类型常量
		public static final int ADMIN = 1;
		public static final int CUSTOMER = 2;
		public static final int PROCUREMENT = 3;
		
		public static final String getName(int code)
	    {
			String strReturn = ""; //初始化返回值
			switch (code)
			{
				case ADMIN:
					strReturn = "管理员";
	                break;
	            case CUSTOMER:
	                strReturn = "客户用户";
	                break;
	            case PROCUREMENT:
	                strReturn = "采购员";
	                break;
	        }
	        return strReturn;
	    }

	 	public static final int[] getAllCode()
		{
	 		int[] lTemp =
	 		{ ADMIN, CUSTOMER,PROCUREMENT};
	 		return lTemp;
		}
	 	
	}
	
	//订单类型常量
	public static class OrderingListType{
		public static final int NORMAL_LIST = 1;
		public static final int SUM_LIST = 2;
		public static final int PURCHASE_LIST = 3;
		public static final String getName(int code)
	    {
			String strReturn = ""; //初始化返回值
			switch (code)
			{
				case NORMAL_LIST:
					strReturn = "配送订货";
	                break;
	            case SUM_LIST:
	                strReturn = "汇总订单";
	                break;
	            case PURCHASE_LIST:
	                strReturn = "集中订货";
	                break;
	        }
	        return strReturn;
	    }

	 	public static final int[] getAllCode()
		{
	 		int[] lTemp =
	 		{ NORMAL_LIST,SUM_LIST, PURCHASE_LIST};
	 		return lTemp;
		}
	 	
	 	public static final int[] getCodeExSum()
		{
	 		int[] lTemp =
	 		{ NORMAL_LIST,PURCHASE_LIST};
	 		return lTemp;
		}
	} 
	
	//状态常量
	//删除状态
	public static class Deleted{
		public static final int DELETED_YES = 1;
		public static final int DELETED_NO = 0;
		public static final String getName(int code)
	    {
			String strReturn = ""; //初始化返回值
			switch (code)
			{
				case DELETED_YES:
					strReturn = "已删除";
	                break;
	            case DELETED_NO:
	                strReturn = "未删除";
	                break;
	        }
	        return strReturn;
	    }

	 	public static final int[] getAllCode()
		{
	 		int[] lTemp =
	 		{ DELETED_YES, DELETED_NO};
	 		return lTemp;
		}
	} 
	
	//复核状态
	public static class Checked{
		public static final int CHECKED_YES = 1;
		public static final int CHECKED_NO = 0;
		public static final String getName(int code)
	    {
			String strReturn = ""; //初始化返回值
			switch (code)
			{
				case CHECKED_YES:
					strReturn = "已复核";
	                break;
	            case CHECKED_NO:
	                strReturn = "未复核";
	                break;
	        }
	        return strReturn;
	    }

	 	public static final int[] getAllCode()
		{
	 		int[] lTemp =
	 		{ CHECKED_YES, CHECKED_NO};
	 		return lTemp;
		}
	} 
	
	//汇总状态
	public static class Summarized{
		public static final int SUMMARIZED_YES = 1;
		public static final int SUMMARIZED_NO = 0;
		public static final String getName(int code)
	    {
			String strReturn = ""; //初始化返回值
			switch (code)
			{
				case SUMMARIZED_YES:
					strReturn = "已汇总";
	                break;
	            case SUMMARIZED_NO:
	                strReturn = "未汇总";
	                break;
	        }
	        return strReturn;
	    }

	 	public static final int[] getAllCode()
		{
	 		int[] lTemp =
	 		{ SUMMARIZED_YES, SUMMARIZED_NO};
	 		return lTemp;
		}
	} 
	
	
	
}
