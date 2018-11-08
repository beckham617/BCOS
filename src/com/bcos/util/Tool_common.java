package com.bcos.util;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.bcos.page.PageBean;

public class Tool_common {
	/**
	 * 作用：转换内码(保留)
	 */
	public static String toCHN(String strValue)
	{
		try
		{
			if(strValue==null)
			{
				return null;
			}
			else
			{
				strValue=new String(strValue.trim().getBytes("ISO8859_1"),"GBK");
				return strValue;
			}
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	/**
     * 格式化数字，例如：12345转化为12,345
     * 
     * @param dValue
     *            被格式化的数值
     * @param iScale
     *            小数点后保留位数,不足补0
     * @return
     */
    public static String formatNumber(double dValue, int iScale) {
    	DecimalFormat df = null;
    	StringBuffer sPattern = new StringBuffer(",##0");
    	if (iScale > 0) {
    		sPattern.append(".");
    		for (int i = 0; i < iScale; i++) {
    			sPattern.append("0");
    		}
    	}
    	df = new DecimalFormat(sPattern.toString());
    	String str = df.format(dValue);
    	return str;
    }
    
    public static double formatDataScale(double data){
    	DecimalFormat df = new DecimalFormat("#.00");
    	return Double.parseDouble(df.format(data));
    } 
	
    public static String ptInfo(PageBean pageBean,String urlPath){
    	String ptInfo = "";
    	StringBuffer sb = new StringBuffer();
    	sb.append(" <pt:pageInfo ");
    	sb.append(" pageCount="+pageBean.getPageCount());
    	sb.append(" currPage="+pageBean.getCurrPage());
    	sb.append(" param=\"currPage\"");
    	sb.append(" path="+urlPath);  
    	sb.append(" totalPage="+pageBean.getLastPage());
    	sb.append(" pageSize="+pageBean.getPageSize());
    	sb.append(" totalSize="+pageBean.getTotalSize());
    	sb.append(" />");    
    	
    	ptInfo = sb.toString();
    	return ptInfo;
    }
	
    /**
     * 格式化日期
     * @param date
     * @return
     */
    public static String Dateformat(Date date) {
		if (date == null) {
			return "";
		}
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		return formater.format(date);
	}
    
    /**
     * 格式化字符串，转化为日期格式
     * @param date
     * @return
     */
    public static Date StrdateFormatToDate(String strdate){
    	DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
    	Date date = null; 
	    try{
	    	date = format.parse(strdate); 
	    }catch(ParseException e){
	    	e.printStackTrace();
	    }
	    return date;
	}
    
    /**
     * 获得系统当前时间
     * @param iType
     * @return
     */
    public static String getCurrentSysTime(int iType) {

		Date dtNow = new Date(System.currentTimeMillis());

		String dateString = "";

		try {
			SimpleDateFormat formatter = null;
			switch (iType) {
			case 1:
				formatter = new SimpleDateFormat("yyyy.MM.dd");
				break;
			case 2:
				formatter = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
				break;
			case 3:
				formatter = new SimpleDateFormat("yyyy.MM.dd hh:mm a");
				break;
			case 4:
				formatter = new SimpleDateFormat("yyyy-MM-dd");
				break;
			case 5:
				formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				break;
			case 6:
				formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm a");
				break;
			default:
				formatter = new SimpleDateFormat("yyyy.MM.dd");
				break;
			}
			dateString = formatter.format(dtNow);
		} catch (Exception e) {
			dateString = "";
		}
		return dateString;
	}
}
