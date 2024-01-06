package ru.mephi.ourbookstore.author;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.domain.AuthorModel;
import ru.mephi.ourbookstore.repository.author.AuthorRepository;
import ru.mephi.ourbookstore.service.author.AuthorService;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.util.TestHelper;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@FieldDefaults(level = AccessLevel.PRIVATE)
class AuthorServiceTest extends BookStoreTest {

    @Autowired
    AuthorService authorService;

    @DisplayName("delete existing author")
    @Test
    void deleteExisting() {
        Long authorId = authorRepository.save(TestHelper.AuthorEntity.getAuthorModel1()).getId();

        authorService.delete(authorId);

        List<AuthorModel> authors = authorRepository.findAll();
        assertEquals(authors.size(), 0);
    }

    @DisplayName("delete nonexistent author")
    @Test
    void deleteNonExistent() {
        assertThrows(NotFoundException.class, () ->
                authorService.delete(1)
        );
    }

    @DisplayName("get min date of birth")
    @Test
    void getMinDateOfBirth() {
        authorRepository.save(TestHelper.AuthorEntity.getAuthorModel1());
        authorRepository.save(TestHelper.AuthorEntity.getAuthorModel2());

        LocalDate birthDate1 = TestHelper.AuthorEntity.getAuthorModel1().getDateOfBirth();
        LocalDate birthDate2 = TestHelper.AuthorEntity.getAuthorModel2().getDateOfBirth();
        LocalDate minDate = birthDate1.isAfter(birthDate2) ? birthDate2 : birthDate1;

        assertEquals(authorService.getMinDateOfBirth(), minDate);
    }

    @DisplayName("get max date of birth")
    @Test
    void getMaxDateOfBirth() {
        authorRepository.save(TestHelper.AuthorEntity.getAuthorModel1());
        authorRepository.save(TestHelper.AuthorEntity.getAuthorModel2());

        LocalDate birthDate1 = TestHelper.AuthorEntity.getAuthorModel1().getDateOfBirth();
        LocalDate birthDate2 = TestHelper.AuthorEntity.getAuthorModel2().getDateOfBirth();
        LocalDate maxDate = birthDate1.isAfter(birthDate2) ? birthDate1 : birthDate2;

        assertEquals(authorService.getMaxDateOfBirth(), maxDate);
    }
}