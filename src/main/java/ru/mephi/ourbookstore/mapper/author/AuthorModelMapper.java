package ru.mephi.ourbookstore.mapper.author;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.mephi.ourbookstore.domain.AuthorModel;
import ru.mephi.ourbookstore.domain.dto.author.Author;

@Mapper(componentModel = "spring", imports = {
        List.class,
})
public interface AuthorModelMapper {

    @Mapping(source = "dateOfBirth", target = "dateOfBirth", dateFormat = "yyyy-MM-dd")
    Author modelToObject(AuthorModel model);

    @Mappings({
            @Mapping(source = "dateOfBirth", target = "dateOfBirth", dateFormat = "yyyy-MM-dd"),
            @Mapping(target = "books", expression = "java(List.of())")
    })
    AuthorModel objectToModel(Author author);
}
