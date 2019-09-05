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
    <title>提现审核列表</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <style>
        .piliang{
            width: 300px;
            margin:20px auto;
        }
        .piliang input{
            width: 120px;
            height: 40px;
            border-radius: 3px;
            outline: none;
            border: 1px solid #bfbfbf;

        }

        .panel-box-edit{
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            width: 68px;
            height: 32px;
            line-height: 32px;
            text-align: center;
            border-radius: 17px;
            background-color: #3290FD;
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
                            <dd><a href="${pageContext.request.contextPath}/user/goUserInfo"> &nbsp;&nbsp;系统账号管理</a></dd>
                            <dd><a style="color: #ffffff !important;
		          	    background-color: #009688;
					    box-shadow: #cde2fa;" href="${pageContext.request.contextPath}/commission/goWithdraw"> &nbsp;&nbsp;佣金提现审核</a></dd>
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
            <a style="cursor: pointer;" onclick="window.history.back()">返回</a>
            <a href="${pageContext.request.contextPath}/commission/goWithdraw">佣金提现审核</a>

        </div>
        <form action="" method="post">

            <!--查询条件-->
            <div class="quyu">
                <div class="coon">


                        <span class="zixing">店铺名称：
                        <select name="storeId" id="storeId" class="wuliu">
                            <option></option>

                        </select>
                    </span>
                        <span class="zixing">
                        时间范围：<input type="date" name="beginTime" id="beginTime" class="wuliu"/>到<input type="date" name="overTime" id="overTime" class="wuliu"/></span>


                        <span>
                        <select id="se" onchange="okc()">
                            <option value="0">快速查看</option>
                            <option value="1">最近七天</option>
                            <option value="2">最近一个月</option>
                        </select>
                    <input type="button" class="btnA" onclick="okc()" value="查询" />
                        </span>
<%--                    提现状态：--%>
<%--                    <button type="button" onclick="changeStatus(0)" class="layui-btn layui-btn-sm layui-btn-primary">--%>
<%--                        待审核--%>
<%--                    </button>--%>
<%--                    <button type="button" onclick="changeStatus(1)" style="margin: 0;" class="layui-btn layui-btn-sm layui-btn-primary">--%>
<%--                        已审核--%>
<%--                    </button>--%>
<%--                    <button type="button" onclick="changeStatus(2)" style="margin: 0;" class="layui-btn layui-btn-sm layui-btn-primary">--%>
<%--                        已驳回--%>
<%--                    </button>--%>
<%--                    <button type="button" onclick="changeStatus(3)" style="margin: 0" class="layui-btn layui-btn-sm layui-btn-primary">--%>
<%--                        全部--%>
<%--                    </button>--%>
                <span style="display: none" id="status" ></span>
            </span>


                </div>
            </div>
            <!--提现状态-->
            <div class="zhuangtai">
                <span>提现状态：</span>
                <input type="button" name="" onclick="changeStatus(0)" value="待审核" class="zhuangtai"/>
                <input type="button" name="" onclick="changeStatus(1)" value="已审核" class="zhuangtai"/>
                <input type="button" name="" onclick="changeStatus(2)" value="已驳回" class="zhuangtai"/>
                <input type="button" name="" onclick="changeStatus(3)" value="全部" class="zhuangtai"/>
            </div>
            ${erro}
            <!--主体订单信息-->
            <div class="cont">

                <table class="layui-table">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="allClick" >全选</th>
                        <th>店铺名称</th>
                        <th>申请时间</th>
                        <th>提现金额</th>
                        <th>账号类型</th>
                        <th>账号、卡号</th>
                        <th>收款人</th>
                        <th>审核与驳回</th>
                    </tr>
                    </thead>
                    <tbody id="tableList">

                    </tbody>
                </table>
                <!--批量审核-->
                <div class="piliang">
                    <input type="button" name="" id="isPass" value="批量审核" style="margin-right:30px;"/>
                    <input type="button" name="" id="isReject" value="批量驳回" />
                </div>

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
                        getData(obj.curr);
                    }
                }
            });

        });
    }
    $(function() {
        okc();

    })
    function changeStatus(num) {
        $("#status").text(num);
        //getData(0);
        okc();
    }
    function getData(curr) {
        var beginTime = $("#beginTime").val();
        var overTime = $("#overTime").val();
        var storeId = $("#storeId").val();
        if(storeId=="请选择"){
            storeId="";
        }
        var pageId = curr;
        var timeNum = $("#se").val();
        var status = $("#status").text();

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/commission/selectWithdraw",
            dataType: "json",
            data: {
                beginTime: beginTime,
                overTime:overTime,
                storeId:storeId,
                pageIndex:pageId,
                timeNumber:timeNum,
                status:status,
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
                    html+='<tr><td><input type="checkbox" name="commission" value=\''+ item.id +'\' /></td>';
                    html+='<td>'+item.storeName+'</td>';
                    html+='<td>'+item.time+'</td>';
                    html+='<td>'+item.money+'</td>';
                    html+='<td>'+item.accountType+'</td>';
                    html+='<td>'+item.cardNumber+'</td>';
                    html+='<td>'+item.payee+'</td>';
                    if(item.withdrawalState==0){
                        html+='<td><a winid=\"'+ item.id +'\" class="panel-box-edit" onclick="Audit(this)">审核</a> &nbsp;';
                        html+='<a winid=\"'+ item.id +'\" class="panel-box-edit" onclick="reject(this)">驳回</a></td>';
                    }else{
                        html+='<td>已审核</td>';
                    }

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
    $("#allClick").change(function ok () {
        if ($(this).prop("checked")==true) {
            var boxs = $("input[name='commission']");
            boxs.prop("checked",true);
        }
        if ($(this).prop("checked")==false) {
            var boxs = $("input[name='commission']");
            boxs.prop("checked",false);
        }
    })
    function Audit(obj) {
        //alert("弹出消息框，显示申请日期、申请金额（金额可以修改）、收款账号、收款人、账号类型以及确认、关闭按钮");
        // var okc= confirm("申请日期,申请金额、收款账号、收款人、账号类型自己看");
        layer.open({
            title:'提示',
            content: '确定审核通过？'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                var id = $(obj).attr("winid");
                window.location.href="${pageContext.request.contextPath}/commission/pass?id="+id;

            }
        });

    }
    function reject(obj) {
        layer.open({
            title:'提示',
            content: '确认驳回吗？'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                var tem = obj;
                var theId = $(tem).attr("winid");
                window.location.href="${pageContext.request.contextPath}/commission/reject?id="+theId;
            }
        });

    }
    $("#isReject").click(function(){

        layer.open({
            title:'提示',
            content: '确认全部驳回吗？'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                var every = $("input[name='commission']");
                var val = [];
                for (i=0;i<every.length;i++) {
                    if(every[i].checked==true){
                        val.push(every[i].value);
                    }
                }
                if(val==null || val==''){
                    layer.open({
                        title: '提示'
                        ,content: '请选择列表'
                    });
                    return;
                }
                //var hint = prompt("请输入驳回理由");
                layer.open({
                    content: '驳回成功！'
                    ,btn: ['确定']
                    ,yes: function(index, layero){
                        //按钮【按钮一】的回调
                        window.location.href="${pageContext.request.contextPath}/commission/rejectAll?list="+val;
                    }
                });

            }
        });

    })
    $("#isPass").click(function(){
        layer.open({
            title:'提示',
            content: '确认全部审核通过吗？'
            ,btn: ['确认', '取消']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                var hipHip = $("input[name='commission']");
                var val =[];
                for(i=0;i<hipHip.length;i++){
                    if(hipHip[i].checked==true){
                        val.push(hipHip[i].value);
                    }
                }
                if(val==null || val==''){
                    layer.open({
                        title: '提示'
                        ,content: '请选择列表'
                    });
                    return;
                }
                layer.open({
                    content: '审批成功！'
                    ,btn: ['确定']
                    ,yes: function(index, layero){
                        //按钮【按钮一】的回调
                        window.location.href="${pageContext.request.contextPath}/commission/passAll?list="+val;
                    }
                });



            }
        });
    })

</script>
</body>
</html>
