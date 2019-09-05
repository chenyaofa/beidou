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
    <title>门店管理</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
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
                        <a  href="${pageContext.request.contextPath}/user/main">首页</a></li>
                    <li class="layui-nav-item"><a  href="${pageContext.request.contextPath}/user/goOrder">订单管理</a></li>
                    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/wuLiu/goLog">物流管理</a></li>
                    <li class="layui-nav-item"><a style="background-color: #4bafff;border-radius: 0 5px 5px 0;box-shadow: #cde2fa;" href="${pageContext.request.contextPath}/user/goStore">门店管理</a></li>
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
            <a href="${pageContext.request.contextPath}/user/main">返回主界面</a>
            <a href="${pageContext.request.contextPath}/user/goStore">门店信息管理</a>
            <a href="${pageContext.request.contextPath}/store/goAddStore">添加门店信息</a>
        </div>
        <form action="${pageContext.request.contextPath}/user/goStore" method="post">

            <!--查询条件-->
            <div class="quyu">
                <div class="coon">
<%--                    <p style="line-height: 30px"><span>门店编号：<input name="storeId" class="search"  id="storeId" <c:if test="${sessionList.storeId!=null && sessionList.storeId!=0}">value="${sessionList.storeId}" </c:if> type="text" /></span>--%>
<%--                        <span>门店名称：<input name="storeName"class="search"  id="storeName" type="text" <c:if test="${sessionList.storeName!=null}">value="${sessionList.storeName}" </c:if> /></span>--%>
<%--                        <span>门店店主：<input name="storeOwner" class="search" id="storeOwner" type="text" <c:if test="${sessionList.storeOwner!=null}">value="${sessionList.storeOwner}" </c:if>/> </span></p>--%>
<%--                    <p style="line-height: 30px"><span>联系方式：<input name="contactWay" class="search" id="contactWay" type="text" <c:if test="${sessionList.contactWay!=null}">value="${sessionList.contactWay}" </c:if>/></span>--%>
<%--                        <span>门店地址：<input name="shipAddress" class="search" id="shipAddress" type="text" <c:if test="${sessionList.shipAddress!=null}">value="${sessionList.shipAddress}" </c:if> /></span>--%>
<%--                        <input name="getmoeny" type="button" onclick="okc()" class="layui-btn layui-btn-sm"  value="点击查询门店信息" />--%>
<%--                    </p>--%>
                        <span class="zixing" >
                                                            查询条件：
                            <select name="baby" id="baby" lay-verify="" class="wuliu">
                                <option selected style="color: #999;">请选择</option>
                                <option value="storeId">门店编号</option>
                                <option value="storeName">门店名称</option>
                                <option value="storeOwner">门店店主</option>
                                <option value="contactWay">联系方式</option>
                                <option value="shipAddress">门店地址</option>
                            </select>
                        </span>

                        <span class="shuru" >
                            <input type="text" name="dear" id="dear"  placeholder="请输入条件" autocomplete="off">
                            <img src="${pageContext.request.contextPath}/statics/images/sou.png" style="position: relative; right: 35px;"/>
                        </span>
                        <button class="btnA" type="button" onclick="okc()">开始查询</button>
                </div>
            </div>

            <!--主体订单信息-->
            <div class="cont">

                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>门店编号</th>
                        <th>门店名称</th>
                        <th>门店店主</th>
                        <th>联系方式</th>
                        <th>门店地址</th>
                        <th>所属账号</th>
                        <th colspan="2">修改与删除</th>
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
    function isDelete(obj) {
        layer.open({
            title:'提示',
            content: '您确定删除这条记录吗'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                layer.open({
                    content: '删除成功'
                    ,btn: ['确定']
                    ,yes: function(index, layero){
                        //按钮【按钮一】的回调
                        var tem = obj;
                        var theId = $(tem).attr("storeId");
                        window.location.href="${pageContext.request.contextPath}/store/deleteStore?storeId="+theId;
                    }
                });

            }
        });
    }
        function getData(curr,limit) {
            var storeId = $("#storeId").val();
            var storeName = $("#storeName").val();
            var storeOwner = $("#storeOwner").val();
            var contactWay = $("#contactWay").val();
            var shipAddress = $("#shipAddress").val();
            var pageSize = limit;
            var pageId = curr;

            var ai = $("#baby").val();
            if(ai=="storeId"){
                storeId = $("#dear").val();
            }else if(ai=="storeName"){
                storeName = $("#dear").val();
            }else if(ai=="storeOwner"){
                storeOwner = $("#dear").val();
            }else if(ai=="contactWay"){
                contactWay = $("#dear").val();
            }else if(ai=="shipAddress"){
                shipAddress = $("#dear").val();
            }

            $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/store/findStore",
            dataType: "json",
            data: {
                storeId: storeId,
                storeName: storeName,
                storeOwner: storeOwner,
                contactWay:contactWay,
                shipAddress:shipAddress,
                pageIndex:pageId,
                pageSize:pageSize,
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
                    html+='<tr><td>'+item.storeId+'</td>';
                    html+='<td>'+item.storeName+'</td>';
                    html+='<td>'+item.storeOwner+'</td>';
                    html+='<td>'+item.contactWay+'</td>';
                    html+='<td>'+item.shipAddress+'</td>';
                    html+='<td>'+item.username +'</td>';
                    html+='<td class=\'xiugai\'><a storeId=\''+item.storeId+'\' class=\'isUpdate\' name=\'xiu\' href=\'${pageContext.request.contextPath}/store/goUpdateStore?storeId='+item.storeId+'\' title=\'修改订单信息\'><img src=\'${pageContext.request.contextPath}/statics/images/bianji.png\'/>修改</a>';
                    html+='<a storeId=\''+item.storeId+'\' class=\'panel-box-edit\' onclick="isDelete(this)" title=\'删除订单信息\'><img src=\'${pageContext.request.contextPath}/statics/images/qudiao.png\'/>删除</a></tr>';
                })
                $('#tableList').html(html);


            },
            error: function(result) {
                alert("没有您要查询的数据");
                console.log("失败");
            }
        });
    }

</script>
</body>
</html>
