<%@ page contentType="application/vnd.ms-word; charset=utf-8" 
	import="java.util.*,edu.ahu.hs.platAppoint.beans.*,edu.ahu.hs.platAppoint.DAO.*"%>
<%@ page pageEncoding="utf-8"%>
 
<%  
	String path=request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	String deOrId=request.getParameter("deOrId");
	DeviceOrInfoDAO doid = new DeviceOrInfoDAO();
	DeOrBean dob = doid.getDeviceOrInfoById(deOrId);
    String fileName = "仪器设备完成使用通知单.doc";
    //对中文文件名编码  
   //fileName = URLEncoder.encode(fileName, "utf-8");  
    byte[] yte = fileName.getBytes("GB2312");  
            String unicoStr = new String(yte, "ISO-8859-1");
   response.setHeader("Content-disposition", "attachment; filename=" + unicoStr);  
%>  
 
<html xmlns:v="urn:schemas-microsoft-com:vml"   
      xmlns:o="urn:schemas-microsoft-com:office:office"   
      xmlns:w="urn:schemas-microsoft-com:office:word"   
      xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"   
      xmlns:st1="urn:schemas-microsoft-com:office:smarttags"   
      xmlns="http://www.w3.org/TR/REC-html40">  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
<meta name="ProgId" content="Word.Document">  
<meta name="Generator" content="Microsoft Word 12">  
<meta name="Originator" content="Microsoft Word 12">   
<title>JSP页面导出为Word文档</title>  
</head> 
<body lang=ZH-CN style='tab-interval:21.0pt;text-justify-trim:punctuation；width:60%'>

<div class=Section1>

<div>

<div>

<div>

<div>

<p class=MsoNormal align=center style='mso-margin-top-alt:auto;mso-margin-bottom-alt:
auto;text-align:center'><span style='font-size:16.0pt;font-family:黑体'>仪器设备完成使用通知单<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>预约部门：</span></b><u><span
lang=EN-US>&nbsp;&nbsp;</span><%=dob.getDepartment() %><span lang=EN-US>&nbsp;&nbsp;</span></u><span
lang=EN-US><span style='mso-spacerun:yes'>  </span></span><b style='mso-bidi-font-weight:
normal'><span lang=EN-US style='font-family:"Calibri","sans-serif";mso-ascii-theme-font:
minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;
mso-hansi-theme-font:minor-latin;mso-bidi-font-family:宋体'>&nbsp;&nbsp;</span></b><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>预约人：</span></b><u><span
lang=EN-US>&nbsp;&nbsp;</span><%=dob.getOrName() %>&nbsp;&nbsp;</span></u><span
lang=EN-US><span style='mso-spacerun:yes'> </span></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>设备名称：</span></b><u><%=dob.getDeviceName() %></u><span lang=EN-US><span style='mso-spacerun:yes'>          </span></span><b
style='mso-bidi-font-weight:normal'>管理员：</b><u><span lang=EN-US>&nbsp;&nbsp;</span><%=dob.getAdminName() %><span
lang=EN-US>&nbsp;&nbsp;</span></u></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>预约时间：</span></b><u><span
lang=EN-US>&nbsp;&nbsp;<%=dob.getReDate() %>&nbsp;&nbsp;<%=dob.getReTime() %>&nbsp;&nbsp;</span></u><span
lang=EN-US><span style='mso-spacerun:yes'>  </span></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'>用途：</b><u><span lang=EN-US>&nbsp;&nbsp;</span><%=dob.getPurpose() %><span
lang=EN-US>&nbsp;</span></u><span lang=EN-US>&nbsp;<span
style='mso-spacerun:yes'>           </span></span><b style='mso-bidi-font-weight:
normal'>产生费用：</b><u><%=dob.getMoney() %></u><b style='mso-bidi-font-weight:normal'><span
lang=EN-US><o:p></o:p></span></b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>联系电话：</span></b><u><span
lang=EN-US>&nbsp;&nbsp;<%=dob.getContact() %>&nbsp;&nbsp;</span></u></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>备注：</span></b>
<u><span lang=EN-US>&nbsp;&nbsp;</span><%=dob.getRemark() %><span lang=EN-US>&nbsp;&nbsp;</span></u></p>

<p class=MsoNormal align=right style='mso-margin-top-alt:auto;margin-right:
45.75pt;mso-margin-bottom-alt:auto;text-align:right'><span style='mso-ascii-font-family:
Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>预约人：</span><%=dob.getOrName() %></p>

<p class=MsoNormal align=right style='mso-margin-top-alt:auto;margin-right:
57.75pt;mso-margin-bottom-alt:auto;text-align:right'><span style='mso-ascii-font-family:
Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>管理员：</span><span
lang=EN-US>&nbsp;&nbsp;</span></p>

