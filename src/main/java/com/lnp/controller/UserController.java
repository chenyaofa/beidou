package com.lnp.controller;


import com.alibaba.fastjson.JSON;
import com.lnp.entity.OrderInformation;
import com.lnp.entity.AfterOrder;
import com.lnp.entity.StoreInformation;
import com.lnp.entity.UserInformation;
import com.lnp.service.LogisticsService;
import com.lnp.service.AfterOrderService;
import com.lnp.service.StoreService;
import com.lnp.service.UserService;
import com.lnp.util.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

//主页面管理（用户信息管理、订单信息管理）
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private StoreService storeService;

    //登陆
    @RequestMapping(value = "/denglu")
    public String denglu(@RequestParam String usernameOruserman,@RequestParam String password,HttpSession session,HttpServletRequest request){
        System.out.println("进入了控制层");
        UserInformation userInformation = userService.SelectUser(usernameOruserman,password);
        if(userInformation !=null){
            session.setAttribute("userSession", userInformation);
            return "redirect:/user/main";
        }else {
            request.setAttribute("error","用户名或密码不正确");
            return "login2";
        }

    }

    @RequestMapping("/goONE")
    public String goONE(){

        return "ONE";
    }

    @RequestMapping("/goONEE")
    public String goONEE(){

        return "ONEE";
    }

    @RequestMapping("/goONEEE")
    public String goONEEE(){

        return "ONEEE";
    }



    //被拦截器拦截的请求
    @RequestMapping("/GetToken")
    public String GetToken(){
        return "GetToken";
    }

    //返回
    @RequestMapping("/fanhuiZhu")
    public String fanhuiKid(){
        return  "login2";
    }

    //主页面
    @RequestMapping("/main")
    public String main(HttpSession session,HttpServletRequest request) {
        if(session.getAttribute("userSession")==null) {
            return "login2";
        }
//        List<StoreInformation> store = logisticsService.findStore();
//        request.setAttribute("store",store);
        //return "main";
        return "index";
    }

    //订单管理页面
    @RequestMapping("/goOrder")
    public String goOrder(){
        return "orderInfo";
    }


    //跳转到注册
    @RequestMapping("/register")
    public String register(HttpSession session) {
        return "register2";
    }

    //注册
    @RequestMapping("/doRegister")
    public String doRegister(@RequestParam String username, @RequestParam String password,
                           @RequestParam String userman, @RequestParam String department,@RequestParam String companyId,
                           HttpSession session, HttpServletRequest request, HttpServletResponse response){
        UserInformation uu = new UserInformation();
        Date date=new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String result=formatter.format(date);
        uu.setCreationTime(result);
        uu.setUsername(username);
        uu.setPassword(password);
        uu.setUserman(userman);
        uu.setDepartment(department);
        uu.setCompanyId(Integer.parseInt(companyId));
        int isOk = userService.AddUser(uu);
        System.out.println("增加后的数为"+isOk);
        PrintWriter out = null;
        if(isOk>0){
            response.setContentType("text/html;charset=utf-8");
            try {
                out = response.getWriter();
                out.print("<script language='javascript'>alert('恭喜您！注册成功！');</script>");
                return "login2";
            }catch (Exception ee){
                ee.printStackTrace();
            }

        }
        //out.print("<script language='javascript'>alert('恭喜您！注册成功！');</script>");
        return "register";
    }


