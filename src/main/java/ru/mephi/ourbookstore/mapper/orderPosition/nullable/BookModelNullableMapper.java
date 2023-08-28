package ru.mephi.ourbookstore.mapper.orderPosition.nullable;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.dto.book.Book;

@Mapper(componentModel = "spring")
public interface BookModelNullableMapper {

    @Mapping(target = "orderPositions", expression = "java(null)")
    Book modelToObject(BookModel model);

    @Mapping(target = "orderPositions", expression = "java(null)")
    BookModel objectToModel(Book book);
}
