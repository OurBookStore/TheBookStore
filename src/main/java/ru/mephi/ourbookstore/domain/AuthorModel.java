package ru.mephi.ourbookstore.domain;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.FieldDefaults;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.FullTextField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.GenericField;

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
    @FullTextField
    String fullName;
    @GenericField
    LocalDate dateOfBirth;
    String country;
    @ManyToMany(cascade = {CascadeType.MERGE}, mappedBy = "authors", fetch = FetchType.EAGER)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    List<BookModel> books;
}