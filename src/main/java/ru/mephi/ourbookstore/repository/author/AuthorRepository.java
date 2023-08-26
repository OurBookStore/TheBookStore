package ru.mephi.ourbookstore.repository.author;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import ru.mephi.ourbookstore.domain.AuthorModel;

public interface AuthorRepository extends JpaRepository<AuthorModel, Long> {
    boolean existsByFullName(String name);
    @Modifying
    @Transactional
    @Query(value = "TRUNCATE TABLE author_model", nativeQuery = true)
    void truncateTable();
}
