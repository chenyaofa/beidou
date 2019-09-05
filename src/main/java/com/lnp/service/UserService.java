package com.lnp.service;

import com.lnp.entity.OrderInformation;
import com.lnp.entity.AfterOrder;
import com.lnp.entity.UserInformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {

    //根据用户名密码验证是否登录成功
    public UserInformation SelectUser(String usernameOruserman, String password);

    //注册用户
    public int AddUser(UserInformation userInformation);

    //查询验证是否有重复订单
    public int selectOrderId(String orderId);

    //分页查询
    public List<OrderInformation> findList(@Param("orderId")String orderId,
                                           @Param("orderTime")String orderTime, @Param("tradeName")String tradeName,
                                           @Param("consigName")String consigName, @Param("receiverAddress")String receiverAddress,
                                           @Param("accountName")String accountName,@Param("storeId")String storeId, @Param("pageIndex")Integer pageIndex, @Param("pagesize")Integer pagesize);

    //分页总记录查询
    public int findCount(@Param("orderId")String orderId,
                         @Param("orderTime")String orderTime,@Param("tradeName")String tradeName,
                         @Param("consigName")String consigName,@Param("receiverAddress")String receiverAddress,
                         @Param("accountName")String accountName,@Param("storeId")String storeId);


    //转移订单信息到回收站的方法
    public int RecycleAdd(OrderInformation orderInformation);

    //增加订单的方法
    public int orderAdd(OrderInformation information);

    //删除订单的方法
    public int deleteOrder(@Param("orderId")String orderId);

    //修改订单的方法
    public int updateOrder(OrderInformation orderInformation);

    //修改订单前传值的方法
    public OrderInformation findUpdate(@Param("orderId")String orderId);


    //修改订单状态
    public int updateOrderStatus(@Param("orderStatus")String orderStatus,@Param("orderId")String orderId);

    //批量操作查询订单信息的方法
    public List<OrderInformation> findAllOrder(@Param("orderStatus")String orderStatus,@Param("orderTime")String orderTime,@Param("pageIndex")Integer pageIndex,@Param("pagesize")Integer pagesize);

    //批量操作分页
    public int findAllOrderCount(@Param("orderStatus")String orderStatus,@Param("orderTime")String orderTime);

    //退货审批查询
    public List<AfterOrder> findOutOrder(@Param("orderId")String orderId,
                                         @Param("orderTime")String orderTime, @Param("tradeName")String tradeName,
                                         @Param("consigName")String consigName, @Param("receiverAddress")String receiverAddress,
                                         @Param("accountName")String accountName, @Param("storeId")String storeId, @Param("pageIndex")Integer pageIndex, @Param("pagesize")Integer pagesize);

    //退货审批查询分页的总页数
    public int findOutOrderCount(@Param("orderId")String orderId,
                                 @Param("orderTime")String orderTime,@Param("tradeName")String tradeName,
                                 @Param("consigName")String consigName,@Param("receiverAddress")String receiverAddress,
                                 @Param("accountName")String accountName,@Param("storeId")String storeId);

    //删除用户
    public int deleteUser(@Param("username")String username);

    //查询用户列表
    public List<UserInformation> findUser(@Param("username")String username,@Param("userman")String userman,@Param("creationTime")String creationTime,
                                          @Param("department")String department,@Param("pageIndex")Integer pageIndex, @Param("pagesize")Integer pagesize);

    //分页
    public int findUserCount(@Param("username")String username,@Param("userman")String userman,@Param("creationTime")String creationTime,
                             @Param("department")String department);


}
