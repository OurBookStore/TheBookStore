package ru.mephi.ourbookstore.service.book;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import ru.mephi.ourbookstore.repository.book.model.BookModel;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Component
@RequiredArgsConstructor
public class BookModelMapper {

    public Book modelToObject(BookModel model) {
        return Book.builder()
                .id(model.getId())
                .name(model.getName())
                .count(model.getCount())
                .price(model.getPrice())
                .build();
    }

    public BookModel ObjectToModel(Book book) {
        return BookModel.builder()
                .id(book.getId())
                .name(book.getName())
                .count(book.getCount())
                .price(book.getPrice())
                .build();
    }
}
