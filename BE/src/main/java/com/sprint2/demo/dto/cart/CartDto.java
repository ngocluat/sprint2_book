package com.sprint2.demo.dto.cart;

import com.sprint2.demo.dto.BookDto;
import com.sprint2.demo.models.Book;

import javax.validation.constraints.Min;

public class CartDto {
    @Min(value = 1, message = "So luong khong duoc nho hon 1")
    private Integer quantity;
    private Book book;

    public CartDto() {
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

}
