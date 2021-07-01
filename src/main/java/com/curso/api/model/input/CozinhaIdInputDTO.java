package com.curso.api.model.input;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author Thiago Guimarães
 * @date 24/06/2021
 */
@Getter
@Setter
public class CozinhaIdInputDTO {
	
	@NotNull
	private Long id;
}
