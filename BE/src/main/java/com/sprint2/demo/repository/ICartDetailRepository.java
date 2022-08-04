package com.sprint2.demo.repository;

import com.sprint2.demo.models.CartDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ICartDetailRepository extends JpaRepository<CartDetail, Integer> {
}
