package com.curso.api.model.input;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RestauranteIdInputDTO {

    @NotNull
    private Long id;   
} 