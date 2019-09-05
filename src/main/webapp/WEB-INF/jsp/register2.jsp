<%--
  Created by IntelliJ IDEA.
  User: 95POIUF6K4
  Date: 2019/8/13
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>【君务】订单管理注册界面</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
</head>
<!--引入css样式，js验证效果-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/register.css"/>

<style>
    .panel-box-edit{

        cursor: pointer;
    }
</style>
<body>
<!--背景图部分-->
<div class="register">
    <div class="con">
        <!--左侧欢迎注册界面-->

        <div class="regist-left">
            <h1>欢迎注册 |</h1>
            <h4>请填写完整信息</h4>
            <div class="reg-img">
                <img src="${pageContext.request.contextPath}/statics/images/tuxing.png"/>

            </div>
        </div>
        <form action="${pageContext.request.contextPath}/user/doRegister" method="post">
        <!--右侧注册表单界面-->
        <div id="regist-right">
            <div class="reg-a">
                <img src="${pageContext.request.contextPath}/statics/images/user name.png"/>
                <input type="text"  name="username" placeholder="请输入用户名" class="username" />
                <i id="userError"></i>
            </div>

            <div class="reg-a">
                <img src="${pageContext.request.contextPath}/statics/images/password1.png"/>
                <input type="password" name="password" placeholder="请输入密码" class="password1"/>
                <i id="password1Error"></i>

            </div>
            <div class="reg-a">
                <img src="${pageContext.request.contextPath}/statics/images/password2.png"/>
                <input type="password" name="passwordAgain" placeholder="请确认密码" class="password2"/>
                <i id="password2Error"></i>
            </div>

            <div class="reg-a">
                <img src="${pageContext.request.contextPath}/statics/images/department.png"/>
                <input type="text" name="department" placeholder="请输入所属部门" class="depart"/>
                <i id="departError"></i>
            </div>

            <div class="reg-a">
                <img src="${pageContext.request.contextPath}/statics/images/user1.png"/>
                <input type="text" name="userman" placeholder="请输入使用人名称" class="user"/>
                <i id="user1Error"></i>
            </div>
            <div class="reg-a">
                <img src="${pageContext.request.contextPath}/statics/images/grade.png"/>
                <select name="companyId" id="companyId" style="width: 348px;
                   height: 26px;
                   color: #757575;
                   font-size: 16px;
                   border:0;
                   border-bottom: 1px solid #D6D3D6;
                   padding-bottom: 3px;
                   text-indent: 10px;
                   outline: none;">

                    <option value="0">请选择权限等级</option>
                    <option value="1">管理员账号</option>
                    <option value="4">门店账号</option>
                </select>

                <i id="gradeError"></i>
            </div>

            <button onclick="agains()" class="zhuce">
                <img src="${pageContext.request.contextPath}/statics/images/tijiao.png" onclick="return false;"/>
            </button>
            <button  type="reset" class="zhuce" style="margin-left: 30px; ">
                <img src="${pageContext.request.contextPath}/statics/images/qingkong.png">
            </button>
            <div><a class="panel-box-edit" onclick="window.history.go(-1)" >返回</a>  </div>
        </div>
        </form>

    </div>

</div>

</body>
</html>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;

    });
    function agains(){
        var result = true;
        // alert($("input[name='username']").val());
        if($("input[name='username']").val()==null||$("input[name='username']").val()==''){
            result = false;
        }else if($("input[name='password']").val()==null||$("input[name='password']").val()==''){
            result = false;
        }else if($("input[name='password']").val()!=$("input[name='passwordAgain']").val()){
            layer.open({
                title: '提示'
                ,content: '两次密码必须一致'
            });
            result=false;
        }else if($("input[name='department']").val()==null||$("input[name='department']").val()==''){
            result = false;
        }else if($("input[name='userman']").val()==null||$("input[name='userman']").val()==''){
            result = false;
        }else if($("#companyId").val()==null||$("#companyId").val()=='0'){
            layer.open({
                title: '提示'
                ,content: '请选择权限等级'
            });
            result = false;
        }
        if(result==true){
            var tryagain = true;

            if($("input[name='password']").val().length<6){
                layer.open({
                    title: '提示'
                    ,content: '密码不能小于6位数'
                });
                tryagain = false;
            }

            if(tryagain==true){
                $("form").submit();
            }

        }else{
            layer.open({
                title: '提示'
                ,content: '请填写完整的信息'
            });
        }
    }
</script>
