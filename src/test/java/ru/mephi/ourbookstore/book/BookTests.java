package ru.mephi.ourbookstore.book;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.controller.book.BookDto;
import ru.mephi.ourbookstore.repository.book.model.BookModel;
import ru.mephi.ourbookstore.service.book.exceptions.BookAlreadyExistException;
import ru.mephi.ourbookstore.service.book.exceptions.BookNotFoundException;
import ru.mephi.ourbookstore.service.book.exceptions.BookValidationException;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
public class BookTests extends BookStoreTest {

    BookModel BOOK_CORRECT_1 = BookModel.builder()
            .id(1)
            .name("1")
            .price(1)
            .count(1)
            .build();

    BookModel BOOK_CORRECT_2 = BookModel.builder()
            .id(2)
            .name("2")
            .price(2)
            .count(2)
            .build();

    BookDto BOOK_CORRECT_1_NEW = BookDto.builder()
            .id(1)
            .name("11")
            .price(11)
            .count(11)
            .build();

    BookDto BOOK_DTO = BookDto.builder()
            .id(3)
            .name("3")
            .price(3)
            .count(3)
            .build();

    BookDto BOOK_DTO_INCORRECT_PRICE = BookDto.builder()
            .id(4)
            .name("4")
            .price(-4)
            .count(4)
            .build();

    BookDto BOOK_DTO_INCORRECT_COUNT = BookDto.builder()
            .id(5)
            .name("5")
            .price(-5)
            .count(5)
            .build();

    BookDto BOOK_DTO_INCORRECT_NAME = BookDto.builder()
            .id(6)
            .name("6")
            .price(-6)
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

        Assertions.assertTrue(isEquals(BOOK_CORRECT_1, bookDto));
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
            Assertions.assertTrue(isEquals(expected, actual));
        }
    }

    @Test
    public void createTest() {
        bookController.create(BOOK_DTO);

        BookDto bookDto = bookController.getById(BOOK_DTO.getId());

        Assertions.assertTrue(isEquals(BOOK_DTO, bookDto));
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
    public void createIncorrectNameTest() {
        Assertions.assertThrows(
                BookValidationException.class,
                () -> bookController.create(BOOK_DTO_INCORRECT_NAME)
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

        Assertions.assertTrue(isEquals(BOOK_CORRECT_1_NEW, bookDto));
    }

    @Test
    public void updateNotFoundTest() {
        Assertions.assertThrows(
                BookNotFoundException.class,
                () -> bookController.update(BOOK_DTO)
        );
    }

    @Test
    public void updateIncorrectNameTest() {
        Assertions.assertThrows(
                BookValidationException.class,
                () -> bookController.update(BOOK_DTO_INCORRECT_NAME)
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
    public void deleteTest(){
        bookController.delete(BOOK_CORRECT_1.getId());

        Assertions.assertThrows(
                BookNotFoundException.class,
                () -> bookController.getById(BOOK_CORRECT_1.getId())
        );
    }

    @Test
    public void deleteNotFoundTest(){
        Assertions.assertThrows(
                BookNotFoundException.class,
                () -> bookController.delete(-1)
        );
    }


    private boolean isEquals(BookModel expected, BookDto actual) {
        return expected.getId() == actual.getId()
                && expected.getName().equals(actual.getName())
                && expected.getPrice() == actual.getPrice()
                && expected.getCount() == actual.getCount();
    }

    private boolean isEquals(BookDto expected, BookDto actual) {
        return expected.getId() == actual.getId()
                && expected.getName().equals(actual.getName())
                && expected.getPrice() == actual.getPrice()
                && expected.getCount() == actual.getCount();
    }
}
