package com.sprint2.demo.services;

import com.sprint2.demo.models.Customer;

public interface ICustomerService {
    Customer findCustomerByEmail(String email);
}
