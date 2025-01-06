package com.dreamteam.javafit.gym.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class GymRequestDto {

    @NotBlank
    private String name;
    @NotBlank
    private String address;
    @NotNull
    private float latitude;
    @NotNull
    private float longitude;
    @NotBlank
    private String phoneNumber;
    @NotBlank
    private String workingHours;
    @NotBlank
    private String gymDescription;
}
