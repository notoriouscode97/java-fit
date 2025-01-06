package com.dreamteam.javafit.gym;

import com.dreamteam.javafit.gym.dto.GymRequestDto;
import com.dreamteam.javafit.gym.dto.GymResponseDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper
public abstract class GymMapper {

    @Mapping(target = "id", ignore = true)
    public abstract GymEntity dtoToGym(GymRequestDto gymRequestDto);

    public abstract GymResponseDto gymToDto(GymEntity gymEntity);
}
