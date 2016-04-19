package edu.ahu.hs.platAppoint.IDAO;

import java.util.ArrayList;

import edu.ahu.hs.platAppoint.beans.UserBean;

public interface IUserInfoDAO {
	public ArrayList<UserBean> getAllUserInfo();
	/**
	 * 录入用户信息
	 */
	public boolean addUserInfo(UserBean ub);
	/**
	 * 删除用户信息
	 */
	public boolean delUserInfo(String UserId);
	/**
	 * 更新用户信息
	 */
	public boolean updateUserInfo(UserBean ub);
	public UserBean getUserInfoById(String userId);

}
