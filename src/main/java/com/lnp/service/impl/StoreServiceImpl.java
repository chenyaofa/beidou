package com.lnp.service.impl;

import com.lnp.dao.StoreDao;
import com.lnp.entity.StoreInformation;
import com.lnp.service.StoreService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("StoreService")
public class StoreServiceImpl implements StoreService {

    @Resource(name = "storeDao")
    private StoreDao storeDao;

    @Override
    public List<StoreInformation> findStore(String storeId,String storeName, String storeOwner, String contactWay, String shipAddress, Integer pageIndex, Integer pagesize) {
        return storeDao.findStore(storeId,storeName,storeOwner,contactWay,shipAddress,pageIndex,pagesize);
    }

    @Override
    public int findStoreCount(String storeId,String storeName, String storeOwner, String contactWay, String shipAddress) {
        return storeDao.findStoreCount(storeId,storeName,storeOwner,contactWay,shipAddress);
    }

    @Override
    public int addStore(StoreInformation storeInformation) {
        return storeDao.addStore(storeInformation);
    }

    @Override
    public StoreInformation updateStoreById(String storeId){
        return storeDao.updateStoreById(storeId);
    }

    @Override
    public int updateStore(StoreInformation storeInformation){
        return storeDao.updateStore(storeInformation);
    }

    @Override
    public int deleteStore(String storeId){
        return storeDao.deleteStore(storeId);
    }


    @Override
    public List<StoreInformation> findStoreAll(){
        return storeDao.findStoreAll();
    }

    @Override
    public int updateFake(int storeId){
        return storeDao.updateFake(storeId);
    }

    @Override
    public List<StoreInformation> findStoreFake(Integer pageIndex,Integer pagesize){
        return storeDao.findStoreFake(pageIndex,pagesize);
    }

    //待审批总数
    public int findStoreFakeCount(){
        return storeDao.findStoreFakeCount();
    }

    @Override
    public List<StoreInformation> findStoreForMe(String username){
        return storeDao.findStoreForMe(username);
    }
}
