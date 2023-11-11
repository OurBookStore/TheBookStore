package ru.mephi.ourbookstore.service.author;

import jakarta.transaction.Transactional;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import ru.mephi.ourbookstore.domain.AuthorModel;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.Entities;
import ru.mephi.ourbookstore.domain.dto.author.Author;
import ru.mephi.ourbookstore.domain.dto.book.Book;
import ru.mephi.ourbookstore.mapper.author.AuthorModelMapper;
import ru.mephi.ourbookstore.repository.author.AuthorRepository;
import ru.mephi.ourbookstore.repository.book.BookRepository;
import ru.mephi.ourbookstore.service.book.BookService;
import ru.mephi.ourbookstore.service.exceptions.AlreadyExistException;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;
import ru.mephi.ourbookstore.util.validation.CountryValidator;
import ru.mephi.ourbookstore.util.validation.DateValidator;

import java.util.List;

import static ru.mephi.ourbookstore.domain.Entities.BOOK;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AuthorService {

    final BookRepository bookRepository;
    final AuthorRepository authorRepository;
    final AuthorModelMapper authorModelMapper;
    final CountryValidator countryValidator;

    public Author getById(Long id) {
        AuthorModel author = authorRepository.findById(id).orElseThrow(
                () -> new NotFoundException(Entities.AUTHOR, "id", id)
        );
        return authorModelMapper.modelToObject(author);
    }

    @Transactional
    public void delete(long authorId) {
        AuthorModel author = authorRepository.findById(authorId).orElseThrow(
                () -> new NotFoundException(Entities.AUTHOR, "id", authorId)
        );
        authorRepository.delete(author);
    }

    @Transactional
    public void update(Author author) {
        Long id = author.getId();
        authorRepository.findById(id)
                .orElseThrow(() -> new NotFoundException(Entities.AUTHOR, "id", id));
        validate(author);
        authorRepository.save(authorModelMapper.objectToModel(author));
    }

    @Transactional
    public Long create(Author author) {
        if (authorRepository.existsByFullName(author.getFullName())) {
            throw new ValidationException(Entities.AUTHOR, "Author with this name already exists",
                    author.getFullName());
        }
        validate(author);
        AuthorModel model = authorRepository.save(authorModelMapper.objectToModel(author));
        return model.getId();
    }

    @Transactional
    public void addBookToAuthor(long bookId, long authorId) {
        BookModel bookModel = bookRepository.findById(bookId)
                .orElseThrow(() -> new NotFoundException(BOOK, "id", bookId));
        AuthorModel authorModel = authorRepository.findById(authorId)
                .orElseThrow(() -> new NotFoundException(Entities.AUTHOR, "id", authorId));
        if (authorModel.getBooks().contains(bookModel)) {
            throw new AlreadyExistException(BOOK, "id", bookId);
        }
        authorModel.getBooks().add(bookModel);
        bookModel.getAuthors().add(authorModel);
        authorRepository.save(authorModel);
    }

    @Transactional
    public void removeBookFromAuthor(long bookId, long authorId) {
        BookModel bookModel = bookRepository.findById(bookId)
                .orElseThrow(() -> new NotFoundException(BOOK, "id", bookId));
        AuthorModel authorModel = authorRepository.findById(authorId)
                .orElseThrow(() -> new NotFoundException(Entities.AUTHOR, "id", authorId));
        if (!authorModel.getBooks().contains(bookModel)) {
            throw new NotFoundException(BOOK, "id", bookId);
        }
        authorModel.getBooks().remove(bookModel);
        bookModel.getAuthors().remove(authorModel);
        authorRepository.save(authorModel);
    }

    public List<Author> getAll() {
        List<AuthorModel> authors = authorRepository.findAll();
        return authors.stream()
                .map(authorModelMapper::modelToObject)
                .toList();
    }

    public void validate(Author author) {
        if (!DateValidator.validateDate(author.getDateOfBirth())) {
            throw new ValidationException(Entities.AUTHOR, "Invalid date of birth", author.getDateOfBirth());
        }
        if (author.getFullName() == null || !author.getFullName().matches("^[a-zA-Z]+ [a-zA-Z]+$")) {
            throw new ValidationException(Entities.AUTHOR, "Invalid Author Name", author.getFullName());
        }
        if (!countryValidator.isCountryValid(author.getCountry())) {
            throw new ValidationException(Entities.AUTHOR, "Invalid country", author.getCountry());
        }
    }
}