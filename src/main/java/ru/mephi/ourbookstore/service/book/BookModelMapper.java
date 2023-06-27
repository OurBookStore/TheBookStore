package ru.mephi.ourbookstore.service.book;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.repository.book.BookModel;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface BookModelMapper {

    Book modelToObject(BookModel model);

    BookModel objectToModel(Book book);
}
