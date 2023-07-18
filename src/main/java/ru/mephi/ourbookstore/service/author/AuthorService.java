package ru.mephi.ourbookstore.service.author;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.mephi.ourbookstore.domain.AuthorModel;
import ru.mephi.ourbookstore.domain.Entities;
import ru.mephi.ourbookstore.domain.dto.author.Author;
import ru.mephi.ourbookstore.mapper.author.AuthorModelMapper;
import ru.mephi.ourbookstore.repository.author.AuthorRepository;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ValidationException;
import ru.mephi.ourbookstore.util.validation.CountryValidator;
import ru.mephi.ourbookstore.util.validation.DateValidator;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AuthorService {

    final private AuthorRepository authorRepository;
    final private AuthorModelMapper authorModelMapper;

    public Author getAuthorById(Long id) {
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
        validate(author);
        Author authorToUpdate = getAuthorById(author.getId());
        authorToUpdate.setCountry(author.getCountry());
        authorToUpdate.setFullName(author.getFullName());
        authorToUpdate.setDateOfBirth(author.getDateOfBirth());
        authorRepository.save(authorModelMapper.objectToModel(authorToUpdate));
    }

    @Transactional
    public Long create(Author author) {
        validate(author);
        AuthorModel model = authorRepository.save(authorModelMapper.objectToModel(author));
        return model.getId();
    }

    public List<Author> getAll() {
        List<AuthorModel> authors = authorRepository.findAll();
            return authors.stream().map(authorModelMapper::modelToObject).toList();
    }

    public void validate(Author author) {
        if (!DateValidator.validateDate(author.getDateOfBirth())) {
            throw new ValidationException(Entities.AUTHOR, "Invalid date of birth", author.getDateOfBirth());
        }
        if (author.getFullName() == null || !author.getFullName().matches("^[a-zA-Z]+ [a-zA-Z]+$")) {
            throw new ValidationException(Entities.AUTHOR, "InvalidAuthorName", author.getFullName());
        }
        if (!CountryValidator.isCountryValid(author.getCountry())) {
            throw new ValidationException(Entities.AUTHOR, "Invalid country", author.getCountry());
        }
    }
}
