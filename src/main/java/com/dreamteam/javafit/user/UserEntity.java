package com.dreamteam.javafit.user;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name="user")
@Data
public class UserEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="first_name")
    private String firstName;

    @Column(name="last_name")
    private String lastName;

    @Column(name="email")
    private String email;

    @Column(name="password")
    private String password;

    @Column(name="must_change_password")
    private boolean mustChangePassword;

    @Column(name="role")
    private String role;

    @Column(name="phone_number")
    private String phoneNumber;
}