package ru.mephi.ourbookstore.author;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.web.server.LocalServerPort;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.domain.AuthorModel;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.dto.author.AuthorDto;
import ru.mephi.ourbookstore.domain.dto.author.AuthorUpdateDto;
import ru.mephi.ourbookstore.spec.BaseSpec;

import static org.junit.jupiter.api.Assertions.assertAll;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class AuthorControllerTest extends BookStoreTest {

    private static final String BASE_URL = "/app/authors";
    private static final Long UNKNOWN_ID = 100L;
    private static final AuthorModel AUTHOR_MODEL_1 = AuthorModel.builder()
            .fullName("1")
            .dateOfBirth(LocalDate.parse("2023-01-01"))
            .country("1")
            .books(new ArrayList<>())
            .build();
    private static final AuthorModel AUTHOR_MODEL_2 = AuthorModel.builder()
            .fullName("2")
            .dateOfBirth(LocalDate.parse("2023-01-01"))
            .country("2")
            .books(new ArrayList<>())
            .build();
    private static final AuthorModel AUTHOR_MODEL_3 = AuthorModel.builder()
            .fullName("3")
            .dateOfBirth(LocalDate.parse("2023-01-01"))
            .country("3")
            .books(new ArrayList<>())
            .build();
    private static final BookModel BOOK_MODEL_1 = BookModel.builder()
            .name("1")
            .price(1)
            .count(1)
            .authors(new ArrayList<>())
            .build();
    private static final BookModel BOOK_MODEL_2 = BookModel.builder()
            .name("2")
            .price(2)
            .count(2)
            .authors(new ArrayList<>())
            .build();
    private static final BookModel BOOK_MODEL_3 = BookModel.builder()
            .name("3")
            .price(3)
            .count(3)
            .authors(new ArrayList<>())
            .build();

    @LocalServerPort
    private int port;

//    @ParameterizedTest
//    @DisplayName("Create author successful")
//    @CsvSource({
//            "Grigory Bashev, 2021-12-01, Russia",
//    })
//    public void createAuthorSuccessful(String fullName, String dateOfBirth, String country) {
//        List<AuthorModel> authorModels = List.of(
//                AuthorModel.builder()
//                        .fullName(fullName)
//                        .dateOfBirth(LocalDate.parse(dateOfBirth))
//                        .country(country)
//                        .build()
//        );
//        authorRepository.saveAll(authorModels);
//
//        List<AuthorDto> authors = RestAssured.given()
//                .port(port)
//                .contentType(ContentType.JSON)
//                .when()
//                .get(BASE_URL)
//                .then()
//                .spec(BaseSpec.getResponseSpec(200))
//                .extract().body().jsonPath().getList(".", AuthorDto.class);
//
//        assertAuthors(authorModels, authors);
//    }
//
//    @ParameterizedTest
//    @DisplayName("Create author unsuccessful")
//    @CsvSource({
//            "Grigory Bashev, 2023-11-22, Russia, Invalid date of birth",
//            "!gory Bashev, 1999-2-31, France, Invalid date of birth",
//            "Grigory Bashev, 1999-12-12, Lol what a country, Invalid country",
//            ",12th of September, Guatemala, Invalid date of birth ",
//            ", 1999-12-12, Guatemala, Invalid Author Name",
//    })
//    public void createAuthorUnsuccessful(String fullName, String dateOfBirth, String country) {
//        AuthorCreateDto authorCreateDto = AuthorCreateDto.builder()
//                .fullName(fullName)
//                .dateOfBirth(dateOfBirth)
//                .country(country)
//                .build();
//
//        RestAssured.given()
//                .port(port)
//                .contentType(ContentType.JSON)
//                .when()
//                .body(authorCreateDto)
//                .post(BASE_URL)
//                .then()
//                .spec(BaseSpec.getResponseSpec(400));
//    }
//
//    @ParameterizedTest
//    @DisplayName("Create author with same name")
//    @CsvSource({
//            "Grigory Bashev, 2021-12-01, Russia, Author with this name already exists",
//    })
//    public void createAuthorSameName(String fullName, String dateOfBirth, String country) {
//        AuthorModel authorModel = AuthorModel.builder()
//                .fullName(fullName)
//                .dateOfBirth(LocalDate.parse(dateOfBirth))
//                .country(country)
//                .build();
//        authorRepository.save(authorModel);
//        AuthorCreateDto authorCreateDto = AuthorCreateDto.builder()
//                .fullName(fullName)
//                .dateOfBirth(dateOfBirth)
//                .country(country)
//                .build();
//
//        RestAssured.given()
//                .port(port)
//                .contentType(ContentType.JSON)
//                .when()
//                .body(authorCreateDto)
//                .post(BASE_URL)
//                .then()
//                .spec(BaseSpec.getResponseSpec(400));
//    }
//
//    @ParameterizedTest
//    @DisplayName("Get existing author")
//    @CsvSource({
//            "Grigory Bashev, 2021-12-01, Russia",
//    })
//    public void getExistingAuthor(String fullName, String dateOfBirth, String country) {
//        AuthorModel authorModel = AuthorModel.builder()
//                .fullName(fullName)
//                .country(country)
//                .dateOfBirth(LocalDate.parse(dateOfBirth))
//                .build();
//        Long authorId = authorRepository.save(authorModel).getId();
//
//        AuthorDto authorDto = RestAssured.given()
//                .port(port)
//                .contentType(ContentType.JSON)
//                .when()
//                .get(BASE_URL + "/{authorId}", authorId)
//                .then()
//                .spec(BaseSpec.getResponseSpec(200))
//                .extract().body().as(AuthorDto.class);
//
//        assertAuthors(authorModel, authorDto);
//    }
//
//    @ParameterizedTest
//    @DisplayName("Update author successful")
//    @CsvSource({
//            "Lev Tolstoy, 2023-01-01, Russia",
//            "Grigory Bashev, 2000-01-01, Russia",
//            "Grigory Bashev, 2023-01-01, France",
//    })
//    public void updateAuthorSuccessful(String newFullName, String newDateOfBirth, String newCountry) {
//        Long authorId = authorRepository.save(AUTHOR_MODEL).getId();
//        AuthorUpdateDto authorUpdateDto = AuthorUpdateDto.builder()
//                .id(Long.toString(authorId))
//                .fullName(newFullName)
//                .country(newCountry)
//                .dateOfBirth(newDateOfBirth)
//                .build();
//
//        RestAssured.given()
//                .port(port)
//                .contentType(ContentType.JSON)
//                .when()
//                .body(authorUpdateDto)
//                .put(BASE_URL)
//                .then()
//                .spec(BaseSpec.getResponseSpec(200))
//                .extract().body().asPrettyString();
//
//        AuthorModel actual = authorRepository.findById(authorId).get();
//        assertAuthors(authorUpdateDto, actual);
//    }
//
//    @ParameterizedTest
//    @DisplayName("Update author unsuccessful")
//    @CsvSource({
//            "1rigory Bashev, 2023-01-01, Russia, Invalid Author Name",
//            ", 2023-01-01, Russia, Invalid Author Name",
//            "Grigory Bashev, 3023-01-01, Russia, Invalid date of birth",
//            "Grigory Bashev, 2023-01-01, Fussia, Invalid country",
//            "Game of thrones, 2023-01-01, Russia, Invalid Author Name",
//            "Grigory Bashev, , Russia, Invalid date of birth",
//            "Grigory Bashev, 2023-01-01, , Invalid country",
//            "Grigory Bashev, a;sldkjf, Russia, Invalid date of birth",
//            "Grigory Bashev, 2023-01-01, asldkjfa, Invalid country",
//            "1234 2345, 2023-01-01, Russia, Invalid Author Name",
//    })
//    public void updateAuthorUnsuccessful(String newFullName, String newDateOfBirth, String newCountry) {
//        Long authorId = authorRepository.save(AUTHOR_MODEL).getId();
//        AuthorUpdateDto authorUpdateDto = AuthorUpdateDto.builder()
//                .id(Long.toString(authorId))
//                .fullName(newFullName)
//                .country(newCountry)
//                .dateOfBirth(newDateOfBirth)
//                .build();
//
//        RestAssured.given()
//                .port(port)
//                .contentType(ContentType.JSON)
//                .when()
//                .body(authorUpdateDto)
//                .put(BASE_URL)
//                .then()
//                .spec(BaseSpec.getResponseSpec(400));
//    }
//
//    @Test
//    @DisplayName("Get nonexistent author")
//    public void getNonexistentAuthor() {
//        RestAssured.given()
//                .port(port)
//                .contentType(ContentType.JSON)
//                .when()
//                .get(BASE_URL + "/{authorId}", UNKNOWN_ID)
//                .then()
//                .spec(BaseSpec.getResponseSpec(
//                        404,
//                        "The AUTHOR with id = " + UNKNOWN_ID + " not found!"
//                ));
//    }
//
//    @Test
//    @DisplayName("Delete nonexistent author")
//    public void deleteNonexistentAuthor() {
//        RestAssured.given()
//                .port(port)
//                .contentType(ContentType.JSON)
//                .when()
//                .delete(BASE_URL + "/{authorId}", UNKNOWN_ID)
//                .then()
//                .spec(BaseSpec.getResponseSpec(
//                        404,
//                        "The AUTHOR with id = " + UNKNOWN_ID + " not found!"
//                ));
//    }

    @Test
    public void addBooksToAuthorTest() {
        Long authorId = authorRepository.save(AUTHOR_MODEL_1).getId();
        Long bookId = bookRepository.save(BOOK_MODEL_1).getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .post(BASE_URL + "/{authorId}/books/{bookId}", authorId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        AuthorModel authorModel = authorRepository.findById(authorId).get();
        BookModel bookModel = bookRepository.findById(bookId).get();

        Assertions.assertTrue(bookModel.getAuthors().contains(authorModel));
        Assertions.assertTrue(authorModel.getBooks().contains(bookModel));
    }

    @Test
    public void addBookToAuthorUnknownBookTest() {
        Long authorId = authorRepository.save(AUTHOR_MODEL_1).getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .post(BASE_URL + "/{authorId}/books/{bookId}", authorId, UNKNOWN_ID)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        404,
                        "The BOOK with id = " + UNKNOWN_ID + " not found!"
                ));
    }

    @Test
    public void addBookToAuthorUnknownAuthorTest() {
        Long bookId = bookRepository.save(BOOK_MODEL_1).getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .post(BASE_URL + "/{authorId}/books/{bookId}", UNKNOWN_ID, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        404,
                        "The AUTHOR with id = " + UNKNOWN_ID + " not found!"
                ));
    }

    @Test
    public void addBookToAuthorAlreadyAddedTest() {
        BookModel bookModel = bookRepository.save(BOOK_MODEL_1);
        AuthorModel authorModel = authorRepository.save(AUTHOR_MODEL_1);
        authorModel.setBooks(List.of(bookModel));
        bookModel.setAuthors(List.of(authorModel));
        authorRepository.save(authorModel);
        Long authorId = authorModel.getId();
        Long bookId = bookModel.getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .post(BASE_URL + "/{authorId}/books/{bookId}", authorId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        409,
                        "The BOOK with id = " + bookId + " already exist!"
                ));
    }

    @Test
    public void addBookToAuthorAuthorAlreadyHaveBookTest() {
        List<BookModel> bookModels = bookRepository.saveAll(List.of(BOOK_MODEL_1, BOOK_MODEL_2));
        AuthorModel authorModel = authorRepository.save(AUTHOR_MODEL_1);
        BookModel bookModel1 = bookModels.get(0);
        BookModel bookModel2 = bookModels.get(1);
        authorModel.setBooks(List.of(bookModel1));
        bookModel1.setAuthors(List.of(authorModel));
        authorRepository.save(authorModel);
        Long authorId = authorModel.getId();
        Long bookId = bookModel2.getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .post(BASE_URL + "/{authorId}/books/{bookId}", authorId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        authorModel = authorRepository.findById(authorId).get();
        bookModel1 = bookRepository.findById(bookModel1.getId()).get();
        bookModel2 = bookRepository.findById(bookModel2.getId()).get();

        Assertions.assertTrue(bookModel1.getAuthors().contains(authorModel));
        Assertions.assertTrue(bookModel2.getAuthors().contains(authorModel));
        Assertions.assertTrue(authorModel.getBooks().containsAll(List.of(bookModel1, bookModel2)));
    }

    @Test
    public void addBookToAuthorBookAlreadyHaveAuthorTest() {
        BookModel bookModel = bookRepository.save(BOOK_MODEL_1);
        List<AuthorModel> authorModels = authorRepository.saveAll(List.of(AUTHOR_MODEL_1, AUTHOR_MODEL_2));
        AuthorModel authorModel1 = authorModels.get(0);
        AuthorModel authorModel2 = authorModels.get(1);
        authorModel1.setBooks(List.of(bookModel));
        bookModel.setAuthors(List.of(authorModel1));
        authorRepository.save(authorModel1);
        Long authorId = authorModel2.getId();
        Long bookId = bookModel.getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .post(BASE_URL + "/{authorId}/books/{bookId}", authorId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        authorModel1 = authorRepository.findById(authorModel1.getId()).get();
        authorModel2 = authorRepository.findById(authorModel2.getId()).get();
        bookModel = bookRepository.findById(bookModel.getId()).get();

        Assertions.assertTrue(authorModel1.getBooks().contains(bookModel));
        Assertions.assertTrue(authorModel2.getBooks().contains(bookModel));
        Assertions.assertTrue(bookModel.getAuthors().containsAll(List.of(authorModel1, authorModel2)));
    }

    @Test
    public void removeBookFromAuthorTest() {
        BookModel bookModel = bookRepository.save(BOOK_MODEL_1);
        AuthorModel authorModel = authorRepository.save(AUTHOR_MODEL_1);
        authorModel.setBooks(List.of(bookModel));
        bookModel.setAuthors(List.of(authorModel));
        authorRepository.save(authorModel);
        Long authorId = authorModel.getId();
        Long bookId = bookModel.getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .delete(BASE_URL + "/{authorId}/books/{bookId}", authorId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        authorModel = authorRepository.findById(authorId).get();
        bookModel = bookRepository.findById(bookId).get();

        Assertions.assertFalse(bookModel.getAuthors().contains(authorModel));
        Assertions.assertFalse(authorModel.getBooks().contains(bookModel));
    }

    @Test
    public void removeBookToAuthorUnknownBookTest() {
        Long authorId = authorRepository.save(AUTHOR_MODEL_1).getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .post(BASE_URL + "/{authorId}/books/{bookId}", authorId, UNKNOWN_ID)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        404,
                        "The BOOK with id = " + UNKNOWN_ID + " not found!"
                ));
    }

    @Test
    public void removeBookToAuthorUnknownAuthorTest() {
        Long bookId = bookRepository.save(BOOK_MODEL_1).getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .delete(BASE_URL + "/{authorId}/books/{bookId}", UNKNOWN_ID, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        404,
                        "The AUTHOR with id = " + UNKNOWN_ID + " not found!"
                ));
    }

    @Test
    public void removeBookToAuthorAlreadyRemovedTest() {
        Long bookId = bookRepository.save(BOOK_MODEL_1).getId();
        Long authorId = authorRepository.save(AUTHOR_MODEL_1).getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .delete(BASE_URL + "/{authorId}/books/{bookId}", authorId, bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(
                        404,
                        "The BOOK with id = " + bookId + " not found!"
                ));
    }

    @Test
    public void removeBookAndCheckAuthorsTest() {
        BookModel bookModel = bookRepository.save(BOOK_MODEL_1);
        AuthorModel authorModel = authorRepository.save(AUTHOR_MODEL_1);
        authorModel.setBooks(List.of(bookModel));
        bookModel.setAuthors(List.of(authorModel));
        authorRepository.save(authorModel);
        Long bookId = bookModel.getId();
        Long authorId = authorModel.getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .delete("/app/books/{bookId}", bookId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        authorModel = authorRepository.findById(authorId).get();

        Assertions.assertFalse(bookRepository.findById(bookId).isPresent());
        Assertions.assertFalse(authorModel.getBooks().contains(bookModel));
    }

    @Test
    public void removeAuthorAndCheckBooksTest() {
        BookModel bookModel = bookRepository.save(BOOK_MODEL_1);
        AuthorModel authorModel = authorRepository.save(AUTHOR_MODEL_1);
        authorModel.setBooks(List.of(bookModel));
        bookModel.setAuthors(List.of(authorModel));
        authorRepository.save(authorModel);
        Long bookId = bookModel.getId();
        Long authorId = authorModel.getId();

        RestAssured.given()
                .port(port)
                .contentType(ContentType.JSON)
                .when()
                .delete(BASE_URL + "/{authorId}", authorId)
                .then()
                .spec(BaseSpec.getResponseSpec(200));

        bookModel = bookRepository.findById(bookId).get();

        Assertions.assertFalse(authorRepository.findById(authorId).isPresent());
        Assertions.assertFalse(bookModel.getAuthors().contains(authorModel));
    }

    public void assertAuthors(List<AuthorModel> expected, List<AuthorDto> actual) {
        Assertions.assertEquals(expected.size(), actual.size());
        for (int i = 0; i < expected.size(); i++) {
            assertAuthors(expected.get(i), actual.get(i));
        }
    }

    public void assertAuthors(AuthorModel expected, AuthorDto actual) {
        assertAll(
                "Grouped assertion of two author",
                () -> assertEquals(expected.getCountry(), actual.getCountry()),
                () -> assertEquals(expected.getDateOfBirth(), LocalDate.parse(actual.getDateOfBirth())),
                () -> assertEquals(expected.getFullName(), actual.getFullName())
        );
    }

    public void assertAuthors(AuthorUpdateDto expected, AuthorModel actual) {
        assertAll(
                "Grouped assertion of two author",
                () -> assertEquals(expected.getCountry(), actual.getCountry()),
                () -> assertEquals(LocalDate.parse(expected.getDateOfBirth()), actual.getDateOfBirth()),
                () -> assertEquals(expected.getFullName(), actual.getFullName())
        );
    }
}