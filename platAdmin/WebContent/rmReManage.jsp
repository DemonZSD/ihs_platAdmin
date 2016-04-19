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
<script src="<%=path %>/lib/ligerUI/js/plugins/ligerMenu.js" type="text/javascript"></script>

	<script type="text/javascript">
   var manager;
   $(function(){
// 	   showForm();
	   showGrid();
	   getGridData("");
	   menu = $.ligerMenu({ width: 120, items:
           [
           { text: '下载', click: download}
           ]
           }); 

   });
   
   function getGridData(rmOrId){
	   $.ajax( {
			type :'post',
			url :'<%=path%>/JsonServiceServlet?service=rmReservation',
			cache :false,
			dataType :'json',
			data : {
				action :'getAllRoomOrInfo',
				rmOrId:rmOrId
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
				$.ligerDialog.warn("加载失败或者无数据!");
			}
		});
   }
   function showGrid(){
	    
	   manager = $("#gridDate").ligerGrid( {
			columns : [ {
				display :"会议室预约Id",
				name :"rmOrId",
				align :'center',
				hide:true
			}, {
				display :"预约房间号",
				name :'roomNo',
				align :'center'
					
			}, {
				display :"功用",
				name :'roomFunction',
				align :'center'
			},{
				display :"提交时间",
				name :'submitTime',
				align :'center',
				width:'12%'
			}, {
				display :"预约日期",
				name :'reDate',
				align :'center',
				width:'12%'
			},{
				display :"预约时间",
				name :'reTime',
				align :'center',
				width:'12%'
			},{
				display :"用途",
				name :'purpose',
				align :'center'
			},{
				display :"产生费用",
				name :'money',
				align :'center'
			},{
				display :"使用状态",
				name :'isUsing',
				align :'center'
			},{
				display :"交易完成",
				name :'finish',
				align :'center',
				hide:true
			},{
				display :"预约人",
				name :'orName',
				align :'center',
			},{
				display :"联系电话",
				name :'contact',
				align :'center',
			},{
				display :"管理员",
				name :'adminName',
				align :'center',
			},{
				display :"预约人单位",
				name :'department',
				align :'center',
			},{
				display :"备注信息",
				name :'remark',
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
					{text :'删除',click :f_delete,img :'./lib/ligerUI/skins/icons/delete.gif'},
					{line :true},
					{text :'下载',click :f_download,img :'./lib/ligerUI/skins/icons/down.gif'} 
				]
			}
		});
   }
  //添加会议室预约信息
   function f_add(){
		$.ligerDialog.open({
			title: '增加会议室预约信息', 
			name:'addRoomReInfo',
			width: 400, 
			height:450, 
			allowClose:false,
			url: 'addRmReInfo.jsp',
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
					url: '<%=path%>/JsonServiceServlet?service=rmReservation&action=addRoomOrInfo',
					cache: false,
					dataType: 'json',
					data:rs,
					success: function (data){
						if (data) {
							dialog.close();
							if(dialog.options.name != null && $.browser.mozilla){
								delete window.frames[dialog.options.name];
							}
							$.ligerDialog.success("添加预约信息成功");
						}else{
							$.ligerDialog.warn("增加预约信息失败");
							return;
						}
						getGridData("");
					},
					error: function (XMLHttpRequest, textStatus) {
						$.ligerDialog.alert("添加失败，请联系管理员");
					}
					});
			}
		}
		function f_Cancel(item, dialog){
			dialog.close();
		}
  }
   //修改预约信息
   function f_modify(){
		var row = manager.getSelectedRow();
		if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
		var params = 'rmOrId='+row.rmOrId
		+'&orName='+encodeURIComponent(row.userName)
		+'&contact='+row.contact
		+'&email='+row.email
		+'&reDate='+row.reDate
		+'&reTime='+row.reTime
		+'&submitTime='+row.submitTime
		+'&money='+row.money
		+'&roomId='+row.roomId
		+'&userId='+row.userId
		+'&isUsing='+row.isUsing
		+'&finish='+row.finish
		+'&remark='+row.remark;
	   $.ligerDialog.open({
			title: '修改预约信息', 
			name:'updateRoomReInfo',
			width: 400, 
			height:450, 
			allowClose:false,
			url: 'updateRoomReInfo.jsp?'+params,
			buttons: [
				{ text: '确定', onclick: f_updateOK },
		        { text: '取消', onclick: f_Cancel }
		    ]
		});
		function f_updateOK(item, dialog){
			
			var fn = dialog.frame.returnValue || dialog.frame.window.returnValue;
			var rs = fn();
			if(rs != false){
				$.ajax({
					type: 'post',
			        url: '<%=path%>/JsonServiceServlet?service=rmReservation&action=updateRoomOrInfo',
			        cache: false,
			        dataType: 'json',
			        data:rs,
			        success: function (data)
			        {
			        	if (data) {
			        		dialog.close();
							if(dialog.options.name != null && $.browser.mozilla){
								delete window.frames[dialog.options.name];
							}
			        		$.ligerDialog.success("修改预约信息成功");
						}else{
							$.ligerDialog.warn("修改预约信息失败");
							return;
						}
			        	getGridData("");
			        },
			        error: function (XMLHttpRequest, textStatus) {
			        	$.ligerDialog.warn("修改失败，请联系管理员");
			        }
				});
			}
		}
		function f_Cancel(item, dialog){
			dialog.close();
		}
  }
  //删除预约信息
   function f_delete(){
	   var row = manager.getSelectedRow();
		if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
		$.ligerDialog.confirm('确定删除？', function(yes) {
			if(yes){
				$.ajax({
					type: 'post',
			        url: '<%=path%>/JsonServiceServlet?service=rmReservation&action=delRoomOrInfo',
			        cache: false,
			        dataType: 'json',
			        data:row,
			        success: function (data)
			        {
						if (data) {
							getGridData("");
						}else{
							$.ligerDialog.warn("删除预约信息失败");
							return;
						}
			        },
			        error: function (XMLHttpRequest, textStatus) {
			        	$.ligerDialog.warn("删除预约信息失败，请联系管理员");
			        }
				});
			}
		});
		
   }
   function f_download(){
		  var row = manager.getSelectedRow();
			if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
			location.href="downloadR.jsp?rmOrId="+row.rmOrId;
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