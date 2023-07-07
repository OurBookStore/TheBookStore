package ru.mephi.ourbookstore.mapper.book;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface BookDtoMapper {

    Book dtoToObject(BookDto model);

    BookDto objectToDto(Book book);
}
