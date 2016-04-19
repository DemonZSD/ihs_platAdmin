package edu.ahu.hs.platAppoint.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import edu.ahu.hs.platAppoint.IDAO.*;
import edu.ahu.hs.platAppoint.beans.UserBean;

public class UserInfoDAO implements IUserInfoDAO{

	private ResultSet rs=null;
	private Connection conn=null;
	private PreparedStatement ps=null;
	
	public ArrayList<UserBean> getAllUserInfo() {
		ArrayList<UserBean> al=new ArrayList<UserBean>();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select * from usertable ");
			rs=ps.executeQuery();
			while(rs.next()){
				UserBean ub=new UserBean();
				ub.setUserId(rs.getString(1));
				ub.setUserName(rs.getString(2));
				ub.setPassWd(rs.getString(3));
				ub.setRealName(rs.getString(4));
				ub.setPhoneNum(rs.getString(5));
				ub.setEmail(rs.getString(6));
				ub.setDepartMent(rs.getString(7));
				al.add(ub);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}

	@Override
	public boolean addUserInfo(UserBean ub) {
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("insert into usertable values (?,?,?,?,?,?,?) ");
			ps.setString(1,ub.getUserId());
			ps.setString(2,ub.getUserName());
			ps.setString(3,ub.getPassWd());
			ps.setString(4,ub.getRealName());
			ps.setString(5,ub.getPhoneNum());
			ps.setString(6,ub.getEmail());
			ps.setString(7,ub.getDepartMent());
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
	public boolean delUserInfo(String userId) {
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("delete from usertable where userId=?");
			ps.setString(1, userId);
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
	public boolean updateUserInfo(UserBean ub) {
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			String sql="UPDATE usertable SET userName= ? , passWd= ?, realName=?, phoneNum = ?,"+
						" email= ?, department= ? where userId= ? ";
			ps=conn.prepareStatement(sql);
			ps.setString(1,ub.getUserName());
			ps.setString(2,ub.getPassWd());
			ps.setString(3,ub.getRealName());
			ps.setString(4,ub.getPhoneNum());
			ps.setString(5,ub.getEmail());
			ps.setString(6,ub.getDepartMent());
			ps.setString(7, ub.getUserId());
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
	public UserBean getUserInfoById(String userId) {
		UserBean ub=new UserBean();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select * from usertable where userId= ? ");
			ps.setString(1, userId);
			rs=ps.executeQuery();
			if(rs.next()){
				ub.setUserId(rs.getString(1));
				ub.setUserName(rs.getString(2));
				ub.setPassWd(rs.getString(3));
				ub.setRealName(rs.getString(4));
				ub.setPhoneNum(rs.getString(5));
				ub.setEmail(rs.getString(6));
				ub.setDepartMent(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return ub;
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
