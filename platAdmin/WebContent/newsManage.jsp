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
   function getGridData(newsId){
	   $.ajax( {
			type :'post',
			url :'<%=path%>/JsonServiceServlet?service=news',
			cache :false,
			dataType :'json',
			data : {
				action :'getAllNews',
				newsId:newsId
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
				display :"通知Id",
				name :"newsId",
				align :'center',
				hide:'true'
			}, {
				display :"标题",
				name :'title',
				align :'center'
			},{
				display :"内容",
				name :'content',
				align :'center',
				hide:'true'
			},{
				display :"发布人",
				name :'owner',
				align :'center'
			},{
				display :"时间",
				name :'time',
				align :'center'
			},{
				display :"排列顺序",
				name :'order',
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
   
  //添加通知
  function f_add(){
		$.ligerDialog.open({
			title: '增加通知', 
			name:'addNewsInfo',
			allowClose:false,
			model:true,
			width: 900, 
			height:600, 
			showMax:true,
			url: 'addNews.jsp',
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
					url: '<%=path%>/JsonServiceServlet?service=news&action=addNewsInfo',
					cache: false,
					dataType: 'json',
					data:rs,
					success: function (data){
						if (data) {
							dialog.close();
							if(dialog.options.name != null && $.browser.mozilla){
								delete window.frames[dialog.options.name];
							}
							$.ligerDialog.success("添加通知成功");
							getGridData("");
						}else{
							$.ligerDialog.warn("增加通知失败");
							return;
						}
					},
					error: function (XMLHttpRequest, textStatus) {
						$.ligerDialog.alert("增加通知失败，请联系管理员");
					}
					});
			}
		}
		function f_Cancel(item, dialog){
			dialog.close();
		}
  }
   //修改通知信息
   function f_modify(){
	   var row = manager.getSelectedRow();
		if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
		var params = 'newsId='+row.newsId;
	   $.ligerDialog.open({
			title: '修改通知', 
			name:'updateNewsInfo',
			width: 900, 
			height:600, 
			allowClose:false,
			showMax:true,
			url: 'updateNews.jsp?'+params,
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
					url: 'JsonServiceServlet?service=news&action=updateNewsInfo',
					cache: false,
					dataType: 'json',
					data:rs,
					success: function (data){
						if (data) {
							dialog.close();
							if(dialog.options.name != null && $.browser.mozilla){
								delete window.frames[dialog.options.name];
							}
							$.ligerDialog.success("修改通知成功");
						}else{
							$.ligerDialog.warn(" 修改通知失败");
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
  //删除通知
   function f_delete(){
	   var row = manager.getSelectedRow();
		if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
		$.ligerDialog.confirm('确定删除？', function(yes) {
			if(yes){
				$.ajax({
					type: 'post',
			        url: '<%=path%>/JsonServiceServlet?service=news&action=delNewsInfo',
			        cache: false,
			        dataType: 'json',
			        data:row,
			        success: function (data)
			        {
						if (data) {
							getGridData("");
						}else{
							$.ligerDialog.warn("删除通知失败");
							return;
						}
			        },
			        error: function (XMLHttpRequest, textStatus) {
			        	$.ligerDialog.warn("删除通知失败，请联系管理员");
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