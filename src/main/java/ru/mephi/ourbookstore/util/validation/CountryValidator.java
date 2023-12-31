package ru.mephi.ourbookstore.util.validation;

import org.springframework.stereotype.Component;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Arrays;
import java.util.Scanner;
import java.util.Set;
import java.util.stream.Collectors;

@Component
public class CountryValidator {

    Set<String> countrySet;

    public CountryValidator() {
        Scanner scanner;
        try {
            scanner = new Scanner(new FileReader("src/main/resources/countrylist"));
        } catch (FileNotFoundException e) {
            throw new RuntimeException("countrylist file not found", e);
        }
        countrySet = Arrays.stream(scanner.nextLine().split(",")).collect(Collectors.toSet());

    }

    public boolean isCountryValid(String country) {
        if (country == null || country.isBlank() || country.length() > 100) {
            return false;
        }
        return countrySet.contains(country);
    }

    public Set<String> getCountries() {
        return countrySet;
    }
}