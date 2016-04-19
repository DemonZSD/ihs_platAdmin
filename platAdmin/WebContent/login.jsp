<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8" import="edu.ahu.hs.platAppoint.servlet.*"%>
    <% String path = request.getContextPath(); %>
    <%
			String errType = (String)request.getParameter("errType");
    		String msg = "";
			if(errType!=null){
				if(errType.equals("1")){
					msg = "用户没有登录！";
				}else if(errType.equals("2")){
					msg = "用户名或密码错误！";
				}
			}
		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预约管理系统登录</title>
</head>
<body class="loginbg">
<div class="login">
<form action="AdminLoginServlet?type=log" method="post">
	<div class="logintext">
		<div></div>
		<div id="log_msg" style="color:red;text-align: center; display: block;"><%= msg %></div>
		<div class="name_css">用户名：<input type="text" name="adminname" class="ur" /></div>
		<div class="pw_css">密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name=passwd type="password"  class="pw" /></div>
		<div class="lg_sub"><input type="submit" value="登录"></input>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="重置"></input></div>
	</div></form>
</div>
</body>
</html>