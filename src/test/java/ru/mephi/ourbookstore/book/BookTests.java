package ru.mephi.ourbookstore.book;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.service.exceptions.book.BookAlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.book.BookNotFoundException;
import ru.mephi.ourbookstore.service.exceptions.book.BookValidationException;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class BookTests extends BookStoreTest {

    BookModel BOOK_CORRECT_1 = BookModel.builder()
            .id(1L)
            .name("1")
            .price(1)
            .count(1)
            .build();

    BookModel BOOK_CORRECT_2 = BookModel.builder()
            .id(2L)
            .name("2")
            .price(2)
            .count(2)
            .build();

    BookDto BOOK_CORRECT_1_NEW = BookDto.builder()
            .id(1L)
            .name("11")
            .price(11)
            .count(11)
            .build();

    BookDto BOOK_DTO = BookDto.builder()
            .id(3L)
            .name("3")
            .price(3)
            .count(3)
            .build();

    BookDto BOOK_DTO_INCORRECT_PRICE = BookDto.builder()
            .id(4L)
            .name("4")
            .price(-4)
            .count(4)
            .build();

    BookDto BOOK_DTO_INCORRECT_COUNT = BookDto.builder()
            .id(5L)
            .name("5")
            .price(5)
            .count(-5)
            .build();

    BookDto BOOK_DTO_INCORRECT_NAME_1 = BookDto.builder()
            .id(6L)
            .price(6)
            .count(6)
            .build();

    BookDto BOOK_DTO_INCORRECT_NAME_2 = BookDto.builder()
            .id(6L)
            .name("")
            .price(6)
            .count(6)
            .build();

    List<BookModel> BOOKS = List.of(
            BOOK_CORRECT_1,
            BOOK_CORRECT_2
    );

    @BeforeEach
    public void initDb() {
        bookRepository.saveAll(BOOKS);
    }

    @AfterEach
    public void dropDb() {
        bookRepository.deleteAll();
    }

    @Test
    public void getByIdTest() {
        BookDto bookDto = bookController.getById(BOOK_CORRECT_1.getId());

        assertBooks(BOOK_CORRECT_1, bookDto);
    }

    @Test
    public void getByIdExceptionTest() {
        Assertions.assertThrows(
                BookNotFoundException.class,
                () -> bookController.getById(-1)
        );
    }

    @Test
    public void getAllTest() {
        List<BookDto> bookDtos = bookController.getAll();

        Assertions.assertEquals(bookDtos.size(), BOOKS.size());
        for (int i = 0; i < BOOKS.size(); i++) {
            BookModel expected = BOOKS.get(i);
            BookDto actual = bookDtos.get(i);
            assertBooks(expected, actual);
        }
    }

    @Test
    public void createTest() {
        bookController.create(BOOK_DTO);

        BookDto bookDto = bookController.getById(BOOK_DTO.getId());

        assertBooks(BOOK_DTO, bookDto);
    }

    @Test
    public void createAlreadyExistTest() {
        BookDto bookDto = BookDto.builder()
                .name(BOOK_CORRECT_1.getName())
                .count(BOOK_CORRECT_1.getCount())
                .price(BOOK_CORRECT_1.getPrice())
                .build();

        Assertions.assertThrows(
                BookAlreadyExistException.class,
                () -> bookController.create(bookDto)
        );
    }

    @Test
    public void createIncorrectName1Test() {
        Assertions.assertThrows(
                BookValidationException.class,
                () -> bookController.create(BOOK_DTO_INCORRECT_NAME_1)
        );
    }

    @Test
    public void createIncorrectName2Test() {
        Assertions.assertThrows(
                BookValidationException.class,
                () -> bookController.create(BOOK_DTO_INCORRECT_NAME_2)
        );
    }

    @Test
    public void createIncorrectCountTest() {
        Assertions.assertThrows(
                BookValidationException.class,
                () -> bookController.create(BOOK_DTO_INCORRECT_COUNT)
        );
    }

    @Test
    public void createIncorrectPriceTest() {
        Assertions.assertThrows(
                BookValidationException.class,
                () -> bookController.create(BOOK_DTO_INCORRECT_PRICE)
        );
    }

    @Test
    public void updateTest() {
        bookController.update(BOOK_CORRECT_1_NEW);

        BookDto bookDto = bookController.getById(BOOK_CORRECT_1.getId());

        assertBooks(BOOK_CORRECT_1_NEW, bookDto);
    }

    @Test
    public void updateNotFoundTest() {
        Assertions.assertThrows(
                BookNotFoundException.class,
                () -> bookController.update(BOOK_DTO)
        );
    }

    @Test
    public void updateIncorrectName1Test() {
        Assertions.assertThrows(
                BookValidationException.class,
                () -> bookController.update(BOOK_DTO_INCORRECT_NAME_1)
        );
    }

    @Test
    public void updateIncorrectName2Test() {
        Assertions.assertThrows(
                BookValidationException.class,
                () -> bookController.update(BOOK_DTO_INCORRECT_NAME_2)
        );
    }

    @Test
    public void updateIncorrectCountTest() {
        Assertions.assertThrows(
                BookValidationException.class,
                () -> bookController.update(BOOK_DTO_INCORRECT_COUNT)
        );
    }

    @Test
    public void updateIncorrectPriceTest() {
        Assertions.assertThrows(
                BookValidationException.class,
                () -> bookController.update(BOOK_DTO_INCORRECT_PRICE)
        );
    }

    @Test
    public void deleteTest() {
        bookController.delete(BOOK_CORRECT_1.getId());

        Assertions.assertThrows(
                BookNotFoundException.class,
                () -> bookController.getById(BOOK_CORRECT_1.getId())
        );
    }

    @Test
    public void deleteNotFoundTest() {
        Assertions.assertThrows(
                BookNotFoundException.class,
                () -> bookController.delete(-1)
        );
    }


    private void assertBooks(BookModel expected, BookDto actual) {
        Assertions.assertEquals(expected.getId(), actual.getId());
        Assertions.assertEquals(expected.getName(), actual.getName());
        Assertions.assertEquals(expected.getPrice(), actual.getPrice());
        Assertions.assertEquals(expected.getCount(), actual.getCount());
    }

    private void assertBooks(BookDto expected, BookDto actual) {
        Assertions.assertEquals(expected.getId(), actual.getId());
        Assertions.assertEquals(expected.getName(), actual.getName());
        Assertions.assertEquals(expected.getPrice(), actual.getPrice());
        Assertions.assertEquals(expected.getCount(), actual.getCount());
    }
}
