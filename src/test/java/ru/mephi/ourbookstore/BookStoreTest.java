package ru.mephi.ourbookstore;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.test.context.ActiveProfiles;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@SpringBootTest
@ActiveProfiles("test")
public class BookStoreTest {
}

