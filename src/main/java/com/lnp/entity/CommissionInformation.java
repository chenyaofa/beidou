package com.lnp.entity;

import java.math.BigDecimal;
import java.util.Date;

public class CommissionInformation {
    private String orderId;//订单号

    private String tradeName;//商品名称

    private BigDecimal tradePrices;//商品价格

    private int tradeOfGoods;//商品数量

    private int platformId;//下单平台id

    public String getPlatformName() {
        return platformName;
    }

    public void setPlatformName(String platformName) {
        this.platformName = platformName;
    }

    private String platformName;//下单平台名称

    private Date orderTime;//下单时间

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    private String time;//string格式的时间

    private int storeId;//所属门店

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    private String storeName;//门店名称

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

    public int getPlatformId() {
        return platformId;
    }

    public void setPlatformId(int platformId) {
        this.platformId = platformId;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public BigDecimal getBrokerage() {
        return brokerage;
    }

    public void setBrokerage(BigDecimal brokerage) {
        this.brokerage = brokerage;
    }

    private BigDecimal brokerage;//所得佣金
}
