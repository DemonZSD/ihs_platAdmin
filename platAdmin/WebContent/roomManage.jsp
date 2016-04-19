<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path%>/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<script  type="text/javascript" src="<%=path%>/lib/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/lib/ligerUI/ligerui.min.js" ></script> 
<script type="text/javascript">
	   var manager;
	   $(function(){
	// 	   showForm();
		   showGrid();
		   getGridData("");
	   });
	   function getGridData(roomId){
		   $.ajax( {
				type :'post',
				url :'<%=path%>/JsonServiceServlet?service=room',
				cache :false,
				dataType :'json',
				data : {
					action :'getAllRoomInfo',
					roomId:roomId
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
		   manager = $("#maingrid").ligerGrid( {
				columns : [ {
					display :"会议室Id",
					name :"roomId",
					align :'center',
					hide:true
				}, {
					display :"房间号",
					name :'roomNo',
					align :'center'
						
				}, {
					display :"房间类型",
					name :'roomType',
					align :'center'
				}, {
					display :"功用",
					name :'roomFunction',
					align :'center'
				},{
					display :"地址",
					name :'addr',
					align :'center'
				},{
					display :"价格",
					name :'price',
					align :'center'
				},{
					display :"管理员Id",
					name :'adminId',
					align :'center',
					hide:true
				},{
					display :"管理员",
					name :'adminName',
					align :'center',
				},{
					display :"容纳人数",
					name :"contain",
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
	  //添加会议室
	   function f_add(){
			$.ligerDialog.open({
				title: '增加会议室', 
				name:'addRoomInfo',
				width: 350, 
				height:350, 
				allowClose:false,
				url: 'addRoomInfo.jsp',
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
						url: '<%=path%>/JsonServiceServlet?service=room&action=addRoomInfo',
						cache: false,
						dataType: 'json',
						data:rs,
						success: function (data){
							if (data) {
								dialog.close();
								if(dialog.options.name != null && $.browser.mozilla){
									delete window.frames[dialog.options.name];
								}
								getGridData("");
							}else{
								$.ligerDialog.warn("增加会议室失败");
								return;
							}
						},
						error: function (XMLHttpRequest, textStatus) {
							$.ligerDialog.alert("增加会议室失败，请联系管理员");
						}
						});
				}
			}
			function f_Cancel(item, dialog){
				dialog.close();
			}
	  }
	   //修改会议室
	   function f_modify(){
			var row = manager.getSelectedRow();
			if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
			var params = 'roomId='+row.roomId
			+'&roomNo='+encodeURIComponent(row.roomNo)
			+'&roomType='+encodeURIComponent(row.roomType)
			+'&roomFunction='+encodeURIComponent(row.roomFunction)
			+'&addr='+encodeURIComponent(row.addr)
			+'&price='+row.price
			+'&adminId='+row.adminId
			+'&contain='+row.contain;
		   $.ligerDialog.open({
				title: '修改会议室', 
				name:'updateRoomInfo',
				width: 300, 
				height:300, 
				allowClose:false,
				url: 'updateRoomInfo.jsp?'+params,
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
				        url: '<%=path%>/JsonServiceServlet?service=room&action=updateRoomInfo',
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
				        		$.ligerDialog.success("修改会议室信息成功");
							}else{
								$.ligerDialog.warn("修改会议室信息失败");
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
	  //删除会议室 
	   function f_delete(){
		   var row = manager.getSelectedRow();
			if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
			$.ligerDialog.confirm('确定删除？', function(yes) {
				if(yes){
					$.ajax({
						type: 'post',
				        url: '<%=path%>/JsonServiceServlet?service=room&action=delRoomInfo',
				        cache: false,
				        dataType: 'json',
				        data:row,
				        success: function (data)
				        {
							if (data) {
								getGridData("");
							}else{
								$.ligerDialog.warn("删除会议室失败");
								return;
							}
				        },
				        error: function (XMLHttpRequest, textStatus) {
				        	$.ligerDialog.warn("删除会议室失败，请联系管理员");
				        }
					});
				}
			});
			
	   }
   </script>
</head>
<body style="height: 100%; text-align: center;">
	<div style="position: absolute; left: 2px;" id="maingrid"></div>
</body>
</html>