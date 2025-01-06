package com.dreamteam.javafit.gym;

import com.dreamteam.javafit.gym.dto.GymRequestDto;
import com.dreamteam.javafit.gym.dto.GymResponseDto;
import jakarta.validation.Valid;
import lombok.Data;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("/gym")
@Data
public class GymController {

    private final GymService gymService;

    @GetMapping("/{id}")
    public ResponseEntity<GymResponseDto> findGymById(@PathVariable int id) {
        return ResponseEntity.ok(gymService.getGymById(id));
    }

    @GetMapping
    public ResponseEntity<List<GymResponseDto>> findAllGyms() {
        return ResponseEntity.ok(gymService.getAllGyms());
    }

    @PostMapping
    public ResponseEntity<GymResponseDto> createGym(@RequestBody @Valid GymRequestDto gymRequestDto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(gymService.create(gymRequestDto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteGym(@PathVariable int id) {
        return ResponseEntity.ok(gymService.delete(id));
    }
}
