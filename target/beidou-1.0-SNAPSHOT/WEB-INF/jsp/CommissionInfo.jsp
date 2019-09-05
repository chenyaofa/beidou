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
    <title>佣金列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
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
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <c:if test="${userSession.companyId==1||userSession.companyId==2||userSession.companyId==3}">
                    <li  class="layui-nav-item" >
                        <a href="${pageContext.request.contextPath}/user/main">首页</a></li>
                    <li class="layui-nav-item"><a  href="${pageContext.request.contextPath}/user/goOrder">订单管理</a></li>
                    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/wuLiu/goLog">物流管理</a></li>
                    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/goStore">门店管理</a></li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="gao" href="javascript:;" style="background-color: #4bafff;border-radius: 0 5px 5px 0;box-shadow: #cde2fa;color: #000000 !important;">收益管理</a>

                        <dl class="layui-nav-child">

                            <dd><a style="color: #ffffff !important;
		          	    background-color: #009688;
					    box-shadow: #cde2fa;" href="${pageContext.request.contextPath}/commission/goCommission"> &nbsp;&nbsp;产品销售收益</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/user/goONE"> &nbsp;&nbsp;流量收益</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/user/goONEE"> &nbsp;&nbsp;广告收益</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/user/goONEEE"> &nbsp;&nbsp;保险收益</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="gao" href="javascript:;" style="color: #000000 !important;">高级权限管理</a>

                        <dl class="layui-nav-child">

                            <dd><a href="${pageContext.request.contextPath}/user/goPermission"> &nbsp;&nbsp;权限管理</a></dd>
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
                    <li class="layui-nav-item"><a style="background-color: #4bafff;border-radius: 0 5px 5px 0;box-shadow: #cde2fa;" href="${pageContext.request.contextPath}/commission/goCommission">佣金列表</a></li>
                    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/Recycle/goLookMe">售后订单管理</a></li>
                </c:if>
            </ul>
        </div>
    </div>

    <!-- 内容主体区域 -->
    <div class="layui-body">

        <!--省代、市代、县代、门店布局-->
        <div class="title-wuliu">

            <a class="panel-box-edit" onclick="window.history.go(-1)">返回</a>
            <a href="${pageContext.request.contextPath}/commission/goCommission">佣金列表</a>
            <a href="${pageContext.request.contextPath}/commission/tiXian">提现申请</a>
        </div>
        <form action="${pageContext.request.contextPath}/commission/goCommission" method="post">

            <!--查询条件-->
            <div class="quyu" style="height: 160px">
                <div class="coon" style="padding-left: 100px">

                    <span class="zixing">店铺名称：
                        <select name="storeId" id="storeId" class="wuliu">
                            <option></option>

                        </select>
                    </span>
                    <span class="zixing">


                        下单平台：
                        <select name="platformId" id="platformId" class="wuliu">
                            <option value="">请选择</option>
                            <option value="1">京东商城</option>
                            <option value="2">淘宝商城</option>
                            <option value="3">苏宁易购</option>
                        </select></span>
                    <span class="zixing">
                        订单号：<input type="text" name="orderId" id="orderId" class="wuliu"/>
                    </span>
<%--                        <input type="reset" value="清楚查询条件" class="layui-btn layui-btn-primary layui-btn-sm" />--%>
                        <span class="zixing">
                        时间范围：<input type="text" name="beginTime" id="beginTime" class="wuliu"/>到<input type="text" name="overTime" id="overTime" class="wuliu"/></span>
                    <span style="padding-left: 500px;padding-top: 10px">
                        <select id="se" onchange="okc()" class="wuliu" style="width: 180px; margin-top: 20px; margin-right: 20px;">
                            <option value="0">快速查看</option>
                            <option value="1">最近七天</option>
                            <option value="2">最近一个月</option>
                        </select>
<%--                    <input type="button" onclick="okc()" class="layui-btn layui-btn-sm" value="查询" />--%>
                    <button class="btnA" type="button" onclick="okc()">开始查询</button></span>
                </div>
            </div>

            <!--主体订单信息-->
            <div class="cont">

                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>店铺名称</th>
                        <th>下单平台</th>
                        <th>订单号</th>
                        <th>订单时间</th>
                        <th>佣金金额</th>
                        <th>删除</th>
                    </tr>
                    </thead>
                    <tbody id="tableList">

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
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#beginTime'
        });
        laydate.render({
            elem:'#overTime'//指定元素
        });
    });
</script>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;

    });

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
                layout: ['limit', 'prev', 'page', 'next', 'skip'],
                limits: [10, 20, 30],
                jump: function (obj, first) {
                    //obj包含了当前分页的所有参数，比如：
                    //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    //console.log(obj.limit); //得到每页显示的条数

                    //首次不执行
                    if (!first) {
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
        var orderId = $("#orderId").val();
        var platformId = $("#platformId").val();

        var beginTime = $("#beginTime").val();
        var overTime = $("#overTime").val();
        var storeId = $("#storeId").val();
        if(storeId=="请选择"){
            storeId="";
        }
        var pageId = curr;
        var pageSize = limit;
        var timeNum = $("#se").val();

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/commission/selectCommission",
            dataType: "json",
            data: {
                orderId: orderId,
                beginTime: beginTime,
                platformId: platformId,
                overTime:overTime,
                storeId:storeId,
                pageIndex:pageId,
                timeNumber:timeNum,
                pageSize:pageSize,
            },
            async:false,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(result) {
                //alert("ajax返回数据");
                //获得分页对象
                var pages = result["pages"];
                count=pages[0].totalCount;
                var list = result["list"];
                //alert(pages[0].totalCount);
                var store = result["store"];
                //alert($("#storeId").val()!=null && $("#storeId").val()!='');
                if($("#storeId").val()==null || $("#storeId").val()=='') {
                    var thestore = "";
                    thestore += '<option>请选择</option>';
                    $.each(store, function (index, item) {
                        thestore += '<option value=\'' + item.storeId + '\' >' + item.storeName + '</option>';
                    })
                    $('#storeId').html(thestore);
                }
                var html = "";
                $.each(list,function(index,item){
                    html+='<tr><td>'+item.storeName+'</td>';
                    html+='<td>'+item.platformName+'</td>';
                    html+='<td>'+item.orderId+'</td>';
                    html+='<td>'+item.time+'</td>';
                    html+='<td>'+item.brokerage+'</td>';
                    html+='<td><a orderId=\''+item.orderId+'\' class=\'panel-box-edit\' onclick="isDelete(this)" >删除</a> </td>';
                })
                $('#tableList').html(html);

            },
            error: function(result) {

                layer.open({
                    title: '提示'
                    ,content: '没有您要查询的数据!'
                });
                console.log("失败");
            }
        });
    }
    function isDelete(obj) {
        layer.open({
            title:'提示',
            content: '您确定删除这条记录吗'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                var tem = obj;
                var theId = $(tem).attr("orderId");
                $.post("${pageContext.request.contextPath}/commission/delCommission",{orderId:theId},function(result){
                    layer.open({
                        title: '提示'
                        ,content: '删除成功!'
                    });
                    getData(0);
                });

            }
        });
    }
</script>
</body>
</html>
