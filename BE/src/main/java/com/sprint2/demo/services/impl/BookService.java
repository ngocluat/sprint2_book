package com.sprint2.demo.services.impl;

import com.sprint2.demo.models.Book;
import com.sprint2.demo.repository.IBookRepository;
import com.sprint2.demo.services.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class BookService implements IBookService {
    @Autowired
    private IBookRepository bookRepository;

    @Override
    public void save(Book book) {
        this.bookRepository.save(book);
    }

    @Override
    public void update(Book book) {
        this.bookRepository.save(book);
    }

    @Override
    public void remove(Integer id) {
        this.bookRepository.delete(this.findById(id));
    }

    @Override
    public Page<Book> findAll(String name, Pageable pageable) {
        return this.bookRepository.findAllByNameContaining(name, pageable);
    }

    @Override
    public Book findById(Integer id) {
        return this.bookRepository.findById(id).orElse(null);
    }

    @Override
    public void updateAll(List<Book> bookList) {
        this.bookRepository.saveAll(bookList);
    }

    @Override
    public List<Book> findTop10BookRelative(Integer bookId) {
        Book book = this.bookRepository.findById(bookId).orElse(null);
        if (book == null) {
            return Collections.emptyList();
        }
        return this.bookRepository.findTop10RelativeBookByAuthorOrCategory(book.getAuthor().getId(),
                book.getCategory().getId(), bookId);
    }
}
