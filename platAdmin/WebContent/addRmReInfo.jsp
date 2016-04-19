<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=path %>/timejs/jquery.datetimepicker.css"/>
<link href="<%=path %>/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/timejs/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/lib/ligerUI/ligerui.min.js" ></script>
 <script src="<%=path %>/lib/ligerUI/js/plugins/ligerRadioList.js" type="text/javascript"></script>
 <script type="text/javascript" src="<%=path %>/timejs/jquery.datetimepicker.js"></script>

<script type="text/javascript">
$(function(){
	
	$("#roomNo").ligerComboBox({
		width: 120,
		slide: false,
		url:'JsonServiceServlet?service=room&action=getRoomInfo',
		valueField: 'roomId',
		textField: 'roomNo',
		hideOnLoseFocus :true
  });
	$("#orName").ligerComboBox({
		width: 120,
		slide: false,
		url:'JsonServiceServlet?service=user&action=getUserInfo',
		valueField: 'userId',
		textField: 'realName',
		hideOnLoseFocus :true
  });
	function returnValue(){
		var roomId = $("#roomNo").ligerGetComboBoxManager().getValue();
		if(roomId==''||roomId==null){
			$.ligerDialog.alert("请选择房间号");
	        return false;
		}
		var userId = $("#orName").ligerGetComboBoxManager().getValue();
		if(userId==''||userId==null){
			$.ligerDialog.alert("请选择预约人");
	        return false;
		}
		var contact=$("#contact").val();
		if(contact==''||contact==null){
			$.ligerDialog.alert("请填写电话");
	        return false;
		}
		var reDate = $("#reDate").val();
		if(reDate==''||reDate==null){
			$.ligerDialog.alert("请选择预约日期");
	        return false;
		}
		var isUsing=$('input:radio[name="isUsing"]:checked').val();
		var finish=$('input:radio[name="finish"]:checked').val();

		var data={
				"roomId":roomId,
				"userId":userId,
				"reDate":reDate,
				"reTime":$("#reTime1").val()+"-"+$("#reTime2").val(),
				"money":$("#money").val(),
				"isUsing":isUsing,
				"finish":finish,
				"contact":contact,
				"remark":$("#remark").val(),
				"purpose":$("#purpose").val()
				
		};
		return data;
	}
	window.returnValue=returnValue;
});

</script>

<style type="text/css">
.l-table-edit-td{
	height:35px;
}
</style> 
</head>
<body style="overflow:auto;margin: 0 auto;">
<div align="center" style="margin-top:20px;">
<form id="mainform">
  	<table cellpadding="0" cellspacing="0" class="l-table-edit" >
        <tr>
            <td align="right" class="l-table-edit-td">预约房间号：</td>
            <td align="left" class="l-table-edit-td">
            	<select id="roomNo" name="roomNo" ></select>
            </td>
        </tr>
         <tr>
            <td align="right" class="l-table-edit-td">预约人：</td>
            <td align="left" class="l-table-edit-td">
            	<select id="orName" name="orName" ></select>
            </td>
        </tr>
        <tr>
            <td align="right" class="l-table-edit-td">联系电话:</td>
            <td align="left" class="l-table-edit-td">
                <input type="text" id="contact" name="contact" size="18" />
            </td>
        </tr>
        <tr>
            <td align="right" class="l-table-edit-td" >预约日期:</td>
            <td align="left" class="l-table-edit-td">
                 <input type="text" id="reDate" />
            </td>
        </tr>
         <tr>
            <td align="right" class="l-table-edit-td" >预约时间:</td>
            <td align="left" class="l-table-edit-td">
                 <input type="text" id="reTime1" readonly="readonly"  style="width:50px;" />
                 -<input type="text" readonly="readonly" id="reTime2"  style="width:50px;" />
            </td>
        </tr>
        <tr>
            <td align="right" class="l-table-edit-td" >使用费用：</td>
            <td align="left" class="l-table-edit-td">
               <input type="text" id="money" name="money" value="0.0" />
            </td>
        </tr>   
        
        <tr>
            <td align="right" class="l-table-edit-td" >使用状态:</td>
            <td align="left" class="l-table-edit-td">
               <input  id="rbtnl_0" type="radio" name="isUsing" value="0" checked="checked" />
               		<label for="rbtnl_0">未使用</label> 
                 <input id="rbtnl_1" type="radio" name="isUsing" value="1" />
                 	<label for="rbtnl_1">已使用</label>
            </td>
        </tr>
         <tr>
            <td align="right" class="l-table-edit-td">交易完成:</td>
            <td align="left" class="l-table-edit-td">
                <input  id="rbtnl_0" type="radio" name="finish" value="0" checked="checked" />
               		<label for="rbtnl_0">交易未完成</label> 
                 <input id="rbtnl_1" type="radio" name="finish" value="1" />
                 	<label for="rbtnl_1">交易完成</label>
                    
            </td>
        </tr>
        <tr>
            <td align="right" class="l-table-edit-td">备注信息:</td>
            <td align="left" class="l-table-edit-td">
                <input type="text" id="remark" name="remark" />
            </td>
        </tr>
        <tr>
            <td align="right" class="l-table-edit-td">用途:</td>
            <td align="left" class="l-table-edit-td">
                <input type="text" id="purpose" name="purpose" />
            </td>
        </tr>
     </table>
     </form>
    
</div>
</body>
<script>
$('#reTime1').datetimepicker({
	datepicker:false,
	format:'H:i',
	value:'08:00',
	step:30
});

$('#reTime2').datetimepicker({
	datepicker:false,
	format:'H:i',
	value:'08:00',
	step:30
});
$('#reDate').datetimepicker({
	timepicker:false,
	format:'Y-m-d'
});

</script>
</html>