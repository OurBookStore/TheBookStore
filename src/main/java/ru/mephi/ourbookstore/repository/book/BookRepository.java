package ru.mephi.ourbookstore.repository.book;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.mephi.ourbookstore.domain.BookModel;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Repository
public interface BookRepository extends JpaRepository<BookModel, Long> {

    Optional<BookModel> findByName(String name);

    List<BookModel> findBookModelsByImage(String image);
}
