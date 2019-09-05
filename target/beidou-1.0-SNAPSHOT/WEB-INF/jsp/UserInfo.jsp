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
    <title>用户账号管理</title>
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
                            <dd><a href="${pageContext.request.contextPath}/store/goShenPi"> &nbsp;&nbsp;门店审批</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/Recycle/goRecycleBin"> &nbsp;&nbsp;订单回收站</a></dd>
                            <dd><a style="color: #ffffff !important;
		          	    background-color: #009688;
					    box-shadow: #cde2fa;" href="${pageContext.request.contextPath}/user/goUserInfo"> &nbsp;&nbsp;系统账号管理</a></dd>
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
            <a class="panel-box-edit" onclick="window.history.back()">返回</a>
            <a href="${pageContext.request.contextPath}/user/goOrder">用户信息管理</a>
            <a href="${pageContext.request.contextPath}/user/register">注册新用户</a>
        </div>
        <form action="${pageContext.request.contextPath}/user/findUser" method="post">

            <!--查询条件-->
            <div class="quyu">
                <div class="coon">

<%--                    <p>--%>
<%--                        <span>账号ID：<input type="text" id="username" name="username" ></span>--%>
<%--                        <span>账号名称：<input type="text" id="userman" name="userman"></span>--%>
<%--                    </p>--%>
<%--                    <p style="margin-top: 10px">--%>
<%--                        选择部门：<select id="department" name="department" >--%>
<%--                        <option></option>--%>
<%--                        <option>研发人员</option>--%>
<%--                        <option>门店账号</option>--%>
<%--                        <option>电商专员</option>--%>
<%--                        <option>销售部</option>--%>
<%--                    </select>--%>

<%--                        <span>创建时间：<input type="text" id="creationTime" name="creationTime"></span>--%>
<%--                        <input type="button" onclick="okc()" class="layui-btn layui-btn-sm"  value="查询用户">--%>
<%--                    </p>--%>
    <!--查询条件-->
<%--    <span class="zixing">--%>
<%--                        所属门店：--%>
<%--                        <select name="storeId" id="storeId" lay-search class="wuliu">--%>
<%--                            <option></option>--%>
<%--                            <c:forEach var="sto" items="${store}" >--%>
<%--                                <option value="${sto.storeId}" <c:if test="${sessionList.storeId==sto.storeId}" >selected="selected"</c:if>>${sto.storeName}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </span>--%>
<%--    <span class="zixing" >--%>
<%--                                        查询条件：--%>
<%--                        <select name="baby" id="baby" lay-verify="" class="wuliu">--%>
<%--                            <option selected style="color: #999;">请选择</option>--%>
<%--                            <option value="orderId">订单编号</option>--%>
<%--                            <option value="orderTime">查询时间</option>--%>
<%--                            <option value="tradeName">商品名称</option>--%>
<%--                            <option value="consigName">收货人</option>--%>
<%--                            <option value="receiverAddress">收货地区</option>--%>
<%--                            <option value="accountName">买家名称</option>--%>
<%--                        </select>--%>
<%--                    </span>--%>




                <span class="zixing">
                                                    查询条件：
                    <select name="baby" id="baby" lay-verify="" class="wuliu">
                        <option selected style="color: #999;">请选择</option>
                        <option value="username">账号ID</option>
                        <option value="userman">账号名称</option>
                        <option value="department">选择部门</option>
                        <option value="creationTime">创建时间</option>
                    </select>
                 </span>

                    <span class="shuru" >
                        <input type="text" name="dear" id="dear"  placeholder="请输入条件" autocomplete="off">
                        <img src="${pageContext.request.contextPath}/statics/images/sou.png" style="position: relative; right: 35px;"/>
                    </span>

                <button class="btnA" type="button" onclick="okc()">开始查询</button>

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
                        <th>账号</th>
                        <th>用户名</th>
                        <th>创建时间</th>
                        <th>所属部门</th>
                        <th>权限等级</th>
                        <th>查看用户信息</th>
                        <th>管理权限</th>
                        <th>删除用户</th>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
    layui.use('layer', function(){
        var layer = layui.layer;

    });
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
                        var thename = $(obj).attr("username");
                        window.location.href="${pageContext.request.contextPath}/user/deleteUser?username="+thename;
                    }
                });

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
                        getData(obj.curr);
                    }
                }
            });

        });
    }
    $(function() {
        okc();

    })
    function getData(curr,limit) {
        var username = $("#username").val();
        var userman = $("#userman").val();
        var department = $("#department").val();
        var creationTime = $("#creationTime").val();
        var pageId = curr;

        var ai = $("#baby").val();
        if(ai=="username"){
            username = $("#dear").val();
        }else if(ai=="userman"){
            userman = $("#dear").val();
        }else if(ai=="department"){
            department = $("#dear").val();
        }else if(ai=="creationTime"){
            creationTime = $("#dear").val();
        }

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/user/findUser",
            dataType: "json",
            data: {
                username: username,
                userman: userman,
                department: department,
                creationTime:creationTime,
                pageIndex:pageId,
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
                    html+='<tr><td>'+item.username+'</td>';
                    html+='<td>'+item.userman+'</td>';
                    html+='<td>'+item.creationTime+'</td>';
                    html+='<td>'+item.department+'</td>';
                    html+='<td>'+item.companyId+'</td>';
                    html+='<td>查看(点击)</td>';
                    html+='<td><a href=\'${pageContext.request.contextPath}/user/goPermission\'>设置权限</a></td>';
                    html+='<td><a username=\''+ item.username+'\' onclick="isDelete(this)" class=\'panel-box-edit\'>删除用户</a> </td></tr>';
                })
                $('#tableList').html(html);

            },
            error: function(result) {
                console.log("失败");
            }
        });
    }

</script>
</body>
</html>
