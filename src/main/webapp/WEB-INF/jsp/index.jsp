<%--
  Created by IntelliJ IDEA.
  User: 95POIUF6K4
  Date: 2019/8/19
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>主界面</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
</head>
<style>
    .panel-box-edit{

        cursor: pointer;
    }

</style>
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
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <c:if test="${userSession.companyId==1||userSession.companyId==2||userSession.companyId==3}">
                    <li  class="layui-nav-item" >
                        <a style="background-color: #4bafff;border-radius: 0 5px 5px 0;box-shadow: #cde2fa;" href="${pageContext.request.contextPath}/user/main">首页</a></li>
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
                        <a style="background-color: #4bafff;border-radius: 0 5px 5px 0;box-shadow: #cde2fa;" href="${pageContext.request.contextPath}/user/main"
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
        <div class="title"><a href="#">管理控制台</a></div>
        <div class="quyu">
            <!--省代-->
            <div class="shengdai guang">
                <div class="tu">
                    <img src="${pageContext.request.contextPath}/statics/images/shengdai.png"/>
                </div>
                <div class="wenzi">
                    <h2>68</h2>
                    <p>省代</p>
                </div>
            </div>

            <!--市代-->
            <div class="shengdai guang">
                <div class="tu">
                    <img src="${pageContext.request.contextPath}/statics/images/shidai.png"/>
                </div>
                <div class="wenzi">
                    <h2>21</h2>
                    <p>市代</p>
                </div>
            </div>
            <!--县代-->
            <div class="shengdai guang">
                <div class="tu">
                    <img src="${pageContext.request.contextPath}/statics/images/xiandai.png"/>
                </div>

                <div class="wenzi">
                    <h2>17</h2>
                    <p>县代</p>
                </div>
            </div>
            <!--门店-->
            <div class="shengdai guang">
                <div class="tu">
                    <img src="${pageContext.request.contextPath}/statics/images/mendian.png"/>
                </div>

                <div class="wenzi">
                    <h2>30</h2>
                    <p>门店</p>
                </div>
            </div>


        </div>

        <!--主体订单信息-->
        <div class="cont">

            <!--关键字搜索部分-->
            <div class="guanjian">
		  		<span class="seaching">
		  			<input type="text" name="dear" id="dear" placeholder="关键字搜索" />
		  			<img src="${pageContext.request.contextPath}/statics/images/sousuo.png"/>
		  		</span>

                <span class="quanbu">
		  			<a href="#" onclick="heyKong('all')" class="biaoqian">全部</a>
		  			<a href="#" onclick="heyKong('orderId')">订单号</a>
		  			<a href="#" onclick="heyKong('orderTime')">查询时间</a>
		  			<a href="#" onclick="heyKong('tradeName')">商品名称</a>
		  			<a href="#" onclick="heyKong('consigName')">收货人</a>
		  		</span>

            </div>



            <form class="content">

                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>订单编号</th>
                        <th>商品名称</th>
                        <th>订单价格</th>
                        <th>数量</th>
                        <th>订单时间</th>
                        <th>订单状态</th>
                        <th>发货门店</th>
                        <th>实付金额</th>
                        <th>收货人</th>
                    </tr>
                    </thead>
                    <tbody id="tableList">
                    <tr>
                        <td>A001</td>
                        <td>XXX</td>
                        <td>1388</td>
                        <td>1</td>
                        <td>未发货</td>
                        <td>xxx</td>
                        <td>1388</td>
                        <td>张三</td>

                        <td class="xiugai2"><a href="#">修改</a></td>
                    </tr>

                    </tbody>
                </table>
            </form>

            <!--底部分页设置-->
            <div id="test1" style="float: right; margin-right: 50px;"></div>



        </div>


        <div class="layui-footer">
            <!-- 底部固定区域 -->
            © copy.com - 君务科技有限公司
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
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
    function heyKong(who) {
        layui.use('laypage', function () {
            var laypage = layui.laypage;
            getData(0,10,who);
            var countnum = count;
            //执行一个laypage实例
            laypage.render({
                elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
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
        heyKong();

    })

    function getData(curr,limit,who) {
        var orderId = $("#orderId").val();
        var orderTime = $("#orderTime").val();
        var tradeName = $("#tradeName").val();
        var consigName = $("#consigName").val();
        var receiverAddress = $("#receiverAddress").val();
        var accountName = $("#accountName").val();
        var storeId = $("#storeId").val();
        var pageSize = limit;
        var pageId = curr;

        if(who=="orderId"){
            if($("#dear").val()==null||$("#dear").val()==''){
                layer.open({
                    title: '提示'
                    ,content: '请输入查询条件'
                });
            }
            orderId = $("#dear").val();
        }else if(who=="orderTime"){
            if($("#dear").val()==null||$("#dear").val()==''){
                layer.open({
                    title: '提示'
                    ,content: '请输入查询条件'
                });
            }
            orderTime = $("#dear").val();
        }else if(who=="tradeName"){
            if($("#dear").val()==null||$("#dear").val()==''){
                layer.open({
                    title: '提示'
                    ,content: '请输入查询条件'
                });
            }
            tradeName = $("#dear").val();
        }else if(who=="consigName"){
            if($("#dear").val()==null||$("#dear").val()==''){
                layer.open({
                    title: '提示'
                    ,content: '请输入查询条件'
                });
            }
            consigName = $("#dear").val();
        }


        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/user/findList",
            dataType: "json",
            data: {
                orderId: orderId,
                orderTime: orderTime,
                tradeName: tradeName,
                consigName:consigName,
                receiverAddress:receiverAddress,
                accountName:accountName,
                storeId:storeId,
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
                var list = result["list"];

                var html = "";
                $.each(list,function(index,item){
                    html+='<tr><td>'+item.orderId+'</td>';
                    html+='<td>'+item.tradeName+'</td>';
                    html+='<td>'+item.tradePrices+'</td>';
                    html+='<td>'+item.tradeOfGoods+'</td>';
                    html+='<td>'+item.time+'</td>';
                    html+='<td>'+item.statusName+'</td>';
                    html+='<td>'+item.storeName+'</td>';
                    html+='<td>'+item.amountPaid+'</td>';
                    html+='<td>'+item.consigName+'</td>';
                })
                $('#tableList').html(html);
                if(list==null||list==""){
                    //alert("空")
                    var html = "<tr ><td colspan='10' style='text-align: center'><h3>暂未搜索到相关数据</h3></td></tr>";

                    $('#tableList').html(html);
                }
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