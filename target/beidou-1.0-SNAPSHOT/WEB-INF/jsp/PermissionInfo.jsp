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
    <title>权限列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/quanxian.css">
    <style>
        .panel-box-edit{

            cursor: pointer;
        }

    </style>
</head>
<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">
            <img src="${pageContext.request.contextPath}/statics/images/guoxing.png" style="padding-right: 20px;"/>
            君务订单管理系统

        </div>


        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">

            <li class="layui-nav-item">
                <a href="">
                    <img src="${pageContext.request.contextPath}/statics/images/kefu.png"/>
                    代理
                </a>
            </li>
            <li class="layui-nav-item">
                <a href="">
                    <img src="${pageContext.request.contextPath}/statics/images/baobiao.png"/>
                    平台
                </a>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}/statics/images/xinxi.png"/>
                    消息
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">平台管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}/statics/images/admin.png" class="layui-nav-img">
                    ${userSession.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/fanHuiLogin">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">

            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <c:if test="${userSession.companyId==1||userSession.companyId==2||userSession.companyId==3}">
                    <li  class="layui-nav-item" >
                        <a href="${pageContext.request.contextPath}/user/main">首页</a></li>
                    <li class="layui-nav-item"><a  href="${pageContext.request.contextPath}/user/goOrder">订单管理</a></li>
                    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/wuLiu/goLog">物流管理</a></li>
                    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/goStore">门店管理</a></li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="gao" href="javascript:;" style="color: #000000 !important;">收益管理</a>

                        <dl class="layui-nav-child">

                            <dd><a href="${pageContext.request.contextPath}/commission/goCommission"> &nbsp;&nbsp;产品销售收益</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/commission/goCommission"> &nbsp;&nbsp;流量收益</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/commission/goCommission"> &nbsp;&nbsp;广告收益</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/commission/goCommission"> &nbsp;&nbsp;保险收益</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="gao" href="javascript:;" style="background-color: #4bafff;border-radius: 0 5px 5px 0;box-shadow: #cde2fa;color: #000000 !important;">高级权限管理</a>

                        <dl class="layui-nav-child">

                            <dd><a style="color: #ffffff !important;
		          	    background-color: #009688;
					    box-shadow: #cde2fa;" href="${pageContext.request.contextPath}/user/goPermission"> &nbsp;&nbsp;权限管理</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/Recycle/goLook"> &nbsp;&nbsp;售后订单管理</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/store/goShenPi"> &nbsp;&nbsp;门店审批</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/Recycle/goRecycleBin"> &nbsp;&nbsp;订单回收站</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/user/goUserInfo"> &nbsp;&nbsp;系统账号管理</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/commission/goWithdraw"> &nbsp;&nbsp;佣金提现审核</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="">设置</a></li>
                </c:if>
                <c:if test="${userSession.companyId==4}">
                    <li  class="layui-nav-item" >
                        <a  href="${pageContext.request.contextPath}/user/main"
                        >首页</a></li>
                    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/goOrder">订单管理</a></li>
                    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/wuLiu/goLog">物流管理</a></li>
                    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/store/goStoreSon">门店管理</a></li>
                    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/commission/goCommission">佣金列表</a></li>
                    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/Recycle/goLookMe">售后订单管理</a></li>
                </c:if>
            </ul>
        </div>
    </div>

    <!-- 内容主体区域 -->
    <div class="layui-body" style="bottom: 0;">

        <!--权限等级布局-->
        <div class="title">
            <a class="panel-box-edit" onclick="window.history.go(-1)">返回</a>
            <a href="#" style="border-bottom: 3px solid #007DDB;">权限等级</a>

        </div>
        <!--一级、二级、三级权限-->
        <div class="mid" >
            <div class="mid1" >
                <div class="p2" >
                    一级权限
                </div>
                <ul>
                    <li style="margin-top: 18px;">管理所有系统用户账户</li>
                    <li>管理所有订单信息门店信息物流信息</li>
                    <li>审批所有下级的门店申请以及售后申请
                    </li>
                </ul>

            </div>
            <div class="mid1" >
                <div class="p2" >
                    二级权限
                </div>
                <ul>
                    <li style="margin-top: 18px;">申请门店</li>
                    <li>管理所属门店</li>
                    <li>审批所有门店的订单物流门店信息</li>
                </ul>
            </div>
            <div class="mid1"  >
                <div class="p2" >
                    三级权限
                </div>
                <ul>
                    <li style="margin-top: 18px;">查询订单信息</li>
                    <li>查询物流信息</li>
                    <li>查询收益信息</li>
                </ul>
            </div>
        </div>

        <!--权限管理列表-->
        <div class="low">
            <form>
                <table class="layui-table" style="position:absolute;width: 1600px;height: 400px;left: 50px;top: 20px;">
                    <thead>
                    <tr>
                        <th style="font-size: 16px;">部门名称</th>
                        <th style="font-size: 16px;">权限列表</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="3" style="font-size: 16px;">管理权限</td>
                        <td  style="font-size: 14px;">
                            <p class="p1"><input class="p3 tou" type="checkbox"  style="margin-left: 10px;"/>店铺权限</p>
                            <p class="p1">
                                <input type="checkbox" value="selectSTO" name="selectSTO" class="p3" style="margin-left: 10px;" />查询店铺概况
                                <input type="checkbox" value="insertSTO" name="insertSTO" class="p3">添加店铺
                                <input type="checkbox" value="deleteSTO" name="deleteSTO" class="p3">删除店铺
                                <input type="checkbox" value="updateSTO" name="updateSTO" class="p3">修改店铺
                                <input type="checkbox" value="lookSTO" name="lookSTO" class="p3">审批门店
                            </p>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <p class="p1"><input  type="checkbox" class="p3 tou" style="margin-left: 10px;"/>物流管理</p>
                            <p class="p1">
                                <input type="checkbox" value="selectWL" name="selectWL" class="p3" style="margin-left: 10px;"/>查询物流
                                <input type="checkbox" value="insertWL" name="insertWL" class="p3" />添加物流
                                <input type="checkbox" value="updateWL" name="updateWL" class="p3" />修改物流
                                <input type="checkbox" value="deleteWL" name="deleteWL" class="p3" />删除物流
                                <input type="checkbox" value="lookWL" name="lookWL" class="p3" />审批物流
                            </p>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <p class="p1"><input  type="checkbox" class="p3 tou"  style="margin-left: 10px;"/>订单信息管理</p>
                            <p class="p1">
                                <input type="checkbox" value="selectOrder" name="selectOrder" class="p3" style="margin-left: 10px;"/>订单基本信息
                                <input type="checkbox" value="insertOrder" name="insertOrder" class="p3" />添加订单
                                <input type="checkbox" value="updateOrder" name="updateOrder" class="p3" />修改订单
                                <input type="checkbox" value="deleteOrder" name="deleteOrder" class="p3" />删除订单
                                <input type="checkbox" value="lookOrder" name="lookOrder" class="p3">售后订单
                            </p>
                        </td>
                    </tr>
                    </tbody>
                </table>

            </form>
            <!--提交按钮-->
            <div class="low1">
                <span><input type="button" onclick="okc()" value="提交权限申请" id="xinxi"  style="color: #ffffff"/></span>
                <span><input type="button" value="返回" onclick="window.history.go(-1)" id="xinxi1"  /></span>

            </div>

            <!--设置分页-->
            <div id="test1" style=" position:absolute; right: 10%;bottom: 0;">

            </div>

            <!--底部版权-->
            <div class="layui-footer">

                <a href="#">© copy.com - 君务科技有限公司</a>
            </div>

            <!--js部分-->
            <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
            <script>
                //JavaScript代码区域
                layui.use('element', function(){
                    var element = layui.element;

                });
                layui.use('laypage', function(){
                    var laypage = layui.laypage;

                    //执行一个laypage实例
                    laypage.render({
                        elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
                        ,count: 50,
                        limit:10,
                        layout:['limit','prev', 'page', 'next','skip'],
                        limits:[10,20,30],
                        jump: function(obj, first){

                            //首次不执行
                            if(!first){
                                //do something

                            }
                        }
                    });
                });

                $(".tou").change(function chg () {
                    if($(this).prop("checked")==true){
                        $(this).parent().siblings().children().prop("checked",true);
                    }
                    if($(this).prop("checked")==false){
                        $(this).parent().siblings().children().prop("checked",false);
                    }

                })
                function okc(){
                    var list = $("input[type='checkbox']");
                    var boss = [];
                    for (var i=0;i<list.length;i++) {
                        if(list[i].checked==true){
                            boss.push(list[i].value);
                        }
                    }
                    alert("权限功能待完善");
                    //$.get("${pageContext.request.contextPath}/permission/givePermission?boss="+boss);
                }
            </script>


        </div></div></div>
</body>
</html>
