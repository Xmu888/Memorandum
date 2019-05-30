<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/29
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- 重置文件 -->
    <link rel="stylesheet" href="static/css/normalize.css">
    <link rel="stylesheet" href="static/css/style.css">
    <title>注册页面</title>
    <%--${pageContext.request.contextPath}--%>
</head>
<body>
<div class="reg_div">
    <form action="/hello" method="post" class="from">
        <input type="hidden" value="0" name="type">
    <p>注册</p>
    <ul class="reg_ul">
        <li>
            <span>User：</span>
            <input type="text" name="userNum" value="" placeholder="4-8位用户名" class="reg_user">
            <span class="user_hint"></span>
        </li>
        <li>
            <span>Password：</span>
            <input type="password" name="" value="" placeholder="6-16位密码" class="reg_password">
            <span class="password_hint"></span>
        </li>
        <li>
            <span>Confirm：</span>
            <input type="password" name="passNum" value="" placeholder="确认密码" class="reg_confirm">
            <span class="confirm_hint"></span>
        </li>
        <li>
            <span>Email：</span>
            <input type="text" name="emil" value="" placeholder="邮箱" class="reg_email">
            <span class="email_hint"></span>
        </li>
        <li>
            <span>Mobile：</span>
            <input type="email" name="phoneNum" value="" placeholder="手机号" class="reg_mobile">
            <span class="mobile_hint"></span>
        </li>
        <li>
            <button type="button" name="button" class="red_button">注册</button>
        </li>
    </ul>
    </form>
</div>
<script src="static/js/jq1.2.js"></script>
<script src="static/js/JavaScript.js"></script>
</body>
</html>
