<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", basePath);
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>物联网实验室账号注册平台</title>
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${path}css/amazeui.min.css">
<link rel="stylesheet" href="${path}css/app.css">
</head>

<body>

	<div class="am-g myapp-login">
		<div class="myapp-login-bg">
			<div class="myapp-login-logo">
				<div class="login-text"
					style="color:white;font-family: Microsoft YaHei; font-size:15px;">
					青岛科技大学物联网实验室</div>
				<br>
				<div class="login-text"
					style="color:white;font-family: Microsoft YaHei; font-size:45px;">
					账号注册</div>
			</div>
			<div class="am-u-sm-10 myapp-login-form">
				<form class="am-form" name="getSen"
					action="http://47.95.238.76/Servlet/ReceiveServlet" method="post">
					<fieldset>
						<div class="login-text"
							style="color:white;font-family: Microsoft YaHei; font-size:30px;">
							<%
								String alert = (String) request.getAttribute("alert");
								if (alert == null) {
								} else
									out.println(alert);
							%>
						</div>
						<div class="am-form-group">
							<div class="login-text"
								style="color:white;font-family: Microsoft YaHei; ">
								请输入您的学号</div>
							<input id="0" type="text" class="" id="doc-ipt-email-1"
								placeholder="" name="username">
						</div>
						<div class="am-form-group">
							<div class="login-text"
								style="color:white;font-family: Microsoft YaHei; ">
								请输入您的身份证号</div>
							<input id="5" type="text" class="" id="doc-ipt-email-1"
								placeholder="" name="ID">
						</div>
						<div class="am-form-group">
							<div class="login-text"
								style="color:white;font-family: Microsoft YaHei; ">
								请输入自定义密码（六位）</div>
							<input id="1" type="password" class="" id="doc-ipt-pwd-1"
								name="password1" placeholder="">
						</div>
						<div class="am-form-group">
							<div class="login-text"
								style="color:white;font-family: Microsoft YaHei; ">
								请输入确认密码（六位）</div>
							<input id="2" type="password" class="" id="doc-ipt-pwd-1"
								name="password2" placeholder="">
						</div>
						<div class="am-form-group">
							<div class="login-text"
								style="color:white;font-family: Microsoft YaHei; ">请输入手机号
							</div>
							<input id="3" type="text" class="" id="doc-ipt-pwd-1"
								name="phoneNum" placeholder="">
						</div>
						<p>
							<button type="submit" class="am-btn am-btn-default"
								onClick="return check()">注册</button>
						</p>
						<div class="login-text">Powered by Innovation Lab of
							Information science & technology of QUST</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="js/jquery.min.js"></script>
	<!--<![endif]-->
	<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
	<script src="js/amazeui.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>
