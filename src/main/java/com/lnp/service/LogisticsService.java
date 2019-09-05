package com.lnp.service;

import com.lnp.entity.LogisticsInformation;
import com.lnp.entity.StoreInformation;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

public interface LogisticsService {

    //根据物流信息编号查询物流信息
    public List<LogisticsInformation> findList(@Param("logisticsId") int logisticsId,@Param("courierId") String courierId,@Param("storeId") int storeId,
                                               @Param("statusId") int statusId,@Param("orderId") String orderId,@Param("pageIndex")Integer pageIndex,@Param("pagesize")Integer pagesize);

    //查询结果行数
    public int findListCount(@Param("logisticsId") int logisticsId,@Param("courierId") String courierId,@Param("storeId") int storeId,
                             @Param("statusId") int statusId,@Param("orderId") String orderId);

    //加载门店下拉框
    public List<StoreInformation> findStore();

    //根据门店名称知道门店id
    public int findStoreId(@Param("storeName")String storeName);

    //增加物流信息
    public int logisticsAdd(LogisticsInformation logisticsInformation);

    //修改物流信息
    public int logisticsUpdate(LogisticsInformation logisticsInformation);

    //修改前传值方法
    public LogisticsInformation findLogisticsById(@Param("logisticsId")int logisticsId);

    //删除物流信息
    public int logisticsDelete(@Param("orderId")String orderId);

    //修改物流状态的方法
    public int updateLogStatus(@Param("orderId")String orderId,@Param("status") String status);
}
