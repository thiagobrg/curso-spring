package com.curso.api.model.input;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author Thiago Guimarães
 * @date 06/07/2021
 */
@Setter
@Getter
public class GrupoInputDTO {

    @NotBlank
    private String nome;
    
} 