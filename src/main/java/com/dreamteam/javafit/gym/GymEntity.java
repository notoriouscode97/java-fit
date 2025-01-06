package com.dreamteam.javafit.gym;

import jakarta.persistence.*;
import lombok.*;

import java.util.Objects;

@Entity
@Table(name="gyms")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class GymEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="name")
    private String name;

    @Column(name="address")
    private String address;

    @Column(name="latitude")
    private float latitude;

    @Column(name="longitude")
    private float longitude;

    @Column(name="phone_number")
    private String phone_number;

    @Column(name="working_hours")
    private String working_hours;

    @Column(name="gym_description")
    private String gym_description;

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        GymEntity gymEntity = (GymEntity) o;
        return id == gymEntity.id;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}








