package com.lnp.service.impl;

import com.lnp.dao.CommissionDao;
import com.lnp.entity.CommissionInformation;
import com.lnp.entity.WithdrawInformation;
import com.lnp.service.CommissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CommissionServiceImpl implements CommissionService {

    @Resource(name = "commissionDao")
    private CommissionDao commissionDao;


    @Override
    public int InsertCommission(CommissionInformation commissionInformation) {
        return commissionDao.InsertCommission(commissionInformation);
    }


    //查询佣金列表
    public List<CommissionInformation> selectCommission(String orderId, String storeId,String platformId,
                                                        String beginTime,String overTime,String timeNumber,Integer pageIndex,Integer pagesize){
        return commissionDao.selectCommission(orderId,storeId,platformId,beginTime,overTime,timeNumber,pageIndex,pagesize);
    }


    //查询佣金列表分页总数
    public int selectCommissionCount(String orderId,String storeId,String platformId,
                                                             String beginTime,String overTime,String timeNumber){
        return commissionDao.selectCommissionCount(orderId,storeId,platformId,beginTime,overTime,timeNumber);
    }


    //快速查询
    public List<CommissionInformation> quickSelect(Integer pageIndex,Integer pagesize,String timeNumber){
        return commissionDao.quickSelect(pageIndex,pagesize,timeNumber);
    }

    //快速查询分页总数
    public int quickSelectCount(String timeNumber){
        return commissionDao.quickSelectCount(timeNumber);
    }


    //佣金提现
    public int apply(WithdrawInformation withdrawInformation){
        return commissionDao.apply(withdrawInformation);
    }

    //提现审核列表的查询
    public List<WithdrawInformation> selectWith(String storeId,String beginTime,String overTime,String timeNumber,
                                                String withdrawalState,Integer pageIndex,Integer pagesize){
        return commissionDao.selectWith(storeId,beginTime,overTime,timeNumber,withdrawalState,pageIndex,pagesize);
    }

    //审核列表分页总数
    public int selectWithCount(String storeId,String beginTime,String overTime,String timeNumber,String withdrawalState){
        return commissionDao.selectWithCount(storeId,beginTime,overTime,timeNumber,withdrawalState);
    }

    //审核通过
    public int updateStatus(int id,int status){
        return commissionDao.updateStatus(id,status);
    }


    //删除佣金信息
    public int deleteCommission(String orderId){
        return commissionDao.deleteCommission(orderId);
    }












}
