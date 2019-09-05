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
    <title>订单修改</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/dingdanjia.css">
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
                    <span>修改订单  |&nbsp;</span>
                    <span class="xiao">请输入订单信息</span>
                </div>
                <!--具体表单内容-->

                <div class="jia">
                    <form action="${pageContext.request.contextPath}/user/orderUpdate"  method="post" >
                        <div class="jia-con">
                            <!--左侧订单信息-->
                            <ul class="con-left">
                                <li>
                                    订单编号：
                                    <input type="text" value="${upList.orderId}" style="border: none" onfocus=this.blur() maxlength="50" name="orderId"  />
                                </li>

                                <li>
                                    商品名称：
                                    <input type="text" maxlength="20"  value="${upList.tradeName}" name="tradeName"  />
                                </li>

                                <li>
                                    商品价格：
                                    <input type="text" maxlength="10" value="${upList.tradePrices}"  name="tradePrices"  />
                                </li>

                                <li>
                                    商品数量：
                                    <input type="text" maxlength="10" value="${upList.tradeOfGoods}"  name="tradeOfGoods" />
                                </li>

                                <li>
                                    实付金额：
                                    <input type="text" maxlength="10" value="${upList.amountPaid}"  name="amountPaid"  />
                                </li>

                                <li>
                                    下单平台：
                                    <select class="add-input" name="platformId" style="margin-left:0;margin-top: 0;font-size: 15px;">
                                        <option value="1" <c:if test="${upList.platformId==1}">selected="selected"</c:if> >京东商城</option>
                                        <option value="2"  <c:if test="${upList.platformId==2}">selected="selected"</c:if> >淘宝商城</option>
                                        <option value="3"  <c:if test="${upList.platformId==3}">selected="selected"</c:if> >苏宁易购</option>
                                    </select>
                                </li><br>

                                <li>
                                    订单时间：
							        <input type="date" value="${time}"  name="orderTime" />


                                </li>
                                <li>
                                    门店名称：
                                    <select class="add-input" name="storeId"  style="margin-left:0;margin-top: 0;font-size: 15px;">
                                        <c:forEach var="sto" items="${store}" >
                                            <option value="${sto.storeId}" <c:if test="${upList.storeId==sto.storeId}" >selected="selected"</c:if>>${sto.storeName}</option>
                                        </c:forEach>
                                    </select>
                                </li>
                            </ul>

                            <!--右侧订单信息-->
                            <ul class="con-right">
                                <li>
                                    收&nbsp;货&nbsp;人：
                                    <input type="text" name="consigName" value="${upList.consigName}"  maxlength="10" />
                                </li>

                                <li>
                                    买家账号：
                                    <input type="text" name="accountName" value="${upList.accountName}"  maxlength="10"  />
                                </li>

                                <li>
                                    手机号码：
                                    <input type="text" name="phoneNumber" value="${upList.phoneNumber}"  maxlength="11" />
                                </li>

                                <li>
                                    <span>订单状态：</span>

                                    <select class="add-input" name="orderStatus" style="margin-left:0; margin-top: 0;font-size: 15px;">
                                        <option value="1" <c:if test="${upList.orderStatus==1}">selected="selected"</c:if> >未发货</option>
                                        <option value="2" <c:if test="${upList.orderStatus==2}">selected="selected"</c:if> >已发货</option>
                                        <option value="3" <c:if test="${upList.orderStatus==3}">selected="selected"</c:if> >已收货</option>
                                        <option value="4" <c:if test="${upList.orderStatus==4}">selected="selected"</c:if> >交易成功</option>
                                        <option value="5" <c:if test="${upList.orderStatus==5}">selected="selected"</c:if> >订单关闭</option>
                                        <option value="6" <c:if test="${upList.orderStatus==6}">selected="selected"</c:if> >下单</option>
                                        <option value="7" <c:if test="${upList.orderStatus==7}">selected="selected"</c:if> >付款</option>
                                    </select>
                                    <p id="up"></p>
                                </li>

                                <li>
								<span data-toggle="distpicker" style="float: right; width:270px;">
									收货地址：
								  <select name="shen" data-province="${upList.shen}" class="add-input" style="float: right;font-size: 15px;"></select>
								  <select name="shi" data-city="${upList.shi}" class="add-input" style="float: right; margin-top: 20px;font-size: 15px;"></select>
								  <select name="xian" data-district="${upList.xian}" class="add-input" style="float:right; margin-top: 20px;font-size: 15px;"></select><br>
								  <input type="text" id="detailedness" maxlength="30" value="${upList.detailedness}"  name="detailedness" style="margin-top: 20px; float: right;font-size: 15px;" />
                                    <input id="addr" name="receiverAddress"  type="hidden" />
								</span>
                                </li>

                            </ul>

                            <!--确认添加订单信息-->
                            <div class="queren">
                                <input type="button" onclick="getUpdate()" value="确认修改订单信息" />

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
<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script src="${pageContext.request.contextPath}/js/distpicker.data.js"></script>
<script src="${pageContext.request.contextPath}/js/distpicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;

    });
    $("select[name='orderStatus']").change(function ss() {
        if($(this).val()==5){
            $("#up").html("退换原因：<input type='text' name='content' class='search' />");
        }else{
            $("#up").html("");
        }

    })

    //验证时间格式
    function checkTime(){
        var reDate= /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/;
        var time = $("input[name='orderTime']").val();
        if(reDate.test(time))
        {
            return true;
        }
        return false;
    }

    //更新前验证输入格式以免报错
    function getUpdate() {
        if($("#detailedness").val()!=""&&$("#detailedness").val()!=null){
            $("#addr").val($("select[name='shen']").val()+" "+$("select[name='shi']").val()+" "+$("select[name='xian']").val()+" "+$("#detailedness").val());
        }
        var reg = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;//验证价格数字
        var reg2 = /(^[1-9]\d*?$)/;//验证数量
        var okc = true;
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
        }


    }

</script>
</body>
</html>
