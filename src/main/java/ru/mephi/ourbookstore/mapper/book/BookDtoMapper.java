package ru.mephi.ourbookstore.mapper.book;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.domain.dto.book.BookCreateDto;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;
import ru.mephi.ourbookstore.domain.dto.book.BookUpdateDto;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface BookDtoMapper {

    Book dtoToObject(BookCreateDto dto);

    Book dtoToObject(BookUpdateDto dto);

    BookDto objectToDto(Book book);
}
