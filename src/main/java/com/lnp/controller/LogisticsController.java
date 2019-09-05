package com.lnp.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lnp.entity.*;
import com.lnp.service.CommissionService;
import com.lnp.service.LogisticsService;
import com.lnp.service.StoreService;
import com.lnp.service.UserService;
import com.lnp.util.PageSupport;
import org.apache.ibatis.annotations.Param;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/wuLiu")
public class LogisticsController {

    @Autowired
    private LogisticsService logisticsService;

    @Autowired
    private UserService userService;

    @Autowired
    private StoreService storeService;

    @Autowired
    private CommissionService commissionService;

    //跳转到物流主页面
    @RequestMapping("/goLog")
    public String goLog(HttpServletRequest request){
//        List<StoreInformation> store = logisticsService.findStore();
//        request.setAttribute("store",store);
        return "LogisticsInfo";
        //return "wuliu";
    }

//    @RequestMapping("/goLogSon")
//    public String goLogSon(HttpSession session,Model model){
//        UserInformation user = (UserInformation)session.getAttribute("userSession");
//        List<StoreInformation> list = storeService.findStoreForMe(user.getUsername());
//        //只保存当前登陆用户的门店，显示自己门店的物流信息
//        model.addAttribute("store",list);
//        return "LogisticsInfo";
//    }
//


    //查询物流信息
    @ResponseBody
    @RequestMapping("/findLog")
    public void findLog(@RequestParam(value = "logisticsId",required = false)String logisticsId, @RequestParam(value = "courierId",required = false)String courierId, @RequestParam(value = "storeId",required = false)String storeId,
                        @RequestParam(value = "statusId",required = false)String statusId, @RequestParam(value = "orderId",required = false)String orderId, @RequestParam(value="pageIndex",required=false) String pageIndex, @RequestParam(value="pageSize",required=false) String getPageSize,HttpSession session, HttpServletResponse response){
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
        List<LogisticsInformation> list = new ArrayList<LogisticsInformation>();
        int pagesize=10;//每页显示数目
        if(getPageSize!=null && getPageSize!=""){
            pagesize= Integer.parseInt(getPageSize);
        }

        int currentPageNo=1;//当前页码
        if (pageIndex!=null) {
            currentPageNo=Integer.parseInt(pageIndex);
        }
        //总页数
        PageSupport pageSupport=new PageSupport();
        int totalCount=logisticsService.findListCount((logisticsId==null||logisticsId.equals(""))?0:Integer.parseInt(logisticsId),courierId,(storeId==null||storeId.equals(""))?0:Integer.parseInt(storeId),(statusId==null||statusId.equals(""))?0:Integer.parseInt(statusId),orderId);
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
            list=logisticsService.findList((logisticsId==null||logisticsId.equals(""))?0:Integer.parseInt(logisticsId),courierId,(storeId==null||storeId.equals(""))?0:Integer.parseInt(storeId),(statusId==null||statusId.equals(""))?0:Integer.parseInt(statusId),orderId, (pageSupport.getCurrentPageNo()-1)*pagesize, pagesize);
            map.put("list",list);
            //输出返回
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String result = JSON.toJSONString(map);
            out.println(result);
        }catch (Exception e){
            //model.addAttribute("erro","没有您要查询的数据");
        }


        //此方法未调用，可以对应实际情况修改
        //循环更新查询出来的每个订单对象的状态
//        for(int i =0;i<list.size();i++){
//            //如何实时更新订单状态,循环更新
//            //只能根据物流编号查询物流状态信息，订单编号不行，所以修改状态时只能先修改物流信息的状态顺便更改订单表的状态
//            KdniaoTrackQueryAPI api = new KdniaoTrackQueryAPI();
//            try {
//                String result = api.getOrderTracesByJson("物流公司编码",list.get(i).getCourierId());//根据物流快递编号获取物流状态信息截取状态编号
//                //截取状态属性获取状态编号
//                JSONObject jsonObject = JSONObject.parseObject(result);
//                String status = jsonObject.get("State").toString();
//                //根据快递鸟提供的信息判断物流状态：2-在途中,3-签收,4-问题件
//                if(status.equals("2")){
//                    //在途中
//                    //写一个专门修改订单和物流状态的方法
//                    logisticsService.updateLogStatus(list.get(i).getOrderId(),"物流状态：已发货");
//                    userService.updateOrderStatus(statusId,list.get(i).getOrderId());//同时把订单信息的状态更改
//                }else if(status.equals("3")){
//                    //已签收
//                    logisticsService.updateLogStatus(list.get(i).getOrderId(),"物流状态：已收货");
//                    userService.updateOrderStatus(statusId,list.get(i).getOrderId());//同时把订单信息的状态更改
//                }else if(status.equals("4")){
//                    //问题件
//                    logisticsService.updateLogStatus(list.get(i).getOrderId(),"问题件：退换或其他状态");
//                    userService.updateOrderStatus(statusId,list.get(i).getOrderId());//同时把订单信息的状态更改
//                }
//                //这个方法每查询一次调用一次
//            }catch (Exception e){
//                e.printStackTrace();
//            }
//        }


