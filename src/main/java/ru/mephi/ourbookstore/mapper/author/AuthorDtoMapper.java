package ru.mephi.ourbookstore.mapper.author;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.dto.author.Author;
import ru.mephi.ourbookstore.domain.dto.author.AuthorCreateDto;
import ru.mephi.ourbookstore.domain.dto.author.AuthorDto;
import ru.mephi.ourbookstore.domain.dto.author.AuthorUpdateDto;

@Mapper(componentModel = "spring")
public interface AuthorDtoMapper {

    Author dtoToObject(AuthorCreateDto dto);

    Author dtoToObject(AuthorUpdateDto dto);

    AuthorDto objectToDto(Author author);
}
