package com.lnp.controller;

import com.alibaba.fastjson.JSON;
import com.lnp.entity.*;
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

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//管理售后信息
@Controller
@RequestMapping("/Recycle")
public class RecycleController {

    @Autowired
    private UserService userService;

    @Autowired
    private LogisticsService logisticsService;

    @Autowired
    private AfterOrderService afterOrderService;

    @Autowired
    private StoreService storeService;

    //跳转到售后订单信息
    @RequestMapping("/goLook")
    public String goLook(Model model){
        List<StoreInformation> store = logisticsService.findStore();
        model.addAttribute("store",store);
        return "AfterOrder";
    }

    //跳转到售后订单信息
    @RequestMapping("/goLookMe")
    public String goLookMe(Model model, HttpSession session){
        UserInformation user = (UserInformation)session.getAttribute("userSession");
        List<StoreInformation> storeList = storeService.findStoreForMe(user.getUsername());
        model.addAttribute("store",storeList);
        return "AfterOrder";
    }

    //跳转到订单回收站
    @RequestMapping("/goRecycleBin")
    public String goRecycleBin(Model model){
        List<StoreInformation> store = logisticsService.findStore();
        model.addAttribute("store",store);
        return "RecycleBin";
    }

    //恢复订单
    @RequestMapping("/goBackRecycleBin")
    public String goBackRecycleBin(@RequestParam(value = "orderId")String orderId){
        RecycleOrder order = afterOrderService.findRecycleOrder(orderId);//对象查错了
        OrderInformation oo = new OrderInformation();
        oo.setOrderId(order.getOrderId());//1
        oo.setAccountName(order.getAccountName());//8
        oo.setStoreId(order.getStoreId());
        oo.setReceiverAddress(order.getReceiverAddress());//10
        oo.setConsigName(order.getConsigName());//7
        oo.setTradeName(order.getTradeName());//2
        oo.setOrderTime(order.getOrderTime());//12
        oo.setOrderStatus(order.getOrderStatus());//13
        oo.setPhoneNumber(order.getPhoneNumber());//9
        oo.setPlatformId(order.getPlatformId());//6
        oo.setAmountPaid(order.getAmountPaid());//5
        oo.setTradeOfGoods(order.getTradeOfGoods());//4
        oo.setTradePrices(order.getTradePrices());//3

        int insert = userService.orderAdd(oo);
        int delete = afterOrderService.deleteRecycle(orderId);
        return "RecycleBin";
    }

    //删除
    @RequestMapping("/deleteRecycle")
    public String deleteRecycle(@RequestParam String orderId){
        int delete = afterOrderService.deleteRecycle(orderId);
        if(delete>0){
            return "RecycleBin";
        }
        return "RecycleBin";
    }

    //清空回收站
    @RequestMapping("/deleteAll")
    public String deleteAll(){
        afterOrderService.deleteAllRecycle();
        return "RecycleBin";
    }

