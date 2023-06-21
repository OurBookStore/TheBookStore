package ru.mephi.ourbookstore.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mephi.ourbookstore.domain.BookDto;

@RestController
@RequestMapping("/v1/books")
public class BookController {

    @GetMapping
    ResponseEntity<BookDto> getBook(){
        return ResponseEntity.ok(new BookDto("Мертвые души","Гоголь"));
    }
}
