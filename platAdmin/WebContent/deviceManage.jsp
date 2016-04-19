<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath();%>
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
	//	   showForm();
		   showGrid();
		   getGridData("");
	});
	function getGridData(deviceId){
		   $.ajax( {
				type :'post',
				url : '<%=path%>/JsonServiceServlet?service=device&action=getAllDeviceInfo',
				cache :false,
				dataType :'json',
				data : {
					deviceId:deviceId
				},
				success : function(data) {
					alert(data);
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
		 manager=$("#maingrid").ligerGrid( {
			columns : [
				{display :"设备ID",name :"deviceId",align :'center',hide: true},
				{display :"设备名称",name:"deviceName",align :'center',width:"13%"},
				{display :"设备型号",name :"type",align :'center',width:"10%"},
				{display :"制造商",name :"made",align :'center',width:"5%"},
				{display :"图像名称",name :"photo",align :'center',width:"6%"},
				{display :"仪器简介",name :"expriment",align :'center',width:"26%"},
				{display :"注意事项",name :"train",align :'center',width:"20%"},
				{display :"样本数量",name :"trainNum",align :'center',width:"5%"},
				{display :"价格",name :"price",align :'center',width:"5%"},
				{display :"管理员Id",name :"adminId",align :'center',hide: true},
				{display :"管理员",name :"adminName",align :'center',width:"7%"}
			],
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
		function f_add() {
			$.ligerDialog.open({
				title: '增加仪器设备信息', 
				name:'addDevice',
				width: 400, 
				height: 500, 
				allowClose:false,
				url: 'addDeviceInfo.jsp',
				buttons: [
					{ text: '确定', onclick: f_addOK },
			        { text: '取消', onclick: f_Cancel }
			    ]
			});
		}
		
		function f_addOK(item, dialog) {
			var fn = dialog.frame.returnValue || dialog.frame.window.returnValue;
			var rs = fn();
			if(rs != false){
				$.ajax({
				type: 'post',
				url: '<%=path%>/JsonServiceServlet?service=device&action=addDeviceInfo',
				cache: false,
				dataType: 'json',
				data:rs,
				success: function (data){
					if (data) {
						dialog.close();
						if(dialog.options.name != null && $.browser.mozilla){
							delete window.frames[dialog.options.name];
						}
						$.ligerDialog.success("添加信息成功");
						getGridData("");
					}else{
						$.ligerDialog.warn("增加仪器失败");
						return;
					}
				},
				error: function (XMLHttpRequest, textStatus) {
					$.ligerDialog.alert("增加失败，请联系管理员");
				}
				});
			}
        }

		function f_Cancel(item, dialog) {
            dialog.close();
            if(dialog.options.name != null && $.browser.mozilla){
				delete window.frames[dialog.options.name];
			}
        }
		
		function f_modify() {
			var row = manager.getSelectedRow();
			if (!row) {$.ligerDialog.warn('请选择行!!!');return;}
			var params = 'deviceId='+row.deviceId
			+'&deviceName='+encodeURIComponent(row.deviceName)
			+'&type='+encodeURIComponent(row.type)
			+'&photo='+encodeURIComponent(row.photo)
			+'&expriment='+encodeURIComponent(row.expriment)
			+'&made='+encodeURIComponent(row.made)
			+'&train='+encodeURIComponent(row.train)
			+'&trainNum='+row.trainNum
			+'&price='+row.price
			+'&adminId='+row.adminId
			+'&adminName='+encodeURIComponent(row.adminName);
			
			$.ligerDialog.open({
				title: '仪器设备基本信息', 
				width: 400, 
				height: 500, 
				allowClose:false,
				url: 'updateDeviceInfo.jsp?'+params,
				buttons: [
					{ text: '确定', onclick: f_updateOK },
			        { text: '取消', onclick: f_Cancel }
			    ]
			});
		}

		function f_updateOK(item, dialog) {
			var fn = dialog.frame.returnValue || dialog.frame.window.returnValue;
			var rs = fn();
			if(rs != false){
				$.ajax({
					type: 'post',
			        url: '<%=path%>/JsonServiceServlet?service=device&action=updateDeviceInfo',
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
			        		$.ligerDialog.success("修改仪器设备信息成功");
						}else{
							$.ligerDialog.warn("修改仪器设备信息失败");
							return;
						}
			        	getGridData("");
			        },
			        error: function (XMLHttpRequest, textStatus) {
			        	$.ligerDialog.warn("仪器设备修改失败，请联系管理员");
			        }
				});
			}
		}

		function f_delete() {
			var row = manager.getSelectedRow();
	        if (!row) { $.ligerDialog.alert('请选择行'); return; }
			$.ligerDialog.confirm('确定删除？', function(yes) {
				if(yes){
					$.ajax({
						type: 'post',
				        url: '<%=path%>/JsonServiceServlet?service=device&action=delDeviceInfo',
				        cache: false,
				        dataType: 'json',
				        data:row,
				        success: function (data)
				        {
							if (data) {
								getGridData("");
							}else{
								$.ligerDialog.warn("删除失败");
								return;
							}
				        },
				        error: function (XMLHttpRequest, textStatus) {
				        	$.ligerDialog.warn("删除失败，请联系管理员");
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