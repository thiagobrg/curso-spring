package com.curso.api.model;

import java.math.BigDecimal;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author Thiago Guimarães
 * @date 24/06/2021
 */
@Getter
@Setter
public class RestauranteDTO {

	private Long id;
	private String nome;
	private BigDecimal taxaFrete;
	private CozinhaDTO cozinha;
	
}
