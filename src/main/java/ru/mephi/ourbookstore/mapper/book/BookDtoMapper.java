package ru.mephi.ourbookstore.mapper.book;

import org.hibernate.search.engine.search.query.SearchResult;
import org.mapstruct.*;
import org.springframework.data.domain.Page;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.domain.dto.book.BookCreateDto;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;
import ru.mephi.ourbookstore.domain.dto.book.BookUpdateDto;
import ru.mephi.ourbookstore.domain.dto.bookPage.BookPageDto;

import java.util.List;

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

    @Named("searchResultToPageDto")
    static BookPageDto searchResultToPageDto(SearchResult<BookModel> search, int bookPerPage, BookModelMapper modelMapper, BookDtoMapper dtoMapper) {
        List<BookDto> books = search.hits().stream().map(modelMapper::modelToObject).map(dtoMapper::objectToDto).toList();
        int bookPerPages = (int)search.total().hitCount()/bookPerPage;
        if (search.total().hitCount()%bookPerPage > 0) {
            bookPerPages++;
        }
        return new BookPageDto(bookPerPages, books);
    }
}
