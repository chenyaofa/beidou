package com.lnp.service.impl;

import com.lnp.dao.AfterOrderDao;
import com.lnp.entity.AfterOrder;
import com.lnp.entity.RecycleOrder;
import com.lnp.service.AfterOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("AfterOrderService")
public class AfterOrderServiceImpl implements AfterOrderService {

    @Resource(name = "afterOrderDao")
    private AfterOrderDao afterOrderDao;


    @Override
    public int deleteAfterOrder(String orderId) {
        return afterOrderDao.deleteAfterOrder(orderId);
    }


    @Override
    public RecycleOrder findRecycleOrder(String orderId){
        return afterOrderDao.findRecycleOrder(orderId);
    }

    @Override
    public int deleteAllRecycle(){
        return afterOrderDao.deleteAllRecycle();
    }

    @Override
    public int addAfterOrder(AfterOrder afterOrder){
        return afterOrderDao.addAfterOrder(afterOrder);
    }


    @Override
    public List<RecycleOrder> findRecycle(String orderId, String orderTime, String tradeName, String consigName, String receiverAddress, String accountName,String storeId, Integer pageIndex, Integer pagesize){
        return afterOrderDao.findRecycle(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId,pageIndex,pagesize);
    }

    @Override
    public int findRecycleCount(String orderId, String orderTime, String tradeName, String consigName, String receiverAddress, String accountName,String storeId){
        return afterOrderDao.findRecycleCount(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId);
    }

    @Override
    public int deleteRecycle(String orderId){
        return afterOrderDao.deleteRecycle(orderId);
    }

}