<p class=MsoNormal align=right style='mso-margin-top-alt:auto;margin-right:
21.0pt;mso-margin-bottom-alt:auto;text-align:right;word-break:break-all'><span
style='mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:
Calibri;mso-hansi-theme-font:minor-latin'>年</span><span lang=EN-US><span
style='mso-spacerun:yes'>      </span></span><span style='mso-ascii-font-family:
Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>月</span><span
lang=EN-US><span style='mso-spacerun:yes'>      </span></span><span
style='mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:
Calibri;mso-hansi-theme-font:minor-latin'>日</span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;margin-right:21.0pt;
mso-margin-bottom-alt:auto'><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;margin-right:-59.5pt;
mso-margin-bottom-alt:auto;margin-left:-63.7pt;mso-margin-top-alt:auto;
mso-para-margin-right:-4.96gd;mso-margin-bottom-alt:auto;mso-para-margin-left:
-5.31gd'><span lang=EN-US>-----------------------------------------------------------------------------------------</span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;margin-right:21.0pt;
mso-margin-bottom-alt:auto'><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='mso-margin-top-alt:auto;mso-margin-bottom-alt:
auto;text-align:center'><span style='font-size:16.0pt;font-family:黑体'>仪器设备完成使用通知单<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>预约部门：</span></b><u><span
lang=EN-US>&nbsp;&nbsp;</span><%=dob.getDepartment() %><span lang=EN-US>&nbsp;&nbsp;</span></u><span
lang=EN-US><span style='mso-spacerun:yes'>  </span></span><b style='mso-bidi-font-weight:
normal'><span lang=EN-US style='font-family:"Calibri","sans-serif";mso-ascii-theme-font:
minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;
mso-hansi-theme-font:minor-latin;mso-bidi-font-family:宋体'>&nbsp;&nbsp;</span></b><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>预约人：</span></b><u><span
lang=EN-US>&nbsp;&nbsp;</span><%=dob.getOrName() %>&nbsp;&nbsp;</span></u><span
lang=EN-US><span style='mso-spacerun:yes'> </span></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>设备名称：</span></b><u><%=dob.getDeviceName() %></u><span lang=EN-US><span style='mso-spacerun:yes'>          </span></span><b
style='mso-bidi-font-weight:normal'>管理员：</b><u><span lang=EN-US>&nbsp;&nbsp;</span><%=dob.getAdminName() %><span
lang=EN-US>&nbsp;&nbsp;</span></u></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>预约时间：</span></b><u><span
lang=EN-US>&nbsp;&nbsp;<%=dob.getReDate() %>&nbsp;&nbsp;<%=dob.getReTime() %>&nbsp;&nbsp;</span></u><span
lang=EN-US><span style='mso-spacerun:yes'>  </span></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'>用途：</b><u><span lang=EN-US>&nbsp;&nbsp;</span><%=dob.getPurpose() %><span
lang=EN-US>&nbsp;</span></u><span lang=EN-US>&nbsp;<span
style='mso-spacerun:yes'>           </span></span><b style='mso-bidi-font-weight:
normal'>产生费用：</b><u><%=dob.getMoney() %></u><b style='mso-bidi-font-weight:normal'><span
lang=EN-US><o:p></o:p></span></b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>联系电话：</span></b><u><span
lang=EN-US>&nbsp;&nbsp;<%=dob.getContact() %>&nbsp;&nbsp;</span></u></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b
style='mso-bidi-font-weight:normal'><span style='mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>备注：</span></b>
<u><span lang=EN-US>&nbsp;&nbsp;</span><%=dob.getRemark() %><span lang=EN-US>&nbsp;&nbsp;</span></u></p>

<p class=MsoNormal align=right style='mso-margin-top-alt:auto;margin-right:
45.75pt;mso-margin-bottom-alt:auto;text-align:right'><span style='mso-ascii-font-family:
Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>预约人：</span><%=dob.getOrName() %></p>

<p class=MsoNormal align=right style='mso-margin-top-alt:auto;margin-right:
57.75pt;mso-margin-bottom-alt:auto;text-align:right'><span style='mso-ascii-font-family:
Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>管理员：</span><span
lang=EN-US>&nbsp;&nbsp;</span></p>

<p class=MsoNormal align=right style='mso-margin-top-alt:auto;margin-right:
21.0pt;mso-margin-bottom-alt:auto;text-align:right;word-break:break-all'><span
style='mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:
Calibri;mso-hansi-theme-font:minor-latin'>年</span><span lang=EN-US><span
style='mso-spacerun:yes'>      </span></span><span style='mso-ascii-font-family:
Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:
minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin'>月</span><span
lang=EN-US><span style='mso-spacerun:yes'>      </span></span><span
style='mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:
Calibri;mso-hansi-theme-font:minor-latin'>日</span></p>

</div>

</div>

</div>

</div>

</div>

</body>
</html>