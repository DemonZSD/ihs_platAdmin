package edu.ahu.hs.platAppoint.IDAO;

import java.util.ArrayList;

import edu.ahu.hs.platAppoint.beans.RmOrBean;

public interface IRoomOrInfoDAO {
	public ArrayList<RmOrBean> getAllRoomOrInfo();
	/**
	 * 录入会议室预约信息
	 */
	public boolean addRoomOrInfo(RmOrBean rob);
	/**
	 * 删除会议室预约信息
	 */
	public boolean delRoomOrInfo(String rmOrId);
	/**
	 * 更新会议室预约信息
	 */
	public boolean updateRoomOrInfo(RmOrBean rob);
	public RmOrBean getRoomOrInfoById(String rmOrId);
}
