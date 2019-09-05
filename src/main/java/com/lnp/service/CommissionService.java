package com.lnp.service;

import com.lnp.entity.CommissionInformation;
import com.lnp.entity.WithdrawInformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommissionService {

    //添加到佣金列表信息
    public int InsertCommission(CommissionInformation commissionInformation);


    //查询佣金列表
    public List<CommissionInformation> selectCommission(@Param("orderId")String orderId, @Param("storeId")String storeId, @Param("platformId")String platformId,
                                                        @Param("beginTime")String beginTime, @Param("overTime")String overTime,@Param("timeNumber")String timeNumber, @Param("pageIndex")Integer pageIndex, @Param("pagesize")Integer pagesize);


    //查询佣金列表分页总数
    public int selectCommissionCount(@Param("orderId")String orderId,@Param("storeId")String storeId,@Param("platformId")String platformId,
                                                             @Param("beginTime")String beginTime,@Param("overTime")String overTime,@Param("timeNumber")String timeNumber);


    //快速查询
    public List<CommissionInformation> quickSelect(@Param("pageIndex")Integer pageIndex,@Param("pagesize")Integer pagesize,@Param("timeNumber")String timeNumber);


    //快速查询分页总数
    public int quickSelectCount(@Param("timeNumber")String timeNumber);

    //佣金提现
    public int apply(WithdrawInformation withdrawInformation);


    //提现审核列表的查询
    public List<WithdrawInformation> selectWith(@Param("storeId")String storeId,@Param("beginTime")String beginTime,@Param("overTime")String overTime,@Param("timeNumber")String timeNumber,
                                                @Param("withdrawalState")String withdrawalState,@Param("pageIndex")Integer pageIndex,@Param("pagesize")Integer pagesize);

    //审核列表分页总数
    public int selectWithCount(@Param("storeId")String storeId,@Param("beginTime")String beginTime,@Param("overTime")String overTime,@Param("timeNumber")String timeNumber,@Param("withdrawalState")String withdrawalState);

    //审核通过
    public int updateStatus(@Param("id")int id,@Param("status")int status);

    //删除佣金信息
    public int deleteCommission(@Param("orderId")String orderId);




}
