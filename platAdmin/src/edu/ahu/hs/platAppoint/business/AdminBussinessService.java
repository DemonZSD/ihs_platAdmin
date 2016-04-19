package edu.ahu.hs.platAppoint.business;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import com.alibaba.fastjson.JSONObject;
import edu.ahu.hs.platAppoint.DAO.*;
import edu.ahu.hs.platAppoint.beans.AdminBean;
import edu.ahu.hs.platAppoint.web.IDataService;

public class AdminBussinessService implements IDataService{
	AdminInfoDAO aid = new AdminInfoDAO();
	public Object handler(String action, HttpServletRequest request)
			throws Exception {
		//获取所有会议室信息
		if("getAllAdminInfo".equals(action)){
			ArrayList<AdminBean> beans = aid.getAllAdminInfo();
			if (beans != null && beans.size() > 0) {
				JSONObject json = new JSONObject();
				json.put("Rows", beans);
				json.put("Total", beans.size());
				return json;
			} else {
				return null;
			}
		}
		if("getAdminInfo".equals(action)){
			return aid.getAllAdminInfo();
			
		}//添加管理员
		if("addAdminInfo".equals(action)){
			String maxId=Long.toString(System.currentTimeMillis());
			String adminName = request.getParameter("adminName");
			String passWd ="12345678";
			String realName = request.getParameter("realName");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			int grade = Integer.parseInt(request.getParameter("grade"));
			AdminBean ab= new AdminBean(maxId, adminName, passWd, realName, phone, email, grade); 
			return aid.addAdminInfo(ab);
		}
		//删除会议室
		if("delAdminInfo".equals(action)){
			String adminId = request.getParameter("adminId");
			return aid.delAdminInfo(adminId);
		}
		//修改会议室信息
		if("updateAdminInfo".equals(action)){
			String adminId=request.getParameter("adminId");
			String adminName = request.getParameter("adminName");
			String passWd = request.getParameter("passWd");
			String realName = request.getParameter("realName");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			int grade = Integer.parseInt(request.getParameter("grade"));
			AdminBean ab=new AdminBean();
     	    ab.setAdminId(adminId);
     	    ab.setAdminName(adminName);
     	    ab.setPassWd(passWd);
     	    ab.setRealName(realName);
     	    ab.setPhone(phone);
     	    ab.setEmail(email);
     	    ab.setGrade(grade);
     	    
     	    return aid.updateAdminInfo(ab);
		}
		return null;
	}
}