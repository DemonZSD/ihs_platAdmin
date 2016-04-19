package edu.ahu.hs.platAppoint.business;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import edu.ahu.hs.platAppoint.DAO.DeviceOrInfoDAO;
import edu.ahu.hs.platAppoint.DAO.UserInfoDAO;
import edu.ahu.hs.platAppoint.beans.DeOrBean;
import edu.ahu.hs.platAppoint.web.IDataService;

public class DeviceOrBusinessService implements IDataService{
	DeviceOrInfoDAO doid=new DeviceOrInfoDAO();
	@Override
	public Object handler(String action, HttpServletRequest request)
			throws Exception {
		// TODO Auto-generated method stub
		//获取所有仪器预约信息
		if("getAllDeviceOrInfo".equals(action)){
			List<DeOrBean> beans =doid.getAllDeviceOrInfo();
			if (beans != null && beans.size() > 0) {
				JSONObject json = new JSONObject();
				json.put("Rows", beans);
				json.put("Total", beans.size());
				return json;
			} else {
				return null;
			}
		}//获取仪器预约
		else if("getDeviceOrInfo".equals(action)){
			return doid.getAllDeviceOrInfo();
		}
		//删除仪器预约
		else if("delDeviceOrInfo".equals(action)){
			String deOrId=request.getParameter("deOrId");
			return doid.delDeviceOrInfo(deOrId);
		}
		//修改仪器预约信息
		else if("updateDeviceOrInfo".equals(action)){
			String deOrId=request.getParameter("deOrId");
			String orName=request.getParameter("orName");
			String contact = request.getParameter("contact");
			String email = request.getParameter("email");
			String reDate = request.getParameter("reDate");
			String reTime = request.getParameter("reTime");
			int s=Integer.parseInt(reTime.substring(0, 2));
			/**
			 * noon=1、2、3分别 代表上午、下午、晚上，
			 */
			int noon=1;
			if(s>12){
				noon=2;
			}else if(s>19){
				noon=3;
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String submitTime=sdf.format(Calendar.getInstance().getTime());
			String money = request.getParameter("money");
			String deviceId = request.getParameter("deviceId");
			String userId = request.getParameter("userId");
			int  isUsing = Integer.parseInt(request.getParameter("isUsing"));
			int finish =Integer.parseInt(request.getParameter("finish"));
			String remark = request.getParameter("remark");
			DeOrBean dob=new DeOrBean();
			dob.setOrName(orName);
			dob.setDeOrId(deOrId);
			dob.setContact(contact);
			dob.setEmail(email);
			dob.setReDate(reDate);
			dob.setReTime(reTime);
			dob.setNoon(noon);
			dob.setSubmitTime(submitTime);
			dob.setMoney(money);
			dob.setDeviceId(deviceId);;
			dob.setUserId(userId);
			dob.setIsUsing(isUsing);
			dob.setFinish(finish);
			dob.setRemark(remark);
			
     	    return doid.updateDeviceOrInfo(dob);
		}
		//添加仪器设备预约信息
		else if("addDeviceOrInfo".equals(action)){
			UserInfoDAO uid=new UserInfoDAO();
			String deOrId=UUID.randomUUID().toString();
			String contact = request.getParameter("contact");
			String email = request.getParameter("email");
			String reDate = request.getParameter("reDate");
			String reTime = request.getParameter("reTime");
			int s=Integer.parseInt(reTime.substring(0, 2));
			/**
			 * noon=1、2、3分别 代表上午、下午、晚上，
			 */
			int noon=1;
			if(s>12){
				noon=2;
			}else if(s>19){
				noon=3;
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String submitTime=sdf.format(Calendar.getInstance().getTime());
			String money = request.getParameter("money");
			String deviceId = request.getParameter("deviceId");
			String userId = request.getParameter("userId");
			String orName= uid.getUserInfoById(userId).getRealName();
			int  isUsing = Integer.parseInt(request.getParameter("isUsing"));
			int finish =Integer.parseInt(request.getParameter("finish"));
			String remark = request.getParameter("remark");
			String purpose=request.getParameter("purpose");
			DeOrBean dob=new DeOrBean(deOrId, orName, contact, email, reDate, reTime, noon, submitTime, money, deviceId, userId, isUsing, finish, remark,purpose);
			return doid.addDeviceOrInfo(dob);
		}
		return null;
	}
	
}
