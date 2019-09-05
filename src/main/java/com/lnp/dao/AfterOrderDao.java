package com.lnp.dao;

import com.lnp.entity.AfterOrder;
import com.lnp.entity.RecycleOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AfterOrderDao {

    //删除售后信息
    public int deleteAfterOrder(@Param("orderId")String orderId);

    //删除回收站信息
    public int deleteRecycle(@Param("orderId")String orderId);

    //清空回收站
    public int deleteAllRecycle();

    //按订单编号查询订单
    public RecycleOrder findRecycleOrder(@Param("orderId")String orderId);

    //添加售后信息
    public int addAfterOrder(AfterOrder afterOrder);


    //查询回收站订单信息
    public List<RecycleOrder> findRecycle(@Param("orderId")String orderId,
                                          @Param("orderTime")String orderTime,@Param("tradeName")String tradeName,
                                          @Param("consigName")String consigName,@Param("receiverAddress")String receiverAddress,
                                          @Param("accountName")String accountName,@Param("storeId")String storeId,@Param("pageIndex")Integer pageIndex,@Param("pagesize")Integer pagesize);

    //查询订单数量
    public int findRecycleCount(@Param("orderId")String orderId,
                                @Param("orderTime")String orderTime,@Param("tradeName")String tradeName,
                                @Param("consigName")String consigName,@Param("receiverAddress")String receiverAddress,
                                @Param("accountName")String accountName,@Param("storeId")String storeId);



}
