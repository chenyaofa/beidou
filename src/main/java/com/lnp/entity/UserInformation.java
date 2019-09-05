package com.lnp.entity;

import java.util.Date;

public class UserInformation {
    private String username;//用户名
    private String password;//密码
    private String userman;//使用人名称
    private String creationTime;//创建时间
    private String department;//所属部门

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    private int companyId;//权限等级

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserman() {
        return userman;
    }

    public void setUserman(String userman) {
        this.userman = userman;
    }

    public String getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(String creationTime) {
        this.creationTime = creationTime;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }


}
