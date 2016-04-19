package edu.ahu.hs.platAppoint.business;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import edu.ahu.hs.platAppoint.DAO.*;
import edu.ahu.hs.platAppoint.beans.RmOrBean;
import edu.ahu.hs.platAppoint.web.IDataService;

public class RoomOrBusinessService implements IDataService{
	RoomOrInfoDAO roid=new RoomOrInfoDAO();
	@Override
	public Object handler(String action, HttpServletRequest request)
			throws Exception {
		
		//获取所有会议室预约信息
		if("getAllRoomOrInfo".equals(action)){
			List<RmOrBean> beans =roid.getAllRoomOrInfo();
			if (beans != null && beans.size() > 0) {
				JSONObject json = new JSONObject();
				json.put("Rows", beans);
				json.put("Total", beans.size());
				return json;
			} else {
				return null;
			}
		}
		//获取会议室预约
		if("getRoomOrInfo".equals(action)){
			return roid.getAllRoomOrInfo();
		}
		
		//删除会议室预约
		if("delRoomOrInfo".equals(action)){
			String rmOrId = request.getParameter("rmOrId");
			return roid.delRoomOrInfo(rmOrId);
		}
		//修改会议室预约信息
		if("updateRoomOrInfo".equals(action)){
			String rmOrId=request.getParameter("rmOrId");
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
			String money=request.getParameter("money");
			money=new String(money.getBytes("ISO-8859-1"),"UTF-8");
			String roomId = request.getParameter("roomId");
			String userId = request.getParameter("userId");
			int  isUsing = Integer.parseInt(request.getParameter("isUsing"));
			int finish =Integer.parseInt(request.getParameter("finish"));
			RmOrBean rob=new RmOrBean();
     	    rob.setOrName(orName);
     	    rob.setRmOrId(rmOrId);
     	    rob.setContact(contact);
     	    rob.setEmail(email);
     	    rob.setReDate(reDate);
     	    rob.setReTime(reTime);
     	    rob.setNoon(noon);
     	    rob.setSubmitTime(submitTime);
     	    rob.setMoney(money);
     	    rob.setRoomId(roomId);
     	    rob.setUserId(userId);
     	    rob.setIsUsing(isUsing);
     	    rob.setFinish(finish);
     	    return roid.updateRoomOrInfo(rob);
		}
		//添加会议室预约
		if("addRoomOrInfo".equals(action)){
			UserInfoDAO uid=new UserInfoDAO();
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
			String money=request.getParameter("money");
			money=new String(money.getBytes("ISO-8859-1"),"UTF-8");
			String roomId = request.getParameter("roomId");
			String userId = request.getParameter("userId");
			String orName= uid.getUserInfoById(userId).getRealName();
			String contact=request.getParameter("contact");
			String email =  uid.getUserInfoById(userId).getEmail();
			int  isUsing = Integer.parseInt(request.getParameter("isUsing"));
			int finish =Integer.parseInt(request.getParameter("finish"));
			String remark = request.getParameter("remark");
			String purpose=request.getParameter("purpose");
			String maxId = UUID.randomUUID().toString();
			RmOrBean rob = new RmOrBean(maxId, orName, contact, email, reDate, reTime, noon, submitTime, money, roomId, userId, isUsing, finish, remark,purpose);
			return roid.addRoomOrInfo(rob);
		}
		return null;
	}

}
