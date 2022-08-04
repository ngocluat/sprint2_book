package com.sprint2.demo.repository.customer;

import com.sprint2.demo.models.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ICustomerRepository extends JpaRepository<Customer, Integer> {

    Customer findFirstByEmail(String email);
}
