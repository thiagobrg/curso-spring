package com.curso.api.model;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author Thiago Guimarães
 * @date 28/06/2021
 */
@Setter
@Getter
public class CidadeDTO {

    private Long id;
    private String nome;
    private EstadoDTO estado;
    
}  