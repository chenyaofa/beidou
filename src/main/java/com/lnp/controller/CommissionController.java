package com.lnp.controller;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.lnp.entity.*;
import com.lnp.service.CommissionService;
import com.lnp.service.LogisticsService;
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

//佣金管理
@Controller
@RequestMapping("/commission")
public class CommissionController {

    @Autowired
    private CommissionService commissionService;

    @Autowired
    private UserService userService;

    @Autowired
    private LogisticsService logisticsService;

    @Autowired
    private StoreService storeService;

    //跳转到佣金列表
    @RequestMapping("/goCommission")
    public String goCommission(HttpServletRequest request){
        List<StoreInformation> store = logisticsService.findStore();
        request.setAttribute("store",store);
        return "CommissionInfo";
    }

    //查询佣金信息
    @ResponseBody
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    @RequestMapping("/selectCommission")
    public void selectCommission(@RequestParam(value = "storeId",required = false)String storeId, @RequestParam(value = "platformId",required = false)String platformId,
                                   @RequestParam(value = "orderId",required = false)String orderId, @RequestParam(value = "beginTime",required = false)String beginTime,
                                   @RequestParam(value = "overTime",required = false)String overTime,@RequestParam(value = "timeNumber",required = false)String timeNumber,@RequestParam(value = "pageSize",required = false)String getPageSize, HttpSession session, Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex, HttpServletResponse response){
        System.out.println("ssssssssssssssss"+timeNumber);
        String time = "";
        if(Integer.parseInt(timeNumber)==1){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c = Calendar.getInstance();
            c.add(Calendar.DATE, - 7);
            Date times = c.getTime();
            time = sdf.format(times);
        }else if(Integer.parseInt(timeNumber)==2){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c = Calendar.getInstance();
            c.add(Calendar.DATE, - 30);
            Date times = c.getTime();
            time = sdf.format(times);
        }
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
        int pageSize = 10;//展示行数
//        if(session.getAttribute("pageSize")!=null){
//            pageSize= (int)session.getAttribute("pageSize");
//        }
        if(getPageSize!=null && getPageSize!=""){

            pageSize= Integer.parseInt(getPageSize);
        }

        int currentPageNo = 1;//当前页码
        if(pageIndex!=null){
            currentPageNo = Integer.parseInt(pageIndex);
        }
        //分页对象
        PageSupport pageSupport = new PageSupport();
        List listInfo = new ArrayList();
        int totalCount = commissionService.selectCommissionCount(orderId,storeId,platformId,beginTime,overTime,time);
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
            List<CommissionInformation> list = commissionService.selectCommission(orderId,storeId,platformId,beginTime,overTime,time,(pageSupport.getCurrentPageNo()-1)*pageSize,pageSize);


            map.put("list",list);

            //输出返回
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String result = JSON.toJSONString(map);
            out.println(result);
        }catch (Exception e){

        }

    }

    @ResponseBody
    @RequestMapping("/delCommission")
    public void delCommission(@RequestParam String orderId,HttpServletResponse response){
        int number = commissionService.deleteCommission(orderId);
        if(number>0){
            try {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("删除成功");
            }catch (Exception e){
                e.printStackTrace();
            }
        }

    }



    //跳转到提现页面
    @RequestMapping("/tiXian")
    public String tiXian(HttpSession session,Model model){
        UserInformation user = (UserInformation) session.getAttribute("userSession");
        List<StoreInformation> store = null;
        if(user.getCompanyId()==1){
            store = storeService.findStoreAll();
        }else {
            store = storeService.findStoreForMe(user.getUsername());
        }
        model.addAttribute("store",store);
        return "tixian";
    }

    //提交提现申请
    @RequestMapping("/apply")
    public String tiXianShenQing(@RequestParam String storeId,@RequestParam String money,@RequestParam String accountType,
                                 @RequestParam String cardNumber,@RequestParam String payee){
        WithdrawInformation wit = new WithdrawInformation();
        wit.setStoreId(Integer.parseInt(storeId));
        wit.setGetTime(new Date());
        wit.setMoney(new BigDecimal(money));
        wit.setAccountType(accountType);
        wit.setCardNumber(cardNumber);
        wit.setPayee(payee);
        wit.setWithdrawalState(0);
        commissionService.apply(wit);
        return "tixianInfo";
    }

    //跳转到提现审核页面
    @RequestMapping("/goWithdraw")
    public String goWithdraw(){
        return "tixianInfo";
    }

    //查询审核信息
    @ResponseBody
    @RequestMapping("/selectWithdraw")
    public void selectWithdraw(@RequestParam(value = "storeId",required = false) String storeId, @RequestParam(value = "beginTime",required = false)String beginTime, @RequestParam(value = "overTime",required = false)String overTime,
                                 @RequestParam(value = "timeNumber",required = false)String timeNumber,@RequestParam(value = "status",required = false)String status, HttpSession session, Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex, HttpServletResponse response){
        Map<String,List> map = new HashMap<String, List>();
        String statusNo = null;
        if(status!=null && status!=""){
            if(Integer.parseInt(status)==3){
                statusNo = null;
            }else{
                statusNo = status;
            }

        }

        String time = "";
        if(Integer.parseInt(timeNumber)==1){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c = Calendar.getInstance();
            c.add(Calendar.DATE, - 7);
            Date times = c.getTime();
            time = sdf.format(times);
        }else if(Integer.parseInt(timeNumber)==2){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c = Calendar.getInstance();
            c.add(Calendar.DATE, - 30);
            Date times = c.getTime();
            time = sdf.format(times);
        }
        List<StoreInformation> store = new ArrayList<StoreInformation>();
        UserInformation user = (UserInformation)session.getAttribute("userSession");
        if(user.getCompanyId()==1){
            store = storeService.findStoreAll();
        }else{
            store = storeService.findStoreForMe(user.getUsername());
        }
        map.put("store",store);
        if(user.getCompanyId()==4){
            if(storeId==null){
                storeId = String.valueOf(store.get(0).getStoreId());
            }
        }
        int pageSize = 10;
        int currentPageNo = 1;
        if(pageIndex!=null){
            currentPageNo = Integer.parseInt(pageIndex);
        }
        PageSupport pageSupport = new PageSupport();
        List listInfo = new ArrayList();
        int totalCount = commissionService.selectWithCount(storeId,beginTime,overTime,time,statusNo);
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
            List<WithdrawInformation> list = commissionService.selectWith(storeId,beginTime,overTime,time,statusNo,(pageSupport.getCurrentPageNo()-1)*pageSize,pageSize);


            map.put("list",list);


            //输出返回
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String result = JSON.toJSONString(map);
            out.println(result);
        }catch (Exception e){

        }

    }


    //提现通过
    @RequestMapping("/pass")
    public String pass(@RequestParam String id){
        //改变申请佣金的状态
        int result = commissionService.updateStatus(Integer.parseInt(id),1);
        return "tixianInfo";
    }

    //提现驳回
    @RequestMapping("/reject")
    public String reject(@RequestParam String id){
        //驳回状态
        commissionService.updateStatus(Integer.parseInt(id),2);
        return "tixianInfo";
    }

    //批量审批
    @RequestMapping("/passAll")
    public String passAll(@RequestParam List list){
        List arrayList = new ArrayList<String>();
        arrayList = list;
        for (Object then:arrayList){
            commissionService.updateStatus(Integer.parseInt(then.toString()),1);
        }
        return "tixianInfo";
    }

    //批量驳回
    @RequestMapping("/rejectAll")
    public String rejectAll(@RequestParam List list){
        List arrayList = new ArrayList();
        arrayList = list;
        for(Object then:arrayList){
            commissionService.updateStatus(Integer.parseInt(then.toString()),2);
        }
        return "tixianInfo";
    }




}
