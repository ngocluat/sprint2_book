package com.sprint2.demo.services;

import com.sprint2.demo.models.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface IBookService {
    void save(Book book);

    void update(Book book);

    void remove(Integer id);

    Page<Book> findAll(String name,Pageable pageable);

    Book findById(Integer id);

    void updateAll(List<Book> bookList);

    List<Book> findTop10BookRelative(Integer bookId);
}