//    @RequestMapping("/findList")
//    public String selectOrder(@RequestParam(value="orderId",required=false) String orderId,
//                            @RequestParam(value="orderTime",required=false) String orderTime,
//                            @RequestParam(value="tradeName",required=false) String tradeName,
//                            @RequestParam(value="consigName",required=false) String consigName,
//                            @RequestParam(value="receiverAddress",required=false) String receiverAddress,
//                            @RequestParam(value="accountName",required=false) String accountName,
//                              @RequestParam(value="storeId",required=false) String storeId,
//                            @RequestParam(value="pageIndex",required=false) String pageIndex,Model model){
//        List<OrderInformation> list = new ArrayList<OrderInformation>();
//        model.addAttribute("erro","");
//        List<StoreInformation> store = logisticsService.findStore();
//        model.addAttribute("store",store);
//        OrderInformation sessionList = new OrderInformation();
//        if(orderId!=null && !orderId.equals("")){
//            sessionList.setOrderId(orderId);
//        }
//        if(orderTime!=null && !orderTime.equals("")){
//            SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd" );
//            java.util.Date timeDate = null;
//            try {
//                timeDate = sdf.parse(orderTime);
//            } catch (Exception e) {
//                model.addAttribute("erro","请检查输入格式");
//                model.addAttribute("store",store);
//                return "main";
//            }
//            java.sql.Date dateTime = new java.sql.Date(timeDate.getTime());//sql类型
//            sessionList.setOrderTime(dateTime);
//        }
//        if(tradeName!=null && !tradeName.equals("")){
//            sessionList.setTradeName(tradeName);
//        }
//        if(consigName!=null && !consigName.equals("")){
//            sessionList.setConsigName(consigName);
//        }
//        if(receiverAddress!=null && !receiverAddress.equals("")){
//            sessionList.setReceiverAddress(receiverAddress);
//        }
//        if(accountName!=null && !accountName.equals("")){
//            sessionList.setAccountName(accountName);
//        }
//        if(storeId!=null && !storeId.equals("")){
//            sessionList.setStoreId(Integer.parseInt(storeId));
//        }
//
//        int pagesize=2;//每页显示数目
//        int currentPageNo=1;//当前页码
//        if (orderId==null) {
//            orderId="";
//        }
//
//        if (pageIndex!=null ) {
//            currentPageNo=Integer.parseInt(pageIndex);
//        }
//        //总页数
//        PageSupport pageSupport=new PageSupport();
//
//        int totalCount=userService.findCount(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId);
//        int totalPageCount=pageSupport.getTotalPageCount();
//        totalPageCount = totalCount%pagesize==0 ?totalCount/pagesize:totalCount/pagesize+1;
//        if (currentPageNo<1) {
//            currentPageNo=1;
//        }else if (currentPageNo>totalPageCount) {
//            currentPageNo=totalPageCount;
//        }
//
//        pageSupport.setCurrentPageNo(currentPageNo);
//        pageSupport.setPageSize(pagesize);
//        pageSupport.setTotalCount(totalCount);
//        try {
//            list=userService.findList(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,  storeId,(pageSupport.getCurrentPageNo()-1)*pagesize, pagesize);
//        }catch (Exception e){
//            model.addAttribute("erro","没有您要查询的数据");
//        }
//
//        System.out.println(list.size());
//        System.out.println(orderId+""+orderTime+""+tradeName+""+consigName+""+receiverAddress+""+accountName+""+pageSupport.getCurrentPageNo());
//        //System.out.println("MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"+list.get(0).amountPaid);
//        model.addAttribute("list",list);
//        model.addAttribute("sessionList",sessionList);
//        model.addAttribute("totalPageCount", totalPageCount);
//        model.addAttribute("pages", pageSupport);
//        return "main";
//    }


    //查询订单信息
    @ResponseBody
    @RequestMapping("/findList")
    public void selectOrder(@RequestParam(value="orderId",required=false) String orderId,
                              @RequestParam(value="orderTime",required=false) String orderTime,
                              @RequestParam(value="tradeName",required=false) String tradeName,
                              @RequestParam(value="consigName",required=false) String consigName,
                              @RequestParam(value="receiverAddress",required=false) String receiverAddress,
                              @RequestParam(value="accountName",required=false) String accountName,
                              @RequestParam(value="storeId",required=false) String storeId,
                              @RequestParam(value="pageIndex",required=false) String pageIndex,
                              @RequestParam(value="pageSize",required=false) String getPageSize,Model model,HttpServletResponse response,HttpSession session){
        Map<String,List> map = new HashMap<String, List>();
        List<OrderInformation> list = new ArrayList<OrderInformation>();
        UserInformation user = (UserInformation)session.getAttribute("userSession");
        List<StoreInformation> store = new ArrayList<StoreInformation>();
        if(user.getCompanyId()==1){
            store = storeService.findStoreAll();
        }else {
            store = storeService.findStoreForMe(user.getUsername());
        }
        map.put("store",store);
        if(user.getCompanyId()==4){
            if(storeId==null || storeId==""){
                storeId = String.valueOf(store.get(0).getStoreId());
            }
        }
        int pageSize=10;//每页显示数目

        if(getPageSize!=null && getPageSize!=""){
            pageSize= Integer.parseInt(getPageSize);
        }


        int currentPageNo=1;//当前页码
        //总页数
        PageSupport pageSupport=new PageSupport();
        if (orderId==null) {
            orderId="";
        }
        if (pageIndex!=null ) {
            currentPageNo=Integer.parseInt(pageIndex);
        }
        int totalCount=userService.findCount(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId);

        int totalPageCount=pageSupport.getTotalPageCount();
        totalPageCount = totalCount%pageSize==0 ?totalCount/pageSize:totalCount/pageSize+1;
        if (currentPageNo<1) {
            currentPageNo=1;
        }else if (currentPageNo>totalPageCount) {
            currentPageNo=totalPageCount;
        }
        pageSupport.setCurrentPageNo(currentPageNo);
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);
        List pages = new ArrayList();
        pages.add(pageSupport);
        map.put("pages",pages);
        try {

            list=userService.findList(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,  storeId,(pageSupport.getCurrentPageNo()-1)*pageSize, pageSize);


            map.put("list",list);


            //输出返回
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String result = JSON.toJSONString(map);
            out.println(result);
        }catch (Exception e){
            model.addAttribute("erro","没有您要查询的数据");
        }
    }


    //跳转到增加页面
    @RequestMapping("/goAdd")
    public String add(){
        return "orderAdd";
    }

    //跳转到门店信息
    @RequestMapping("/goStore")
    public String goStore(){
        return "storeInfo";
    }

    //返回
    @RequestMapping("/fanHui")
    public String fanHui(HttpServletRequest request){
        List<StoreInformation> store = logisticsService.findStore();
        request.setAttribute("store",store);
        return "orderInfo";
    }

    //返回登陆(注销)
    @RequestMapping("/fanHuiLogin")
    public String fanHuiLogin(HttpServletRequest request){
        //注销登陆时清除所有session
        HttpSession session = request.getSession();
        session.invalidate();
        return "login2";
    }

    @ResponseBody
    @RequestMapping("/checkOrderId")
    public void checkOrderId(@RequestParam(value = "orderId",required = false) String orderId,HttpServletResponse response){
            Map<String,List> map = new HashMap<String, List>();

            int resultOrderId = userService.selectOrderId(orderId);
            List orderCheck = new ArrayList();
            orderCheck.add(resultOrderId);
            map.put("orderCheck",orderCheck);

            try {

                //输出返回
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                String resultId = JSON.toJSONString(map);
                out.println(resultId);
            }catch (Exception e){
                e.printStackTrace();
            }


    }


    //添加订单
    @RequestMapping("/orderAdd")
    public String orderAdd(@RequestParam(value="orderId")String orderId,@RequestParam(value="tradeName")String tradeName,@RequestParam(value="tradePrices")String tradePrices,@RequestParam(value="tradeOfGoods")String tradeOfGoods,@RequestParam(value="amountPaid")String amountPaid
            ,@RequestParam(value="platformId")String platformId,@RequestParam(value="consigName")String consigName,@RequestParam(value="accountName")String accountName,@RequestParam(value="phoneNumber")String phoneNumber,@RequestParam(value="receiverAddress")String receiverAddress
            ,@RequestParam(value="orderTime")String orderTime,@RequestParam(value="orderStatus")String orderStatus){
        try {

        OrderInformation orderInformation = new OrderInformation();
        orderInformation.setOrderId(orderId);
        orderInformation.setTradeName(tradeName);
        orderInformation.setTradePrices(new BigDecimal(tradePrices));
        orderInformation.setTradeOfGoods(Integer.parseInt(tradeOfGoods));
        orderInformation.setAmountPaid(new BigDecimal(amountPaid));

        orderInformation.setPlatformId(Integer.parseInt(platformId));
        orderInformation.setConsigName(consigName);
        orderInformation.setAccountName(accountName);
        orderInformation.setPhoneNumber(phoneNumber);
        orderInformation.setReceiverAddress(receiverAddress);

        SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd" );
        java.util.Date timeDate = null;

        timeDate = sdf.parse(orderTime);

        java.sql.Date dateTime = new java.sql.Date(timeDate.getTime());//sql类型
        orderInformation.setOrderTime(dateTime);
        System.out.println("sssssssssssssssssssssssssssssssssssss时间"+dateTime);
        orderInformation.setOrderStatus(Integer.parseInt(orderStatus));
        //先查出最小距离门店ID
        int storeId = MapStrong(receiverAddress);
        orderInformation.setStoreId(storeId);
        //先把审核状态设置为0未审核
        orderInformation.setAudit(0);

        int num = userService.orderAdd(orderInformation);
        if(num>0){
            //return "main";
            return "redirect:/user/goOrder";
        }

        }catch (Exception e){
           e.printStackTrace();
        }
        return "orderAdd";
    }




    //删除订单
    @RequestMapping("/orderDelete")
    public String orderDelete(@RequestParam(value="orderId")String orderId){
        //删除前转移到订单回收表
        OrderInformation order = userService.findUpdate(orderId);
        int insert = userService.RecycleAdd(order);
        int num = userService.deleteOrder(orderId);
        return "orderInfo";
    }


    @Autowired
    private LogisticsService logisticsService;

    @Autowired
    private AfterOrderService afterOrderService;

    //跳转到修改订单
    @RequestMapping("/goUpdate")
    public String goUpdate(@RequestParam(value="orderId")String orderId,HttpServletRequest request){
        OrderInformation orderInformation=userService.findUpdate(orderId);
        orderInformation.setReceiverAddress(orderInformation.getReceiverAddress());
        request.setAttribute("upList",orderInformation);
        String dateStr = new SimpleDateFormat("yyyy-MM-dd").format(orderInformation.getOrderTime());
        request.setAttribute("time",dateStr);
        List<StoreInformation> store = logisticsService.findStore();
        request.setAttribute("store",store);
        return "orderUpdate";
    }

    //修改订单
    @RequestMapping("/orderUpdate")
    public String orderUpdate(@RequestParam(value="orderId")String orderId,@RequestParam(value="tradeName")String tradeName,@RequestParam(value="tradePrices")String tradePrices,@RequestParam(value="tradeOfGoods")String tradeOfGoods,@RequestParam(value="amountPaid")String amountPaid
            ,@RequestParam(value="platformId")String platformId,@RequestParam(value="consigName")String consigName,@RequestParam(value="accountName")String accountName,@RequestParam(value="phoneNumber")String phoneNumber,@RequestParam(value="receiverAddress")String receiverAddress
            ,@RequestParam(value="orderTime")String orderTime,@RequestParam(value="orderStatus")String orderStatus,@RequestParam(value="storeId")String storeId,@RequestParam(value = "content",required = false)String content){
        try{
        OrderInformation orderInformation = new OrderInformation();
        orderInformation.setOrderId(orderId);
        orderInformation.setTradeName(tradeName);
        orderInformation.setTradePrices(new BigDecimal(tradePrices));
        orderInformation.setTradeOfGoods(Integer.parseInt(tradeOfGoods));
        orderInformation.setAmountPaid(new BigDecimal(amountPaid));
        orderInformation.setStoreId(Integer.parseInt(storeId));

        orderInformation.setPlatformId(Integer.parseInt(platformId));
        orderInformation.setConsigName(consigName);
        orderInformation.setAccountName(accountName);
        orderInformation.setPhoneNumber(phoneNumber);
        orderInformation.setReceiverAddress(receiverAddress);
        SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd" );
        java.util.Date timeDate = null;

            timeDate = sdf.parse(orderTime);

        java.sql.Date dateTime = new java.sql.Date(timeDate.getTime());//sql类型
        orderInformation.setOrderTime(dateTime);
        orderInformation.setOrderStatus(Integer.parseInt(orderStatus));
        //如果状态改为退货状态，则把信息添加到售后表
        if(Integer.parseInt(orderStatus)==5){
            AfterOrder afterOrder = new AfterOrder();
            afterOrder.setOrderId(orderId);
            afterOrder.setTradeName(tradeName);
            afterOrder.setTradePrices(new BigDecimal(tradePrices));
            afterOrder.setTradeOfGoods(Integer.parseInt(tradeOfGoods));
            afterOrder.setAmountPaid(new BigDecimal(amountPaid));
            afterOrder.setStoreId(Integer.parseInt(storeId));

            afterOrder.setPlatformId(Integer.parseInt(platformId));
            afterOrder.setConsigName(consigName);
            afterOrder.setAccountName(accountName);
            afterOrder.setPhoneNumber(phoneNumber);
            afterOrder.setReceiverAddress(receiverAddress);
            SimpleDateFormat sdfs = new SimpleDateFormat( "yyyy-MM-dd" );
            java.util.Date timeDates = null;

                timeDate = sdf.parse(orderTime);

            java.sql.Date dateTimes = new java.sql.Date(timeDate.getTime());//sql类型
            afterOrder.setOrderTime(orderTime);
            afterOrder.setRecycleContent(content);
            afterOrderService.addAfterOrder(afterOrder);
        }



        int num = userService.updateOrder(orderInformation);
        int logNum = logisticsService.updateLogStatus(orderId,orderStatus);//同时更新对应物流的状态？
        if(num>0){
            //return "main";
            return "redirect:/user/goOrder";
        }
        return "orderUpdate";
        }catch (Exception e){
            return "wuliu";
        }
    }

    //查询坐标离收货地址最近的门店ID
    public Integer MapStrong(String address){
        //先把数据库物流门店设置可以为空
        //通过收货地址循环判断门店地址根据经度纬度拿取最短距离坐标
        //把每个门店跟收货地址距离都判断完后取集合中的最小值
        //根据最小值再指定发货门店
        //根据发货地址得出发货门店，物流信息通过发货门店分类待发货订单
        Map<String,BigDecimal> mm =  BaiDuMapApi.getLatAndLngByAddress(address);

        //用一个集合存储所有门店与收货地址的距离
        Map<Double,Integer> men = new HashMap<Double,Integer>() ;
        List<StoreInformation> ll = storeService.findStoreAll();
        for(StoreInformation ss:ll){
            Map<String,BigDecimal> mtwo =  BaiDuMapApi.getLatAndLngByAddress(ss.getShipAddress());
            men.put(BaiDuMapApi.distanceOfTwoPoints(mm.get("lat").doubleValue(), mm.get("lng").doubleValue(),mtwo.get("lat").doubleValue(), mtwo.get("lng").doubleValue()),ss.getStoreId());
        }
        List<Double> small = new ArrayList<Double>();
        for (Double dd:men.keySet()){
            small.add(dd);
        }
        for(int i =0;i<small.size()-1;i++){
            for (int j=0;j<small.size()-i-1;j++){
                if(small.get(j)>small.get(j+1)){
                    double numA= small.get(j);
                    small.set(j,small.get(j+1));
                    small.set(j+1,numA);
                }
            }
        }
        //最小距离key
        double kid = small.get(0);


        return men.get(kid);
    }

    @RequestMapping("/goGetAllOrder")
    public String goGetAllOrder(){

        return "getAll";
    }


    @RequestMapping("/faHuo")
    public String faHuo(@RequestParam String orderId,HttpServletRequest request){
        OrderInformation order = userService.findUpdate(orderId);
        request.setAttribute("order",order);
        List<StoreInformation> store = logisticsService.findStore();
        request.setAttribute("store",store);
        return "LogisticsAdd";
    }





    //批量操作的查询
    @ResponseBody
    @RequestMapping("/getAllOrder")
    public void getAllOrder(@RequestParam(value = "orderStatus",required=false)String orderStatus,@RequestParam(value = "orderTime",required=false)String orderTime,@RequestParam(value="pageSize",required=false) String getPageSize,@RequestParam(value="pageIndex",required=false) String pageIndex,Model model,HttpServletResponse response){
        Map<String,List> map = new HashMap<String, List>();
        int pagesize=5;//每页显示数目

        if(getPageSize!=null && getPageSize!=""){
            pagesize= Integer.parseInt(getPageSize);
        }

        int currentPageNo=1;//当前页码
        if (pageIndex!=null ) {
            currentPageNo=Integer.parseInt(pageIndex);
        }
        //总页数
        PageSupport pageSupport=new PageSupport();
        int totalCount=userService.findAllOrderCount(orderStatus,orderTime);
        int totalPageCount=pageSupport.getTotalPageCount();
        totalPageCount = totalCount%pagesize==0 ?totalCount/pagesize:totalCount/pagesize+1;
        if (currentPageNo<1) {
            currentPageNo=1;
        }else if (currentPageNo>totalPageCount) {
            currentPageNo=totalPageCount;
        }

        pageSupport.setCurrentPageNo(currentPageNo);
        pageSupport.setPageSize(pagesize);
        pageSupport.setTotalCount(totalCount);
        List pages = new ArrayList();
        pages.add(pageSupport);
        map.put("pages",pages);

        String time="";
        if(orderTime!=null && !orderTime.equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd" );
            java.util.Date timeDate = null;
            try {
                timeDate = sdf.parse(orderTime);
            } catch (Exception e) {
                model.addAttribute("erro","请检查输入格式");
                //return "getAll";
            }
            time=orderTime;
        }
        try {
            //提交一个按订单状态查询的订单list
            List<OrderInformation> list = userService.findAllOrder(orderStatus,time,(pageSupport.getCurrentPageNo()-1)*pagesize,pagesize);
            map.put("list",list);

            //输出返回
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String result = JSON.toJSONString(map);
            out.println(result);
        }catch (Exception e){

        }

    }

    //批量删除
    @RequestMapping("/DeleteAll")
    public String DeleteAll(@RequestParam(value="deleteList")List deleteList){
        List arrayList = new ArrayList<String>();
        arrayList = deleteList;
        for (Object list:arrayList){
            userService.deleteOrder(list.toString());
        }

        return "getAll";
    }

    //批量修改订单
    @RequestMapping("/UpdateAll")
    public String UpdateAll(@RequestParam(value="updateList")List updateList,@RequestParam(value = "orderStatus")String orderStatus){
        List list = new ArrayList<String>();
        list = updateList;
        for (Object li:list){
            userService.updateOrderStatus(orderStatus,li.toString());
        }
        return "getAll";
    }

    //权限管理
    @RequestMapping("/goPermission")
    public String goPermission(HttpSession session){
        UserInformation user = (UserInformation) session.getAttribute("userSession");
        if(user.getCompanyId()==1){
            //根据权限等级设置权限？
        }
        return "PermissionInfo";
    }

    //用户账号管理
    @RequestMapping("/goUserInfo")
    public String goFindUser(){

        return "UserInfo";
    }

    //查询用户账号信息
    @ResponseBody
    @RequestMapping("/findUser")
    public void findUser(@RequestParam(value = "username",required = false)String username,@RequestParam(value = "userman",required = false)String userman,
                           @RequestParam(value = "department",required = false)String department,@RequestParam(value = "creationTime",required = false)String creationTime,
                           @RequestParam(value = "pageIndex",required = false)String pageIndex,HttpServletResponse response){
        Map<String,List> map = new HashMap<String, List>();
        List<UserInformation> list = new ArrayList<UserInformation>();
        int pageSize = 10;//每页显示数目
        int currentPageNo=1;//当前页码
        if(pageIndex!=null){
            currentPageNo=Integer.parseInt(pageIndex);
        }
        //分页对象
        PageSupport pageSupport = new PageSupport();

        //总页数
        int totalCount = userService.findUserCount(username,userman,creationTime,department);
        int totalPageCount = pageSupport.getTotalPageCount();
        totalPageCount = totalCount%pageSize==0 ?totalCount/pageSize:totalCount/pageSize+1;
        if(currentPageNo<1){
            currentPageNo=1;
        }else if(currentPageNo>totalPageCount){
            currentPageNo=totalPageCount;
        }

        pageSupport.setCurrentPageNo(currentPageNo);
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);
        try {
            list = userService.findUser(username,userman,creationTime,department,(pageSupport.getCurrentPageNo()-1)*pageSize,pageSize);
            map.put("list",list);
            List pages = new ArrayList();
            pages.add(pageSupport);
            map.put("pages",pages);

            //输出返回
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String result = JSON.toJSONString(map);
            out.println(result);
        }catch (Exception e){
            e.printStackTrace();
        }



    }

    //删除用户
    @RequestMapping("/deleteUser")
    public String deleteUser(@RequestParam(value = "username")String username){
        userService.deleteUser(username);

        return "UserInfo";
    }

    //查询（没有调用）
