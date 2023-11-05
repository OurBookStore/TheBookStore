package ru.mephi.ourbookstore.config.security;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;

@ConditionalOnProperty(
        prefix = "spring.security",
        name = "enabled",
        havingValue = "false"
)
@Configuration
public class WebSecurityConfigDisable {

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring()
                .anyRequest();
    }
}