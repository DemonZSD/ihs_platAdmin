package edu.ahu.hs.platAppoint.business;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import edu.ahu.hs.platAppoint.DAO.DeviceInfoDAO;
import edu.ahu.hs.platAppoint.beans.*;
import edu.ahu.hs.platAppoint.web.IDataService;

public class DeviceBusinessService implements IDataService {
	DeviceInfoDAO did=new DeviceInfoDAO();
	@Override
	public Object handler(String action, HttpServletRequest request)
			throws Exception {
		//获取所有设备
		if("getAllDeviceInfo".equals(action)){
			List<DeviceBean> beans = did.getAllDeviceInfo();
			if (beans != null && beans.size() > 0) {
				JSONObject json = new JSONObject();
				json.put("Rows", beans);
				
				json.put("Total", beans.size());
				
				return json;
				
			} else {
				return null;
			}
		}//获取设备
		if("getDeviceInfo".equals(action)){
			return did.getAllDeviceInfo();
		}//添加设备
		if("addDeviceInfo".equals(action)){
			String deviceName = request.getParameter("deviceName");
			String type =request.getParameter("type");
			String made=request.getParameter("made");
			String photo = request.getParameter("photo");
			String expriment = request.getParameter("expriment");
			String train = request.getParameter("train");
			int trainNum = Integer.parseInt(request.getParameter("trainNum"));
			String price = request.getParameter("price");
			String adminId = request.getParameter("adminId");
			String maxId = UUID.randomUUID().toString();
			DeviceBean db=new DeviceBean(maxId, deviceName, type, made,photo, expriment, train, trainNum, price, adminId);
			return did.addDeviceInfo(db);
		}
		//删除会议室
		if("delDeviceInfo".equals(action)){
			String deviceId = request.getParameter("deviceId");
			return did.delDeviceInfo(deviceId);
		}
		//修改会议室信息
		if("updateDeviceInfo".equals(action)){
			String deviceId=request.getParameter("deviceId");
			String deviceName = request.getParameter("deviceName");
			String type =request.getParameter("type");
			String made=request.getParameter("made");
			String photo = request.getParameter("photo");
			String expriment = request.getParameter("expriment");
			String train = request.getParameter("train");
			int trainNum = Integer.parseInt(request.getParameter("trainNum"));
			String price = request.getParameter("price");
			String adminId = request.getParameter("adminId");
			DeviceBean db=new DeviceBean();
			db.setDeviceId(deviceId);
			db.setDeviceName(deviceName);
			db.setType(type);
			db.setPhoto(photo);
			db.setExpriment(expriment);
			db.setTrain(train);
			db.setTrainNum(trainNum);
			db.setPrice(price);
			db.setAdminId(adminId);
			db.setMade(made);
     	    return did.updateDeviceInfo(db);
		}
		return null;
	}

}
