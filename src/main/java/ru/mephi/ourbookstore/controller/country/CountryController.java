package ru.mephi.ourbookstore.controller.country;

import java.util.Set;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.mephi.ourbookstore.util.validation.CountryValidator;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@RestController
@RequestMapping("/countries")
@RequiredArgsConstructor
@SecurityRequirement(name = "bearerAuth")
public class CountryController {

    private final CountryValidator countryValidator;

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public Set<String> getCountries() {
        return countryValidator.getCountries();
    }
}
