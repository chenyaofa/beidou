package com.lnp.service;

import com.lnp.entity.StoreInformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StoreService {

    //根据输入信息查询门店
    public List<StoreInformation> findStore(@Param("storeId")String storeId,@Param("storeName")String storeName, @Param("storeOwner")String storeOwner, @Param("contactWay")String contactWay,
                                            @Param("shipAddress")String shipAddress, @Param("pageIndex")Integer pageIndex, @Param("pagesize")Integer pagesize);

    //分页所需门店数量
    public int findStoreCount(@Param("storeId")String storeId,@Param("storeName")String storeName,@Param("storeOwner")String storeOwner,@Param("contactWay")String contactWay,
                              @Param("shipAddress")String shipAddress);

    //根据用户账号查询所用有门店
    public List<StoreInformation> findStoreForMe(@Param("username")String username);

    //增加订单信息功能
    public int addStore(StoreInformation storeInformation);

    //修改门店信息功能
    public int updateStore(StoreInformation storeInformation);

    //修改传值
    public StoreInformation updateStoreById(@Param("storeId")String storeId);

    //删除门店
    public int deleteStore(@Param("storeId")String storeId);

    //查询出所有门店的地址信息
    public List<StoreInformation> findStoreAll();

    public List<StoreInformation> findStoreFake(@Param("pageIndex")Integer pageIndex,@Param("pagesize")Integer pagesize);

    //待审批总数
    public int findStoreFakeCount();

    //审批门店
    public int updateFake(@Param("storeId")int storeId);
}
