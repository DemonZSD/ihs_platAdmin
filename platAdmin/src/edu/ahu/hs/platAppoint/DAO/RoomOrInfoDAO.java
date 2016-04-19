package edu.ahu.hs.platAppoint.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import edu.ahu.hs.platAppoint.IDAO.IRoomOrInfoDAO;
import edu.ahu.hs.platAppoint.beans.RmOrBean;

public class RoomOrInfoDAO implements IRoomOrInfoDAO{
	private ResultSet rs=null;
	private Connection conn=null;
	private PreparedStatement ps=null;
	@Override
	public ArrayList<RmOrBean> getAllRoomOrInfo() {
		ArrayList<RmOrBean> al=new ArrayList<RmOrBean>();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select * from rmortable ");
			rs=ps.executeQuery();
			RoomInfoDAO rid=new RoomInfoDAO();
			UserInfoDAO uid=new UserInfoDAO();
			while(rs.next()){
				RmOrBean rob=new RmOrBean();
				rob.setRmOrId(rs.getString(1));
				rob.setOrName(rs.getString(2));
				rob.setContact(rs.getString(3));
				rob.setEmail(rs.getString(4));
				rob.setReDate(rs.getString(5));
				rob.setReTime(rs.getString(6));
				rob.setNoon(rs.getInt(7));
				rob.setSubmitTime(rs.getString(8).substring(0,16));
				rob.setMoney(rs.getString(9));
				rob.setRoomId(rs.getString(10));
				rob.setRoomNo(rs.getString(18));
				rob.setRoomFunction(rs.getString(17));
				rob.setUserId(rs.getString(11));
				rob.setUserName(uid.getUserInfoById(rs.getString(11)).getRealName());
				rob.setIsUsing(rs.getInt(12));
				rob.setFinish(rs.getInt(13));
				rob.setRemark(rs.getString(14));
				rob.setAdminId(rid.getRoomInfoById(rs.getString(10)).getAdminId());
				rob.setAdminName(rs.getString(16));
				rob.setDepartment(rs.getString(19));
				rob.setPurpose(rs.getString(15));
				al.add(rob);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}

	@Override
	public boolean addRoomOrInfo(RmOrBean rob) {
		boolean flag=false;
		RoomInfoDAO rid = new RoomInfoDAO();
		UserInfoDAO uid = new UserInfoDAO();
		try {
			conn=new ConnDB().getConn();
			String sql="insert into rmortable "
			+ "(rmOrId,orName,contact,email,reDate,reTime, "+
			"noon,submitTime,money,roomId,userId,isUsing,finish,remark,purpose,adminName,Function,roomNum,department)"
			+" values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)  ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, rob.getRmOrId());
			ps.setString(2, rob.getOrName());
			ps.setString(3,rob.getContact());
			ps.setString(4,rob.getEmail());
			ps.setString(5,rob.getReDate());
			ps.setString(6,rob.getReTime());
			ps.setInt(7, rob.getNoon());
			ps.setString(8,rob.getSubmitTime());
			ps.setString(9,rob.getMoney());
			ps.setString(10, rob.getRoomId());
			ps.setString(11, rob.getUserId());
			ps.setInt(12, rob.getIsUsing());
			ps.setInt(13, rob.getFinish());
			ps.setString(14,rob.getRemark() );
			ps.setString(15, rob.getPurpose());
			String adminName = rid.getRoomInfoById(rob.getRoomId()).getAdminName();
			ps.setString(16, adminName);
			String function = rid.getRoomInfoById(rob.getRoomId()).getRoomFunction();
			ps.setString(17, function);
			String roomNo = rid.getRoomInfoById(rob.getRoomId()).getRoomNo();
			ps.setString(18, roomNo);
			String department = uid.getUserInfoById(rob.getUserId()).getDepartMent();
			ps.setString(19, department);
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
	public boolean delRoomOrInfo(String rmOrId) {
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("delete from rmortable where rmOrId=?");
			ps.setString(1, rmOrId);
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
	public boolean updateRoomOrInfo(RmOrBean rob) {
		boolean flag=false;
		RoomInfoDAO rid = new RoomInfoDAO();
		UserInfoDAO uid = new UserInfoDAO();
		try {
			conn=new ConnDB().getConn();
			String sql="UPDATE rmortable SET orName= ? , contact=?, email=?, reDate = ?,"+
						" reTime=?, noon= ?, submitTime=?, money=? ,  roomId=?, userId=? , isUsing=?,"+
						" finish=? ,adminName=? , Function=? , roomNum=? , department=?  where rmOrId=? ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, rob.getOrName());
			ps.setString(2,rob.getContact());
			ps.setString(3,rob.getEmail());
			ps.setString(4,rob.getReDate());
			ps.setString(5,rob.getReTime());
			ps.setInt(6, rob.getNoon());
			ps.setString(7,rob.getSubmitTime());
			ps.setString(8,rob.getMoney());
			ps.setString(9,rob.getRoomId());
			ps.setString(10,rob.getUserId());
			ps.setInt(11,rob.getIsUsing());
			ps.setInt(12,rob.getFinish());
			ps.setString(17,rob.getRmOrId());
			String adminName = rid.getRoomInfoById(rob.getRoomId()).getAdminName();
			ps.setString(13, adminName);
			String function = rid.getRoomInfoById(rob.getRoomId()).getRoomFunction();
			ps.setString(14, function);
			String roomNo = rid.getRoomInfoById(rob.getRoomId()).getRoomNo();
			ps.setString(15, roomNo);
			String department = uid.getUserInfoById(rob.getUserId()).getDepartMent();
			ps.setString(16, department);
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
	public RmOrBean getRoomOrInfoById(String rmOrId) {
		RmOrBean rob=new RmOrBean();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select * from rmortable where rmOrId = ? ");
			ps.setString(1, rmOrId);
			rs=ps.executeQuery();
			RoomInfoDAO rid=new RoomInfoDAO();
			UserInfoDAO uid=new UserInfoDAO();
			while(rs.next()){
				rob.setRmOrId(rs.getString(1));
				rob.setOrName(rs.getString(2));
				rob.setContact(rs.getString(3));
				rob.setEmail(rs.getString(4));
				rob.setReDate(rs.getString(5));
				rob.setReTime(rs.getString(6));
				rob.setNoon(rs.getInt(7));
				rob.setSubmitTime(rs.getString(8).substring(0,16));
				rob.setMoney(rs.getString(9));
				rob.setRoomId(rs.getString(10));
				rob.setRoomNo(rs.getString(18));
				rob.setUserId(rs.getString(11));
				rob.setUserName(uid.getUserInfoById(rs.getString(11)).getRealName());
				rob.setIsUsing(rs.getInt(12));
				rob.setFinish(rs.getInt(13));
				rob.setRemark(rs.getString(14));
				rob.setAdminId(rid.getRoomInfoById(rs.getString(10)).getAdminId());
				rob.setAdminName((rid.getRoomInfoById(rs.getString(10)).getAdminName()));
				rob.setDepartment(uid.getUserInfoById(rs.getString(11)).getDepartMent());
				rob.setPurpose(rs.getString(15));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return rob;
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
