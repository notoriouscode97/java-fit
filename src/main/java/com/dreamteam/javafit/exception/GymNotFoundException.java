package com.dreamteam.javafit.exception;

public class GymNotFoundException extends RuntimeException {
    public GymNotFoundException(String message) {
        super(message);
    }
}
