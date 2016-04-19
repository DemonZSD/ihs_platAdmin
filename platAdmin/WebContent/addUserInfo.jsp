<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path %>/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/lib/js/jquery-1.5.2.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=path %>/lib/ligerUI/ligerui.min.js" ></script> 
<script type="text/javascript">
$(function(){
	$("#mainform").ligerForm({
			fields:[
				{
					display:"身份证号",
					id:"userId",
					newline: true,
					labelAlign:'right',
					type: "text"
				}, 
				{
					display:"用户名",
					id:"userName",
					newline: true,
					labelAlign:'right',
					type: "text"
				}, 
				{
					display:"真实姓名",
					id:"realName",
					newline: true,
					labelAlign:'right',
					type: "text"
				},
				{display:"联系电话",
					id:"phoneNum",
					newline: true,
					labelAlign:'right', 
					type: "text"
				},
				{display:"邮箱",id:"email",newline: true,labelAlign:'right', type: "text"},
				{display:"所在单位",id:"departMent",newline: true,labelAlign:'right', type: "text"}
			]
		});
	function returnValue(){
		var userId = $("#userId").val();
		if(userId==''||userId==null){
			$.ligerDialog.alert("请输入用户身份证号");
	        return false;
		}
		var userName = $("#userName").val();
		if(userName==''||userName==null){
			$.ligerDialog.alert("请输入用户名");
	        return false;
		}
		var realName = $("#realName").val();
		if(realName==''||realName==null){
			$.ligerDialog.alert("请输入真实姓名");
	        return false;
		}
		var phoneNum = $("#phoneNum").val();
		if(phoneNum==''||phoneNum==null){
			$.ligerDialog.alert("请输入联系方式");
	        return false;
		}
		var email = $("#email").val();
		if(email==''||email==null){
			$.ligerDialog.alert("请输入邮箱");
	        return false;
		}
		var data={
				"userId":userId,
				"userName":userName,
				"realName":realName,
				"phoneNum":phoneNum,
				"email":email,
				"departMent":$("#departMent").val()
				
		};
		return data;
	}
	window.returnValue=returnValue;
});
</script> 
</head>
<body style="overflow:auto;">
<div style="margin-top:10px;">
  <form id="mainform" >
  </form>
</div>
</body>
</html>