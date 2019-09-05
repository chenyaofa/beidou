package com.lnp.entity;

import java.math.BigDecimal;

public class StoreInformation {
    private int storeId;//门店编号
    private String storeName;//门店名称
    private String storeOwner;//门店店主
    private String contactWay;//联系方式
    private String shipAddress;//发货地址

    public BigDecimal getAgentMoney() {
        return agentMoney;
    }

    public void setAgentMoney(BigDecimal agentMoney) {
        this.agentMoney = agentMoney;
    }

    private BigDecimal agentMoney;//佣金总数

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    private String username;//所属用户

    public int getFake() {
        return fake;
    }

    public void setFake(int fake) {
        this.fake = fake;
    }

    private int fake;//是否通过审批

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getStoreOwner() {
        return storeOwner;
    }

    public void setStoreOwner(String storeOwner) {
        this.storeOwner = storeOwner;
    }

    public String getContactWay() {
        return contactWay;
    }

    public void setContactWay(String contactWay) {
        this.contactWay = contactWay;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }


}
