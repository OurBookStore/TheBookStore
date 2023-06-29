package ru.mephi.ourbookstore.mapper.book;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.dto.book.Book;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface BookModelMapper {

    Book modelToObject(BookModel model);

    BookModel objectToModel(Book book);
}
