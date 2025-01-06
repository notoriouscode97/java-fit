package com.dreamteam.javafit.gym;

import com.dreamteam.javafit.gym.dto.GymRequestDto;
import com.dreamteam.javafit.gym.dto.GymResponseDto;
import org.mapstruct.*;

@Mapper
public interface GymMapper {

    GymEntity dtoToGym(GymRequestDto gymRequestDto);

    GymResponseDto gymToDto(GymEntity gymEntity);
}
