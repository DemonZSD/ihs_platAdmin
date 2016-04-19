<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<script  type="text/javascript" src="<%=path %>/lib/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/lib/ligerUI/ligerui.min.js" ></script> 
	<script type="text/javascript">
   var manager;
   $(function(){
// 	   showForm();
	   showGrid();
	   getGridData("");
   });
   function getGridData(adminId){
	   $.ajax( {
			type :'post',
			url :'<%=path%>/JsonServiceServlet?service=admin',
			cache :false,
			dataType :'json',
			data : {
				action :'getAllAdminInfo',
				adminId:adminId
			},
			success : function(data) {
				if (data != null) {
					manager.set( {
						data :data
					});
					}else{
						manager.set( {
							data :null
						});
						$.ligerDialog.warn("加载失败或者无数据!");	
					}
			},
			error : function(XMLHttpRequest, textStatus) {
			}
		});
		
	   
   }
   function showGrid(){
	   manager = $("#gridDate").ligerGrid( {
			columns : [ {
				display :"管理员Id",
				name :"adminId",
				align :'center',
				hide:true
			}, {
				display :"管理员",
				name :'realName',
				align :'center'
					
			}, {
				display :"管理员账号",
				name :'adminName',
				align :'center'
			},  {
				display :"管理员密码",
				name :'passWd',
				align :'center'
			},{
				display :"联系电话",
				name :'phone',
				align :'center'
			},{
				display :"邮箱",
				name :'email',
				align :'center'
			},{
				display :"管理员级别",
				name :'grade',
				align :'center'
			}],
			pageSize :40,
			width :'100%',
			height :'100%',
			toolbar : {
				items : [ 
					{text :'增加',click :f_add,img :'./lib/ligerUI/skins/icons/add.gif'}, 
					{line :true},
					{text :'修改',click :f_modify,img :'./lib/ligerUI/skins/icons/modify.gif'}, 
					{line :true},
					{text :'删除',click :f_delete,img :'./lib/ligerUI/skins/icons/delete.gif'} 
				]
			}
		});
   }
   
  //添加管理员
   function f_add(){
		$.ligerDialog.open({
			title: '增加管理员', 
			name:'addAdminInfo',
			width: 350, 
			height:350, 
			allowClose:false,
			url: 'addAdminInfo.jsp',
			buttons: [
				{ text: '确定', onclick: f_addOK },
		        { text: '取消', onclick: f_Cancel }
		    ]
		});
		function f_addOK(item, dialog){
			var fn = dialog.frame.returnValue || dialog.frame.window.returnValue;
			var rs = fn();
			if(rs != false){
				$.ajax({
					type: 'post',
					url: '<%=path%>/JsonServiceServlet?service=admin&action=addAdminInfo',
					cache: false,
					dataType: 'json',
					data:rs,
					success: function (data){
						if (data) {
							dialog.close();
							if(dialog.options.name != null && $.browser.mozilla){
								delete window.frames[dialog.options.name];
							}
							$.ligerDialog.success("添加管理员信息成功");
							getGridData("");
						}else{
							$.ligerDialog.warn("增加管理员失败！");
							return;
						}
					},
					error: function (XMLHttpRequest, textStatus) {
						$.ligerDialog.alert("增加管理员失败！");
					}
					});
			}
		}
		function f_Cancel(item, dialog){
			dialog.close();
		}
  }
   //修改管理员信息
   function f_modify(){
		var row = manager.getSelectedRow();
		if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
		var params = 'adminId='+encodeURIComponent(row.adminId)
		+'&adminName='+encodeURIComponent(row.adminName)
		+'&realName='+encodeURIComponent(row.realName)
		+'&passWd='+encodeURIComponent(row.passWd)
		+'&phone='+row.phone
		+'&email='+row.email
		+'&grade='+row.grade;
	   $.ligerDialog.open({
			title: '修改管理员信息', 
			name:'updateAdminInfo',
			width: 300, 
			height:300, 
			allowClose:false,
			url: 'updateAdminInfo.jsp?'+params,
			buttons: [
				{ text: '确定', onclick: f_addOK },
		        { text: '取消', onclick: f_Cancel }
		    ]
		});
		function f_addOK(item, dialog){
			
			var fn = dialog.frame.returnValue || dialog.frame.window.returnValue;
			var rs = fn();
			if(rs != false){
				
				$.ajax({
					type: 'post',
					url: 'JsonServiceServlet?service=admin&action=updateAdminInfo',
					cache: false,
					
					dataType: 'json',
					data:rs,
					success: function (data){
						if (data) {
							dialog.close();
							if(dialog.options.name != null && $.browser.mozilla){
								delete window.frames[dialog.options.name];
							}
							$.ligerDialog.success("修改管理员信息成功！");
						}else{
							$.ligerDialog.warn(" 修改管理员信息失败！");
							return;
						}
						getGridData("");
					},
					error: function (XMLHttpRequest, textStatus) {
						$.ligerDialog.alert("修改管理员信息失败！");
					}
					});
			}
		}
		function f_Cancel(item, dialog){
			dialog.close();
		}
  }
  //删除管理员
   function f_delete(){
	   var row = manager.getSelectedRow();
		if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
		$.ligerDialog.confirm('确定删除？', function(yes) {
			if(yes){
				$.ajax({
					type: 'post',
			        url: '<%=path%>/JsonServiceServlet?service=admin&action=delAdminInfo',
			        cache: false,
			        dataType: 'json',
			        data:row,
			        success: function (data)
			        {
						if (data) {
							getGridData("");
						}else{
							$.ligerDialog.warn("删除管理员失败");
							return;
						}
			        },
			        error: function (XMLHttpRequest, textStatus) {
			        	$.ligerDialog.warn("删除管理员失败！");
			        }
				});
			}
		});
		
   }
   </script>
</head>
<style>
html,body{
width:100%;
height:100%;
padding:0px;
margin: 0;
overflow: hidden;
}
.gridDate{
position: absolute;
width:100%;
height:100%;
}
</style>
<body>
<div id="topMenu" class="topMenu">
<table>
		<tr>
			<td align="left">
				<form id="menuForm" style="width:350px;"></form>
			</td>
			<td align="right">
				<div id="search">
			</div>
		</tr>
	</table>
</div>
<div id="gridDate" class="gridDate"></div>
</body>
</html>