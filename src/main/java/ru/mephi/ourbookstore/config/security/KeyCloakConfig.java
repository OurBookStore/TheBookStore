package ru.mephi.ourbookstore.config.security;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.ExchangeFilterFunction;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

@Configuration
@Slf4j
public class KeyCloakConfig {
    @Value("${keycloak.auth-server-url}")
    private String keycloakUrl;

    @Bean
    public WebClient getKeycloakWebClient() {
        return WebClient.builder()
                .baseUrl(keycloakUrl)
                .filter(logRequest())
                .build();
    }

    @Bean
    public ObjectWriter getJsonWriter() {
        return new ObjectMapper()
                .writer()
                .withDefaultPrettyPrinter();
    }

    private static ExchangeFilterFunction logRequest() {
        return ExchangeFilterFunction.ofRequestProcessor(clientRequest -> {
            log.info("Request: {} {}", clientRequest.method(), clientRequest.url());
            clientRequest.headers().forEach((name, values) ->
                    values.forEach(value -> log.info("{}={}", name, value)));
            return Mono.just(clientRequest);
        });
    }
}
