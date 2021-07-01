package com.curso.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.RestauranteDTO;
import com.curso.domain.model.Restaurante;

/**
 * 
 * @author Thiago Guimarães
 * @date 28/06/2021
 */
@Component
public class RestauranteModelAssembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public RestauranteDTO toDto(Restaurante restaurante) {
		return modelMapper.map(restaurante, RestauranteDTO.class);
	}
	
	public List<RestauranteDTO> toCollectionDto(List<Restaurante> list){
		return list.stream().map(entity -> toDto(entity)).collect(Collectors.toList());
	}
}
