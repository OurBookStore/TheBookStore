package ru.mephi.ourbookstore.mapper.author;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import ru.mephi.ourbookstore.domain.AuthorModel;
import ru.mephi.ourbookstore.domain.dto.author.Author;

@Mapper(componentModel = "spring")
public interface AuthorModelMapper {

    Author modelToObject(AuthorModel model);

    @Mapping(source = "dateOfBirth", target = "dateOfBirth", dateFormat = "yyyy-MM-dd")
    AuthorModel objectToModel(Author author);
}
