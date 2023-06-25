package ru.mephi.ourbookstore.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mephi.ourbookstore.domain.BookDto;

@RestController
@RequestMapping("/books")
public class BookController {

    @GetMapping
    BookDto getBook() {
        return new BookDto("Мертвые души", "Гоголь");
    }
}
