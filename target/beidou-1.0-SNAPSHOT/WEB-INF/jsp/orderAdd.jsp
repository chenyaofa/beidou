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
    <title>订单添加</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/dingdanjia.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
    <style>

    </style>
</head>

<body>
<!--主体内容-->
<div class="dingadd">
    <div class="conadd">
        <!--顶部logo布局-->

        <div class="topadd">

            <img src="${pageContext.request.contextPath}/statics/images/logo.png"/>
            <span>君务订单管理系统</span>
        </div>

        <!--中间内容部分-->
        <div class="tianadd">
            <div class="moddle">

                <!--标题-添加订单-->
                <div class="ding-title">
                    <span>添加订单  |&nbsp;</span>
                    <span class="xiao">请输入订单信息</span>
                </div>
                <!--具体表单内容-->

                <div class="jia">
                    <form action="${pageContext.request.contextPath}/user/orderAdd" method="post" >
                        <div class="jia-con">
                            <!--左侧订单信息-->
                            <ul class="con-left">
                                <li>
                                    订单编号：
                                    <input type="text" maxlength="50" name="orderId" value="" />
                                </li>

                                <li>
                                    商品名称：
                                    <input type="text" maxlength="20" name="tradeName"  value="" />
                                </li>

                                <li>
                                    商品价格：
                                    <input type="text" maxlength="10" name="tradePrices" value="" />
                                </li>

                                <li>
                                    商品数量：
                                    <input type="text" maxlength="10" name="tradeOfGoods" value="" />
                                </li>

                                <li>
                                    实付金额：
                                    <input type="text" maxlength="10" name="amountPaid" value="" />
                                </li>

                                <li>
                                    下单平台：
                                    <select class="add-input" name="platformId" style="font-size: 15px; margin-left:0;margin-top: 0;">
                                        <option value="1">京东商城</option>
                                        <option value="2">淘宝商城</option>
                                        <option value="3">苏宁易购</option>
                                    </select>
                                </li><br>

                                <li >

<%--                                    <span class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->--%>
                                      订单时间： <input type="date" name="orderTime" style="font-size: 15px;" />
<%--                                    </span>--%>
<%--                                <span class="zixing">--%>
<%--                                    订单时间：--%>
<%--                                        <span class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->--%>
<%--                                          <input type="text" class="layui-input" id="test1">--%>
<%--                                        </span>--%>
<%--                                </span>--%>
                                </li>
                            </ul>

                            <!--右侧订单信息-->
                            <ul class="con-right">
                                <li>
                                    收&nbsp;货&nbsp;人：
                                    <input type="text" name="consigName" maxlength="10" value="" />
                                </li>

                                <li>
                                    买家账号：
                                    <input type="text" name="accountName" maxlength="18" value="" />
                                </li>

                                <li>
                                    手机号码：
                                    <input type="text" name="phoneNumber" maxlength="11" value="" />
                                </li>

                                <li>
                                    <span>订单状态：</span>

                                    <select class="add-input" name="orderStatus" style="margin-left:0; margin-top: 0;font-size: 15px;">
                                        <option value="1">未发货</option>
                                        <option value="2">已发货</option>
                                        <option value="3">已收货</option>
                                        <option value="4">交易成功</option>
                                        <option value="5">订单关闭</option>
                                        <option value="6">下单</option>
                                        <option value="7">付款</option>
                                    </select>
                                </li>

                                <li>
								<span data-toggle="distpicker" style="float: right; width:270px;">
									收货地址：
								  <select name="shen" data-province="请选择" class="add-input" style="float: right;font-size: 15px;"></select>
								  <select name="shi" data-city="请选择" class="add-input" style="float: right; margin-top: 20px;font-size: 15px;"></select>
								  <select name="xian" data-district="请选择" class="add-input" style="float:right; margin-top: 20px;font-size: 15px;"></select><br>
								  <input type="text" id="detailedness" maxlength="30" name="detailedness" style="margin-top: 20px; float: right;font-size: 15px;" />
                                    <input id="addr" name="receiverAddress"  type="hidden" />
								</span>
                                </li>

                            </ul>

                            <!--确认添加订单信息-->
                            <div class="queren">
                                <input type="button" onclick="getAdd()" value="确认添加订单信息" />

                                <a href="${pageContext.request.contextPath}/user/fanHui" >返回</a>
                            </div>

                        </div>
                    </form>
                </div>

            </div>



        </div>

    </div>

