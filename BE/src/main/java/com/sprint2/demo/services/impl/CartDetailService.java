package com.sprint2.demo.services.impl;

import com.sprint2.demo.models.CartDetail;
import com.sprint2.demo.repository.ICartDetailRepository;
import com.sprint2.demo.services.ICartDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartDetailService implements ICartDetailService {
    @Autowired
    private ICartDetailRepository iCartDetailRepository;

    @Override
    public void saveDetailList(List<CartDetail> cartDetailList) {
        this.iCartDetailRepository.saveAll(cartDetailList);
    }

    @Override
    public void saveDetail(CartDetail cartDetail) {
        this.iCartDetailRepository.save(cartDetail);
    }
}
