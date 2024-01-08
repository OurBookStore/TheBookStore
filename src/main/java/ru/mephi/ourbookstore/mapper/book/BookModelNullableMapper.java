package ru.mephi.ourbookstore.mapper.book;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.mapper.author.AuthorModelNullableMapper;

@Mapper(componentModel = "spring",
        uses = {
                AuthorModelNullableMapper.class,
        }
)
public interface BookModelNullableMapper {

    @Mappings({
            @Mapping(target = "orderPositions", expression = "java(null)"),
    })
    Book modelToObject(BookModel model);

    @Mappings({
            @Mapping(target = "orderPositions", expression = "java(null)"),
    })
    BookModel objectToModel(Book book);
}
