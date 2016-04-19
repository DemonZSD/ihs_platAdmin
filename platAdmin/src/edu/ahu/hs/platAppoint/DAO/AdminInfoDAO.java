package edu.ahu.hs.platAppoint.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.UUID;

import edu.ahu.hs.platAppoint.IDAO.IAdminInfoDAO;
import edu.ahu.hs.platAppoint.beans.AdminBean;
import edu.ahu.hs.platAppoint.beans.LoginRecordBean;
public class AdminInfoDAO implements IAdminInfoDAO{
	private ResultSet rs=null;
	private Connection conn=null;
	private PreparedStatement ps=null;
	//验证登录
	public boolean checkLogin(String adminName,String passWd){
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select  passWd from admintable where adminName=?");
			ps.setString(1,adminName);
			rs=ps.executeQuery();
			if(rs.next()){
				String dbPassWd=rs.getString(1);
				if(dbPassWd.equals(passWd)){
					flag=true;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return flag;
	}
	public AdminBean getAdminInfoByName(String adminName){
		AdminBean ab=new AdminBean();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select adminId,adminName,passwd,realname,phone,email,grade from admintable  where adminName=? ");
			ps.setString(1, adminName);
			rs=ps.executeQuery();
			if(rs.next()){
				ab.setAdminId(rs.getString(1));
				ab.setAdminName(rs.getString(2));
				ab.setPassWd(rs.getString(3));
				ab.setRealName(rs.getString(4));
				ab.setPhone(rs.getString(5));
				ab.setEmail(rs.getString(6));
				ab.setGrade(rs.getInt(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return ab;
	}
	//获取管理员信息
	public AdminBean getAdminInfo(String adminId){
		AdminBean ab=new AdminBean();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select adminId,adminName,passwd,realname,phone,email,grade from admintable  where adminId=? ");
			ps.setString(1, adminId);
			rs=ps.executeQuery();
			if(rs.next()){
				ab.setAdminId(adminId);
				ab.setAdminName(rs.getString(2));
				ab.setPassWd(rs.getString(3));
				ab.setRealName(rs.getString(4));
				ab.setPhone(rs.getString(5));
				ab.setEmail(rs.getString(6));
				ab.setGrade(rs.getInt(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return ab;
	}
	//获取所有管理员信息
	public ArrayList<AdminBean> getAllAdminInfo(){
		ArrayList<AdminBean> al=new ArrayList<AdminBean>();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select adminId,adminName,passwd,realname,phone,email,grade from admintable ");
			rs=ps.executeQuery();
			while(rs.next()){
				AdminBean ab=new AdminBean();
				ab.setAdminId(rs.getString(1));
				ab.setAdminName(rs.getString(2));
				ab.setPassWd(rs.getString(3));
				ab.setRealName(rs.getString(4));
				ab.setPhone(rs.getString(5));
				ab.setEmail(rs.getString(6));
				ab.setGrade(rs.getInt(7));
				al.add(ab);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	//添加管理员
	public boolean addAdminInfo(AdminBean ab){
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("insert into admintable(adminId,adminName,passwd,realname,phone,email,grade) values (?,?,?,?,?,?,?) ");
			ps.setString(1,ab.getAdminId());
			ps.setString(2,ab.getAdminName());
			ps.setString(3,ab.getPassWd());
			ps.setString(4,ab.getRealName());
			ps.setString(5,ab.getPhone());
			ps.setString(6,ab.getEmail());
			ps.setInt(7,ab.getGrade());
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
	//插入登录信息
	public void insertLoginRecord(LoginRecordBean lrb){
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("insert into adminlogintable values (?,?,?,?,?) ");
			String loginId=UUID.randomUUID().toString();
			ps.setString(1, loginId);
			ps.setString(2, lrb.getAdminId());
			ps.setString(3, lrb.getRealName());
			ps.setString(4,lrb.getLoginTime());
			ps.setString(5, lrb.getIp());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
	}
	//获取登录次数
	public int getLoginCount(String adminId){
		int count=0;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select count(*) from adminlogintable where adminId= ? ");
			ps.setString(1, adminId);
			rs=ps.executeQuery();
			if(rs.next()){
				   count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return count;
	}
	//获取上次登录信息
	public ArrayList<LoginRecordBean> getLatestLoginInfo(String adminId){
		ArrayList<LoginRecordBean> loginRecord=new ArrayList<LoginRecordBean>();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select * from adminlogintable order by logintime");
			rs=ps.executeQuery();
			while(rs.next()){
				LoginRecordBean lrb=new LoginRecordBean();
				lrb.setAdminId(rs.getString(1));
				lrb.setLoginTime(rs.getString(2));
				lrb.setIp(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return loginRecord;
	}
	public boolean delAdminInfo(String adminId) {
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("delete from admintable where adminId=?");
			ps.setString(1, adminId);
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
	public boolean updateAdminInfo(AdminBean ab) {
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			String sql="UPDATE admintable SET adminName= ? , passWd=?, realName=?, phone = ?,"+
						" email=?, grade=? where adminId=? ";
			ps=conn.prepareStatement(sql);
			ps.setString(1,ab.getAdminName());
			ps.setString(2,ab.getPassWd());
			ps.setString(3,ab.getRealName());
			ps.setString(4,ab.getPhone());
			ps.setString(5,ab.getEmail());
			ps.setInt(6,ab.getGrade());
			ps.setString(7, ab.getAdminId());
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
