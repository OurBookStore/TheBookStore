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

import static org.junit.jupiter.api.Assertions.assertAll;
import static org.junit.jupiter.api.Assertions.assertEquals;

class AuthorControllerTest {

    @Test
    @BeforeEach
    void cleanData() {
        List<AuthorDto> authorDtoList = AuthorSpec.getAll();
        for (int i = 0; i < authorDtoList.size(); i++) {
            AuthorSpec.deleteAuthor(authorDtoList.get(i).getId());
        }
    }

    @ParameterizedTest
    @DisplayName("Create author successful")
    @CsvSource({
            "Grigory Bashev, 2021-12-01, Russia",
    })
    void createAuthorSuccessful(String fullName, String dateOfBirth, String country) {
        AuthorCreateDto authorCreateDto = AuthorCreateDto.builder().country(country)
                .dateOfBirth(dateOfBirth)
                .fullName(fullName).build();
        AuthorSpec.createAuthorSuccessful(authorCreateDto);

    }

    @ParameterizedTest
    @DisplayName("Create author unsuccessful")
    @CsvSource({
            "Grigory Bashev, 2023-11-22, Russia",
            "!gory Bashev, 1999-2-31, France",
            "Grigory Bashev, 1999-12-12, Lol what a country",
            ",12th of September, Guatemala",
    })
    void createAuthorUnsuccessful(String fullName, String dateOfBirth, String country) {
        AuthorCreateDto authorCreateDto = AuthorCreateDto.builder().country(country)
                .dateOfBirth(dateOfBirth)
                .fullName(fullName).build();
        AuthorSpec.createAuthorInvalid(authorCreateDto);
    }

    @ParameterizedTest
    @DisplayName("Get existing author")
    @CsvSource({
            "Grigory Bashev, 2021-12-01, Russia",
    })
    void getExistingAuthor(String fullName, String dateOfBirth, String country) {
        var authorCreateDto = AuthorCreateDto.builder()
                .country(country)
                .dateOfBirth(dateOfBirth)
                .fullName(fullName).build();
        Long id = AuthorSpec.createAuthorSuccessful(authorCreateDto);
        var authorDto = AuthorSpec.getAuthor(id);

        assertAuthors(authorDto, authorCreateDto);
    }

    @Test
    @DisplayName("Get nonexistent author")
    void getNonexistentAuthor() {
        var authorDto = AuthorSpec.getNotExistingAuthor(1L);
    }

    public  void assertAuthors(AuthorDto authorDto, AuthorCreateDto authorCreateDto) {
        assertAll(
                "Grouped assertion of two author dtos",
                () -> assertEquals(authorDto.getCountry(), authorCreateDto.getCountry()),
                () -> assertEquals(authorDto.getDateOfBirth(), authorCreateDto.getDateOfBirth()),
                () -> assertEquals(authorDto.getFullName(), authorCreateDto.getFullName())
        );
    }

    public  void assertAuthors(AuthorDto authorDto, AuthorUpdateDto authorUpdateDto) {
        assertAll(
                "Grouped assertion of two author dtos",
                () -> assertEquals(authorDto.getCountry(), authorUpdateDto.getCountry()),
                () -> assertEquals(authorDto.getDateOfBirth(), authorUpdateDto.getDateOfBirth()),
                () -> assertEquals(authorDto.getFullName(), authorUpdateDto.getFullName())
        );
    }
}