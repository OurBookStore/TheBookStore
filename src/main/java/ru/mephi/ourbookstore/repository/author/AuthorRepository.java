package ru.mephi.ourbookstore.repository.author;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mephi.ourbookstore.domain.AuthorModel;

public interface AuthorRepository extends JpaRepository<AuthorModel, Long> {
    boolean existsByFullName(String name);
}
