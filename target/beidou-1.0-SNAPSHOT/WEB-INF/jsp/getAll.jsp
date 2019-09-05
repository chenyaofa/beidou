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
    <title>批量操作</title>
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
                    账户名称
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
                    <li class="layui-nav-item"><a style="background-color: #4bafff;border-radius: 0 5px 5px 0;box-shadow: #cde2fa;" href="${pageContext.request.contextPath}/user/goOrder">订单管理</a></li>
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
                    <li class="layui-nav-item"><a style="background-color: #4bafff;border-radius: 0 5px 5px 0;box-shadow: #cde2fa;" href="${pageContext.request.contextPath}/user/goOrder">订单管理</a></li>
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

            <a class="panel-box-edit" onclick="window.history.go(-1)">返回</a>

        </div>
        <form action="${pageContext.request.contextPath}/wuLiu/findLog" method="post">

            <!--查询条件-->
            <div class="quyu">
                <div class="coon">

                    <span class="zixing" style="line-height: 30px">
                        商品状态：
                        <select name="orderStatus" id="orderStatus" class="wuliu">
                            <option ></option>
                            <option value="1">未发货</option>
                            <option value="2">已发货</option>
                            <option value="3">已收货</option>
                            <option value="4">交易成功</option>
                            <option value="5">订单关闭</option>
                            <option value="6">下单</option>
                            <option value="7">付款</option>
                        </select>
                        </span>
                    <span class="zixing" style="margin-right: 15px">
                        订单时间：
                        <input type="text" id="orderTime" name="orderTime" class="wuliu" >
                        </span>
                        <input type="button" onclick="okc()" class="btnA" name="" value="查询">




<%--                    <p>--%>
<%--                        <input type="button" id="isDelete" class="btnA" value="一键删除">--%>
<%--                        请选择您要修改的状态：--%>
<%--                        <select id="orderStatusB" name="orderStatusB" class="wuliu">--%>
<%--                            <option></option>--%>
<%--                            <option value="1">未发货</option>--%>
<%--                            <option value="2">已发货</option>--%>
<%--                            <option value="3">已收货</option>--%>
<%--                            <option value="4">交易成功</option>--%>
<%--                            <option value="5">订单关闭</option>--%>
<%--                            <option value="6">下单</option>--%>
<%--                            <option value="7">付款</option>--%>
<%--                        </select>--%>
<%--                        <input type="button" name="go" class="btnA" id="justGo" value="一键修改状态">--%>
<%--                    </p>--%>
                </div>
            </div>
            <div class="zhuangtai" style="margin-bottom: 20px;margin-left: 25px;">

                请选择您要修改的状态：
                <select id="orderStatusB" name="orderStatusB" class="wuliu">
                    <option></option>
                    <option value="1">未发货</option>
                    <option value="2">已发货</option>
                    <option value="3">已收货</option>
                    <option value="4">交易成功</option>
                    <option value="5">订单关闭</option>
                    <option value="6">下单</option>
                    <option value="7">付款</option>
                </select>
                <input style="margin-right: 10px;margin-left: 15px" type="button" name="go" class="btnA" id="justGo" value="一键修改">
                <input type="button" id="isDelete" class="btnA" value="一键删除" >
            </div>
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
                        <th><label><input type="checkbox" id="allClick" name="allorder" value="全选">全选 </label></th>
                        <th>订单编号</th>
                        <th>商品名称</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>订单状态</th>
                        <th>发货门店</th>
                        <th>实付金额</th>
                        <th>收货人</th>
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

        <!--底部分页设置-->
        <div id="test1" style="float: right; margin-right: 50px;"></div>


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
</script>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;

    });
    $("#isDelete").click(function ss () {

        layer.open({
            title:'提示',
            content: '确认永久删除吗'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                layer.open({
                    content: '删除成功'
                    ,btn: ['确定']
                    ,yes: function(index, layero){
                        //按钮【按钮一】的回调
                        var every = $("input[name='order']");
                        var val = [];
                        for (i=0;i<every.length;i++) {
                            if(every[i].checked==true){
                                val.push(every[i].value);
                            }
                        }
                        window.location.href="${pageContext.request.contextPath}/user/DeleteAll?deleteList="+val;
                    }
                });

            }
        });

    })
    $("#justGo").click(function biu(){
        if($("#orderStatusB").val()==null||$("#orderStatusB").val()==""){
            layer.open({
                title: '提示'
                ,content: '请选择修改状态'
            });
            return;
        }
        layer.open({
            title:'提示',
            content: '确认修改'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                layer.open({
                    content: '修改成功'
                    ,btn: ['确定']
                    ,yes: function(index, layero){
                        //按钮【按钮一】的回调
                        var status = $("#orderStatusB").val();
                        var hipHip = $("input[name='order']");
                        var val =[];
                        for(i=0;i<hipHip.length;i++){
                            if(hipHip[i].checked==true){
                                val.push(hipHip[i].value);
                            }
                        }
                        //$.get("${pageContext.request.contextPath}/user/UpdateAll?updateList="+val+"&orderStatus="+status);
                        window.location.href="${pageContext.request.contextPath}/user/UpdateAll?updateList="+val+"&orderStatus="+status;
                    }
                });

            }
        });
    })

    $("#allClick").change(function ok () {
        if ($(this).prop("checked")==true) {
            var boxs = $("input[name='order']");
            boxs.prop("checked",true);
        }
        if ($(this).prop("checked")==false) {
            var boxs = $("input[name='order']");
            boxs.prop("checked",false);
        }
    })

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
                limit: 5,
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
        var orderStatus = $("#orderStatus").val();
        var orderTime = $("#orderTime").val();
        var pageSize = limit;
        var pageId = curr;


        $.ajax({

            type: "POST",
            url: "${pageContext.request.contextPath}/user/getAllOrder",
            dataType: "json",
            data: {
                orderStatus: orderStatus,
                orderTime: orderTime,
                pageSize:pageSize,
                pageIndex:pageId,
            },
            async:false,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(result) {
                //alert("ajax返回数据");
                //获得分页对象
                var pages = result["pages"];
                count=pages[0].totalCount;
                //计算获得当前的数据量  当然这里这个值也可以从后台一块传来
                var list = result["list"];
                //alert(pages[0].totalCount);

                var html = "";
                $.each(list,function(index,item){
                    html+='<tr><td><input type=\'checkbox\' name=\'order\' value=\''+ item.orderId+'\'></td>';
                    html+='<td>'+item.orderId+'</td>';
                    html+='<td>'+item.tradeName+'</td>';
                    html+='<td>'+item.tradePrices+'</td>';
                    html+='<td>'+item.tradeOfGoods+'</td>';
                    html+='<td>'+item.statusName+'</td>';
                    html+='<td>'+item.storeName+'</td>';
                    html+='<td>'+item.amountPaid+'</td>';
                    html+='<td>'+item.consigName+'</td>';
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
