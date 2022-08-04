package com.sprint2.demo.repository;

import com.sprint2.demo.models.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IBookRepository extends JpaRepository<Book, Integer> {
    Page<Book> findAllByNameContaining(String name, Pageable pageable);

    @Query(value = "SELECT *\n" +
            "FROM book\n" +
            "WHERE (author_id = :authorId\n" +
            "   OR category_id = :categoryId) AND book.id != :bookId LIMIT 10",
            nativeQuery = true)
    List<Book> findTop10RelativeBookByAuthorOrCategory(Integer authorId, Integer categoryId, Integer bookId);
}
