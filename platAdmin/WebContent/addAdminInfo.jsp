<%@ page language="java" contentType="text/html; charset=UTF-8" import=" edu.ahu.hs.platAppoint.beans.*"
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
					display:"管理员姓名",
					id:"realName",
					newline: true,
					labelAlign:'right',
					type: "text"
				}, 
				{
					display:"登录账号",
					id:"adminName",
					newline: true,
					labelAlign:'right',
					type: "text"
				},
				{display:"联系电话",
					id:"phone",
					newline: true,
					labelAlign:'right', 
					type: "text"
				},
				{display:"邮箱",id:"email",newline: true,labelAlign:'right', type: "text"},
				{display:"级别",
					id:"grade",
					comboboxName:"lev",
					newline :true,
					labelAlign:'right',
					type :"select",
					options:{data:[{lev:'lev1',grade:'0'},{lev:'lev2',grade:'1'}],
						valueField:"grade",textField:"lev",initText:"-- 请选择 --" }
				}
			]
		});
	function returnValue(){
		var realName = $("#realName").val();
		if(realName==''||realName==null){
			$.ligerDialog.alert("请输入管理员姓名！");
	        return false;
		}
		var adminName = $("#adminName").val();
		if(adminName==''||adminName==null){
			$.ligerDialog.alert("请添加管理员账号");
	        return false;
		}
		var phone = $("#phone").val();
		if(phone==''||phone==null){
			$.ligerDialog.alert("请输入管理员联系方式！");
	        return false;
		}
		var grade = $("#lev").ligerGetComboBoxManager().getValue();
		if(grade==''||grade==null){
			$.ligerDialog.alert("请选择管理员级别");
	        return false;
		}
		var data={
				"adminName":adminName,
				"realName":realName,
				"email": $("#email").val(),
				"phone":phone,
				"grade":grade
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
<div class="navline" style="margin-top:5px;"></div>
<div style="margin-top:10px;">
  <form id="mainform" >
  </form>
</div>
</body>
</html>