package com.dreamteam.javafit.gym.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class GymResponseDto {

    private int id;
    private String name;
    private String address;
    private float latitude;
    private float longitude;
    private String phoneNumber;
    private String workingHours;
    private String gymDescription;
}
