package edu.ahu.hs.platAppoint.business;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import edu.ahu.hs.platAppoint.DAO.*;
import edu.ahu.hs.platAppoint.beans.RoomBean;
import edu.ahu.hs.platAppoint.web.IDataService;

public class RoomBusinessService implements IDataService{
	RoomInfoDAO irid = new RoomInfoDAO();
	public Object handler(String action, HttpServletRequest request)
			throws Exception {
		//获取所有会议室信息
		if("getAllRoomInfo".equals(action)){
			List<RoomBean> beans = irid.getAllRoomInfo();
			if (beans != null && beans.size() > 0) {
				JSONObject json = new JSONObject();
				json.put("Rows", beans);
				json.put("Total", beans.size());
				return json;
			} else {
				return null;
			}
		}
		//获取会议室
		if("getRoomInfo".equals(action)){
			return irid.getAllRoomInfo();
		}
		//添加会议室
		if("addRoomInfo".equals(action)){
			String roomNo = request.getParameter("roomNo");
			String roomType = request.getParameter("roomType");
			String roomFunction = request.getParameter("roomFunction");
			String addr = request.getParameter("addr");
			String price=request.getParameter("price");
			String adminId = request.getParameter("adminId");
			String adminName = request.getParameter("adminName");
			int contain = Integer.parseInt(request.getParameter("contain"));
			String maxId = UUID.randomUUID().toString();
			RoomBean rb = new RoomBean(maxId, roomNo, roomType, roomFunction, addr, price, adminId, adminName, contain); 
			return irid.addRoomInfo(rb);
		}
		//删除会议室
		if("delRoomInfo".equals(action)){
			String roomId = request.getParameter("roomId");
			return irid.delRoomInfo(roomId);
		}
		//修改会议室信息
		if("updateRoomInfo".equals(action)){
			String roomId=request.getParameter("roomId");
			String roomNo = request.getParameter("roomNo");
     	    String roomType=request.getParameter("roomType");
     	    String roomFunction= request.getParameter("roomFunction");
     	    String addr = request.getParameter("addr");
     	    String price=request.getParameter("price");
     	    String adminId = request.getParameter("adminId");
     	    int  contain =Integer.parseInt(request.getParameter("contain"));
     	    RoomBean rb=new RoomBean();
     	    rb.setRoomId(roomId);
     	    rb.setRoomNo(roomNo);
     	    rb.setRoomType(roomType);
     	    rb.setRoomFunction(roomFunction);
     	    rb.setPrice(price);
     	    rb.setAddr(addr);
     	    rb.setAdminId(adminId);
     	    rb.setContain(contain);
     	    boolean ff = irid.updateRoomInfo(rb);
     	    return ff;
     	    
		}
		return null;
	}
	
}