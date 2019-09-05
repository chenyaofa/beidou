package com.lnp.controller;

import com.alibaba.fastjson.JSON;
import com.lnp.entity.StoreInformation;
import com.lnp.entity.UserInformation;
import com.lnp.service.StoreService;
import com.lnp.util.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//门店管理
@Controller
@RequestMapping("/store")
public class StoreController {

    @Autowired
    private StoreService storeService;

    //查询门店信息
    @ResponseBody
    @RequestMapping("/findStore")
    public void findStore(@RequestParam(value="storeId",required=false) String storeId, @RequestParam(value="storeName",required=false) String storeName, @RequestParam(value="storeOwner",required=false) String storeOwner,
                          @RequestParam(value="contactWay",required=false) String contactWay, @RequestParam(value="shipAddress",required=false) String shipAddress,  @RequestParam(value="pageSize",required=false) String pageSize, @RequestParam(value="pageIndex",required=false) String pageIndex, HttpServletResponse response){
        List<StoreInformation> list = new ArrayList<StoreInformation>();
        Map<String,List> map = new HashMap<String, List>();

        int pagesize=10;//每页显示数目
        if(pageSize!=null && pageSize!=""){
            pagesize= Integer.parseInt(pageSize);
        }
        int currentPageNo=1;//当前页码

        if (pageIndex!=null ) {
            currentPageNo=Integer.parseInt(pageIndex);
        }
        //总页数
        PageSupport pageSupport=new PageSupport();
        int totalCount=storeService.findStoreCount(storeId,storeName,storeOwner,contactWay,shipAddress);
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
            list=storeService.findStore(storeId,storeName,storeOwner,contactWay,shipAddress, (pageSupport.getCurrentPageNo()-1)*pagesize, pagesize);
            map.put("list",list);
            //输出返回
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String result = JSON.toJSONString(map);
            out.println(result);
        }catch (Exception e){
            //model.addAttribute("erro","没有您要查询的数据");
        }

    }

    //我的门店
    @RequestMapping("/goStoreSon")
    public String goStoreSon(HttpSession session,Model model){
        UserInformation user = (UserInformation)session.getAttribute("userSession");
        List<StoreInformation> list = storeService.findStoreForMe(user.getUsername());

        model.addAttribute("list",list);
        return "MyStore";
    }

    //添加门店信息
    @RequestMapping("/AddStore")
    public String AddStore( @RequestParam(value="storeName",required=false) String storeName, @RequestParam(value="storeOwner",required=false) String storeOwner,
                             @RequestParam(value="contactWay",required=false) String contactWay, @RequestParam(value="shipAddress",required=false) String shipAddress,HttpSession session){
        StoreInformation storeInformation = new StoreInformation();
        storeInformation.setStoreName(storeName);
        storeInformation.setStoreOwner(storeOwner);
        storeInformation.setContactWay(contactWay);
        storeInformation.setShipAddress(shipAddress);
        storeInformation.setFake(0);
        UserInformation user = (UserInformation) session.getAttribute("userSession");
        storeInformation.setUsername(user.getUsername());
        int ok = storeService.addStore(storeInformation);
        if(ok>0){
            return "storeInfo";
        }
        return  "StoreAdd";
    }

    //跳转到添加门店
    @RequestMapping("/goAddStore")
    public String goAddStore(){
        return "StoreAdd";
    }

    //跳转到修改门店信息
    @RequestMapping("/goUpdateStore")
    public String goUpdate(@RequestParam String storeId, HttpServletRequest request){
        StoreInformation storeInformation = new StoreInformation();
        storeInformation = storeService.updateStoreById(storeId);
        String[] address = storeInformation.getShipAddress().split(" ");
        request.setAttribute("address",address);
        request.setAttribute("storeList",storeInformation);
        return "storeUpdate";
    }

    //修改门店信息
    @RequestMapping("/UpdateStore")
    public String updateStore(@RequestParam(value="storeId",required=false) String storeId,@RequestParam(value="storeName",required=false) String storeName, @RequestParam(value="storeOwner",required=false) String storeOwner,
                              @RequestParam(value="contactWay",required=false) String contactWay, @RequestParam(value="shipAddress",required=false) String shipAddress){
        StoreInformation storeInformation = new StoreInformation();
        storeInformation.setStoreId(Integer.parseInt(storeId));
        storeInformation.setStoreName(storeName);
        storeInformation.setStoreOwner(storeOwner);
        storeInformation.setContactWay(contactWay);
        storeInformation.setShipAddress(shipAddress);
        int right = storeService.updateStore(storeInformation);
        if(right>0){
            return "storeInfo";
        }
        return "storeUpdate";
    }

    //返回
    @RequestMapping("/fanHui")
    public String fanHui(){
        return "storeInfo";
    }

    //删除门店
    @RequestMapping("/deleteStore")
    public String deleteStore(@RequestParam String storeId,@RequestParam(value = "shenpi",required = false)String shenpi){
        int right = storeService.deleteStore(storeId);
        if(right>0){
            if(shenpi!=null){
                return "ShenPi";
            }
            return "storeInfo";
        }
        return "storeInfo";
    }

    //跳转到审批页面
    @RequestMapping("/goShenPi")
    public String goShenPi(HttpServletRequest request){
//        List<StoreInformation> list = storeService.findStoreFake();
//        request.setAttribute("list",list);
        return "ShenPi";
    }

    //查询待审批信息
    @ResponseBody
    @RequestMapping("/selectShenPi")
    public void ShenPi(@RequestParam(value="pageIndex",required=false) String pageIndex,HttpServletResponse response, @RequestParam(value="pageSize",required=false) String pageSize){
        //因为是直接查询出所有未审核的门店信息的，所以没有啥分页不分页的
        Map<String,List> map = new HashMap<String, List>();



        int pagesize=10;//每页显示数目
        int currentPageNo=1;//当前页码

        if(pageSize!=null && pageSize!=""){
            pagesize= Integer.parseInt(pageSize);
        }
        if (pageIndex!=null ) {
            currentPageNo=Integer.parseInt(pageIndex);
        }
        //总页数
        PageSupport pageSupport=new PageSupport();
        int totalCount=storeService.findStoreFakeCount();

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
            List<StoreInformation> list = storeService.findStoreFake((pageSupport.getCurrentPageNo()-1)*pagesize, pagesize);
            map.put("list",list);

            //输出返回
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String result = JSON.toJSONString(map);
            out.println(result);
        }catch (Exception e){

        }


    }

    //审批通过
    @RequestMapping("/updateTongGuo")
    public String updateTongGuo(@RequestParam String storeId){
        int result = storeService.updateFake(Integer.parseInt(storeId));
        return "redirect:/store/goShenPi";
    }


}
