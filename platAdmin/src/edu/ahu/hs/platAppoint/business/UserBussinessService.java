package edu.ahu.hs.platAppoint.business;

import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import com.alibaba.fastjson.JSONObject;
import edu.ahu.hs.platAppoint.DAO.UserInfoDAO;
import edu.ahu.hs.platAppoint.beans.UserBean;
import edu.ahu.hs.platAppoint.web.IDataService;

public class UserBussinessService implements IDataService {
	UserInfoDAO uid=new UserInfoDAO();
	@Override
	public Object handler(String action, HttpServletRequest request)
			throws Exception {
		//获取所有用户信息
		if("getUserAllInfo".equals(action)){
			List<UserBean> beans = uid.getAllUserInfo();
			if (beans != null && beans.size() > 0) {
				JSONObject json = new JSONObject();
				json.put("Rows", beans);
				json.put("Total", beans.size());
				System.out.println(json+"*****");
				return json;
			} else {
				return null;
			}
		}//获取用户信息
		if("getUserInfo".equals(action)){
			return uid.getAllUserInfo();
		}//添加用户
		if("addUserInfo".equals(action)){
			String userId=request.getParameter("userId");
			String userName = request.getParameter("userName");
			String passWd ="123456";
			String realName = request.getParameter("realName");
			String phoneNum = request.getParameter("phoneNum");
			String email = request.getParameter("email");
			String departMent = request.getParameter("departMent");
			UserBean ub= new UserBean(userId, userName, passWd, realName, phoneNum, email, departMent); 
			return uid.addUserInfo(ub);
		}
		//删除会议室
		if("delUserInfo".equals(action)){
			String userId = request.getParameter("userId");
			return uid.delUserInfo(userId);
		}
		//修改会议室信息
		if("updateUserInfo".equals(action)){
			String userId=request.getParameter("userId");
			String userName = request.getParameter("userName");
			String passWd = request.getParameter("passWd");
			String realName = request.getParameter("realName");
			String phoneNum = request.getParameter("phoneNum");
			String email = request.getParameter("email");
			String department = request.getParameter("departMent");
			UserBean ub=new UserBean();
     	    ub.setUserId(userId);
     	    ub.setUserName(userName);
     	    ub.setPassWd(passWd);
     	    ub.setRealName(realName);
     	    ub.setPhoneNum(phoneNum);
     	    ub.setEmail(email);
     	    ub.setDepartMent(department);
     	    return uid.updateUserInfo(ub);
		}
		return null;
	}
	

}
