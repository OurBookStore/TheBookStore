package ru.mephi.ourbookstore.mapper.book;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;
import ru.mephi.ourbookstore.domain.dto.book.Book;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface BookDtoMapper {

    Book dtoToObject(BookDto model);

    BookDto ObjectToDto(Book book);
}
