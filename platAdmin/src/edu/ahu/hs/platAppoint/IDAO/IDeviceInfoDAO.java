package edu.ahu.hs.platAppoint.IDAO;

import java.util.ArrayList;
import edu.ahu.hs.platAppoint.beans.DeviceBean;
public interface IDeviceInfoDAO {
	public ArrayList<DeviceBean> getAllDeviceInfo();
	/**
	 * 录入仪器设备信息
	 */
	public boolean addDeviceInfo(DeviceBean db);
	/**
	 * 删除仪器设备信息
	 */
	public boolean delDeviceInfo(String deviceId);
	/**
	 * 更新仪器设备信息
	 */
	public boolean updateDeviceInfo(DeviceBean db);
	public DeviceBean getDeviceInfoById(String deviceId);

}
