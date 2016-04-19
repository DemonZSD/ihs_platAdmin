<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    String path=request.getContextPath();
	request.setCharacterEncoding("UTF-8"); 
	String adminId =new String(request.getParameter("adminId").getBytes("ISO-8859-1"), "UTF-8");
	String adminName = new String(request.getParameter("adminName").getBytes("ISO-8859-1"), "UTF-8");
	String realName = new String(request.getParameter("realName").getBytes("ISO-8859-1"), "UTF-8");
	String passWd=request.getParameter("passWd");
	String phone = new String(request.getParameter("phone").getBytes("ISO-8859-1"), "UTF-8");
	String email = request.getParameter("email");
	String grade = request.getParameter("grade");
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
		fields :[{display:"管理员姓名",id:"realName",newline: true,labelAlign:'right', type: "text"}, 
				{display :"登录账号",id :"adminName",newline: true,labelAlign:'right', type: "text"},	
				{display:"登录密码",id:"passWd",newline: true,labelAlign:'right', type: "text"},
				{display:"联系电话",id:"phone",newline: true,labelAlign:'right', type: "text"},
				{display:"邮箱",id:"email",newline: true,labelAlign:'right', type: "text"},
				{display:"级别",id:"grade",
					comboboxName:"lev",
					newline :true,
					labelAlign:'right',
					type :"select",
					options:{data:[{lev:'lev1',grade:'0'},{lev:'lev2',grade:'1'}],
						valueField:"grade",textField:"lev",initText:"-- 请选择 --"
						}
				}
				]
	});
	$("#adminName").val('<%=adminName%>');
	$("#realName").val('<%=realName%>');
	$("#passWd").val('<%=passWd%>');
	$("#phone").val('<%=phone%>');
	$("#email").val('<%=email%>');
	$("#lev").ligerGetComboBoxManager().setValue('<%=grade%>');
}
function returnValue(){
	var adminName = $("#adminName").val();
	if(adminName==""){ 
		$.ligerDialog.alert("请填写账号");
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
	var phone = $("#phone").val();
	if(phone==""){ 
		$.ligerDialog.alert("请填写联系电话");
        return false;
	}
	var grade = $("#lev").ligerGetComboBoxManager().getValue();
	if(grade==''||grade==null){
		$.ligerDialog.alert("请选择管理员级别");
        return false;
	}
	var data={
			"adminId":<%=adminId%>,
			"adminName":adminName,
			"realName":realName,
			"phone":phone,
			"passWd":passWd,
			"email":$("#email").val(),
			"grade":grade
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