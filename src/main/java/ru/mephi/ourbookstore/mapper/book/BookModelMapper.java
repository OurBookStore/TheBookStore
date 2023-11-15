package ru.mephi.ourbookstore.mapper.book;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.mapper.author.AuthorModelNullableMapper;
import ru.mephi.ourbookstore.mapper.orderPosition.OrderPositionModelNullableMapper;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring",
        uses = {
                AuthorModelNullableMapper.class,
                OrderPositionModelNullableMapper.class,
        }
)
public interface BookModelMapper {

    Book modelToObject(BookModel model);

    BookModel objectToModel(Book book);
}
