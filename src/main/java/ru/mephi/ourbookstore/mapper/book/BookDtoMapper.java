package ru.mephi.ourbookstore.mapper.book;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.NullValueMappingStrategy;
import org.springframework.data.domain.Page;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.domain.dto.book.BookCreateDto;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;
import ru.mephi.ourbookstore.domain.dto.book.BookUpdateDto;
import ru.mephi.ourbookstore.domain.dto.bookPage.BookPageDto;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Mapper(componentModel = "spring", nullValueMappingStrategy = NullValueMappingStrategy.RETURN_DEFAULT)
public interface BookDtoMapper {

    Book dtoToObject(BookCreateDto dto);

    Book dtoToObject(BookUpdateDto dto);

    BookDto objectToDto(Book book);

    @Mapping(source = "content", target = "books")
    BookPageDto objectToPageDto(Page<Book> bookPage);
}
