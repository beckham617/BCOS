package com.bcos.page;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter; 
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.bcos.util.PropertyUtil; 

/** 
 * @author beckham 分页标签 Oct 22, 2009 9:20:49 PM 
 */   
public class PageTag extends SimpleTagSupport {  
	private String path; // 请求路径  
	private String param; // 传递参数  
	private int currPage; // 当前页  
	private int totalPage;// 总页数
    private int totalSize;  
    private int pageCount;  
    private int pageSize;  
    
    
	public int getTotalSize() {  
        return totalSize;  
    }  
    public void setTotalSize(int totalSize) {  
        this.totalSize = totalSize;  
    }  
    public int getPageCount() {  
        return pageCount;  
    }  
    public void setPageCount(int pageCount) {  
        this.pageCount = pageCount;  
    }  
    public int getPageSize() {  
        return pageSize;  
    }  
    public void setPageSize(int pageSize) {  
        this.pageSize = pageSize;  
    }  
    public String getPath() {  
        return path;  
    }  
    public void setPath(String path) {  
        this.path = path;  
    }  
    public String getParam() {  
        return param;  
    }  
    public void setParam(String param) {  
        this.param = param;  
    }  
    public int getCurrPage() {  
        return currPage;  
    }  
    public void setCurrPage(int currPage) {  
        this.currPage = currPage;  
    }  
    public int getTotalPage() {  
        return totalPage;  
    }  
    public void setTotalPage(int totalPage) {  
        this.totalPage = totalPage;  
    }  
    public void doTag() throws JspException, IOException {  
        JspWriter out = this.getJspContext().getOut();  
        StringBuffer sb = new StringBuffer();  
          
        sb.append("<mce:style type=\"text/css\"><!-- ") ;  
           
        sb.append("* { margin:0; padding:0;}") ;  
           
        sb.append("body { font-size:13px; font-family:Verdana;width:100%;}") ;  
           
        sb.append("a { color:#333; text-decoration:none;}") ;  
        sb.append("a:hover {text-decoration:none;color:#FF0000;font-weight:bold;}");  
           
        sb.append("ul { list-style:none;}") ;  
           
        sb.append("#pagelist {width:100%; margin:30px auto; padding:6px 0px; height:20px;}") ;  
           
        sb.append("#pagelist ul li { float:left; border:1px solid #5d9cdf; height:20px; line-height:20px; margin:0px 2px;}") ;  
           
        sb.append("#pagelist ul li a, .pageinfo { display:block; padding:0px 6px; background:#e6f2fe;}") ;  
           
        sb.append(".current { background:#a9d2ff; display:block; padding:0px 6px; font-weight:bold;}") ;  
           
        sb.append(" --></mce:style><style type=\"text/css\" mce_bogus=\"1\" > ") ;  
           
        sb.append("* { margin:0; padding:0;}") ;  
           
        sb.append("body { font-size:13px; font-family:Verdana;width:100%;}") ;  
           
        sb.append("a { color:#333; text-decoration:none;}") ;  
        sb.append("a:hover {text-decoration:none;color:#FF0000;font-weight:bold;}");  
           
        sb.append("ul { list-style:none;}") ;  
           
        sb.append("#pagelist {width:100%; margin:2px auto; padding:6px 0px; height:20px;}") ;  
           
        sb.append("#pagelist ul li { float:left; border:1px solid #5d9cdf; height:20px; line-height:20px; margin:0px 2px;}") ;  
           
        sb.append("#pagelist ul li a, .pageinfo { display:block; padding:0px 6px; background:#e6f2fe;}") ;  
           
        sb.append(".current { background:#a9d2ff; display:block; padding:0px 6px; font-weight:bold;}") ;  
           
        sb.append("</style>") ;  
           
          
        sb.append("<div id=\"pagelist\">");  
        sb.append("<ul>") ;  
        
        
        if (currPage <= 1) {  
            sb.append("<li>") ;  
            sb.append("首页");  
            sb.append("</li>") ;  
            sb.append("<li>") ;  
            sb.append("上一页");  
            sb.append("</li>") ;  
              
        } else {  
            sb.append("<li>") ;  
            sb.append("<a href='");  
            sb.append(path);  
            sb.append(param);  
            sb.append("=1");  
            sb.append("\'");  
            sb.append(">");  
            sb.append("首页");  
            sb.append("</a>");  
            sb.append("</li>") ;  
            sb.append("<li>") ;  
            sb.append("<a href='");  
            sb.append(path);  
            sb.append(param);  
            sb.append("=");  
            sb.append(currPage - 1);  
            sb.append("\'");  
            sb.append(">");  
            sb.append("上一页");  
            sb.append("</a>");  
            sb.append("</li>") ;  
               
        }  
        // 显示页码 默认显示pageNumber个页码  
        int pageNumber = PropertyUtil.getPageNumber();  
        // 总页数小于需要显示的页码数
        int result = (currPage-1) / pageNumber;  
        int begin = 1;  
        int end = 1;  
        begin = result * pageNumber+1;  
        end = (result + 1) * pageNumber;  
        if (end >= totalPage) {  
            end = totalPage;  
        }  
        for (int i = begin; i <currPage; i++) {  
            sb.append("<li>").append("<a href='").append(path).append(param).append("=")  
                    .append(i).append("\'").append(">").append(i).append(  
                            "</a>").append("</li>");  
        }  
        sb.append("<li class=\"current\">").append(currPage).append("</li>");  
        for (int i = currPage+1; i <=end; i++) {  
            sb.append("<li>").append("<a href='").append(path).append(param).append("=")  
                    .append(i).append("\'").append(">").append(i).append(  
                            "</a>").append("</li>");  
        }  
        if (currPage == totalPage || totalPage == 0) {  
            sb.append("<li>") ;  
            sb.append("下一页");  
            sb.append("</li>") ;  
               
            sb.append("<li>") ;  
            sb.append("末页");  
            sb.append("</li>") ;  
        } else {  
            sb.append("<li>") ;  
            sb.append("<a href='");  
            sb.append(path);  
            sb.append(param);  
            sb.append("=");  
            sb.append(currPage + 1);  
            sb.append("\'");  
            sb.append(">");  
            sb.append("下一页");  
            sb.append("</a>");  
            sb.append("</li>") ;  
               
            sb.append("<li>") ;  
            sb.append("<a href='");  
            sb.append(path);  
            sb.append(param);  
            sb.append("=");  
            sb.append(totalPage);  
            sb.append("\'");  
            sb.append(">");  
            sb.append("末页");  
            sb.append("</a>");  
            sb.append("</li>") ;  
               
        }  
        sb.append("<li>") ;  
        sb.append("    ");  
        sb.append("总共");  
        sb.append("<font color=\"red\">");  
        sb.append(totalSize);  
        sb.append("</font>");  
        sb.append("条结果");  
        sb.append("  ");  
        sb.append("  ");  
        sb.append("当前");  
        sb.append("<font color=\"red\">");  
        sb.append(currPage);  
        sb.append("</font>");  
        sb.append("/");  
        sb.append("<font color=\"red\">");  
        sb.append(pageCount);  
        sb.append("页") ;  
        sb.append("</font>");  
        sb.append("</li>") ;  
        sb.append("    ");  
        sb.append("</ul>") ;  
           
        sb.append("</div>");  
        out.println(sb);  
    }  
}  