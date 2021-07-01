package com.curso.api.model.input;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
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
public class CidadeInputDTO {

    @NotBlank
    private String nome;
    
    @Valid
    @NotNull
    private EstadoIdInputDTO estado;
    
}