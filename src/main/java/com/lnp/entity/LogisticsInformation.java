package com.lnp.entity;

public class LogisticsInformation {
    private int logisticsId;//物流信息编号
    private int logisticsCompanyId;//物流公司编号
    private String courierId;//快递单号
    private String logisticsRoute;//物流路线
    private int storeId;//发货门店编号
    private int statusId;//订单状态编号

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    private String orderId;//订单编号

    private String logisticsCompanyName;//物流公司名称
    private String storeName;//门店名称
    private String statusName;//订单状态

    public String getLogisticsCompanyName() {
        return logisticsCompanyName;
    }

    public void setLogisticsCompanyName(String logisticsCompanyName) {
        this.logisticsCompanyName = logisticsCompanyName;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public int getLogisticsId() {
        return logisticsId;
    }

    public void setLogisticsId(int logisticsId) {
        this.logisticsId = logisticsId;
    }

    public int getLogisticsCompanyId() {
        return logisticsCompanyId;
    }

    public void setLogisticsCompanyId(int logisticsCompanyId) {
        this.logisticsCompanyId = logisticsCompanyId;
    }

    public String getCourierId() {
        return courierId;
    }

    public void setCourierId(String courierId) {
        this.courierId = courierId;
    }

    public String getLogisticsRoute() {
        return logisticsRoute;
    }

    public void setLogisticsRoute(String logisticsRoute) {
        this.logisticsRoute = logisticsRoute;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }


}
