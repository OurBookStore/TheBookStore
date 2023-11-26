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
import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Indexed
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AuthorModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    @Field
    String fullName;
    @Field(index = Index.YES, analyze= Analyze.NO, store = Store.YES)
    @DateBridge(resolution = Resolution.MONTH)
    LocalDate dateOfBirth;
    String country;
    @ManyToMany(cascade = {CascadeType.MERGE}, mappedBy = "authors", fetch = FetchType.EAGER)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    List<BookModel> books;
}