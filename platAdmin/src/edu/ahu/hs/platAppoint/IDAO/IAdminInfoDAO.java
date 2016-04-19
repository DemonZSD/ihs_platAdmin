package edu.ahu.hs.platAppoint.IDAO;

import java.util.ArrayList;

import edu.ahu.hs.platAppoint.beans.AdminBean;

public interface IAdminInfoDAO {

	public ArrayList<AdminBean> getAllAdminInfo();
	/**
	 * 录入会议室信息
	 */
	public boolean addAdminInfo(AdminBean rb);
	/**
	 * 删除会议室信息
	 */
	public boolean delAdminInfo(String adminId);
	/**
	 * 更新会议室信息
	 */
	public boolean updateAdminInfo(AdminBean ab);
}
