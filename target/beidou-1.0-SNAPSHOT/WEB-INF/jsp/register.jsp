<%--
  Created by IntelliJ IDEA.
  User: 95POIUF6K4
  Date: 2019/6/6
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册用户</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/auth1.css">
<style>
    body {
        /*margin: 0;
        background-color: #fbfbfb;
        text-align: center;*/

        margin: 0;
        background-color: #fbfbfb;
        text-align: center;
        background:url("${pageContext.request.contextPath}/statics/images/07.jpg") no-repeat center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }
    .panel-box-edit{

        cursor: pointer;
    }

</style>
<body >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<div class="lowin lowin-bule" align="center">
    <h1>欢迎注册</h1>
    <h3>请输入完整信息</h3>
    <div class="lowin-wrapper">
        <div class="lowin-box  lowin-register">
            <div class="lowin-box-inner">
                <form action="${pageContext.request.contextPath}/user/doRegister" method="post">
                    <p>订单管理系统</p>
                    <div class="lowin-group">
                        <label>用户名</label>
                        <input type="text" name="username" autocomplete="name" class="lowin-input" />
                    </div>
                    <div class="lowin-group">
                        <label>密码</label>
                        <input type="password" name="password" autocomplete="password" class="lowin-input" />
                    </div>
                    <div class="lowin-group">
                        <label>确认密码</label>
                        <input type="password" name="passwordAgain" autocomplete="password" class="lowin-input" />
                    </div>
                    <div class="lowin-group">
                        <label>所属部门</label>
                        <input type="text" name="department" autocomplete="name" class="lowin-input" />
                    </div>
                    <div class="lowin-group">
                        <label>使用人名称</label>
                        <input type="text" name="userman" autocomplete="current-password" class="lowin-input">
                    </div>
                    <div class="lowin-group">
                        <label>权限等级</label>
                        <input type="text" name="companyId" class="lowin-input">
                    </div>
                    <button class="lowin-btn"  type="button" onclick="agains()" name="go" value="提交注册">
                        提交注册
                    </button>
                    <button class="lowin-btn"  type="reset"  name="again" value="清空信息">
                        清空信息
                    </button>
                </form>
                <div><a class="panel-box-edit" onclick="window.history.go(-1)" >返回</a>  </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function agains(){
        var result = true;
        //alert($("input[name='username']").val());
        if($("input[name='username']").val()==null||$("input[name='username']").val()==''){
            result = false;
        }else if($("input[name='password']").val()==null||$("input[name='password']").val()==''){
            result = false;
        }else if($("input[name='department']").val()==null||$("input[name='department']").val()==''){
            result = false;
        }else if($("input[name='userman']").val()==null||$("input[name='userman']").val()==''){
            result = false;
        }else if($("input[name='companyId']").val()==null||$("input[name='companyId']").val()==''){
            result = false;
        }
        if(result==true){
            var tryagain = true;
            if(isNaN($("input[name='companyId']").val())){
                alert("权限等级要为数字");
                tryagain = false;
            }
            if($("input[name='password']").val().length<6){
                alert("密码不能小于6位数");
                tryagain = false;
            }

            if(tryagain==true){
                $("form").submit();
            }

        }else{
            alert("请填写完整的信息");
        }
    }
</script>
</body>
</html>