        //return "LogisticsInfo";
    }

    //添加物流信息
    @RequestMapping("/goAdd")
    public String goAdd(HttpServletRequest request){
        List<StoreInformation> store = storeService.findStoreAll();
        request.setAttribute("store",store);
        return "LogisticsAdd";
    }

    //执行添加物流信息操作
    @RequestMapping("/logAdd")
    public String logAdd(@RequestParam(value = "logisticsCompanyId")String logisticsCompanyId,@RequestParam(value = "courierId")String courierId,
                            @RequestParam(value = "storeId")String storeId,@RequestParam(value = "statusId")String statusId,@RequestParam(value = "orderId")String orderId,HttpServletRequest request){
        LogisticsInformation logisticsInformation=new LogisticsInformation();
//        logisticsInformation.setLogisticsId(Integer.parseInt(logisticsId));
        logisticsInformation.setLogisticsCompanyId(Integer.parseInt(logisticsCompanyId));
        logisticsInformation.setCourierId(courierId);
        //logisticsInformation.setLogisticsRoute(logisticsRoute);
        logisticsInformation.setStoreId(Integer.parseInt(storeId));
        logisticsInformation.setStatusId(Integer.parseInt(statusId));
        userService.updateOrderStatus(statusId,orderId);//更新订单信息的订单状态
        logisticsInformation.setOrderId(orderId);
        int ok = logisticsService.logisticsAdd(logisticsInformation);
        if(ok>0){
            return "LogisticsInfo";
        }
        return "LogisticsAdd";
    }

    //跳转到修改物流信息
    @RequestMapping("/goUpdate")
    public String goUpdate(@RequestParam(value = "logisticsId")String logisticsId,HttpServletRequest request){
        LogisticsInformation log = logisticsService.findLogisticsById(Integer.parseInt(logisticsId));
        request.setAttribute("log",log);
        List<StoreInformation> store = logisticsService.findStore();
        request.setAttribute("store",store);
        return "LogisticsUpdate";
    }

    //修改操作
    @RequestMapping("/logUpdate")
    public String logUpdate(@RequestParam(value = "logisticsId")String logisticsId,@RequestParam(value = "logisticsCompanyId")String logisticsCompanyId,@RequestParam(value = "courierId")String courierId,
                            @RequestParam(value = "storeId")String storeId,@RequestParam(value = "statusId")String statusId,@RequestParam(value = "orderId")String orderId){
        LogisticsInformation ll = new LogisticsInformation();
        ll.setLogisticsId(Integer.parseInt(logisticsId));
        ll.setLogisticsCompanyId(Integer.parseInt(logisticsCompanyId));
        ll.setCourierId(courierId);
        //ll.setLogisticsRoute(logisticsRoute);
        ll.setStoreId(Integer.parseInt(storeId));
        ll.setStatusId(Integer.parseInt(statusId));
        //订单状态修改为交易成功时添加佣金信息
        if(Integer.parseInt(statusId)==4){
            try {
                insertCommission(orderId);//交易成功后说明订单已经完成了，就不能再改这个物流信息了
            }catch (Exception e){
                e.printStackTrace();//添加失败
                //return "GetToken";
            }

        }
        userService.updateOrderStatus(statusId,orderId);//同时把订单信息的状态更改
        ll.setOrderId(orderId);
        int upd = logisticsService.logisticsUpdate(ll);
        if(upd>0){
            return "LogisticsInfo";
        }
        return "LogisticsUpdate";
    }

    //添加佣金信息
    public void insertCommission(String orderId){
        OrderInformation list = userService.findUpdate(orderId);
        CommissionInformation commissionInformation = new CommissionInformation();
        commissionInformation.setOrderId(list.getOrderId());
        commissionInformation.setTradeName(list.getTradeName());
        commissionInformation.setTradePrices(list.getTradePrices());
        commissionInformation.setTradeOfGoods(list.getTradeOfGoods());
        commissionInformation.setPlatformId(list.getPlatformId());
        commissionInformation.setOrderTime(list.getOrderTime());
        commissionInformation.setStoreId(list.getStoreId());
        //所得佣金
        commissionInformation.setBrokerage(new BigDecimal(200));
        commissionService.InsertCommission(commissionInformation);

    }

    //删除物流信息
    @RequestMapping("/logDelete")
    public String orderDelete(@RequestParam(value="orderId")String orderId){
        int num = logisticsService.logisticsDelete(orderId);
        return "LogisticsInfo";
    }

    //返回
    @RequestMapping("/fanHui")
    public String fanHui(HttpServletRequest request){
        List<StoreInformation> store = storeService.findStoreAll();
        request.setAttribute("store",store);
        return "LogisticsInfo";
    }
}
