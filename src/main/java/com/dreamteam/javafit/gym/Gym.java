package com.dreamteam.javafit.gym;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name="gym")
@Data
public class Gym {

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
}








