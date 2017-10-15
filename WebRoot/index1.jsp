<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", basePath);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0034)https://open.ikuai8.com/login.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="">
<meta name="viewport" content="width=device-width">
<title>inTouch——Keep in touch with the world！</title>
<link type="text/css" rel="stylesheet" href="${path}css1/normalize.css">
<link type="text/css" rel="stylesheet" href="${path}css1/login.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script language="javascript" type="text/javascript">
        function check() {
            var num = document.getElementById("0").value;
            var reg = /08070/;
            var go = reg.test(num);
            if (document.getElementById("0").value == "") {
                alert("请输入学号!");
                return false;
            }
            if (go == false) {
                alert("学号格式不正确！");
                return false;
            }
            if (document.getElementById("5").value == "" || document.getElementById("5").value.length != 18) {
                alert("请输入正确格式的身份证号！");
                return false;
            }
            if (document.getElementById("1").value == "") {
                alert("请输入登录密码!");
                return false;
            }
            if (document.getElementById("2").value == "") {
                alert("请输入确认密码!");
                return false;
            }
            if (document.getElementById("1").value != document.getElementById("2").value) {
                alert("两次密码输入不一致！");
                return false;
            }
            if (document.getElementById("1").value.length != 6) {
                alert("密码长度不符合要求");
                return false;
            }
            if (document.getElementById("3").value == "" || document.getElementById("3").value.length != 11) {
                alert("请输入正确格式的手机号，以便通知短信送达！");
                return false;
            }
            return true;
        }
    </script>
    <link rel="stylesheet" href="css1/login.css">
</head>

<body class="login_bg">

    <div class="main_lay">

        <!--登录页面-->
        <div class="login" style="left: 0px; top: 198px;">
            <img src="${path}css1/logo.png" class="text_center login_logo" style="opacity: 1; top: 0px;">
          
							
						
            <!--登录块-->
            <form class="text_center" ame="getSen"
					action="${path}/Servlet/ReceiveServlet" method="post">
                <ul class="load_animation">
                    <li style="opacity: 1; top: 0px;">
                        <div class="div_info">
                            <div class="promptInpt">
                                <p class="promptTxt">学号</p>
                            </div>
                            <input class="user inputTxt" name="username" id="0" type="text">
                        </div>
                    </li>
                    <li style="opacity: 1; top: 0px;">
                        <div class="div_info">
                            <div class="promptInpt">
                                <p class="promptTxt">身份证号</p>
                            </div>
                            <input class="user inputTxt" name="ID" name="ID" id="5" type="text">
                        </div>
                    </li>
                    <li style="opacity: 1; top: 0px;">
                        <div class="div_info">
                            <div class="promptInpt">
                                <p class="promptTxt">自定义密码（6位）</p>
                            </div>
                            <input class="password inputTxt" name="password1" id="1" type="password">
                        </div>
                    </li>
                    <li style="opacity: 1; top: 0px;">
                        <div class="div_info">
                            <div class="promptInpt">
                                <p class="promptTxt">输入确认密码</p>
                            </div>
                            <input class="password inputTxt" name="password2" id="2" type="password">
                        </div>
                    </li>
                    </li>
                    <li style="opacity: 1; top: 0px;">
                        <div class="div_info">
                            <div class="promptInpt">
                                <p class="promptTxt">手机号</p>
                            </div>
                            <input class="user inputTxt" name="phoneNum" id="3" type="text">
                        </div>
                    </li>
                    <li style="opacity: 1; top: 0px;">
                        <div class="cue">
                              <span class="error_font"><%
								String alert = (String) request.getAttribute("alert");
								if (alert == null) {
								} else
									out.println(alert);
							%></span>
                        </div> <input type="button" value="注   册" class="btn_login" onClick="return check()">
                        
                        <div class="state div_info">
                            <!-- label class="checkbox fl"> 自动登录 <span class="icon_check"></span> <input type="checkbox" /></label-->

                        </div>
                    </li>
            
            <!--登录块--end-->
        </ul></form></div>
        <!--登录页面--end-->

    </div>

    <script type="text/javascript" src="${path}css1/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${path}css1/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${path}css1/login.js"></script>


</body></html>