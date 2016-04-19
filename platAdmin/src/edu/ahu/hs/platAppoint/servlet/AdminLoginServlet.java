package edu.ahu.hs.platAppoint.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import edu.ahu.hs.platAppoint.DAO.AdminInfoDAO;
import edu.ahu.hs.platAppoint.beans.AdminBean;
import edu.ahu.hs.platAppoint.beans.LoginRecordBean;

/**
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminLoginServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type=request.getParameter("type");
		//验证登录
		if(type.equals("log")){
			String adminName = request.getParameter("adminname").trim();
			adminName = new String(adminName.getBytes("ISO-8859-1"),"UTF-8");
			String passWd = request.getParameter("passwd").trim();
			AdminInfoDAO aid = new AdminInfoDAO();
			if(aid.checkLogin(adminName, passWd)){
		        	AdminBean ab=aid.getAdminInfoByName(adminName);
					String adminId=ab.getAdminId();
					String realName=ab.getRealName();
					int logCount=aid.getLoginCount(adminId);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					String loginTime=sdf.format(Calendar.getInstance().getTime());
					String ip=this.getIpAddr(request);
					int lev = ab.getGrade();
					LoginRecordBean lrb=new LoginRecordBean();
					lrb.setAdminId(adminId);
					lrb.setAdminName(adminName);
					lrb.setRealName(realName);
					lrb.setLoginTime(loginTime);
					lrb.setIp(ip);
					lrb.setCount(logCount);
					lrb.setLev(lev);
					//获取登录信息并插入数据库
					if(request.getSession().getAttribute("admininfo")==null){
						aid.insertLoginRecord(lrb);
						request.getSession().setAttribute("admininfo",lrb);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}else{
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}
					
			}else{
				request.getRequestDispatcher("login.jsp?errType=2").forward(request,response);
			}
		}else if(type.equals("quit")){
			request.getSession().removeAttribute("admininfo");
			request.getSession().invalidate();
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	public String getIpAddr(HttpServletRequest request) {  
	      String ip = request.getHeader("WL-Proxy-Client-IP");  
	      if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	         ip = request.getHeader("Proxy-Client-IP");  
	     }  
	      if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	         ip = request.getHeader("WL-Proxy-Client-IP");  
	      }  
	     if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	          ip = request.getRemoteAddr();  
	     }  
	     return ip;  
	} 

}
