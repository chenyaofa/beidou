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
    <title>提现申请</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/dingdanjia.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/storeadd.css" />
    <style>
        .panel-box-edit{

            cursor: pointer;
        }

    </style>
</head>

<body>
<div id="container" style="position:relative;">
    <div id="container1">
        <div class="top">
            <div class="head">
                <a style="margin-left: 130px;"><img src="${pageContext.request.contextPath}/statics/images/logo.png" style="margin-bottom: -8px;" /></a><span style="padding: 30px;">君务订单管理系统</span>
            </div>
        </div>
        <div class="mid" >

            <div class="mid1" style="border-radius: 3px; height: 560px; top: 127px">
                <div class="con2" style="width: 400px; margin:0 auto">
                    <!--中间表单内容-->
                    <form action="${pageContext.request.contextPath}/commission/apply" method="post">

                        <div class="mid2" style="padding-left: 95px;">
                            <span  id="p1" style="color: #0896D8;">佣金提现申请</span>
                        </div>
                        <div class="mid3" style="padding-top: 0; padding-left: 63px;">
                            <ul class="con-left">
                                <li>
                                    店铺名称：
                                    <select class="add-input" name="storeId" id="storeId"  style="margin-left:0;margin-top: 0;">
                                        <option></option>
                                        <c:forEach var="sto" items="${store}" >
                                            <option value="${sto.storeId}">${sto.storeName}</option>
                                        </c:forEach>
                                    </select>
                                </li>

                                <li>
                                    提现金额：
                                    <input type="text"  id="money" name="money"  value="" />
                                </li>

                                <li>
                                    账户类型：
                                    <select class="add-input" name="accountType" style="margin-left:0;margin-top: 0;">
                                        <option>-请选择-</option>
                                        <option>线下转账</option>
                                    </select>

                                </li>

                                <li>
                                    账号/卡号：
                                    <input type="text"  id="cardNumber" name="cardNumber" value="" />
                                </li>

                                <li>
                                    收&nbsp;&nbsp;款&nbsp;&nbsp;人：
                                    <input type="text" id="payee" name="payee" value="" />
                                </li><br>

                            </ul>
                        </div>

                        <div class="mid4" style="left: 93px; top:35px">
						 <span>
						 	<input type="button" onclick="verification()" value="提交申请" id="name"
                                   style="width: 200px; margin-right: 15px; border-radius: 3px;"/>
						 </span>

                            <a class="panel-box-edit" onclick="window.history.go(-1)" style="text-decoration: none;"><span style="color: dodgerblue;">返回</span></a>

                        </div>
                    </form></div>

            </div>



        </div>
        <div class="layui-footer" >
            <!-- 底部固定区域 -->
            © copy.com - 君务科技有限公司

        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js" ></script>
<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;

    });
    function verification(){
        var money = $("#money").val();
        var cardNumber=$("#cardNumber").val();
        var payee = $("#payee").val();
        var result = true;
        if(money==null || money==''){
            layer.open({
                title: '提示'
                ,content: '提现金额不能为空'
            });
            result = false;
        }else if(cardNumber==null||cardNumber==''){
            layer.open({
                title: '提示'
                ,content: '卡号不能为空'
            });
            result = false;
        }else if(payee==null||payee==''){
            layer.open({
                title: '提示'
                ,content: '收款人不能为空'
            });
            result = false;
        }

        if(result==true){
            var lastagain = true;
            if($("#money").val().length>5){

                layer.open({
                    title: '提示'
                    ,content: '提现金额不能大于五位数'
                });
                lastagain=false;
            }else if(isNaN($("#cardNumber").val())){

                layer.open({
                    title: '提示'
                    ,content: '卡号必须为数字'
                });
                lastagain=false;
            }else if($("#payee").val().length<2){

                layer.open({
                    title: '提示'
                    ,content: '收款人名称不能小于两位'
                });
                lastagain=false;
            }

            if(lastagain==true){
                layer.open({
                    content: '添加成功'
                    ,btn: ['确定']
                    ,yes: function(index, layero){
                        //按钮【按钮一】的回调
                        $("form").submit();
                    }
                });

            }
        }

    }
</script>
</body>
</html>
