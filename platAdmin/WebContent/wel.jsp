<%@page import="edu.ahu.hs.platAppoint.DAO.AdminInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="edu.ahu.hs.platAppoint.beans.*,java.util.*"
    pageEncoding="UTF-8"%>
    <%
    	LoginRecordBean lrb = (LoginRecordBean)session.getAttribute("admininfo");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="wel_center">
		
		<div class="wel_tt"><h3 style="margin-top:20px;width:200px;border-bottom: 1px dashed gray;">您的相关信息</h3>
			<table class="wel_table">
				<tr><td class="wel_td1">登录账号：</td><td class="wel_td2"><%= lrb.getAdminName() %></td></tr>
				<tr><td class="wel_td1">真实姓名：</td><td  class="wel_td2"><%= lrb.getRealName() %></td></tr>
				<tr><td  class="wel_td1">登录时间：</td><td  class="wel_td2"><%= lrb.getLoginTime() %></td></tr>
				<tr><td  class="wel_td1">登录次数：</td><td  class="wel_td2"><%= lrb.getCount() %></td></tr>
				<tr><td  class="wel_td1">IP地址：</td><td  class="wel_td2"><%= lrb.getIp() %></td></tr>
				<tr><td class="wel_td1">身份过期：</td><td  class="wel_td2">30分钟</td></tr>
			</table>
			<div class="state">如果你界面显示不正常请用IE9+、Chrome等浏览器、或者改为非兼容模式</div>
		</div>
	
	
	</div>
</body>
</html>