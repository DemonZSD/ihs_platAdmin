package edu.ahu.hs.platAppoint.IDAO;
import java.util.ArrayList;
import java.util.List;

import edu.ahu.hs.platAppoint.beans.*;
public interface IRoomInfoDAO {
	
	
	public ArrayList<RoomBean> getAllRoomInfo();
	/**
	 * 录入会议室信息
	 */
	public boolean addRoomInfo(RoomBean rb);
	/**
	 * 删除会议室信息
	 */
	public boolean delRoomInfo(String roomId);
	/**
	 * 更新会议室信息
	 */
	public boolean updateRoomInfo(RoomBean rb);
	public RoomBean getRoomInfoById(String roomId);
}
