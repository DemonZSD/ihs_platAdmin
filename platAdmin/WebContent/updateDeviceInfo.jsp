<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    String path=request.getContextPath();
	request.setCharacterEncoding("UTF-8"); 
	String deviceId = request.getParameter("deviceId");
	String deviceName = new String(request.getParameter("deviceName").getBytes("ISO-8859-1"), "UTF-8");
	String type = new String(request.getParameter("type").getBytes("ISO-8859-1"), "UTF-8");
	String photo = new String(request.getParameter("photo").getBytes("ISO-8859-1"), "UTF-8");
	String made = new String(request.getParameter("made").getBytes("ISO-8859-1"), "UTF-8");
	String expriment = new String(request.getParameter("expriment").getBytes("ISO-8859-1"), "UTF-8");
	String train = new String(request.getParameter("train").getBytes("ISO-8859-1"), "UTF-8");
	String price = new String(request.getParameter("price").getBytes("ISO-8859-1"), "UTF-8");
	String adminId = request.getParameter("adminId");
	String trainNum = request.getParameter("trainNum");
	String adminName = new String(request.getParameter("adminName").getBytes("ISO-8859-1"), "UTF-8");
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
		fields : [{display:"实验设备名称",id:"deviceName",newline: true,labelAlign:'right', type: "text"}, 
		          {display:"设备型号",id:"type",newline: true,labelAlign:'right', type: "text"},
		          {display :"管理员",id :"adminId",comboboxName:"adminList",newline :true,labelAlign:'right',type :"select",
			options:{url:'JsonServiceServlet?service=admin&action=getAdminInfo',valueField:"adminId",textField:"realName",initText:"-- 请选择 --"}	
		},
		{display:"设备制造商",id:"made",newline: true,labelAlign:'right', type: "text"},
		{display:"图像文件名",id:"photo",newline: true,labelAlign:'right', type: "text"},
		{display:"仪器介绍",id:"expriment",newline: true,labelAlign:'right', type: "textArea"},
		{display:"注意事项",id:"train",newline: true,labelAlign:'right', type: "textArea"},
		{display:"样本数量",id:"trainNum",newline: true,labelAlign:'right', type: "number"},
		{display:"价格",id:"price",newline: true,labelAlign:'right', type: "text"}
		]
	});
	$("#deviceName").val('<%=deviceName%>');
	$("#adminList").ligerGetComboBoxManager().setValue('<%=adminId%>');
	$("#type").val('<%=type%>');
	$("#photo").val('<%=photo%>');
	$("#made").val('<%=made%>');
	$("#expriment").val('<%=expriment%>');
	$("#price").val('<%=price%>');
	$("#train").val('<%=train%>');
	$("#trainNum").val('<%=trainNum%>');
}
function returnValue(){
	var deviceName = $("#deviceName").val();
	if(deviceName==""){ 
		$.ligerDialog.alert("请填设备名称");
        return false;
	}
	var adminId = $("#adminList").ligerGetComboBoxManager().getValue();
	if(adminId==""){ 
		$.ligerDialog.alert("请选择管理员");
        return false;
	}
	var type = $("#type").val();
	if(type==""){ 
		$.ligerDialog.alert("请填写设备型号");
        return false;
	}
	var data={
			"deviceId":'<%=deviceId%>',
			"deviceName":deviceName,
			"adminId":adminId,
			"type":type,
			"photo":$("#photo").val(),
			"made":$("#made").val(),
			"expriment":$("#expriment").val(),
			"price":$("#price").val(),
			"train":$("#train").val(),
			"trainNum":$("#trainNum").val()
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
</style>
<body>
<div id="updateForm" class="updateForm"></div>
</body>
</html>