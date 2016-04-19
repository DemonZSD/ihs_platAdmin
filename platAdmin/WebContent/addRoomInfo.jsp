<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加会议室信息</title>
<link href="<%=path %>/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/lib/js/jquery-1.5.2.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=path %>/lib/ligerUI/ligerui.min.js" ></script> 
<script type="text/javascript">
$(function(){
	$("#mainform").ligerForm({
			fields:[
				{
					display:"房间号",
					id:"roomNo",
					newline: true,
					labelAlign:'right',
					type: "text"
				}, 
				{display :"管理员",
					id :"adminId",
					comboboxName:"adminList",
					newline :true,
					labelAlign:'right',
					type :"select",
					options:{url:'JsonServiceServlet?service=admin&action=getAdminInfo',
							valueField:"adminId",textField:"realName",initText:"-- 请选择 --"
							}
					},
				{display:"房间类型",
					id:"roomType",
					newline: true,
					labelAlign:'right', 
					type: "text"
				},
				{display:"功用",id:"roomFunction",newline: true,labelAlign:'right', type: "text"},
				{display:"地址",id:"addr",newline: true,labelAlign:'right', type: "text"},
				{display:"价格",id:"price",newline: true,labelAlign:'right', type: "text"},
				{display:"容纳人数",id:"contain",newline: true,labelAlign:'right', type: "number"}
			]
		});
	
	
	function returnValue(){
		var roomNo = $("#roomNo").val();
		if(roomNo==''||roomNo==null){
			$.ligerDialog.alert("请输入房间号");
	        return false;
		}
		var roomType = $("#roomType").val();
		if(roomType==''||roomType==null){
			$.ligerDialog.alert("请输入房间类型");
	        return false;
		}
		var roomFunction = $("#roomFunction").val();
		if(roomFunction==''||roomFunction==null){
			$.ligerDialog.alert("请输入房间功用");
	        return false;
		}
		var adminId = $("#adminList").ligerGetComboBoxManager().getValue();
		if(adminId==''||adminId==null){
			$.ligerDialog.alert("请选择管理员");
	        return false;
		}
		var data={
				"roomNo":roomNo,
				"roomType":roomType,
				"roomFunction":roomFunction,
				"adminId":adminId,
				"addr":$("#addr").val().replace(/[\r\n]/ig,""),
				"price":$("#price").val(),
				"contain":$("#contain").val()
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