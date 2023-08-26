package ru.mephi.ourbookstore.controller.author;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import ru.mephi.ourbookstore.domain.dto.author.AuthorCreateDto;
import ru.mephi.ourbookstore.domain.dto.author.AuthorDto;
import ru.mephi.ourbookstore.domain.dto.author.AuthorUpdateDto;
import ru.mephi.ourbookstore.spec.author.AuthorSpec;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class AuthorControllerTest {

    @Test
    @BeforeEach
    public void cleanDb() {
        List<AuthorDto> authorDtoList = AuthorSpec.getAll();
        for (AuthorDto authorDto : authorDtoList) {
            AuthorSpec.deleteAuthor(Long.parseLong(authorDto.getId()));
        }
    }

    @ParameterizedTest
    @DisplayName("Create author successful")
    @CsvSource({
            "Grigory Bashev, 2021-12-01, Russia",
    })
    public void createAuthorSuccessful(String fullName, String dateOfBirth, String country) {
        AuthorCreateDto authorCreateDto = AuthorCreateDto.builder().country(country)
                .dateOfBirth(dateOfBirth)
                .fullName(fullName).build();
        AuthorSpec.createAuthorSuccessful(authorCreateDto);
        AuthorDto authorDto = AuthorSpec.getAll().get(0);
        assertAuthors(authorDto, authorCreateDto);
    }

    @ParameterizedTest
    @DisplayName("Create author unsuccessful")
    @CsvSource({
            "Grigory Bashev, 2023-11-22, Russia, Invalid date of birth",
            "!gory Bashev, 1999-2-31, France, Invalid date of birth",
            "Grigory Bashev, 1999-12-12, Lol what a country, Invalid country",
            ",12th of September, Guatemala, Invalid date of birth ",
            ", 1999-12-12, Guatemala, Invalid Author Name",
    })
    public void createAuthorUnsuccessful(String fullName, String dateOfBirth, String country, String error) {
        AuthorCreateDto authorCreateDto = AuthorCreateDto.builder().country(country)
                .dateOfBirth(dateOfBirth)
                .fullName(fullName).build();
        String response = AuthorSpec.createAuthorInvalid(authorCreateDto);
        assertTrue(response.contains(error));
    }

    @ParameterizedTest
    @DisplayName("Create author with same name")
    @CsvSource({
            "Grigory Bashev, 2021-12-01, Russia, Author with this name already exists",
    })
    public void createAuthorSameName(String fullName, String dateOfBirth, String country, String error) {
        AuthorCreateDto authorCreateDto = AuthorCreateDto.builder().country(country)
                .dateOfBirth(dateOfBirth)
                .fullName(fullName).build();
        AuthorSpec.createAuthorSuccessful(authorCreateDto);
        String response = AuthorSpec.createAuthorInvalid(authorCreateDto);
        assertTrue(response.contains(error));
    }

    @ParameterizedTest
    @DisplayName("Get existing author")
    @CsvSource({
            "Grigory Bashev, 2021-12-01, Russia",
    })
    public void getExistingAuthor(String fullName, String dateOfBirth, String country) {
        var authorCreateDto = AuthorCreateDto.builder()
                .country(country)
                .dateOfBirth(dateOfBirth)
                .fullName(fullName).build();
        Long id = AuthorSpec.createAuthorSuccessful(authorCreateDto);
        AuthorDto authorDto = AuthorSpec.getAuthor(id);
        assertAuthors(authorDto, authorCreateDto);
    }

    @ParameterizedTest
    @DisplayName("Update author successful")
    @CsvSource({
            "Lev Tolstoy, 2023-01-01, Russia",
            "Grigory Bashev, 2000-01-01, Russia",
            "Grigory Bashev, 2023-01-01, France",
    })
    public void updateAuthorSuccessful(String newFullName, String newDateOfBirth, String newCountry) {
        AuthorCreateDto authorCreateDto = AuthorCreateDto.builder()
                .country("Russia")
                .dateOfBirth("2023-01-01")
                .fullName("Grigory Bashev").build();
        long id = AuthorSpec.createAuthorSuccessful(authorCreateDto);

        AuthorUpdateDto authorUpdateDto = AuthorUpdateDto.builder()
                .country(newCountry)
                .fullName(newFullName)
                .dateOfBirth(newDateOfBirth)
                .id(String.valueOf(id)).build();
        AuthorSpec.updateAuthor(authorUpdateDto);

        AuthorDto authorDto = AuthorSpec.getAuthor(id);
        assertAuthors(authorDto, authorUpdateDto);
    }

    @ParameterizedTest
    @DisplayName("Update author unsuccessful")
    @CsvSource({
            "1rigory Bashev, 2023-01-01, Russia, Invalid Author Name",
            ", 2023-01-01, Russia, Invalid Author Name",
            "Grigory Bashev, 3023-01-01, Russia, Invalid date of birth",
            "Grigory Bashev, 2023-01-01, Fussia, Invalid country",
            "Game of thrones, 2023-01-01, Russia, Invalid Author Name",
            "Grigory Bashev, , Russia, Invalid date of birth",
            "Grigory Bashev, 2023-01-01, , Invalid country",
            "Grigory Bashev, a;sldkjf, Russia, Invalid date of birth",
            "Grigory Bashev, 2023-01-01, asldkjfa, Invalid country",
            "1234 2345, 2023-01-01, Russia, Invalid Author Name",
    })
    public void updateAuthorUnsuccessful(String newFullName, String newDateOfBirth, String newCountry, String error) {
        AuthorCreateDto authorCreateDto = AuthorCreateDto.builder()
                .country("Russia")
                .dateOfBirth("2023-01-01")
                .fullName("Grigory Bashev").build();
        long id = AuthorSpec.createAuthorSuccessful(authorCreateDto);
        AuthorUpdateDto authorUpdateDto = AuthorUpdateDto.builder()
                .country(newCountry)
                .fullName(newFullName)
                .dateOfBirth(newDateOfBirth)
                .id(String.valueOf(id)).build();
        String response = AuthorSpec.updateAuthorInvalid(authorUpdateDto);
        assertTrue(response.contains(error));
    }

    @Test
    @DisplayName("Get nonexistent author")
    public void getNonexistentAuthor() {
        String response = AuthorSpec.getNotExistingAuthor(1L);
        assertTrue(response.contains("The AUTHOR with id = 1 not found"));
    }

    @Test
    @DisplayName("Delete nonexistent author")
    public void deleteNonexistentAuthor() {
        String response = AuthorSpec.deleteNotExistingAuthor(1L);
        assertTrue(response.contains("The AUTHOR with id = 1 not found"));
    }

    public void assertAuthors(AuthorDto authorDto, AuthorCreateDto authorCreateDto) {
        assertAll(
                "Grouped assertion of two author dtos",
                () -> assertEquals(authorDto.getCountry(), authorCreateDto.getCountry()),
                () -> assertEquals(authorDto.getDateOfBirth(), authorCreateDto.getDateOfBirth()),
                () -> assertEquals(authorDto.getFullName(), authorCreateDto.getFullName())
        );
    }


    public void assertAuthors(AuthorDto authorDto, AuthorUpdateDto authorUpdateDto) {
        assertAll(
                "Grouped assertion of two author dtos",
                () -> assertEquals(authorDto.getCountry(), authorUpdateDto.getCountry()),
                () -> assertEquals(authorDto.getDateOfBirth(), authorUpdateDto.getDateOfBirth()),
                () -> assertEquals(authorDto.getFullName(), authorUpdateDto.getFullName())
        );
    }
}