    //查询信息
    @ResponseBody
    @RequestMapping("/findRecycleBin")
    public void findRecycleBin(@RequestParam(value="orderId",required=false) String orderId,
                                 @RequestParam(value="orderTime",required=false) String orderTime,
                                 @RequestParam(value="tradeName",required=false) String tradeName,
                                 @RequestParam(value="consigName",required=false) String consigName,
                                 @RequestParam(value="receiverAddress",required=false) String receiverAddress,
                                 @RequestParam(value="accountName",required=false) String accountName,
                                 @RequestParam(value="storeId",required=false) String storeId,
                                 @RequestParam(value="pageIndex",required=false) String pageIndex,
                                 @RequestParam(value="pageSize",required=false) String getPageSize,Model model,HttpSession session,HttpServletResponse response){
        List<RecycleOrder> list = new ArrayList<RecycleOrder>();
        Map<String,List> map = new HashMap<String, List>();

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

        int pagesize=10;//每页显示数目
        if(getPageSize!=null && getPageSize!=""){
            pagesize= Integer.parseInt(getPageSize);
        }

        int currentPageNo=1;//当前页码
        if (orderId==null) {
            orderId="";
        }

        if (pageIndex!=null ) {
            currentPageNo=Integer.parseInt(pageIndex);
        }
        //总页数
        PageSupport pageSupport=new PageSupport();

        int totalCount=afterOrderService.findRecycleCount(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId);
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
        try {
            list=afterOrderService.findRecycle(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,  storeId,(pageSupport.getCurrentPageNo()-1)*pagesize, pagesize);
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


    //查询售后订单信息
    @ResponseBody
    @RequestMapping("/goList")
    public void goList(@RequestParam(value="orderId",required=false) String orderId,
                       @RequestParam(value="orderTime",required=false) String orderTime,
                       @RequestParam(value="tradeName",required=false) String tradeName,
                       @RequestParam(value="consigName",required=false) String consigName,
                       @RequestParam(value="receiverAddress",required=false) String receiverAddress,
                       @RequestParam(value="accountName",required=false) String accountName,
                       @RequestParam(value="storeId",required=false) String storeId,
                       @RequestParam(value="pageIndex",required=false) String pageIndex,
                            @RequestParam(value="pageSize",required=false) String getPageSize, Model model, HttpServletResponse response, HttpSession session){
        Map<String,List> map = new HashMap<String, List>();
        List<AfterOrder> list = new ArrayList<AfterOrder>();
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
        int totalCount=userService.findOutOrderCount(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId);
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

            list = userService.findOutOrder(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,  storeId,(pageSupport.getCurrentPageNo()-1)*pageSize, pageSize);
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


    @RequestMapping("/goListForMe")
    public String goListForMe(@RequestParam(value="orderId",required=false) String orderId,
                         @RequestParam(value="orderTime",required=false) String orderTime,
                         @RequestParam(value="tradeName",required=false) String tradeName,
                         @RequestParam(value="consigName",required=false) String consigName,
                         @RequestParam(value="receiverAddress",required=false) String receiverAddress,
                         @RequestParam(value="accountName",required=false) String accountName,
                         @RequestParam(value="storeId",required=false) String storeId,
                         @RequestParam(value="pageIndex",required=false) String pageIndex, Model model,HttpSession session){
        List<AfterOrder> afterOrder = new ArrayList<AfterOrder>();
        UserInformation user = (UserInformation)session.getAttribute("userSession");
        List<StoreInformation> storeList = storeService.findStoreForMe(user.getUsername());
        model.addAttribute("store",storeList);
        if(storeId==null || storeId==""){
            storeId = String.valueOf(storeList.get(0).getStoreId());
        }
        int pageSize = 3;
        int currentPageNo=1;
        if(orderId==null){
            orderId="";
        }
        if(pageIndex!=null){
            currentPageNo=Integer.parseInt(pageIndex);
        }
        //分页工具类对象
        PageSupport pageSupport=new PageSupport();
        int totalCount=userService.findOutOrderCount(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId);
        int totalPageCount=pageSupport.getTotalPageCount();
        if(currentPageNo<1){
            currentPageNo=1;
        }else if(currentPageNo>totalPageCount){
            currentPageNo=totalPageCount;
        }

        pageSupport.setCurrentPageNo(currentPageNo);
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);
        try {
            afterOrder = userService.findOutOrder(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,  storeId,(pageSupport.getCurrentPageNo()-1)*pageSize, pageSize);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("list", afterOrder);
        model.addAttribute("pages",pageSupport);
        //如何实时更新订单状态

        return "AfterOrder";
    }

    //审批通过
    //同意返回物品或还没发货
    @RequestMapping("/approve")
    public String approve(@RequestParam(value = "orderId")String orderId){
        //审核通过后，如果是退货，等门店收货后改变订单状态，如果是换货，就重新发送一条物流信息
        LogisticsInformation logisticsInformation = new LogisticsInformation();
        //先删除原来的物流信息再跳转到物流添加页面新增一条物流信息
        int i = logisticsService.logisticsDelete(orderId);

        int o = afterOrderService.deleteAfterOrder(orderId);

        System.out.println("删除成功，进入物流信息页面重新发送物流");
        return "LogisticsAdd";
    }

    //审批被打回
    @RequestMapping("/appRefuse")
    public String appRefuse(@RequestParam(value = "orderId")String orderId,HttpSession session,Model model){
        //删除申请信息
        afterOrderService.deleteAfterOrder(orderId);
        UserInformation user = (UserInformation)session.getAttribute("userSession");
        List<StoreInformation> storeList = storeService.findStoreForMe(user.getUsername());
        model.addAttribute("store",storeList);
        return "AfterOrder";
    }

}
