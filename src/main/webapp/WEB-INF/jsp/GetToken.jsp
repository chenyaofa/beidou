<%--
  Created by IntelliJ IDEA.
  User: 95POIUF6K4
  Date: 2019/7/9
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
<link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
<html>
<head>
    <title>拦截器拦截</title>
</head>
<body>
    <div>
        <div>
            <h3>访问页面失败,请先登录</h3>
        </div>
        <form>

        </form>
    </div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js" ></script>
<script type="text/javascript">
    $(function () {
        alert("访问页面失败，请先登录");
        window.location.href="${pageContext.request.contextPath}/user/fanHuiLogin";
    })
</script>
</html>
