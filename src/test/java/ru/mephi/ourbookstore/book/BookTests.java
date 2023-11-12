package ru.mephi.ourbookstore.book;

import java.util.List;
import java.util.Optional;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.controller.book.BookController;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.dto.book.BookCreateDto;
import ru.mephi.ourbookstore.domain.dto.book.BookDto;
import ru.mephi.ourbookstore.domain.dto.book.BookUpdateDto;
import ru.mephi.ourbookstore.service.exceptions.AlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;
import ru.mephi.ourbookstore.util.TestHelper;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BookTests extends BookStoreTest {

    final List<BookModel> BOOKS = List.of(
            TestHelper.BookEntity.getBookModel1(),
            TestHelper.BookEntity.getBookModel2()
    );


    @Autowired
    BookController bookController;

    @Test
    public void getByIdTest() {
        Long bookId = bookRepository.save(TestHelper.BookEntity.getBookModel1()).getId();

        BookDto bookDto = bookController.getById(bookId);

        assertBooks(TestHelper.BookEntity.getBookModel1(), bookDto);
    }

    @Test
    public void getByIdExceptionTest() {
        Assertions.assertThrows(
                NotFoundException.class,
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
        Long appUserId = bookController.create(TestHelper.BookEntity.getBookCreateDto());

        BookModel bookModel = bookRepository.findById(appUserId).get();

        assertBooks(TestHelper.BookEntity.getBookCreateDto(), bookModel);
    }

    @Test
    public void createAlreadyExistTest() {
        bookRepository.save(TestHelper.BookEntity.getBookModel1());
        BookCreateDto bookDto = BookCreateDto.builder()
                .name(TestHelper.BookEntity.getBookModel1().getName())
                .price(TestHelper.BookEntity.getBookModel1().getPrice())
                .count(TestHelper.BookEntity.getBookModel1().getCount())
                .build();

        Assertions.assertThrows(
                AlreadyExistException.class,
                () -> bookController.create(bookDto)
        );
    }

    @Test
    public void createIncorrectName1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> bookController.create(TestHelper.BookEntity.getBookCreateDtoIncorrectName1())
        );
    }

    @Test
    public void createIncorrectName2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> bookController.create(TestHelper.BookEntity.getBookCreateDtoIncorrectName2())
        );
    }

    @Test
    public void createIncorrectCountTest() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> bookController.create(TestHelper.BookEntity.getBookCreateDtoIncorrectCount())
        );
    }

    @Test
    public void createIncorrectPriceTest() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> bookController.create(TestHelper.BookEntity.getBookCreateDtoIncorrectPrice())
        );
    }

    @Test
    public void updateTest() {
        Long bookId = bookRepository.save(TestHelper.BookEntity.getBookModel1()).getId();
        BookUpdateDto bookUpdateDto = TestHelper.BookEntity.getBookUpdateDto();
        bookUpdateDto.setId(bookId);

        bookController.update(bookUpdateDto);

        BookModel bookModel = bookRepository.findById(bookId).get();
        assertBooks(bookUpdateDto, bookModel);
    }

    @Test
    public void updateNotFoundTest() {
        Assertions.assertThrows(
                NotFoundException.class,
                () -> bookController.update(TestHelper.BookEntity.getBookUpdateDtoUnknown())
        );
    }

    @Test
    public void updateIncorrectName1Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> bookController.update(TestHelper.BookEntity.getBookUpdateDtoIncorrectName1())
        );
    }

    @Test
    public void updateIncorrectName2Test() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> bookController.update(TestHelper.BookEntity.getBookUpdateDtoIncorrectName2())
        );
    }

    @Test
    public void updateIncorrectCountTest() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> bookController.update(TestHelper.BookEntity.getBookUpdateDtoIncorrectCount())
        );
    }

    @Test
    public void updateIncorrectPriceTest() {
        Assertions.assertThrows(
                ValidationException.class,
                () -> bookController.update(TestHelper.BookEntity.getBookUpdateDtoIncorrectPrice())
        );
    }

    @Test
    public void deleteTest() {
        Long bookId = bookRepository.save(TestHelper.BookEntity.getBookModel1()).getId();

        bookController.delete(bookId);

        Optional<BookModel> bookModel = bookRepository.findById(bookId);
        Assertions.assertTrue(bookModel.isEmpty());
    }

    @Test
    public void deleteNotFoundTest() {
        Assertions.assertThrows(
                NotFoundException.class,
                () -> bookController.delete(-1)
        );
    }

    private void assertBooks(BookUpdateDto expected, BookModel actual) {
        assertBooks(actual, expected);
    }

    private void assertBooks(BookCreateDto expected, BookModel actual) {
        assertBooks(actual, expected);
    }

    private void assertBooks(BookModel expected, BookUpdateDto actual) {
        Assertions.assertEquals(expected.getId(), actual.getId());
        Assertions.assertEquals(expected.getName(), actual.getName());
        Assertions.assertEquals(expected.getPrice(), actual.getPrice());
        Assertions.assertEquals(expected.getCount(), actual.getCount());
    }

    private void assertBooks(BookModel expected, BookCreateDto actual) {
        Assertions.assertEquals(expected.getName(), actual.getName());
        Assertions.assertEquals(expected.getPrice(), actual.getPrice());
        Assertions.assertEquals(expected.getCount(), actual.getCount());
    }

    private void assertBooks(BookModel expected, BookDto actual) {
        Assertions.assertEquals(expected.getName(), actual.getName());
        Assertions.assertEquals(expected.getPrice(), actual.getPrice());
        Assertions.assertEquals(expected.getCount(), actual.getCount());
    }
}
