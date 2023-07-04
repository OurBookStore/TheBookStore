package ru.mephi.ourbookstore;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import ru.mephi.ourbookstore.controller.book.BookController;
import ru.mephi.ourbookstore.controller.customer.CustomerController;
import ru.mephi.ourbookstore.repository.book.BookRepository;
import ru.mephi.ourbookstore.repository.customer.CustomerRepository;

@SpringBootTest
@ActiveProfiles("test")
@FieldDefaults(level = AccessLevel.PROTECTED)
public class BookStoreTest {

    @Autowired
    BookController bookController;
    @Autowired
    BookRepository bookRepository;

    @Autowired
    CustomerController customerController;
    @Autowired
    CustomerRepository customerRepository;
}

