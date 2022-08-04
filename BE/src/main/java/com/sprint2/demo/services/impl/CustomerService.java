package com.sprint2.demo.services.impl;

import com.sprint2.demo.models.Customer;
import com.sprint2.demo.repository.customer.ICustomerRepository;
import com.sprint2.demo.services.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService implements ICustomerService {
    @Autowired
    private ICustomerRepository iCustomerRepository;

    @Override
    public Customer findCustomerByEmail(String email) {
        return this.iCustomerRepository.findFirstByEmail(email);
    }
}
