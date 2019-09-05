package com.lnp.entity;

import java.math.BigDecimal;
import java.util.Date;

public class RecycleOrder {
    private String orderId;//订单编号
    private String tradeName;//商品名称
    private BigDecimal tradePrices;//商品价格
    private int tradeOfGoods;//商品数量
    private BigDecimal amountPaid;//实付金额
    private int platformId;//下单平台
    private String consigName;//收货人
    private String accountName;//买家名称
    private String phoneNumber;//手机号码
    private String receiverAddress;//收货地址
    private int logisticsId;//物流编号
    private Date orderTime;//订单时间
    private int orderStatus;//订单状态

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    private String storeName;//门店名称

    private int storeId;//门店编号

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String statusName;//状态名称

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getTradeName() {
        return tradeName;
    }

    public void setTradeName(String tradeName) {
        this.tradeName = tradeName;
    }

    public BigDecimal getTradePrices() {
        return tradePrices;
    }

    public void setTradePrices(BigDecimal tradePrices) {
        this.tradePrices = tradePrices;
    }

    public int getTradeOfGoods() {
        return tradeOfGoods;
    }

    public void setTradeOfGoods(int tradeOfGoods) {
        this.tradeOfGoods = tradeOfGoods;
    }

    public BigDecimal getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(BigDecimal amountPaid) {
        this.amountPaid = amountPaid;
    }

    public int getPlatformId() {
        return platformId;
    }

    public void setPlatformId(int platformId) {
        this.platformId = platformId;
    }

    public String getConsigName() {
        return consigName;
    }

    public void setConsigName(String consigName) {
        this.consigName = consigName;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public int getLogisticsId() {
        return logisticsId;
    }

    public void setLogisticsId(int logisticsId) {
        this.logisticsId = logisticsId;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }
}
