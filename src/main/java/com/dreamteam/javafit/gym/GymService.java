package com.dreamteam.javafit.gym;

import com.dreamteam.javafit.exception.CommonErrorMessage;
import com.dreamteam.javafit.exception.GymNotFoundException;
import com.dreamteam.javafit.gym.dto.GymRequestDto;
import com.dreamteam.javafit.gym.dto.GymResponseDto;
import lombok.Data;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Data
public class GymService {

    private final GymRepository gymRepository;
    private final GymMapper gymMapper;

    public GymResponseDto getGymById(int gymId) {
        var gymEntity  = gymRepository.findById(gymId).orElseThrow(()
                -> new GymNotFoundException(CommonErrorMessage.GYM_NOT_FOUND));

        return gymMapper.gymToDto(gymEntity);
    }

    public List<GymResponseDto> getAllGyms() {
        var gymEntities = gymRepository.findAll();
        return gymEntities.stream().map(gymMapper::gymToDto).toList();
    }

    public GymResponseDto create(GymRequestDto gymRequestDto) {
        var gymEntity = gymMapper.dtoToGym(gymRequestDto);
        gymRepository.save(gymEntity);

        return gymMapper.gymToDto(gymEntity);
    }

    public String delete(int gymId) {
        gymRepository.deleteById(gymId);

        return "Gym deleted";
    }
}
