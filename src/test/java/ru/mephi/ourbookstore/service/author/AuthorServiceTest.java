package ru.mephi.ourbookstore.service.author;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import ru.mephi.ourbookstore.BookStoreTest;
import ru.mephi.ourbookstore.domain.AuthorModel;
import ru.mephi.ourbookstore.repository.author.AuthorRepository;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@FieldDefaults(level = AccessLevel.PRIVATE)
class AuthorServiceTest extends BookStoreTest {

    final AuthorModel AUTHOR_1 = AuthorModel.builder()
            .country("Russia")
            .dateOfBirth(LocalDate.now())
            .fullName("Grigory Bashev")
            .build();

    @Autowired
    AuthorService authorService;

    @DisplayName("delete existing author")
    @Test
    void deleteExisting() {
        Long authorId = authorRepository.save(AUTHOR_1).getId();

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
}