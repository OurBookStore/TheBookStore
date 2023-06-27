package ru.mephi.ourbookstore.service.book;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.repository.book.model.BookModel;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface BookModelMapper {

    Book modelToObject(BookModel model);

    BookModel ObjectToModel(Book book);
}
