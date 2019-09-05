package com.lnp.service.impl;


import com.lnp.dao.UserDao;
import com.lnp.entity.OrderInformation;
import com.lnp.entity.AfterOrder;
import com.lnp.entity.UserInformation;
import com.lnp.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("UserService")
public class UserServiceImpl implements UserService {

    @Resource(name = "userDao")
    private UserDao userDao;


    @Override
    public UserInformation SelectUser(String usernameOruserman, String password) {
        return userDao.SelectUser(usernameOruserman,password);
    }

    @Override
    public int AddUser(UserInformation userInformation) {
        return userDao.AddUser(userInformation);
    }

    @Override
    public List<OrderInformation> findList(String orderId, String orderTime, String tradeName, String consigName, String receiverAddress, String accountName,String storeId, Integer pageIndex, Integer pagesize) {
        return userDao.findList(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId,pageIndex,pagesize);
    }


    @Override
    public int findCount(String orderId, String orderTime, String tradeName, String consigName, String receiverAddress, String accountName,String storeId) {
        return userDao.findCount(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId);
    }

    @Override
    public int orderAdd(OrderInformation information){

        return userDao.orderAdd(information);
    }

    @Override
    public int selectOrderId(String orderId){
        return userDao.selectOrderId(orderId);
    }

    @Override
    public int deleteOrder(String orderId){
        return userDao.deleteOrder(orderId);
    }

    @Override
    public int updateOrder(OrderInformation orderInformation){
        return userDao.updateOrder(orderInformation);
    }

    @Override
    public OrderInformation findUpdate(String orderId){
        return userDao.findUpdate(orderId);
    }


    @Override
    public int updateOrderStatus(String orderStatus,String orderId){
        return userDao.updateOrderStatus(orderStatus,orderId);
    }

    @Override
    public List<OrderInformation> findAllOrder(String orderStatus,String orderTime,Integer pageIndex,Integer pagesize){
        return userDao.findAllOrder(orderStatus,orderTime,pageIndex,pagesize);
    }

    @Override
    public int findAllOrderCount(String orderStatus,String orderTime){
        return userDao.findAllOrderCount(orderStatus,orderTime);
    }

    @Override
    public List<AfterOrder> findOutOrder(String orderId, String orderTime, String tradeName, String consigName, String receiverAddress, String accountName, String storeId, Integer pageIndex, Integer pagesize){
        return userDao.findOutOrder(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId,pageIndex,pagesize);
    }

    @Override
    public int findOutOrderCount(String orderId, String orderTime, String tradeName, String consigName, String receiverAddress, String accountName,String storeId){
        return userDao.findOutOrderCount(orderId,orderTime,tradeName,consigName,receiverAddress,accountName,storeId);
    }

    @Override
    public int deleteUser(String username){
        return userDao.deleteUser(username);
    }

    @Override
    public int RecycleAdd(OrderInformation orderInformation){
        return userDao.RecycleAdd(orderInformation);
    }

    @Override
    public List<UserInformation> findUser(String username,String userman,String creationTime,
                                          String department,Integer pageIndex,Integer pagesize){
        return userDao.findUser(username,userman,creationTime,department,pageIndex,pagesize);
    }

    @Override
    public int findUserCount(String username,String userman,String creationTime, String department){
        return userDao.findUserCount(username,userman,creationTime,department);
    }



}