</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/distpicker.data.js"></script>
<script src="${pageContext.request.contextPath}/js/distpicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;

    });
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#orderTime' //指定元素
        });
    });
    function checkTime(){
        var reDate= /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/;
        var time = $("input[name='orderTime']").val();
        if(reDate.test(time))
        {
            return true;
        }
        return false;
    }
    function checkOrderId() {
        var orderId = $("input[name='orderId']").val();
        var okc = true;
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/user/checkOrderId",
            dataType: "json",
            data: {
                orderId: orderId,
            },
            async:false,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(resultId) {
                var orderCheck = resultId["orderCheck"];
                if(orderCheck[0]!=0){
                    layer.open({
                        title: '提示'
                        ,content: '订单号不能重复哦!'
                    });
                    //alert("订单号不能重复哦");
                    okc = false;

                }
            }
        });

        return okc;
    }
    function getAdd() {
        if($("#detailedness").val()!=""&&$("#detailedness").val()!=null){
            $("#addr").val($("select[name='shen']").val()+" "+$("select[name='shi']").val()+" "+$("select[name='xian']").val()+" "+$("#detailedness").val());
        }
        var reg = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;//验证价格数字
        var reg2 = /(^[1-9]\d*?$)/;//验证数量
        var okc = true;
        if($("input[name='orderId']").val()==""||$("input[name='orderId']").val()==null){
            okc = false;
        }
        if($("input[name='tradeName']").val()==""||$("input[name='tradeName']").val()==null){
            okc = false;
        }
        if($("input[name='tradePrices']").val()==""||$("input[name='tradePrices']").val()==null){
            okc = false;
        }
        if($("input[name='tradeOfGoods']").val()==""||$("input[name='tradeOfGoods']").val()==null){
            okc = false;
        }
        if($("input[name='amountPaid']").val()==""||$("input[name='amountPaid']").val()==null){
            okc = false;
        }
        if($("input[name='consigName']").val()==""||$("input[name='consigName']").val()==null){
            okc = false;
        }
        if($("input[name='accountName']").val()==""||$("input[name='accountName']").val()==null){
            okc = false;
        }
        if($("input[name='phoneNumber']").val()==""||$("input[name='phoneNumber']").val()==null){
            okc = false;
        }
        if($("#addr").val()==""||$("#addr").val()==null){
            okc = false;
        }
        if($("input[name='orderTime']").val()==""||$("input[name='orderTime']").val()==null){
            okc = false;
        }
        if(okc==true){
            var tryAgain = true;
            if(isNaN($("input[name='phoneNumber']").val())){
                layer.open({
                    title: '提示'
                    ,content: '联系方式应该为数字!'
                });
                tryAgain=false;
            }else if(!checkOrderId()){
                tryAgain=false;
            }else if($("input[name='phoneNumber']").val().length<11){
                layer.open({
                    title: '提示'
                    ,content: '手机号码必须为11位!'
                });
                tryAgain=false;
            }else if(!checkTime()){
                layer.open({
                    title: '提示'
                    ,content: '时间格式不正确!'
                });
                return false;
            }else if(!reg.test($("input[name='tradePrices']").val())) {
                layer.open({
                    title: '提示'
                    ,content: '价格格式不正确!'
                });
                tryAgain=false;
            }else if(!reg.test($("input[name='amountPaid']").val())) {
                layer.open({
                    title: '提示'
                    ,content: '价格格式不正确!'
                });
                tryAgain=false;
            }else if(!reg2.test($("input[name='tradeOfGoods']").val())){
                layer.open({
                    title: '提示'
                    ,content: '请输入正确的商品数量!'
                });
                return false;
            }
            if(tryAgain==true){

                $("form").submit();
            }

        }else{
            layer.open({
                title: '提示'
                ,content: '请填写完整的信息'
            });
            //alert("请填写完整的信息！");
        }


    }

</script>
</body>
</html>
