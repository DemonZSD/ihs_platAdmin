package edu.ahu.hs.platAppoint.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import edu.ahu.hs.platAppoint.IDAO.IDeviceInfoDAO;
import edu.ahu.hs.platAppoint.beans.DeviceBean;

public class DeviceInfoDAO implements IDeviceInfoDAO{

	private ResultSet rs=null;
	private Connection conn=null;
	private PreparedStatement ps=null;
	
	
	public ArrayList<DeviceBean> getAllDeviceInfo() {
		ArrayList<DeviceBean> al=new ArrayList<DeviceBean>();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select * from devicetable ");
			rs=ps.executeQuery();
			while(rs.next()){
				DeviceBean db=new DeviceBean();
				db.setDeviceId(rs.getString(1));
				db.setDeviceName(rs.getString(2));
				db.setType(rs.getString(3));
				db.setPhoto(rs.getString(4));
				db.setExpriment(rs.getString(5));
				db.setTrain(rs.getString(6));
				db.setTrainNum(rs.getInt(7));
				db.setPrice(rs.getString(8));
				db.setAdminId(rs.getString(9));
				db.setMade(rs.getString(10));
				db.setAdminName(rs.getString(11));
				al.add(db);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}


	@Override
	public boolean addDeviceInfo(DeviceBean db) {
		boolean flag=false;
		AdminInfoDAO aid = new AdminInfoDAO();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("insert into devicetable values (?,?,?,?,?,?,?,?,?,?,?) ");
			ps.setString(1,db.getDeviceId());
			ps.setString(2,db.getDeviceName());
			ps.setString(3,db.getType());
			ps.setString(4,db.getPhoto());
			ps.setString(5,db.getExpriment());
			ps.setString(6,db.getTrain());
			ps.setInt(7,db.getTrainNum());
			ps.setString(8, db.getPrice());
			ps.setString(9, db.getAdminId());
			ps.setString(10, db.getMade());
			ps.setString(11, aid.getAdminInfo(db.getAdminId()).getRealName());
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
	public boolean delDeviceInfo(String deviceId) {
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("delete from devicetable where deviceId=?");
			ps.setString(1, deviceId);
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
	public boolean updateDeviceInfo(DeviceBean db) {
		boolean flag=false;
		AdminInfoDAO aid = new AdminInfoDAO();
		try {
			conn=new ConnDB().getConn();
			String sql="UPDATE devicetable SET deviceName= ? , type= ?, photo=?, experiment = ?,"+
						" train=?, trainNum=? , price=? , adminId=? , made= ? ,adminName=? where deviceId=? ";
			ps=conn.prepareStatement(sql);
			ps.setString(11,db.getDeviceId());
			ps.setString(1,db.getDeviceName());
			ps.setString(2,db.getType());
			ps.setString(3,db.getPhoto());
			ps.setString(4,db.getExpriment());
			ps.setString(5,db.getTrain());
			ps.setInt(6,db.getTrainNum());
			ps.setString(7, db.getPrice());
			ps.setString(9, db.getMade());
			ps.setString(8, db.getAdminId());
			ps.setString(10, aid.getAdminInfo(db.getAdminId()).getRealName());
			
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
	public DeviceBean getDeviceInfoById(String deviceId) {
		DeviceBean db=new DeviceBean();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement(" select * from devicetable where deviceId= ? ");
			ps.setString(1, deviceId);
			rs=ps.executeQuery();
			if(rs.next()){
				db.setDeviceId(rs.getString(1));
				db.setDeviceName(rs.getString(2));
				db.setType(rs.getString(3));
				db.setPhoto(rs.getString(4));
				db.setExpriment(rs.getString(5));
				db.setTrain(rs.getString(6));
				db.setTrainNum(rs.getInt(7));
				db.setPrice(rs.getString(8));
				db.setAdminId(rs.getString(9));
				db.setMade(rs.getString(10));
				db.setAdminName(rs.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return db;
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
