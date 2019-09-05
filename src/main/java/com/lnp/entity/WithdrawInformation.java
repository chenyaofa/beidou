package com.lnp.entity;

import java.math.BigDecimal;
import java.util.Date;

public class WithdrawInformation {
    private int id;//ID
    private int storeId;//店铺id
    private Date getTime;//提现时间
    private BigDecimal money;//提现金额
    private String accountType;//账号类型
    private String cardNumber;//卡号
    private String payee;//收款人
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    private String time;//string格式的时间
    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    private String storeName;//店铺名称

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public Date getGetTime() {
        return getTime;
    }

    public void setGetTime(Date getTime) {
        this.getTime = getTime;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getPayee() {
        return payee;
    }

    public void setPayee(String payee) {
        this.payee = payee;
    }

    public int getWithdrawalState() {
        return withdrawalState;
    }

    public void setWithdrawalState(int withdrawalState) {
        this.withdrawalState = withdrawalState;
    }

    private int withdrawalState;//提现状态
}
