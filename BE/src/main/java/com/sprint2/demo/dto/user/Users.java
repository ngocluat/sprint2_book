package com.sprint2.demo.dto.user;


import com.sprint2.demo.models.Customer;

public class Users {
    private String username;
    private String password;
    private boolean flag;
    private Customer customer;

    public Users() {
        //HuuNQ
    }

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

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }
    
    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

}
