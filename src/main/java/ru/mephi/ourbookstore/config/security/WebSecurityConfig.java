package ru.mephi.ourbookstore.config.security;

import com.jayway.jsonpath.JsonPath;
import com.jayway.jsonpath.PathNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.stereotype.Component;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.security.interfaces.RSAPublicKey;
import java.util.Arrays;
import java.util.Collection;
import java.util.stream.Stream;

@ConditionalOnProperty(
        prefix = "spring.security",
        name = "enabled",
        havingValue = "true"
)
@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class WebSecurityConfig {

    @Value("${spring.security.oauth2.resourceserver.jwt.public-key-location}")
    private RSAPublicKey publicKey;

    @Value("${spring.security.enabled}")
    private Boolean isSecurityEnable;

    /**
     * Реализация фильтра безопасности с учетом OAuth2 KeyCloak сервера
     *
     * @param http                       - атрибут безопасности, на котором настраивается работа фильтра
     * @param jwtAuthenticationConverter JWT Converter для чтения JWT токена
     * @return фильтр безопасности
     * @throws Exception есть методы с checked исключением
     */
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http,
                                    Converter<Jwt, ? extends AbstractAuthenticationToken> jwtAuthenticationConverter) throws Exception {

        http.oauth2ResourceServer(oauth2 -> oauth2.jwt(jwt -> jwt.jwtAuthenticationConverter(jwtAuthenticationConverter)));

        http.cors(cors -> cors.configurationSource(corsConfigurationSource()));

        // State-less session (state in access-token only)
        http.sessionManagement(sm -> sm.sessionCreationPolicy(SessionCreationPolicy.STATELESS));

        // Disable CSRF because of state-less session-management
        http.csrf(csrf -> csrf.disable());

        // Return 401 (unauthorized) instead of 302 (redirect to login) when
        // authorization is missing or invalid
        http.exceptionHandling(eh -> eh.authenticationEntryPoint((request, response, authException) -> {
            response.addHeader(HttpHeaders.WWW_AUTHENTICATE, "Bearer realm=\"Restricted Content\"");
            response.sendError(HttpStatus.UNAUTHORIZED.value(), HttpStatus.UNAUTHORIZED.getReasonPhrase());
        }));

        if (isSecurityEnable) {
            http.authorizeHttpRequests(accessManagement -> accessManagement
                    .requestMatchers(
                            "/swagger-ui/**",
                            "/v3/api-docs/**",
                            "/account/oauth/**",
                            "/error"
                    ).permitAll()
                    .requestMatchers(
                            HttpMethod.GET,
                            "/books/**",
                            "/authors/**",
                            "/images/**",
                            "/countries/**"
                    ).permitAll()
                    .requestMatchers(
                            HttpMethod.POST,
                            "/appUsers"
                    ).permitAll()
                    .anyRequest().authenticated()
            );
        } else {
            http.authorizeHttpRequests(accessManagement -> accessManagement
                    .requestMatchers("/error").permitAll()
                    .requestMatchers("/**").permitAll()
                    .anyRequest().permitAll()
            );
        }

        return http.build();
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("*"));
        configuration.setAllowedMethods(Arrays.asList("*"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    /**
     * Внутренний класс-помошник
     * для реализации чтения JWT-токена
     */
    @RequiredArgsConstructor
    static class JwtGrantedAuthoritiesConverter implements Converter<Jwt, Collection<? extends GrantedAuthority>> {

        @Override
        @SuppressWarnings({"rawtypes", "unchecked"})
        public Collection<? extends GrantedAuthority> convert(Jwt jwt) {

            return Stream.of("$.realm_access.roles", "$.resource_access.*.roles").flatMap(claimPaths -> {
                        Object claim;
                        try {
                            claim = JsonPath.read(jwt.getClaims(), claimPaths);
                        } catch (PathNotFoundException e) {
                            claim = null;
                        }
                        if (claim == null) {
                            return Stream.empty();
                        }
                        if (claim instanceof String claimStr) {
                            return Stream.of(claimStr.split(","));
                        }
                        if (claim instanceof String[] claimArr) {
                            return Stream.of(claimArr);
                        }
                        if (Collection.class.isAssignableFrom(claim.getClass())) {
                            final var iter = ((Collection) claim).iterator();
                            if (!iter.hasNext()) {
                                return Stream.empty();
                            }
                            final var firstItem = iter.next();
                            if (firstItem instanceof String) {
                                return (Stream<String>) ((Collection) claim).stream();
                            }
                            if (Collection.class.isAssignableFrom(firstItem.getClass())) {
                                return (Stream<String>) ((Collection) claim).stream().flatMap(colItem -> ((Collection) colItem).stream()).map(String.class::cast);
                            }
                        }
                        return Stream.empty();
                    })
                    .filter(t -> t.contains("ROLE_"))
                    .map(SimpleGrantedAuthority::new).toList();
        }
    }

    /**
     * Реализация JWT конвертера для токенов KeyCloak
     */
    @Component
    @RequiredArgsConstructor
    static class SpringAddonsJwtAuthenticationConverter implements Converter<Jwt, JwtAuthenticationToken> {

        @Override
        public JwtAuthenticationToken convert(Jwt jwt) {
            final var authorities = new JwtGrantedAuthoritiesConverter().convert(jwt);
            final String username = JsonPath.read(jwt.getClaims(), "preferred_username");
            return new JwtAuthenticationToken(jwt, authorities, username);
        }
    }

    /**
     * Необходимый класс для получения Public ключа, необходимого для
     * проверки сертификатов подписывающего сервиса
     * (Для валидации аутентификации)
     *
     * @return класс-котейнер RSA public key
     */
    @Bean
    public RSAPublicKey jwtValidationKey() {
        return publicKey;
    }

    /**
     * Jwt декодер, он ищет сигнатуру токена
     * пытается ее расшифровать открытым ключем
     *
     * @param rsaPublicKey открытый ключ RSA
     * @return JwtDecoder с установленными параметрами
     */
    @Bean
    public JwtDecoder jwtDecoder(RSAPublicKey rsaPublicKey) {
        return NimbusJwtDecoder.withPublicKey(rsaPublicKey).build();
    }

}