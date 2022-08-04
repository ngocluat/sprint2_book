package com.sprint2.demo.repository;

import com.sprint2.demo.models.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ICartRepository extends JpaRepository<Cart, Integer> {
}
