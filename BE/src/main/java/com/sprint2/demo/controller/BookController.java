package com.sprint2.demo.controller;

import com.sprint2.demo.models.Book;
import com.sprint2.demo.services.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin
@RequestMapping("/books")
public class BookController {
    @Autowired
    private IBookService bookService;

    @GetMapping(value = "")
    public ResponseEntity<Page<Book>> getAll(@PageableDefault(value = 8) Pageable pageable,
                                             Optional<String> sort,
                                             Optional<String> name) {
        Sort.Direction direction = Sort.Direction.DESC;
        String sortField = "releaseDate";

        if (sort.isPresent()) {
            String sortVal = sort.get();
            sortField = sortVal.contains("release") ? "releaseDate" : "price";
            direction = sortVal.contains("DESC") ? Sort.Direction.DESC : Sort.Direction.ASC;
        }

        Sort sortRequest = Sort.by(direction, sortField);
        Pageable pageableRequest = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), sortRequest);
        Page<Book> bookPage = this.bookService.findAll(name.orElse(""), pageableRequest);
        if (bookPage.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<>(bookPage, HttpStatus.OK);
        }
    }

    @GetMapping("{id}")
    public ResponseEntity<Book> getBookDetailDtoById(@PathVariable("id") Integer bookId) {
        Book book = bookService.findById(bookId);
        if (book == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(book, HttpStatus.OK);
    }

    @GetMapping("relative/{id}")
    public ResponseEntity<List<Book>> getRelativeBookById(@PathVariable("id") Integer bookId) {
        List<Book> bookList = bookService.findTop10BookRelative(bookId);
        if (bookList == null || bookList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(bookList, HttpStatus.OK);
    }
}
