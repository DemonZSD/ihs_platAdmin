<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path %>/timejs/jquery.datetimepicker.css"/>
<script type="text/javascript" src="<%=path %>/timejs/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/timejs/jquery.datetimepicker.js"></script>
</head>
<body>
<input type="text" id="reDate" />
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="/public/admin/images/mail_leftbg.gif"><img src="/public/admin/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="/public/admin/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">
        修改信息        </div></td>
      </tr>
    </table>
    </td>
    <td width="16" valign="top" background="/public/admin/images/mail_rightbg.gif"><img src="/public/admin/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="/public/admin/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" valign="top" width="80%">&nbsp;</td>
        <td width="5%">&nbsp;</td>
        <td valign="top" width="15%">&nbsp;</td>
      </tr>
      <tr><br><br>
        <td colspan="2" valign="top"><span class="left_bt" style="font-size:16px;">联合培养奖助体系</span>
        
        
                  <br><br>
	        <form name="example" method="post" action="grantsystemform">
	       		 发&nbsp;表&nbsp;人：<input type="text" name="owner" value="" style="width:120px;">
	        	发表日期：<input id="datepicker" type="text" name="time" />
	        	<br><br>
				<textarea name="content1" style="width:720px;height:550px;visibility:hidden;" >			
								</textarea>			
				<input type="submit" name="button" value="提交内容" /> (提交快捷键: Ctrl + Enter)
			</form>
        </td>
        <td width="5">&nbsp;</td>
        <td width="15%" valign="top"><table width="100%" height="144" border="0" cellpadding="0" cellspacing="0" class="line_table">
          <tr>
          <br><br>
            <td width="7%" height="27" background="/public/admin/images/news-title-bg.gif"><img src="/public/admin/images/news-title-bg.gif" width="2" height="27"></td>
            <td width="93%" background="/public/admin/images/news-title-bg.gif" class="left_bt2">操作说明</td>
          </tr>
          <tr>
            <td height="102" valign="top">&nbsp;</td>
            <td height="102" valign="top">
            <textarea rows="10" cols="30"></textarea>
            </td>
          </tr>
          <tr>
            <td height="5" colspan="2">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      
      <tr>
        <td height="40" colspan="4"><table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
          <tr>
            <td></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="2%">&nbsp;</td>
        <td width="51%" class="left_txt"><img src="/public/admin/images/icon-mail2.gif" width="16" height="11"> 管理员QQ：403278819<br>
              <img src="/public/admin/images/icon-phone.gif" width="17" height="14"> <a href="/index/index">进入前台</a></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td background="/admin/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="/public/admin/images/mail_leftbg.gif"><img src="/public/admin/images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="/public/admin/images/buttom_bgs.gif"><img src="/public/admin/images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="/public/admin/images/mail_rightbg.gif"><img src="/public/admin/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>


</body>
<script >
	$('#reDate').datetimepicker({
		timepicker:false,
		format:'Y-m-d'
	});
</script>
</html>
