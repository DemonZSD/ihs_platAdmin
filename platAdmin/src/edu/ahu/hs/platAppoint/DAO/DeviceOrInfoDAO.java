package edu.ahu.hs.platAppoint.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import edu.ahu.hs.platAppoint.IDAO.IDeviceOrInfoDAO;
import edu.ahu.hs.platAppoint.beans.DeOrBean;

public class DeviceOrInfoDAO implements IDeviceOrInfoDAO{
	private ResultSet rs=null;
	private Connection conn=null;
	private PreparedStatement ps=null;
	@Override
	public ArrayList<DeOrBean> getAllDeviceOrInfo() {
		ArrayList<DeOrBean> al=new ArrayList<DeOrBean>();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select * from deortable ");
			rs=ps.executeQuery();
			DeviceInfoDAO did=new DeviceInfoDAO();
			UserInfoDAO uid=new UserInfoDAO();
			while(rs.next()){
				DeOrBean dob=new DeOrBean();
				dob.setDeOrId(rs.getString(1));
				dob.setOrName(rs.getString(2));
				dob.setContact(rs.getString(3));
				dob.setEmail(rs.getString(4));
				dob.setReDate(rs.getString(5));
				dob.setReTime(rs.getString(6));
				dob.setNoon(rs.getInt(7));
				dob.setSubmitTime(rs.getString(8).substring(0, 16));
				dob.setMoney(rs.getString(9));
				dob.setDeviceId(rs.getString(10));
				dob.setDeviceType(rs.getString(17));
				dob.setDeviceName(rs.getString(16));
				dob.setUserId(rs.getString(11));
				dob.setUserName(uid.getUserInfoById(rs.getString(11)).getRealName());
				dob.setIsUsing(rs.getInt(12));
				dob.setFinish(rs.getInt(13));
				dob.setRemark(rs.getString(14));
				dob.setAdminId(did.getDeviceInfoById(rs.getString(10)).getAdminId());
				dob.setAdminName(rs.getString(18));
				dob.setDepartment(rs.getString(19));
				dob.setPurpose(rs.getString(15));
				al.add(dob);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	@Override
	public boolean addDeviceOrInfo(DeOrBean dob) {
		boolean flag=false;
		DeviceInfoDAO did = new DeviceInfoDAO();
		UserInfoDAO uid = new UserInfoDAO();
		try {
			conn=new ConnDB().getConn();
			String sql="insert into deortable "+
			" (deOrId,orName,contact,email,reDate,reTime,noon,submitTime,money,"+
					"deviceId,userId,isUsing,finish,remark,purpose,deviceName,type,adminName,department) "+
			" values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)  ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dob.getDeOrId());
			ps.setString(2, dob.getOrName());
			ps.setString(3,dob.getContact());
			ps.setString(4,dob.getEmail());
			ps.setString(5,dob.getReDate());
			ps.setString(6,dob.getReTime());
			ps.setInt(7,dob.getNoon());
			ps.setString(8,dob.getSubmitTime());
			ps.setString(9,dob.getMoney());
			ps.setString(10, dob.getDeviceId());
			ps.setString(11, dob.getUserId());
			ps.setInt(12, dob.getIsUsing());
			ps.setInt(13, dob.getFinish());
			ps.setString(14,dob.getRemark() );
			ps.setString(15, dob.getPurpose());
			ps.setString(16, did.getDeviceInfoById(dob.getDeviceId()).getDeviceName());
			ps.setString(17,did.getDeviceInfoById(dob.getDeviceId()).getType());
			ps.setString(18,did.getDeviceInfoById(dob.getDeviceId()).getAdminName());
			ps.setString(19, uid.getUserInfoById(dob.getUserId()).getDepartMent());
			if(ps.executeUpdate()>0){
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return flag;
	}
	@Override
	public boolean delDeviceOrInfo(String deOrId) {
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("delete from deortable where deOrId=?");
			ps.setString(1, deOrId);
			if(ps.executeUpdate()>0){
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return flag;
	}
	@Override
	public boolean updateDeviceOrInfo(DeOrBean dob) {
		boolean flag=false;
		DeviceInfoDAO did = new DeviceInfoDAO();
		UserInfoDAO uid = new UserInfoDAO();
		try {
			conn=new ConnDB().getConn();
			String sql="UPDATE deortable SET orName= ? , contact=?, email=?, reDate = ?,"+
						" reTime=?,noon=? , submitTime=?, money=? ,  deviceId=?, userId=? , isUsing=? ,"+
						" finish=? , remark = ? ,deviceName=? , type=? , adminName=? , department=?  where deOrId=? ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dob.getOrName());
			ps.setString(2,dob.getContact());
			ps.setString(3,dob.getEmail());
			ps.setString(4,dob.getReDate());
			ps.setString(5,dob.getReTime());
			ps.setInt(6, dob.getNoon());			
			ps.setString(7,dob.getSubmitTime());
			ps.setString(8,dob.getMoney());
			ps.setString(9,dob.getDeviceId());
			ps.setString(10,dob.getUserId());
			ps.setInt(11,dob.getIsUsing());
			ps.setInt(12,dob.getFinish());
			ps.setString(18,dob.getDeOrId());
			ps.setString(13, dob.getRemark());
			String deviceName = did.getDeviceInfoById(dob.getDeviceId()).getDeviceName();
			ps.setString(14, deviceName);
			String type = did.getDeviceInfoById(dob.getDeviceId()).getType();
			ps.setString(15, type);
			String adminName = did.getDeviceInfoById(dob.getDeviceId()).getAdminName();
			ps.setString(16,adminName);
			String departMent = uid.getUserInfoById(dob.getUserId()).getDepartMent();
			ps.setString(17, departMent);
			if(ps.executeUpdate()>0){
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return flag;
	}
	@Override
	public DeOrBean getDeviceOrInfoById(String deOrId) {
		DeOrBean dob=new DeOrBean();
			try {
				conn=new ConnDB().getConn();
				ps=conn.prepareStatement("select * from deortable where deOrId = ? ");
				ps.setString(1, deOrId);
				rs=ps.executeQuery();
				DeviceInfoDAO did=new DeviceInfoDAO();
				UserInfoDAO uid=new UserInfoDAO();
				while(rs.next()){
					dob.setDeOrId(rs.getString(1));
					dob.setOrName(rs.getString(2));
					dob.setContact(rs.getString(3));
					dob.setEmail(rs.getString(4));
					dob.setReDate(rs.getString(5));
					dob.setReTime(rs.getString(6));
					dob.setNoon(rs.getInt(7));
					dob.setSubmitTime(rs.getString(8).substring(0, 16));
					dob.setMoney(rs.getString(9));
					dob.setDeviceId(rs.getString(10));
					dob.setDeviceType(rs.getString(17));
					dob.setDeviceName(rs.getString(16));
					dob.setUserId(rs.getString(11));
					dob.setUserName(uid.getUserInfoById(rs.getString(11)).getRealName());
					dob.setIsUsing(rs.getInt(12));
					dob.setFinish(rs.getInt(13));
					dob.setRemark(rs.getString(14));
					dob.setAdminId(did.getDeviceInfoById(rs.getString(10)).getAdminId());
					dob.setAdminName(rs.getString(18));
					dob.setDepartment(rs.getString(19));
					dob.setPurpose(rs.getString(15));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return dob;

	}
	public void close(){
		
		try{
			if(rs!=null){
				rs.close();
				rs=null;
			}
			if(ps!=null){
				ps.close();
				ps=null;
			}
			if(conn!=null){
				conn.close();
				conn=null;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	

}
