package com.curso.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.input.RestauranteInputDTO;
import com.curso.domain.model.Cozinha;
import com.curso.domain.model.Restaurante;

/**
 * 
 * @author Thiago Guimarães
 * @date 28/06/2021
 */
@Component
public class RestauranteInputDisassembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public Restaurante toDomain(RestauranteInputDTO restauranteInputDTO) {
		return modelMapper.map(restauranteInputDTO, Restaurante.class);
	}
	
	public void copyToDomainObject(RestauranteInputDTO restauranteInputDTO, Restaurante restaurante) {
		//Zera a referencia para evitar exception de troca de IDs.
		restaurante.setCozinha(new Cozinha());
		modelMapper.map(restauranteInputDTO, restaurante);
	}
}
