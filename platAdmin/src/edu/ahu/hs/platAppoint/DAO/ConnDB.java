package edu.ahu.hs.platAppoint.DAO;

import java.sql.*;

public class ConnDB {

private Connection ct=null;
	
	//���l��
	public Connection getConn(){
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			ct=DriverManager.getConnection("jdbc:mysql://rdsiemb2miemb2m.mysql.rds.aliyuncs.com:3306/r12e6iy8qq8uce6u","r12e6iy8qq8uce6u","platform");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return ct; 
	}
}
