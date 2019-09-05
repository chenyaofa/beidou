package com.lnp.service.impl;

import com.lnp.dao.LogisticsDao;
import com.lnp.entity.LogisticsInformation;
import com.lnp.entity.StoreInformation;
import com.lnp.service.LogisticsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("LogisticsService")
public class LogisticsServiceImpl implements LogisticsService {

    @Resource(name = "logisticsDao")
    private LogisticsDao logisticsDao;

    @Override
    public List<LogisticsInformation> findList(int logisticsId,String courierId,int storeId, int statusId,String orderId,Integer pageIndex, Integer pagesize) {
        return logisticsDao.findList(logisticsId,courierId,storeId,statusId,orderId,pageIndex,pagesize);
    }

    @Override
    public int findListCount(int logisticsId,String courierId,int storeId, int statusId,String orderId){
        return logisticsDao.findListCount(logisticsId,courierId,storeId,statusId,orderId);
    }


    @Override
    public List<StoreInformation> findStore(){
        return logisticsDao.findStore();
    }

    @Override
    public int findStoreId(String storeName){
        return logisticsDao.findStoreId(storeName);
    }

    @Override
    public int logisticsAdd(LogisticsInformation logisticsInformation){
        return logisticsDao.logisticsAdd(logisticsInformation);
    }

    @Override
    public int logisticsUpdate(LogisticsInformation logisticsInformation){
        return logisticsDao.logisticsUpdate(logisticsInformation);
    }

    @Override
    public LogisticsInformation findLogisticsById(int logisticsId){
        return logisticsDao.findLogisticsById(logisticsId);
    }


    @Override
    public int logisticsDelete(String orderId){
        return logisticsDao.logisticsDelete(orderId);
    }


    @Override
    public int updateLogStatus(String orderId,String status){
        return logisticsDao.updateLogStatus(orderId,status);
    }
}
