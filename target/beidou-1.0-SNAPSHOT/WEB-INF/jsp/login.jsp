<%--
  Created by IntelliJ IDEA.
  User: 95POIUF6K4
  Date: 2019/6/3
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>用户登录</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/auth.css">
<style>
    body {
        margin: 0;
        background-color: #fbfbfb;
        text-align: center;
        background:url("${pageContext.request.contextPath}/statics/images/01.jpg") no-repeat center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }

</style>
<body  style="overflow-y:hidden">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<div class="lowin lowin-bule" align="center">
        <h1>北斗国星订单管理系统</h1>
        <div class="lowin-brand">
            <img src="${pageContext.request.contextPath}/statics/images/05.jpg" alt="logo" />
        </div>
        <div class="lowin-wrapper">
            <div class="lowin-box  lowin-register">
                <div class="lowin-box-inner">
                    <form action="${pageContext.request.contextPath}/user/denglu" method="post">
                    <p style="font-size: 20px">订单管理系统</p>
                    <div class="lowin-group">
                        <label>用户名</label>
                        <input type="text" name="usernameOruserman" placeholder="请输入用户名" autocomplete="name" class="lowin-input" />
                    </div>
                    <div class="lowin-group">
                        <label>密码</label>
                        <input type="password" name="password" placeholder="请输入密码" autocomplete="current-password" class="lowin-input">
                    </div>
                    <span>${error }</span>
                    <button type="submit" class="lowin-btn">
                        登录
                    </button>

                    </form>
                <div class="text-foot">
                    没有账号?<a href="${pageContext.request.contextPath}/user/register" class="login-link">点击注册</a>
                </div>
            </div>
        </div>
        </div>
</div>
</body>
<script type="text/javascript">

</script>
</body>
</html>
