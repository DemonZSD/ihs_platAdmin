<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    String path=request.getContextPath();
	request.setCharacterEncoding("UTF-8"); 
	String userId = new String(request.getParameter("userId").getBytes("ISO-8859-1"), "UTF-8");
	String userName = new String(request.getParameter("userName").getBytes("ISO-8859-1"), "UTF-8");
	String realName = new String(request.getParameter("realName").getBytes("ISO-8859-1"), "UTF-8");
	String passWd=request.getParameter("passWd");
	String phoneNum = new String(request.getParameter("phoneNum").getBytes("ISO-8859-1"), "UTF-8");
	String email = new String(request.getParameter("email").getBytes("ISO-8859-1"), "UTF-8");
	String departMent = new String(request.getParameter("departMent").getBytes("ISO-8859-1"), "UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<script  type="text/javascript" src="<%=path %>/lib/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/lib/ligerUI/ligerui.min.js" ></script> 
</head>
<script type="text/javascript">
$( function() {
	showForm();
	window.returnValue=returnValue;
});

function showForm(){
	$("#updateForm").ligerForm( {
		fields : [{display:"真实姓名",id:"realName",newline: true,labelAlign:'right', type: "text"}, 
				{display :"用户名",id :"userName",newline: true,labelAlign:'right', type: "text"},	
				{display:"用户密码",id:"passWd",newline: true,labelAlign:'right', type: "text"},
				{display:"联系电话",id:"phoneNum",newline: true,labelAlign:'right', type: "text"},
				{display:"邮箱",id:"email",newline: true,labelAlign:'right', type: "text"},
				{display:"所在单位",id:"departMent",newline: true,labelAlign:'right', type: "text"}
				]
	});
	$("#userName").val('<%=userName%>');
	$("#realName").val('<%=realName%>');
	$("#passWd").val('<%=passWd%>');
	$("#phoneNum").val('<%=phoneNum%>');
	$("#email").val('<%=email%>');
	$("#departMent").val('<%=departMent%>');
}
function returnValue(){
	
	var userName = $("#userName").val();
	if(userName==""){ 
		$.ligerDialog.alert("请填写登录名");
        return false;
	}
	var realName = $("#realName").val();
	if(realName==""){ 
		$.ligerDialog.alert("请填写真实姓名");
        return false;
	}
	var passWd = $("#passWd").val();
	if(passWd==""){ 
		$.ligerDialog.alert("密码不能为空");
        return false;
	}
	var phoneNum = $("#phoneNum").val();
	if(phoneNum==""){ 
		$.ligerDialog.alert("请填写联系电话");
        return false;
	}
	var data={
			"userId":'<%=userId %>',
			"userName":userName,
			"realName":realName,
			"phoneNum":phoneNum,
			"passWd":passWd,
			"email":$("#email").val(),
			"departMent":$("#departMent").val()
	};
	return data;
}
</script>
<style>
html,body {
	width: 100%;
	height: 100%;
	padding: 0px;
	margin: 0;
	overflow: hidden;
}
.addForm{
width:100%;
form:100%;
}
</style>
<body>
<div id="updateForm" class="updateForm"></div>
</body>
</html>