package ru.mephi.ourbookstore.mapper.author;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.AuthorModel;
import ru.mephi.ourbookstore.domain.dto.author.Author;
import ru.mephi.ourbookstore.mapper.book.BookModelNullableMapper;

@Mapper(componentModel = "spring",
        imports = {
                List.class,
        },
        uses = {
                BookModelNullableMapper.class,
        }
)
public interface AuthorModelMapper {

    @Mapping(source = "dateOfBirth", target = "dateOfBirth", dateFormat = "yyyy-MM-dd")
    Author modelToObject(AuthorModel model);

    @Mapping(source = "dateOfBirth", target = "dateOfBirth", dateFormat = "yyyy-MM-dd")
    AuthorModel objectToModel(Author author);
}
