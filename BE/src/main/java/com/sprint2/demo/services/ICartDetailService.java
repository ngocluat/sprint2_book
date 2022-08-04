package com.sprint2.demo.services;

import com.sprint2.demo.models.CartDetail;

import java.util.List;

public interface ICartDetailService {
    void saveDetailList(List<CartDetail> cartDetailList);

    void saveDetail(CartDetail cartDetail);
}
