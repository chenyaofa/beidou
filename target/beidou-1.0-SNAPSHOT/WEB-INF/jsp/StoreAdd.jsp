<%--
  Created by IntelliJ IDEA.
  User: 95POIUF6K4
  Date: 2019/8/19
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>添加门店</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/storeadd.css">
    <style>
        .panel-box-edit{

            cursor: pointer;
        }

    </style>
</head>

<body class="layui-layout-body">
<div id="container" style="position:relative;">
    <div id="container1">
        <div class="top">
            <div class="head">
                <a style="margin-left: 130px;"><img src="${pageContext.request.contextPath}/statics/images/logo.png" style="margin-bottom: -8px;" /></a><span style="padding: 30px;">君务订单管理系统</span>
            </div>
        </div>
        <div class="mid" >

            <div class="mid1" style="height: 660px">
                <form method="post" action="${pageContext.request.contextPath}/store/AddStore">
                    <div class="mid2" >
                        <span  id="p1">门店添加</span>
                        <img src="${pageContext.request.contextPath}/statics/images/cebulan.png" style="height:28px;" />
                        <span id="p2">请输入门店信息</span>
                    </div>
                    <div class="mid3">

                        <table>
                            <tr>
                                <th>门店名称:</th>
                                <td><input type="text" name="storeName" maxlength="10" id="storeName" class="n1" /></td>
                            </tr>
                            <tr>
                                <th>门店店主:</th>
                                <td><input type="text" name="storeOwner" maxlength="10" id="storeOwner" class="n2" /></td>
                            </tr>
                            <tr>
                                <th>联系方式:</th>
                                <td><input type="text" name="contactWay" maxlength="11" id="contactWay" class="n3" /></td>
                            </tr>
                            <tr class="tr1">
                                <th>门店地址:</th>
                                <td><input type="text" placeholder="请输入详细地址" id="detailedness" maxlength="30" name="detailedness" class="n4" /></td>
                                <input id="addr" name="shipAddress" type="hidden" />
                            </tr>
                            <p id="sss" data-toggle="distpicker" >
                                <select name="shen" class="h1" data-province=""></select>
                                <select name="shi" class="h1" data-city="" style="top: 40px;"></select>
                                <select name="xian" class="h1" data-district="" style="top: 80px;"></select>
                            </p>

                        </table>

                    </div>
                    <div class="mid4">
                        <span><input onclick="copy()" type="button" value="点击添加门店信息" id="name" /></span>
                        <div class="back">
                            <a class="panel-box-edit" onclick="window.history.go(-1)" style="text-decoration: none;color: black;">返回</a>
                        </div>
                    </div>
                </form>
            </div>

        </div>
        <div class="layui-footer" >
            <!-- 底部固定区域 -->
            © copy.com - 君务科技有限公司
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>

<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script src="${pageContext.request.contextPath}/js/distpicker.data.js"></script>
<script src="${pageContext.request.contextPath}/js/distpicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;

    });
    function decide(){
        if($("#storeName").val()==null||$("#storeName").val()==''){
            return false;
        }else if($("#storeOwner").val()==null||$("#storeOwner").val()==''){
            return false;
        }else if($("#contactWay").val()==null||$("#contactWay").val()==''){
            return false;
        }else if($("#detailedness").val()==null||$("#detailedness").val()==''){
            return false;
        }else{
            return true;
        }

    }
    function copy(){
        if($("#detailedness").val()!=""&&$("#detailedness").val()!=null){
            $("#addr").val($("select[name='shen']").val()+" "+$("select[name='shi']").val()+" "+$("select[name='xian']").val()+" "+$("#detailedness").val());
        }

        var result = true;
        if(decide()){
            if($("#storeName").val().length<3){
                layer.open({
                    title: '提示'
                    ,content: '名字长度不能小于四个字符'
                });
                result =false;
            }
            if(!isNaN($("#storeName").val())){
                layer.open({
                    title: '提示'
                    ,content: '不能为纯数字'
                });
                result =false;
            }
            if($("#contactWay").val().length<6||$("#contactWay").val().length>11){
                layer.open({
                    title: '提示'
                    ,content: '联系方式不能小于6位或大于11位'
                });
                result =false;
            }
            if($("#addr").val().length<6){
                layer.open({
                    title: '提示'
                    ,content: '请填写详细的地址'
                });
                result =false;
            }
        }else{
            result = false;
            layer.open({
                title: '提示'
                ,content: '请填写完整的信息'
            });
        }
        if(result==true){
            layer.open({
                title: '提示',
                content: '提交成功，请耐心等待审核'
                ,btn: ['确定']
                ,yes: function(index, layero){
                    $("form").submit();
                }
            });

        }
    }

</script>
</body>
</html>
