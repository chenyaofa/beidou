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
    <title>物流修改</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/logo.png" type="${pageContext.request.contextPath}/statics/images/logo.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/wuliujia.css">
    <style>
        a{
            text-decoration: none;
        }
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

            <div class="mid1">

                <div class="mid2" >
                    <span  id="p1">物流修改 &nbsp;|</span>
                    <span id="p2">请输物流店信息</span>
                </div>
                <form action="${pageContext.request.contextPath}/wuLiu/logUpdate" method="post" >
                <div class="mid3">

                        <table>
                            <tr>
                                <input type="hidden" name="logisticsId" value="${log.logisticsId}" />
                                <th>物流公司:</th>
                                <td>
                                    <th>物流公司：</th>
                                    <select name="logisticsCompanyId" id="n1">
                                        <option value="1" <c:if test="${log.logisticsCompanyId==1}" >selected="selected"</c:if> >顺丰速运</option>
                                        <option value="2" <c:if test="${log.logisticsCompanyId==2}" >selected="selected"</c:if> >中通快递</option>
                                        <option value="3" <c:if test="${log.logisticsCompanyId==3}" >selected="selected"</c:if> >申通快递</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>快递单号：</th>
                                <td><input type="text" id="courierId" maxlength="20" value="${log.courierId}" name="courierId" class="n2" /></td>
                            </tr>

                            <tr>
                                <th>订单编号：</th>
                                <td><input type="text" id="orderId" maxlength="20" value="${log.orderId}" name="orderId" class="n2"  /></td>
                            </tr>

                            <tr>
                                <th>门店名称：</th>
                                <td>
                                    <select name="storeId" class="n2" style="width:234px; height: 35px;">
                                        <c:forEach var="sto" items="${store}" >
                                            <option value="${sto.storeId}" <c:if test="${log.storeId==sto.storeId}" >selected="selected"</c:if>>${sto.storeName}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>订单状态：</th>
                                <td>
                                    <select name="statusId" class="n2" style="width:234px; height: 35px;">
                                        <option value="1" <c:if test="${log.statusId==1}" >selected="selected"</c:if>>未发货</option>
                                        <option value="2" <c:if test="${log.statusId==2}" >selected="selected"</c:if>>已发货</option>
                                        <option value="3" <c:if test="${log.statusId==3}" >selected="selected"</c:if>>已收货</option>
                                        <option value="4" <c:if test="${log.statusId==4}" >selected="selected"</c:if>>交易成功</option>
                                        <option value="5" <c:if test="${log.statusId==5}" >selected="selected"</c:if>>订单关闭</option>
                                        <option value="6" <c:if test="${log.statusId==6}" >selected="selected"</c:if>>下单</option>
                                        <option value="7" <c:if test="${log.statusId==7}" >selected="selected"</c:if>>付款</option>
                                    </select>
                                </td>
                            </tr>
                        </table>

                </div>
                <div class="mid4" >
                    <span><input type="button" onclick="verification()" value="修改物流信息" id="name"  /></span>
                    <div class="back" >
                        <a onclick="window.history.go(-1)" class="panel-box-edit" style="text-decoration: none;"><span style="color: dodgerblue;">返回</span></a>
                    </div>

                </div>
                </form>
            </div>
        </div>
        <div class="layui-footer" >
            <!-- 底部固定区域 -->
            © copy.com - 君务科技有限公司
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;

    });
    function verification(){
        var getInto = true;
        if($("#courierId").val()==null||$("#courierId").val()==''){
            getInto= false;
        }else if($("#orderId").val()==null||$("#orderId").val()==''){
            getInto= false;
        }

        if(getInto==true){
            //alert("bingo!");
            $("form").submit();
        }else{
            layer.open({
                title: '提示'
                ,content: '不能输入为空'
            });
        }


    }
</script>
</body>
</html>
