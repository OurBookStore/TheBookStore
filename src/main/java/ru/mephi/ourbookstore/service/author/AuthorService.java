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

import java.util.List;

@Service
@RequiredArgsConstructor
public class AuthorService {

    private final AuthorRepository authorRepository;
    private final AuthorModelMapper authorModelMapper;
    private final CountryValidator countryValidator;

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
            throw new ValidationException(Entities.AUTHOR, "Author with this name already exists", author.getFullName());
        }
        validate(author);
        AuthorModel model = authorRepository.save(authorModelMapper.objectToModel(author));
        return model.getId();
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