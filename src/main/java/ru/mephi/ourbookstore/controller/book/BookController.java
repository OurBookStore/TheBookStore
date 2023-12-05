package ru.mephi.ourbookstore.controller.book;

import java.util.List;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mephi.ourbookstore.domain.dto.book.BookCreateDto;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;
import ru.mephi.ourbookstore.domain.dto.book.BookUpdateDto;
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
        return bookDtoMapper.objectToDto(bookService.getById(bookId));
    }

    @GetMapping
    public List<BookDto> getAll() {
        return bookService.getAll().stream()
                .map(bookDtoMapper::objectToDto)
                .toList();
    }

    @GetMapping("/{searchText}")
    public List<BookDto> search(@PathVariable String searchText) {
        return bookService.search(searchText).stream()
                .map(bookDtoMapper::objectToDto)
                .toList();
    }

    @SecurityRequirement(name = "bearerAuth")
    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public Long create(@RequestBody BookCreateDto bookDto) {
        Book book = bookDtoMapper.dtoToObject(bookDto);
        return bookService.create(book);
    }

    @SecurityRequirement(name = "bearerAuth")
    @PutMapping
    @PreAuthorize("hasRole('ADMIN')")
    public void update(@RequestBody BookUpdateDto bookDto) {
        Book book = bookDtoMapper.dtoToObject(bookDto);
        bookService.update(book);
    }

    @SecurityRequirement(name = "bearerAuth")
    @DeleteMapping("/{bookId}")
    @PreAuthorize("hasRole('ADMIN')")
    public void delete(@PathVariable long bookId) {
        bookService.delete(bookId);
    }
}
