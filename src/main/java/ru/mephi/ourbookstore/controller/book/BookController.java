package ru.mephi.ourbookstore.controller.book;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import ru.mephi.ourbookstore.domain.dto.book.*;
import ru.mephi.ourbookstore.domain.dto.bookPage.BookPageDto;
import ru.mephi.ourbookstore.mapper.book.BookDtoMapper;
import ru.mephi.ourbookstore.mapper.book.BookDtoMapperImpl;
import ru.mephi.ourbookstore.mapper.book.BookModelMapper;
import ru.mephi.ourbookstore.service.book.BookService;

import java.util.List;

@RestController
@RequestMapping("/books")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BookController {

    final BookService bookService;
    final BookDtoMapperImpl bookDtoMapper;
    final BookModelMapper bookModelMapper;

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


    @GetMapping("/page/{pageNumber}")
    public BookPageDto get(@PathVariable int pageNumber) {
        return bookDtoMapper.objectToPageDto(bookService.getByPageNumber(pageNumber));
    }

    @GetMapping("/search")
    public BookPageDto search(@RequestBody BookSearchRqDto bookSearchRqDto) {
        return BookDtoMapper.searchResultToPageDto(bookService.search(bookSearchRqDto), bookSearchRqDto.getBookPerPage(), bookModelMapper, bookDtoMapper);
    }

    @GetMapping("search/defaults")
    public BookFilterDefaultsDto getFilterDefaults() {
        return bookService.getFilterDefaults();
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
