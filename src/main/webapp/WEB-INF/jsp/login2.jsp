<%--
  Created by IntelliJ IDEA.
  User: 95POIUF6K4
  Date: 2019/8/13
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>【君务】订单管理登录界面</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/login.css">
</head>
<body>
<div class="login">

    <div class="con">

        <div class="left">

            <div class="head">
                <a><img src="${pageContext.request.contextPath}/statics/images/logo.png" style="margin-bottom: -8px;"></a><span style="margin: 21px;">君务订单管理系统</span>
            </div>
            <form action="${pageContext.request.contextPath}/user/denglu" method="post">
                <div class="left1">
                    <a><img src="${pageContext.request.contextPath}/statics/images/user.png"></a><input type="text" name="usernameOruserman" placeholder="请输入用户名" class="name"/>
                </div>
                <div class="left2">
                    <a><img src="${pageContext.request.contextPath}/statics/images/password.png"></a><input  name="password" type="password" placeholder="请输入密码" class="name"/>
                </div>
                <span>${error }</span>
            <div id="left3">
<%--                <td>--%>
<%--                    <input type="checkbox"  class="checkbox" />记住密码--%>
<%--                </td>--%>
                <a style="padding-left: 130px" ><span>
							忘记密码？</span></a>
            </div>
            <button type="submit" class="lowin-btn">
                <img src="${pageContext.request.contextPath}/statics/images/denglu.png"/>
            </button>
            </form>
        </div>
        <div class="center">
            <img src="${pageContext.request.contextPath}/statics/images/fengefu.png" />
        </div>


        <div class="right">
            <div class="right1">

            </div>

            <div class="right1" style="margin-top: 20px;">
                <a ><span>欢迎登录</span></a>
<%--                <a><img src="${pageContext.request.contextPath}/statics/images/qiehuan.png"/></a>--%>
            </div>


            <div class="right2">
                <a><img src="${pageContext.request.contextPath}/statics/images/erweima.png"/></a>
            </div>
            <div class="right3">
                扫一扫，更多精彩机会等着你！
            </div>
        </div>
    </div>

</div>
</body>
</html>

