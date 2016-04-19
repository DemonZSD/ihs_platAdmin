<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path %>/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/lib/js/jquery-1.5.2.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=path %>/lib/ligerUI/ligerui.min.js" ></script> 
<link rel="stylesheet" href="<%=path %>/editor/themes/default/default.css" />
<link rel="stylesheet" href="<%=path %>/editor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=path %>/editor/kindeditor.js"></script>
<script charset="utf-8" src="<%=path %>/editor/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=path %>/editor/plugins/code/prettify.js"></script>
<script type="text/javascript">
$(function(){
	
	function returnValue(){
		var newstitle = $("#newstitle").val();
		var owner = $("#owner").val();
		var time = $("#time").val();
		var content = $("iframe").contents().find(".ke-content").html();
		//alert(content);
		var order = $("#order").val();
		var data={
				"title":newstitle,
				"time":time,
				"owner":owner,
				"content":content,
				"order":order
		};
		return data;
	}
	window.returnValue=returnValue;
});

		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '../plugins/code/prettify.css',
				uploadJson : '../jsp/upload_json.jsp',
				fileManagerJson : '../jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
</head>
<body style="overflow:auto;">
<div style="margin-top:10px;">
  <form id="mainform" >
  <div class="news_info">
  	<h3>请填写信息</h3><br><br>
  	通知标题：<input type="text" id="newstitle" name="title" size="70" /><br><br><br>
  	发&nbsp;&nbsp;表&nbsp;&nbsp;人：<input type="text" id="owner" name="owner" size="15" style="margin-right:40px;" />
  	发表时间：<input type="text" id="time" name="time" size="15" />&nbsp;&nbsp;&nbsp;注意格式：2014/08/20，请严格按照格式填写！<br><br><br>
  	显示顺序：<input type="text" id="order" name="order" size="15" />&nbsp;&nbsp;&nbsp;如果您不填写，将按时间顺序排序。
  </div>
  <div class="textEditor" style="margin-left:50px;">
  	<textarea id="content1" name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">在此处编辑</textarea>
	<br />  	
  </div>
  </form>
</div>
</body>
</html>