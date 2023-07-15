package ru.mephi.ourbookstore.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.Date;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AuthorModel {
     @Id
     @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;
     String firstName;
     String lastName;
     Date dateOfBirth;
     String country;
}