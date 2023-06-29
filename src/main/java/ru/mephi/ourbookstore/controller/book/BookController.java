package ru.mephi.ourbookstore.controller.book;

import java.util.List;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;
import ru.mephi.ourbookstore.mapper.book.BookDtoMapper;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.service.book.BookService;

@RestController
@RequestMapping("/books")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BookController {

    final BookService bookService;
    final BookDtoMapper bookDtoMapper;

    @GetMapping("/{bookId}")
    public BookDto getById(@PathVariable long bookId) {
        return bookDtoMapper.ObjectToDto(bookService.getById(bookId));
    }

    @GetMapping
    public List<BookDto> getAll() {
        return bookService.getAll().stream()
                .map(bookDtoMapper::ObjectToDto)
                .toList();
    }

    @PostMapping
    public void create(@RequestBody BookDto bookDto) {
        Book book = bookDtoMapper.dtoToObject(bookDto);
        bookService.create(book);
    }

    @PutMapping
    public void update(@RequestBody BookDto bookDto) {
        Book book = bookDtoMapper.dtoToObject(bookDto);
        bookService.update(book);
    }

    @DeleteMapping("/{bookId}")
    public void delete(@PathVariable long bookId) {
        bookService.delete(bookId);
    }
}
