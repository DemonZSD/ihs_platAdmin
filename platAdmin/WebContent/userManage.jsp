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
   function getGridData(userId){
	   $.ajax( {
			type :'post',
			url :'<%=path%>/JsonServiceServlet?service=user',
			cache :false,
			dataType :'json',
			data : {
				action :'getUserAllInfo',
				userId:userId
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
				display :"用户Id",
				name :"userId",
				align :'center'
			}, {
				display :"用户名",
				name :'userName',
				align :'center'
					
			}, {
				display :"用户真实姓名",
				name :'realName',
				align :'center'
			},  {
				display :"用户登录密码",
				name :'passWd',
				align :'center'
			},{
				display :"联系电话",
				name :'phoneNum',
				align :'center'
			},{
				display :"邮箱",
				name :'email',
				align :'center'
			},{
				display :"所在单位",
				name :'departMent',
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
   
  //添加用户
   function f_add(){
		$.ligerDialog.open({
			title: '增加用户', 
			name:'addUserInfo',
			width: 350, 
			height:350, 
			allowClose:false,
			url: 'addUserInfo.jsp',
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
					url: '<%=path%>/JsonServiceServlet?service=user&action=addUserInfo',
					cache: false,
					dataType: 'json',
					data:rs,
					success: function (data){
						if (data) {
							dialog.close();
							if(dialog.options.name != null && $.browser.mozilla){
								delete window.frames[dialog.options.name];
							}
							$.ligerDialog.success("添加用户信息成功");
							getGridData("");
						}else{
							$.ligerDialog.warn("增加用户失败");
							return;
						}
					},
					error: function (XMLHttpRequest, textStatus) {
						$.ligerDialog.alert("增加用户失败，请联系管理员");
					}
					});
			}
		}
		function f_Cancel(item, dialog){
			dialog.close();
		}
  }
   //修改用户信息
   function f_modify(){
		var row = manager.getSelectedRow();
		if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
		var params = 'userId='+row.userId
		+'&userName='+encodeURIComponent(row.userName)
		+'&realName='+encodeURIComponent(row.realName)
		+'&passWd='+encodeURIComponent(row.passWd)
		+'&phoneNum='+row.phoneNum
		+'&email='+row.email
		+'&departMent='+encodeURIComponent(row.departMent);
	   $.ligerDialog.open({
			title: '修改用户', 
			name:'updateUserInfo',
			width: 300, 
			height:300, 
			allowClose:false,
			url: 'updateUserInfo.jsp?'+params,
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
					url: 'JsonServiceServlet?service=user&action=updateUserInfo',
					cache: false,
					dataType: 'json',
					data:rs,
					success: function (data){
						if (data) {
							dialog.close();
							if(dialog.options.name != null && $.browser.mozilla){
								delete window.frames[dialog.options.name];
							}
							$.ligerDialog.success("修改用户成功");
						}else{
							$.ligerDialog.warn(" 修改用户失败");
							return;
						}
						getGridData("");
					},
					error: function (XMLHttpRequest, textStatus) {
						$.ligerDialog.alert("修改用户失败，请联系管理员");
					}
					});
			}
		}
		function f_Cancel(item, dialog){
			dialog.close();
		}
  }
  //删除用户 
   function f_delete(){
	   var row = manager.getSelectedRow();
		if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
		$.ligerDialog.confirm('确定删除？', function(yes) {
			if(yes){
				$.ajax({
					type: 'post',
			        url: '<%=path%>/JsonServiceServlet?service=user&action=delUserInfo',
			        cache: false,
			        dataType: 'json',
			        data:row,
			        success: function (data)
			        {
						if (data) {
							getGridData("");
						}else{
							$.ligerDialog.warn("删除用户失败");
							return;
						}
			        },
			        error: function (XMLHttpRequest, textStatus) {
			        	$.ligerDialog.warn("删除用户失败，请联系管理员");
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