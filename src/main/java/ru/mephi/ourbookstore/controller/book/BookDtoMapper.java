package ru.mephi.ourbookstore.controller.book;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import ru.mephi.ourbookstore.service.book.Book;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Component
@RequiredArgsConstructor
public class BookDtoMapper {

    public Book dtoToObject(BookDto model) {
        return Book.builder()
                .id(model.getId())
                .name(model.getName())
                .count(model.getCount())
                .price(model.getPrice())
                .build();
    }

    public BookDto ObjectToDto(Book book) {
        return BookDto.builder()
                .id(book.getId())
                .name(book.getName())
                .count(book.getCount())
                .price(book.getPrice())
                .build();
    }
}
