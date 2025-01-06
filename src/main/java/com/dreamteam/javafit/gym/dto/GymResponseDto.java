package com.dreamteam.javafit.gym.dto;

import lombok.Data;

@Data
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
