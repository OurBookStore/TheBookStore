package ru.mephi.ourbookstore.mapper.author;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.AuthorModel;
import ru.mephi.ourbookstore.domain.dto.author.Author;

@Mapper(componentModel = "spring")
public interface AuthorModelNullableMapper {

    @Mappings({
            @Mapping(target = "books", expression = "java(null)")
    })
    Author modelToObject(AuthorModel model);

    @Mappings({
            @Mapping(target = "books", expression = "java(null)")
    })
    AuthorModel objectToModel(Author author);
}
