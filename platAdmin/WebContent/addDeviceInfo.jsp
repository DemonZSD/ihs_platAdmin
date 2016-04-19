<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<script src="lib/js/jquery-1.5.2.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="lib/ligerUI/ligerui.min.js" ></script> 
<script type="text/javascript" src="./lib/js/uploadify/jquery.uploadify-3.1.min.js" ></script> 

<script type="text/javascript">
$(function(){
	$("#mainform").ligerForm({
			fields:[
				{
					display:"实验设备名称",
					id:"deviceName",
					newline: true,
					labelAlign:'right',
					type: "text"
				}, 
				{display:"实验设备型号",
					id:"type",
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
					{display:"设备制造商",id:"made",newline: true,labelAlign:'right', type: "text"},
					{display:"图像文件名",id:"photo",newline: true,labelAlign:'right', type: "text"},			
				{display:"价格",id:"price",newline: true,labelAlign:'right', type: "text"},
				{display:"仪器介绍",id:"expriment",newline: true,labelAlign:'right', type: "textArea"},
				{display:"注意事项",id:"train",newline: true,labelAlign:'right', type: "textArea"},
				{display:"样本数量",id:"trainNum",newline: true,labelAlign:'right', type: "number"}
			]
		});
	function returnValue(){
		var deviceName = $("#deviceName").val();
		if(deviceName==''||deviceName==null){
			$.ligerDialog.alert("请输入设备名称");
	        return false;
		}
		var type = $("#type").val();
		if(type==''||type==null){
			$.ligerDialog.alert("请输入设备型号");
	        return false;
		}
		var adminId = $("#adminList").ligerGetComboBoxManager().getValue();
		if(adminId==''||adminId==null){
			$.ligerDialog.alert("请选择管理员");
	        return false;
		}
		var data={
				"deviceName":deviceName,
				"type":type,
				"made":$("#made").val(),
				"photo":$("#photo").val(),
				"adminId":adminId,
				"expriment":$("#expriment").val().replace(/[\r\n]/ig,""),
				"price":$("#price").val(),
				"train":$("#train").val().replace(/[\r\n]/ig,""),
				"trainNum":$("#trainNum").val()
		};
		return data;
	}
	window.returnValue=returnValue;
});
</script>

<style type="text/css">
.h_first{
	color: #666;
}
.navline{ height:1px; line-height:1px; width:100%;border-bottom:1px solid #f5f5f5; background-color:#D9D9D9;}
</style> 
</head>
<body style="overflow:auto;">
<div style="margin-left:50px;margin-top:10px;width:300px;">
  <form id="mainform" >
  </form>
</div>
</body>
</html>