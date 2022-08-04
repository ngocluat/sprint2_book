package com.sprint2.demo.dto.cart;

import com.sprint2.demo.dto.CustomerDto;

import javax.validation.constraints.Min;
import java.util.List;

public class CartAndDetailDto {
    private Integer id;
    private CustomerDto customer;
    private List<CartDto> cartDtoList;
    private String dateCreate;
    @Min(value = 1, message = "Tong khong duoc nho hon 0")
    private Double total;

    public CartAndDetailDto() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public CustomerDto getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerDto customer) {
        this.customer = customer;
    }

    public List<CartDto> getCartDtoList() {
        return cartDtoList;
    }

    public void setCartDtoList(List<CartDto> cartDtoList) {
        this.cartDtoList = cartDtoList;
    }

    public String getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
}
