package ru.mephi.ourbookstore.controller.book;

import org.mapstruct.Mapper;
import ru.mephi.ourbookstore.service.book.Book;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring")
public interface BookDtoMapper {

    Book dtoToObject(BookDto model);

    BookDto ObjectToDto(Book book);
}
