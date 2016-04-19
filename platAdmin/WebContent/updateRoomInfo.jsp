<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    String path=request.getContextPath();
	request.setCharacterEncoding("UTF-8"); 
	String roomId = request.getParameter("roomId");
	String roomNo = new String(request.getParameter("roomNo").getBytes("ISO-8859-1"), "UTF-8");
	String roomType = new String(request.getParameter("roomType").getBytes("ISO-8859-1"), "UTF-8");
	String roomFunction = new String(request.getParameter("roomFunction").getBytes("ISO-8859-1"), "UTF-8");
	String addr = new String(request.getParameter("addr").getBytes("ISO-8859-1"), "UTF-8");
	String price = new String(request.getParameter("price").getBytes("ISO-8859-1"), "UTF-8");
	String adminId =request.getParameter("adminId");
	String contain = request.getParameter("contain");
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
$(function(){
	$("#updateForm").ligerForm( {
		fields : [{display:"房间号",id:"roomNo",newline: true,labelAlign:'right', type: "text"}, 
					{display :"管理员",id :"adminId",comboboxName:"adminList",newline :true,labelAlign:'right',type :"select",
			options:{url:'JsonServiceServlet?service=admin&action=getAdminInfo',valueField:"adminId",textField:"realName",initText:"-- 请选择 --"}	
		},
		{display:"房间类型",id:"roomType",newline: true,labelAlign:'right', type: "text"},
		{display:"功用",id:"roomFunction",newline: true,labelAlign:'right', type: "text"},
		{display:"地址",id:"addr",newline: true,labelAlign:'right', type: "text"},
		{display:"价格",id:"price",newline: true,labelAlign:'right', type: "text"},
		{display:"容纳人数",id:"contain",newline: true,labelAlign:'right', type: "number"}
		]
	});
	$("#roomNo").val('<%=roomNo%>');
	$("#adminList").ligerGetComboBoxManager().setValue('<%=adminId%>');
	$("#roomType").val('<%=roomType%>');
	$("#roomFunction").val('<%=roomFunction%>');
	$("#addr").val('<%=addr%>');
	$("#price").val('<%=price%>');
	$("#contain").val('<%=contain%>');
	
});
	function returnValue(){
		var roomNo = $("#roomNo").val();
		if(roomNo==""||roomNo==null){ 
			$.ligerDialog.alert("请填写房间号");
	        return false;
		}
		var adminId = $("#adminList").ligerGetComboBoxManager().getValue();
		if(adminId==""||adminId==null){ 
			$.ligerDialog.alert("请选择管理员");
	        return false;
		}
		var roomType = $("#roomType").val();
		if(roomType==""||roomType==null){ 
			$.ligerDialog.alert("请填写房间类型");
	        return false;
		}
		var roomFunction = $("#roomFunction").val();
		if(roomFunction==""||roomFunction==null){ 
			$.ligerDialog.alert("请填写房间功用");
	        return false;
		}
		var data={
				"roomId":'<%=roomId%>',
				"roomNo":roomNo,
				"adminId":adminId,
				"roomType":roomType,
				"roomFunction":roomFunction,
				"addr":$("#addr").val(),
				"price":$("#price").val(),
				"contain":$("#contain").val()
		};
		return data;
	}
window.returnValue=returnValue;

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