//    @RequestMapping("/findListForMe")
//    public String findListForMe(@RequestParam(value="orderId",required=false) String orderId,
//                                @RequestParam(value="orderTime",required=false) String orderTime,
//                                @RequestParam(value="tradeName",required=false) String tradeName,
//                                @RequestParam(value="consigName",required=false) String consigName,
//                                @RequestParam(value="receiverAddress",required=false) String receiverAddress,
//                                @RequestParam(value="storeId",required=false) String storeId,
//                                @RequestParam(value="accountName",required=false) String accountName,
//                                @RequestParam(value="pageIndex",required=false) String pageIndex,Model model,HttpSession session){
//        List<OrderInformation> list = new ArrayList<OrderInformation>();
//        UserInformation user = (UserInformation)session.getAttribute("userSession");
//        List<StoreInformation> storeList = storeService.findStoreForMe(user.getUsername());
//        if(storeId==null || storeId==""){
//            storeId = String.valueOf(storeList.get(0).getStoreId());
//        }
//        model.addAttribute("erro","");
//        model.addAttribute("store",storeList);
//        OrderInformation sessionList = new OrderInformation();
//        if(orderId!=null && !orderId.equals("")){
//            sessionList.setOrderId(orderId);
//        }
//        if(orderTime!=null && !orderTime.equals("")){
//            SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd" );
//            java.util.Date timeDate = null;
//            try {
//                timeDate = sdf.parse(orderTime);
//            } catch (Exception e) {
//                model.addAttribute("erro","请检查输入格式");
//                model.addAttribute("store",storeList);
//                return "main";
//            }
//            java.sql.Date dateTime = new java.sql.Date(timeDate.getTime());//sql类型
//            sessionList.setOrderTime(dateTime);
//        }
//        if(tradeName!=null && !tradeName.equals("")){
//            sessionList.setTradeName(tradeName);
//        }
//        if(consigName!=null && !consigName.equals("")){
//            sessionList.setConsigName(consigName);
//        }
//        if(receiverAddress!=null && !receiverAddress.equals("")){
//            sessionList.setReceiverAddress(receiverAddress);
//        }
//        if(accountName!=null && !accountName.equals("")){
//            sessionList.setAccountName(accountName);
//        }
//        int pagesize=2;//每页显示数目
//        int currentPageNo=1;//当前页码
//        if (orderId==null) {
//            orderId="";
//        }
//
//        if (pageIndex!=null ) {
//            currentPageNo=Integer.parseInt(pageIndex);
//        }
//        //总页数
//        PageSupport pageSupport=new PageSupport();
//
//        int totalCount=userService.findCount(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId);
//        int totalPageCount=pageSupport.getTotalPageCount();
//        totalPageCount = totalCount%pagesize==0 ?totalCount/pagesize:totalCount/pagesize+1;
//        if (currentPageNo<1) {
//            currentPageNo=1;
//        }else if (currentPageNo>totalPageCount) {
//            currentPageNo=totalPageCount;
//        }
//
//        pageSupport.setCurrentPageNo(currentPageNo);
//        pageSupport.setPageSize(pagesize);
//        pageSupport.setTotalCount(totalCount);
//        try {
//            list=userService.findList(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,  storeId,(pageSupport.getCurrentPageNo()-1)*pagesize, pagesize);
//        }catch (Exception e){
//            model.addAttribute("erro","没有您要查询的数据");
//        }
//
//        model.addAttribute("list",list);
//        model.addAttribute("sessionList",sessionList);
//        model.addAttribute("pages", pageSupport);
//        return "orderInfo";
//    }







}
