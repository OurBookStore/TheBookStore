package ru.mephi.ourbookstore.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.mephi.ourbookstore.domain.BookModel;
import ru.mephi.ourbookstore.domain.OrderModel;

@Entity
@Table(name = "order_positions")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderPositionModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "position_id")
    Long id;

    @ManyToOne
    @JoinColumn(name = "book_id") //понять какой айдишник или же ставить bookId
    BookModel book;

    int count;

    @ManyToOne
    OrderModel order;

}
