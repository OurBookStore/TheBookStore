package ru.mephi.ourbookstore.util.validation;

import org.springframework.stereotype.Component;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;
import java.util.stream.Collectors;

@Component
public class CountryValidator {

    static Set<String> countrySet;

    static {
        Scanner scanner = null;
        try {
            scanner = new Scanner(new FileReader("src/main/resources/countrylist"));
        } catch (FileNotFoundException e) {
            throw new RuntimeException("countrylist file not found", e);
        }
        countrySet = Arrays.stream(scanner.nextLine().split(",")).collect(Collectors.toSet());
    }

    public static boolean isCountryValid(String country) {
        if (country.isBlank() || country.length() > 100) {
            return false;
        }
        return countrySet.contains(country);
    }
}