package edu.ahu.hs.platAppoint.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import edu.ahu.hs.platAppoint.IDAO.*;
import edu.ahu.hs.platAppoint.beans.*;

public class NewsInfoDAO implements INewsInfoDAO {

	private ResultSet rs=null;
	private Connection conn=null;
	private PreparedStatement ps=null;
	
	@Override
	public ArrayList<NewsBean> getAllNews() {
		ArrayList<NewsBean> al=new ArrayList<NewsBean>();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select * from newstable ");
			rs=ps.executeQuery();
			while(rs.next()){
				NewsBean newsbean=new NewsBean();
				newsbean.setNewsId(rs.getInt(1));
				newsbean.setTitle(rs.getString(2));
				newsbean.setOwner(rs.getString(3));
				newsbean.setContent(rs.getString(4));
				newsbean.setOrder(rs.getInt(5));
				newsbean.setTime(rs.getString(6));
				
				al.add(newsbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}

	@Override
	public NewsBean getNewsById(String newsId) {
		NewsBean newsbean=new NewsBean();
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select * from newstable where id= ? ");
			ps.setString(1, newsId);
			rs=ps.executeQuery();
			if(rs.next()){
				newsbean.setNewsId(rs.getInt(1));
				newsbean.setTitle(rs.getString(2));
				newsbean.setOwner(rs.getString(3));
				newsbean.setContent(rs.getString(4));
				newsbean.setOrder(rs.getInt(5));
				newsbean.setTime(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return newsbean;
	}

	@Override
	public boolean delNewsById(String newsId) {
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("delete from newstable where id=?");
			ps.setString(1, newsId);
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
	public boolean updateNewsById(NewsBean newsbean) {
		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			String sql="UPDATE newstable SET title=? , auther=?, content=?, sort=?,"+
					"time=? where id=? ";
			
//			String sql="UPDATE newstable SET title='"+newsbean.getTitle()+
//					"' , auther='"+newsbean.getOwner()+
//					"', content='"+newsbean.getContent()+
//					"', sort="+newsbean.getOrder()+
//					", time='"+newsbean.getTime()+
//					"' where id='"+newsbean.getNewsId()+"'";
//			System.out.println(sql);
			ps=conn.prepareStatement(sql);
			ps.setString(1,newsbean.getTitle());
			ps.setString(2,newsbean.getOwner());
			ps.setString(3,newsbean.getContent());
			ps.setInt(4,newsbean.getOrder());
			ps.setString(5,newsbean.getTime());
			ps.setInt(6,newsbean.getNewsId());
			
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
	public boolean addNews(NewsBean newsbean) {

		boolean flag=false;
		try {
			conn=new ConnDB().getConn();
			
			String sql = "insert into newstable (title,auther,content,sort,time) values ('"
					+newsbean.getTitle()+"','"
					+newsbean.getOwner()+"','"
					+newsbean.getContent()+"','"
					+newsbean.getOrder()+"','"
					+newsbean.getTime()+"')";
//			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			
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
