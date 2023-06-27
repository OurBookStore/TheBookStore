package ru.mephi.ourbookstore.repository.book;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Repository
public interface BookRepository extends JpaRepository<BookModel, Long> {

    Optional<BookModel> findByName(String name);
}
