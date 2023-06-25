package ru.mephi.ourbookstore;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.junit.jupiter.api.AfterEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import ru.mephi.ourbookstore.controller.book.BookController;
import ru.mephi.ourbookstore.repository.book.BookRepository;

@SpringBootTest
@ActiveProfiles("test")
@FieldDefaults(level = AccessLevel.PROTECTED)
public class BookStoreTest {

    @Autowired
    BookController bookController;
    @Autowired
    BookRepository bookRepository;
}

