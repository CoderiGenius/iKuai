<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>青科大物联网工程实验室账号注册平台</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="青岛科技大学物联网工程实验室">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </head>
  
  
         
  <body>
  
  <div class="row">
<div class=" col-lg-12 col-md-4 col-sm-6 ">
   <h1 style="color:balck;font-family: Microsoft YaHei"> 青岛科技大学物联网工程实验室账号注册</h1> <br>
    <div style="color:black">
<%
String alert = (String)request.getAttribute("alert");
if(alert==null){}
else
out.println(alert);%>
</div>
    <form name="getSen" action="Servlet/ReceiveServlet" method="post" class="login-form" >

        <div class="input-group">
            <span class="input-group-addon" style="height:34px;">学号</span>
            <input type="text" name="username" class="form-control" style="width: 100%;">
         </div>
			<br>
        <div class="input-group">
            <span class="input-group-addon">手机号</span>
            <input type="text" name="phoneNum" class="form-control" style="width: 100%;">
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">密码</span>
            <input type="text" name="password1" class="form-control" style="width: 100%;">
           
        </div>
         <br>
           <div class="input-group">
            <span class="input-group-addon">确认密码</span>
            <input type="text" name="password2" class="form-control" style="width: 100%;">
           
        </div>
    

  <input type="submit" value="提交" class="btn btn-default btn-lg" > <br>
</form>
</div>

</div>
  </body>
</html>
