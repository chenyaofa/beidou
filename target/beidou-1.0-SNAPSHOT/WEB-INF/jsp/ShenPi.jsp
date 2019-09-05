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
    <title>门店申请审批</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
    <style>
        .panel-box-edit{

            cursor: pointer;
        }
        .coon2 {
            text-align: center;
            padding: 70px 0 0 40px;
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

                            <dd><a href="${pageContext.request.contextPath}/user/goPermission"> &nbsp;&nbsp;权限管理</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/Recycle/goLook"> &nbsp;&nbsp;售后订单管理</a></dd>
                            <dd><a style="color: #ffffff !important;
		          	    background-color: #009688;
					    box-shadow: #cde2fa;" href="${pageContext.request.contextPath}/store/goShenPi"> &nbsp;&nbsp;门店审批</a></dd>
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
    <div class="layui-body">

        <!--省代、市代、县代、门店布局-->
        <div class="title-wuliu">
            <a class="panel-box-edit" onclick="window.history.go(-1)" >返回</a>
            <a href="${pageContext.request.contextPath}/store/goShenPi">门店审批</a>
            <a href="${pageContext.request.contextPath}/store/goAddStore">申请门店</a>
        </div>

        <form  method="post">

            <!--查询条件-->
            <div class="quyu">
                <div class="coon2">
                    <div class="shenhe">
                        没有待审核门店，可以选择&nbsp;
                    </div>

                    <div class="reading">
                        <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/store/goAddStore'">注册门店</button>
                        <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/user/goStore'">查看门店</button>
                        <a href="${pageContext.request.contextPath}/store/goAddStore">注册门店</a>
                        <a href="${pageContext.request.contextPath}/user/goStore">查看门店</a>
                    </div>

                </div>
            </div>

            ${erro}
            <!--主体订单信息-->
            <div class="cont">

                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>门店编号</th>
                        <th>门店名称</th>
                        <th>门店店主</th>
                        <th>门店地址</th>
                        <th>门店联系方式</th>
                        <th>审核门店</th>
                    </tr>
                    </thead>
                    <tbody id="tableList">
                    <c:forEach items="${list}" var="sto">
                        <tr>
                            <td id="storeId">${sto.storeId}</td>
                            <td>${sto.storeName}</td>
                            <td>${sto.storeOwner}</td>
                            <td>${sto.shipAddress}</td>
                            <td>${sto.contactWay}</td>
                            <td>
                                <a storeId="${sto.storeId}" class="bingo  panel-box-edit"
                                   style="padding-right: 10px; color:#ffffff; width: 50px; height: 35px ; border-radius: 10px; background-color: #3290FD">审核通过</a>

                                <a storeId="${sto.storeId}" class="goback  panel-box-edit"
                                   style="padding-right: 10px; color:#ffffff; width: 50px; height: 35px ; border-radius: 10px; background-color: #3290FD"
                                >拒绝审核</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
            <div>
                <div align="center" id="test"></div>
            </div>
        </form>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © copy.com - 君务科技有限公司
    </div>
</div>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;

    });
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
    function bingo(obj) {
        layer.open({
            title:'提示',
            content: '确认审核通过吗?'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                var storeId = $(obj).attr("storeId");
                window.location.href="${pageContext.request.contextPath}/store/updateTongGuo?storeId="+storeId;

            }
        });
    }
    function goback(obj) {
        //审核不通过
        layer.open({
            title:'提示',
            content: '确认审核不通过吗?'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                var storeId = $(obj).attr("storeId");
                window.location.href="${pageContext.request.contextPath}/store/deleteStore?shenpi=1&storeId="+storeId;
            }
        });
    }
    var count = 0;//查询数量
    function okc() {
        layui.use('laypage', function () {
            var laypage = layui.laypage;
            getData(0);
            var countnum = count;
            //执行一个laypage实例
            laypage.render({
                elem: 'test' //注意，这里的 test1 是 ID，不用加 # 号
                , count: countnum,
                limit: 10,
                layout: [ 'prev', 'page', 'next', 'skip'],
                jump: function (obj, first) {
                    //obj包含了当前分页的所有参数，比如：
                    //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    //console.log(obj.limit); //得到每页显示的条数

                    //首次不执行
                    if (!first) {
                        //getData(obj.curr);
                        getData(obj.curr, obj.limit);
                    }
                }
            });

        });
    }
    $(function() {
        okc();

    })
    function getData(curr,limit) {
        var pageId = curr;
        var pageSize = limit;
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/store/selectShenPi",
            dataType: "json",
            data: {
                pageIndex:pageId,
                pageSize:pageSize,
            },
            async:false,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(result) {
                //获得分页对象
                var pages = result["pages"];
                count=pages[0].totalCount;
                var list = result["list"];
                var html = "";
                $.each(list,function(index,item){
                    html+='<tr><td>'+item.storeId+'</td>';
                    html+='<td>'+item.storeName+'</td>';
                    html+='<td>'+item.storeOwner+'</td>';
                    html+='<td>'+item.shipAddress+'</td>';
                    html+='<td>'+item.contactWay+'</td>';
                    html+='<td><a storeId=\''+ item.storeId+'\' onclick="bingo(this)" class=\'bingo  panel-box-edit\' ' +
                        'style="color: #ffffff;width: 84px;height: 37px;line-height: 37px;border-radius: 20px;text-align: center;background-color: #3290FD;display: inline-block;margin-right: 10px;" >审核通过</a> ';

                    html+='<a storeId=\''+ item.storeId+'\' onclick="goback(this)" class=\'goback  panel-box-edit\'' +
                        ' style="color: #ffffff;width: 84px;height: 37px;line-height: 37px;border-radius: 20px;text-align: center;background-color: #3290FD;display: inline-block;" >拒绝审核</a></td></tr>';
                })
                $('#tableList').html(html);

            },
            error: function(result) {
                layer.open({
                    title: '提示'
                    ,content: '没有您要查询的数据'
                });
                console.log("失败");
            }
        });
    }
</script>
</body>
</html>
