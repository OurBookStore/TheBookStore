package ru.mephi.ourbookstore.book;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;
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

    @AfterEach
    public void dropDb() {
        bookRepository.deleteAll();
    }

    @Test
    public void getByIdTest() {
        Long bookId = bookRepository.save(BOOK_CORRECT_1).getId();

        BookDto bookDto = bookController.getById(bookId);

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
        bookRepository.saveAll(BOOKS);

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
        Long bookId = bookRepository.save(BOOK_CORRECT_1).getId();

        BookDto bookDto = bookController.getById(bookId);

        assertBooks(BOOK_CORRECT_1, bookDto);
    }

    @Test
    public void createAlreadyExistTest() {
        Long bookId = bookRepository.save(BOOK_CORRECT_1).getId();
        BookDto bookDto = BookDto.builder()
                .id(bookId)
                .name(BOOK_CORRECT_1.getName())
                .price(BOOK_CORRECT_1.getPrice())
                .count(BOOK_CORRECT_1.getCount())
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
        Long bookId = bookRepository.save(BOOK_CORRECT_1).getId();
        BOOK_CORRECT_1_NEW.setId(bookId);

        bookController.update(BOOK_CORRECT_1_NEW);

        BookModel bookModel = bookRepository.findById(bookId).get();
        assertBooks(BOOK_CORRECT_1_NEW, bookModel);
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
        Long bookId = bookRepository.save(BOOK_CORRECT_1).getId();

        bookController.delete(bookId);

        Optional<BookModel> bookModel = bookRepository.findById(bookId);
        Assertions.assertTrue(bookModel.isEmpty());
    }

    @Test
    public void deleteNotFoundTest() {
        Assertions.assertThrows(
                BookNotFoundException.class,
                () -> bookController.delete(-1)
        );
    }

    private void assertBooks(BookDto expected, BookModel actual) {
        assertBooks(actual, expected);
    }

    private void assertBooks(BookModel expected, BookDto actual) {
        Assertions.assertEquals(expected.getName(), actual.getName());
        Assertions.assertEquals(expected.getPrice(), actual.getPrice());
        Assertions.assertEquals(expected.getCount(), actual.getCount());
    }
}
