package edu.ahu.hs.platAppoint.IDAO;

import java.util.ArrayList;

import edu.ahu.hs.platAppoint.beans.DeOrBean;

public interface IDeviceOrInfoDAO {
		public ArrayList<DeOrBean> getAllDeviceOrInfo();
		/**
		 * 录入仪器预约信息
		 */
		public boolean addDeviceOrInfo(DeOrBean dob);
		/**
		 * 删除仪器预约信息
		 */
		public boolean delDeviceOrInfo(String deOrId);
		/**
		 * 更新仪器预约信息
		 */
		public boolean updateDeviceOrInfo(DeOrBean dob);
		public DeOrBean getDeviceOrInfoById(String deOrId);
	}
