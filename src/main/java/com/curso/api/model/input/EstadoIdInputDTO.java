package com.curso.api.model.input;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author Thiago Guimarães
 * @date 28/06/2021
 */
@Setter
@Getter
public class EstadoIdInputDTO {

    @NotNull
    private Long id;
    
}