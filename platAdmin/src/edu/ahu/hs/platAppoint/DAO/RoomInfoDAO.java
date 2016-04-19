package edu.ahu.hs.platAppoint.DAO;

import java.sql.*;
import java.util.*;

import edu.ahu.hs.platAppoint.IDAO.IRoomInfoDAO;
import edu.ahu.hs.platAppoint.beans.RoomBean;


public class RoomInfoDAO implements IRoomInfoDAO{


	private ResultSet rs=null;
	private Connection conn=null;
	private PreparedStatement ps=null;
	
	
	//获取会议室列表
	public ArrayList<RoomBean> getAllRoomInfo(){
		ArrayList<RoomBean> al=new ArrayList<RoomBean>();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select * from roomtable ");
			rs=ps.executeQuery();
			while(rs.next()){
				RoomBean rb=new RoomBean();
				rb.setRoomId(rs.getString(1));
				rb.setRoomNo(rs.getString(2));
				rb.setRoomType(rs.getString(3));
				rb.setRoomFunction(rs.getString(4));
				rb.setAddr(rs.getString(5));
				rb.setPrice(rs.getString(6));
				rb.setAdminId(rs.getString(7));
				rb.setAdminName(rs.getString(9));
				rb.setContain(rs.getInt(8));
				al.add(rb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	public RoomBean getRoomInfoById(String roomId){
		RoomBean rb=new RoomBean();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select * from roomtable where roomId=?");
			ps.setString(1, roomId);
			rs=ps.executeQuery();
			while(rs.next()){
				rb.setRoomId(roomId);
				rb.setRoomNo(rs.getString(2));
				rb.setRoomType(rs.getString(3));
				rb.setRoomFunction(rs.getString(4));
				rb.setAddr(rs.getString(5));
				rb.setPrice(rs.getString(6));
				rb.setAdminId(rs.getString(7));
				rb.setAdminName(rs.getString(9));
				rb.setContain(rs.getInt(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return rb;
	}
	
	public boolean delRoomInfo(String roomId){
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("delete from roomtable where roomId=?");
			ps.setString(1, roomId);
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
	//修改会议室信息
	public boolean updateRoomInfo(RoomBean rb) {
		boolean flag=false;
		AdminInfoDAO adminDap = new AdminInfoDAO();
		try {
			conn=new ConnDB().getConn();
			String sql="UPDATE roomtable SET roomNo= ? , roomType=?, Function=?, addr = ?,"+
						" price=?, adminId=?, contain=? ,adminName=? where roomId=? ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, rb.getRoomNo());
			ps.setString(2,rb.getRoomType());
			ps.setString(3,rb.getRoomFunction());
			ps.setString(4,rb.getAddr());
			ps.setString(5,rb.getPrice());
			ps.setInt(7,rb.getContain() );
			ps.setString(6,rb.getAdminId());
			ps.setString(9, rb.getRoomId());
			ps.setString(8, adminDap.getAdminInfo(rb.getAdminId()).getRealName());
			
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
	//添加会议室
	public boolean  addRoomInfo(RoomBean rb){
		AdminInfoDAO adminDap = new AdminInfoDAO();
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("insert into roomtable values (?,?,?,?,?,?,?,?,?) ");
			ps.setString(1, rb.getRoomId());
			ps.setString(2,rb.getRoomNo());
			ps.setString(3,rb.getRoomType());
			ps.setString(4,rb.getRoomFunction());
			ps.setString(5,rb.getAddr());
			ps.setString(6,rb.getPrice() );
			ps.setString(7,rb.getAdminId() );
			ps.setInt(8, rb.getContain());
			ps.setString(9, adminDap.getAdminInfo(rb.getAdminId()).getRealName());
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
	//关闭资源
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
