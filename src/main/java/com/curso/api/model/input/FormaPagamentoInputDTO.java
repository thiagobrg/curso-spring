package com.curso.api.model.input;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author Thiago Guimarães
 * @date 01/07/2021
 */
@Setter
@Getter
public class FormaPagamentoInputDTO {

    @NotBlank
    private String descricao;
    
}