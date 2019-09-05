package com.lnp.entity;

import java.math.BigDecimal;
import java.util.Date;

public class AfterOrder {

    private String orderId;
    private String tradeName;
    private BigDecimal tradePrices;
    private int tradeOfGoods;
    private BigDecimal AmountPaid;
    private int platformId;
    private String consigName;
    private String accountName;
    private String phoneNumber;
    private String receiverAddress;
    private String orderTime;
    private int storeId;
    private String recycleContent;



    public int getTradeOfGoods() {
        return tradeOfGoods;
    }

    public void setTradeOfGoods(int tradeOfGoods) {
        this.tradeOfGoods = tradeOfGoods;
    }


    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    private String storeName;//门店名称


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

    public BigDecimal getAmountPaid() {
        return AmountPaid;
    }

    public void setAmountPaid(BigDecimal amountPaid) {
        AmountPaid = amountPaid;
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

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public String getRecycleContent() {
        return recycleContent;
    }

    public void setRecycleContent(String recycleContent) {
        this.recycleContent = recycleContent;
    }


}
