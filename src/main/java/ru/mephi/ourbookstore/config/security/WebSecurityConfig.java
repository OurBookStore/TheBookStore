package ru.mephi.ourbookstore.config.security;

import com.jayway.jsonpath.JsonPath;
import com.jayway.jsonpath.PathNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
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
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Component;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import java.security.interfaces.RSAPublicKey;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Stream;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {

    @Value("${spring.security.oauth2.resourceserver.jwt.public-key-location}")
    private RSAPublicKey publicKey;

    @Value("${security.enable}")
    private Boolean isSecurityEnable;

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http, Converter<Jwt, ? extends AbstractAuthenticationToken> jwtAuthenticationConverter) throws Exception {

        http.oauth2ResourceServer(oauth2 -> oauth2.jwt(jwt -> jwt.jwtAuthenticationConverter(jwtAuthenticationConverter)));

//        // Enable and configure CORS
//        http.cors(cors -> cors.configurationSource(corsConfigurationSource("http://localhost:8080")));
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

        // @formatter:off
        if(isSecurityEnable){
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
                            "/authors/**"
                    ).permitAll()
                    .requestMatchers(
                            HttpMethod.POST,
                            "/appUsers"
                    ).permitAll()
                    .anyRequest().authenticated()
            );
        }else {
            http.authorizeHttpRequests(accessManagement -> accessManagement
                    .requestMatchers("/error").permitAll()
                    .requestMatchers("/**").permitAll()
                    .anyRequest().permitAll()
            );
        }
        // @formatter:on

        return http.build();
    }

    @ConditionalOnProperty(prefix = "security",
            name = "enabled",
            havingValue = "true")
    @EnableMethodSecurity(prePostEnabled = true)
    static class Dummy {
    }
//    private UrlBasedCorsConfigurationSource corsConfigurationSource(String... origins) {
//        final var configuration = new CorsConfiguration();
//        configuration.setAllowedOrigins(Arrays.asList(origins));
//        configuration.setAllowedMethods(List.of("*"));
//        configuration.setAllowedHeaders(List.of("*"));
//        configuration.setExposedHeaders(List.of("*"));
//
//        final var source = new UrlBasedCorsConfigurationSource();
//        source.registerCorsConfiguration("/**", configuration);
//        return source;
//    }

//    @Bean
//    public FilterRegistrationBean corsFilter() {
//        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//        CorsConfiguration config = new CorsConfiguration();
//        config.addAllowedOrigin("*");
//        config.addAllowedHeader("*");
//        config.addAllowedMethod("*");
//        source.registerCorsConfiguration("/**", config);
//        FilterRegistrationBean bean = new FilterRegistrationBean(new CorsFilter(source));
//        bean.setOrder(0);
//        return bean;
//    }

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
                    /* Insert some transformation here if you want to add a prefix like "ROLE_" or force upper-case authorities */
//                    .filter(t -> t.contains("ROLE_"))
//                    .map(grand -> new SimpleGrantedAuthority(grand.substring(5))).toList();
                    .filter(t -> t.contains("ROLE_"))
                    .map(SimpleGrantedAuthority::new).toList();
        }
    }

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

    @Bean
    public RSAPublicKey jwtValidationKey() {
        return publicKey;
    }

    @Bean
    public JwtDecoder jwtDecoder(RSAPublicKey rsaPublicKey) {
        return NimbusJwtDecoder.withPublicKey(rsaPublicKey).build();
    }

}