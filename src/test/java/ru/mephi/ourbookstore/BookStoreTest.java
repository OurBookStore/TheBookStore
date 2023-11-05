package ru.mephi.ourbookstore;

import org.junit.jupiter.api.AfterEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import ru.mephi.ourbookstore.repository.appUser.AppUserRepository;
import ru.mephi.ourbookstore.repository.author.AuthorRepository;
import ru.mephi.ourbookstore.repository.book.BookRepository;
import ru.mephi.ourbookstore.repository.cart.CartRepository;
import ru.mephi.ourbookstore.repository.order.OrderRepository;
import ru.mephi.ourbookstore.repository.orderPosition.OrderPositionRepository;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@AutoConfigureMockMvc
@SpringBootTest(
        webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT
)
@ActiveProfiles("test")
public class BookStoreTest {

    @Autowired
    protected MockMvc mockMvc;
    @Autowired
    protected OrderRepository orderRepository;
    @Autowired
    protected AppUserRepository appUserRepository;
    @Autowired
    protected OrderPositionRepository orderPositionRepository;
    @Autowired
    protected BookRepository bookRepository;
    @Autowired
    protected AuthorRepository authorRepository;
    @Autowired
    protected CartRepository cartRepository;

    @AfterEach
    public void cleanUpDb() {
        orderRepository.deleteAll();
        appUserRepository.deleteAll();
        orderPositionRepository.deleteAll();
        bookRepository.deleteAll();
        authorRepository.deleteAll();
        cartRepository.deleteAll();
    }
}

