package ru.mephi.ourbookstore.controller.book;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/books")
public class BookController {

    @GetMapping("/{bookId}")
    public BookDto getBook(@PathVariable String bookId) {
        return new BookDto(1, "Мертвые души", 1, 1);
    }
}
