package com.sprint2.demo.services;

import com.sprint2.demo.dto.CustomerDto;
import com.sprint2.demo.dto.cart.CartDto;
import com.sprint2.demo.models.Cart;
import org.springframework.validation.BindingResult;

import java.util.List;

public interface ICheckOutService {
    void checkExistOfLinksObject(List<CartDto> cartDtoList, BindingResult bindingResult);

    Cart saveCart(CustomerDto customer);
}
