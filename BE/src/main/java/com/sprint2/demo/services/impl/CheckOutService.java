package com.sprint2.demo.services.impl;

import com.sprint2.demo.dto.CustomerDto;
import com.sprint2.demo.dto.cart.CartDto;
import com.sprint2.demo.models.Book;
import com.sprint2.demo.models.Cart;
import com.sprint2.demo.models.Customer;
import com.sprint2.demo.repository.ICartRepository;
import com.sprint2.demo.services.IBookService;
import com.sprint2.demo.services.ICheckOutService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class CheckOutService implements ICheckOutService {
    @Autowired
    private ICartRepository iCartRepository;
    @Autowired
    private IBookService iBookService;

    @Override
    public void checkExistOfLinksObject(List<CartDto> cartDtoList, BindingResult bindingResult) {
        int i = 0;
        Book bookCurrent;
        for (CartDto cartDetail : cartDtoList) {
            bookCurrent = this.iBookService.findById(cartDetail.getBook().getId());
            if (bookCurrent != null) {
                BeanUtils.copyProperties(bookCurrent, cartDetail.getBook());
                if (bookCurrent.getQuantity() < 1) {
                    addErrorIntoBindingResult(bookCurrent.getName(), "hiện tại đã hết hàng", i, bindingResult);
                } else if (bookCurrent.getQuantity() < cartDetail.getQuantity()) {
                    addErrorIntoBindingResult(bookCurrent.getName(),
                            "hiện tại chỉ còn " + bookCurrent.getQuantity() + " sản phẩm", i, bindingResult);
                }
            } else {
                addErrorIntoBindingResult(cartDetail.getBook().getName(), "Không tồn tại trong hệ thống", i, bindingResult);
            }
            bookCurrent = null;
            i++;
        }
    }

    @Override
    public Cart saveCart(CustomerDto customer) {
        Customer customerSave = new Customer();
        customerSave.setId(customer.getId());
        Cart cart = new Cart();
        LocalDate now = LocalDate.now();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        cart.setDateCreate(now.format(format));
        cart.setStatus(true);
        cart.setCustomer(customerSave);

        return this.iCartRepository.save(cart);
    }

    private void addErrorIntoBindingResult(String bookName, String message, int index, BindingResult bindingResult) {
        bindingResult.pushNestedPath("cartDetail[" + index + "]");
        bindingResult.rejectValue("book", "error", bookName + " " + message);
        bindingResult.popNestedPath();
    }
}
