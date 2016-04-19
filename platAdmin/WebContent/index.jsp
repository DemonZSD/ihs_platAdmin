<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,edu.ahu.hs.platAppoint.beans.*"
    pageEncoding="UTF-8"%>
    <%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%
	LoginRecordBean lrb=(LoginRecordBean)session.getAttribute("admininfo");
	int lev=2;
	String userName="";
	if(lrb==null){
		//返回登录界面
		response.sendRedirect("login.jsp?type=1");
	}else{
		userName=lrb.getRealName();
		 lev=lrb.getLev();
	}
	%>
    <title>预约管理系统</title>
    <link href="<%=path %>/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" /> 
    <link rel="stylesheet" type="text/css" id="mylink"/>   
    <script src="<%=path %>/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>    
    <script src="<%=path %>/lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script> 
    <script src="<%=path %>/lib/ligerUI/js/plugins/ligerTab.js"></script>
    <script src="<%=path %>/lib/jquery.cookie.js"></script>
    <script src="<%=path %>/lib/json2.js"></script>
<!--     <script src="indexdata.js" type="text/javascript"></script> -->
        <script type="text/javascript">
            var tab = null;
            var accordion = null;
            var tree = null;
            var tabItems = [];
            $(function ()
            {
                $("#layout1").ligerLayout({ leftWidth: 190, height: '100%',heightDiff:-34,space:4, onHeightChanged: f_heightChanged });

                var height = $(".l-layout-center").height();
                $("#framecenter").ligerTab({
                    height: height,
                    showSwitchInTab : true,
                    showSwitch: true,
                    onAfterAddTabItem: function (tabdata)
                    {
                        tabItems.push(tabdata);
                        saveTabStatus();
                    },
                    onAfterRemoveTabItem: function (tabid)
                    { 
                        for (var i = 0; i < tabItems.length; i++)
                        {
                            var o = tabItems[i];
                            if (o.tabid == tabid)
                            {
                                tabItems.splice(i, 1);
                                saveTabStatus();
                                break;
                            }
                        }
                    },
                    onReload: function (tabdata)
                    {
                        var tabid = tabdata.tabid;
                        addFrameSkinLink(tabid);
                    }
                });

                $("#accordion1").ligerAccordion({ height: height - 24, speed: null });

                $(".l-link").hover(function ()
                {
                    $(this).addClass("l-link-over");
                }, function ()
                {
                    $(this).removeClass("l-link-over");
                });
                tab = liger.get("framecenter");
                accordion = liger.get("accordion1");

                css_init();
                pages_init();
            });
            function f_heightChanged(options)
            {  
                if (tab)
                    tab.addHeight(options.diff);
                if (accordion && options.middleHeight - 24 > 0)
                    accordion.setHeight(options.middleHeight - 24);
            }
            function f_addTab(tabid, text, url)
            {
                tab.addTabItem({
                    tabid: tabid,
                    text: text,
                    url: url,
                    callback: function ()
                    {
                        addShowCodeBtn(tabid); 
                        addFrameSkinLink(tabid); 
                    }
                });
            }
            function addFrameSkinLink(tabid)
            {
                var prevHref = getLinkPrevHref(tabid) || "";
                var skin = getQueryString("skin");
                if (!skin) return;
                skin = skin.toLowerCase();
                attachLinkToFrame(tabid, prevHref + skin_links[skin]);
            }
            var skin_links = {
                "aqua": "lib/ligerUI/skins/Aqua/css/ligerui-all.css",
                "gray": "lib/ligerUI/skins/Gray/css/all.css",
                "silvery": "lib/ligerUI/skins/Silvery/css/style.css",
                "gray2014": "lib/ligerUI/skins/gray2014/css/all.css"
            };
            function pages_init()
            {
                var tabJson = $.cookie('liger-home-tab'); 
                if (tabJson)
                { 
                    var tabitems = JSON2.parse(tabJson);
                    for (var i = 0; tabitems && tabitems[i];i++)
                    { 
                        f_addTab(tabitems[i].tabid, tabitems[i].text, tabitems[i].url);
                    } 
                }
            }
            function saveTabStatus()
            { 
                $.cookie('liger-home-tab', JSON2.stringify(tabItems));
            }
            function getQueryString(name)
            {
                var now_url = document.location.search.slice(1), q_array = now_url.split('&');
                for (var i = 0; i < q_array.length; i++)
                {
                    var v_array = q_array[i].split('=');
                    if (v_array[0] == name)
                    {
                        return v_array[1];
                    }
                }
                return false;
            }
            function attachLinkToFrame(iframeId, filename)
            { 
                if(!window.frames[iframeId]) return;
                var head = window.frames[iframeId].document.getElementsByTagName('head').item(0);
                var fileref = window.frames[iframeId].document.createElement("link");
                if (!fileref) return;
                fileref.setAttribute("rel", "stylesheet");
                fileref.setAttribute("type", "text/css");
                fileref.setAttribute("href", filename);
                head.appendChild(fileref);
            }
            function getLinkPrevHref(iframeId)
            {
                if (!window.frames[iframeId]) return;
                var head = window.frames[iframeId].document.getElementsByTagName('head').item(0);
                var links = $("link:first", head);
                for (var i = 0; links[i]; i++)
                {
                    var href = $(links[i]).attr("href");
                    if (href && href.toLowerCase().indexOf("ligerui") > 0)
                    {
                        return href.substring(0, href.toLowerCase().indexOf("lib") );
                    }
                }
            }
            setInterval("webtime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
     </script> 
<style type="text/css"> 
    .l-link{ display:block; height:26px; line-height:26px; padding-left:10px; border-radius:4px;text-decoration:none; color:#333; background:#C7DFF9;}
    .l-link2{text-decoration:underline; color:white; margin-left:2px;margin-right:2px;}
    .l-layout-top{background:#102A49; color:White;}
    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
    .l-link{ display:block; line-height:26px; height:26px; padding-left:16px; margin:4px;}
    .l-link-over{ background:#BDD9F8;border-radius:4px;text-decoration:none;} 
    .l-winbar{ background:#2B5A76; height:30px; position:absolute; left:0px; bottom:0px; width:100%; z-index:99999;}
    .space{ color:#E7E7E7;}
    .l-topmenu{ margin:0; padding:0; height:31px; line-height:31px; background:url('lib/images/top.jpg') repeat-x bottom;  position:relative; border-top:1px solid #1D438B;  }
    .l-topmenu-logo{ color:#E7E7E7; padding-left:35px; line-height:26px;background:url('lib/images/topicon.gif') no-repeat 10px 5px;}
    .l-topmenu-welcome{  position:absolute; height:24px; line-height:24px;  right:30px; top:2px;color:#070A0C;}
    .l-topmenu-welcome a{ color:#E7E7E7; text-decoration:none;} 
     .body-gray2014 #framecenter{
        margin-top:3px;
    }
      .viewsourcelink {
         background:#B3D9F7;  display:block; position:absolute; right:10px; top:3px; padding:6px 4px; color:#333; text-decoration:underline;
    }
    .viewsourcelink-over {
        background:#81C0F2;
    }
    .l-topmenu-welcome label {color:white;
    }
    #skinSelect {
        margin-right: 6px;
    }
 </style>
</head>
<body style="padding:0px;background:#EAEEF5;"> 
	<div class="header">
		<table>
		<tr><td width="30%"><img alt="健康科学研究院" src="./images/logo.png" /></td>
		<td width="45%" align="center"><span>健康科学研究院仪器设备预约管理系统</span></td>
		<td width="25%"><div class="header_info">当前用户：<%=userName %>&nbsp;&nbsp;
			&nbsp;&nbsp;<a href="AdminLoginServlet?type=quit">退出系统</a><div id="webtime" style="margin-top:5px;"></div></div></td></tr>
		</table>
	</div>
  <div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; "> 
        <div position="left"  title="主要菜单" id="accordion1"> 
                    <div title="仪器设备管理">
                    	<div style=" height:7px;"></div>
                         <a class="l-link" href="javascript:f_addTab('deviceManage','实验仪器管理','deviceManage.jsp')">实验仪器管理</a> 
                        <a class="l-link" href="javascript:f_addTab('roomManage','教室管理','roomManage.jsp')">教室管理</a> 
                    </div> 
                    <div title="仪器设备预约管理">
                    	<div style=" height:7px;"></div>
                         <a class="l-link" href="javascript:f_addTab('deReManage','实验仪器预约管理','deReManage.jsp')">实验仪器预约管理</a> 
                        <a class="l-link" href="javascript:f_addTab('rmReManage','会议室预约管理','rmReManage.jsp')">会议室预约管理</a> 
                    </div> 
                    <div title="用户管理">
                    	<div style=" height:7px;"></div>
                         <a class="l-link" href="javascript:f_addTab('userManage','用户管理','userManage.jsp')">用户管理</a>
                         	
                          		<% if(lev<1){ %>  
                        <a class="l-link" href="javascript:f_addTab('adManage','管理员管理','adminManage.jsp')">管理员管理</a>
                        	<%} %> 
                    </div>
                      <div title="预约系统通知">
                    	<div style=" height:7px;"></div>
                         <a class="l-link" href="javascript:f_addTab('newsManage','预约系统通知','newsManage.jsp')">预约系统通知</a> 
                    </div> 
        </div>
        <div position="center" id="framecenter"> 
            <div class="home" title="欢迎" style="height:300px" >
                <iframe frameborder="0" name="home" id="home" src="wel.jsp"></iframe>
            </div> 
        </div> 
        
    </div>
    <div  style="height:32px; line-height:32px; text-align:center;">
            Copyright © 健康科学研究院
    </div>
    <div style="display:none"></div>
</body>
</html>

