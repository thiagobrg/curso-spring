package com.curso.core.modelmapper;

import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.curso.api.model.EnderecoDTO;
import com.curso.api.model.input.ItemPedidoInputDTO;
import com.curso.domain.model.Endereco;
import com.curso.domain.model.ItemPedido;

/**
 * 
 * @author Thiago Guimarães
 * @date 28/06/2021
 */
@Configuration
public class ModelMapperConfig {

	@Bean
	public ModelMapper modelMapper() {
		var modelMapper = new ModelMapper();
		
//		modelMapper.createTypeMap(Restaurante.class, RestauranteModel.class)
//			.addMapping(Restaurante::getTaxaFrete, RestauranteModel::setPrecoFrete);
		
		var enderecoToEnderecoModelTypeMap = modelMapper.createTypeMap(
				Endereco.class, EnderecoDTO.class);
		
		enderecoToEnderecoModelTypeMap.<String>addMapping(
				enderecoSrc -> enderecoSrc.getCidade().getEstado().getNome(),
				(enderecoModelDest, value) -> enderecoModelDest.getCidade().setEstado(value));
		
		modelMapper.createTypeMap(ItemPedidoInputDTO.class, ItemPedido.class)
	    	.addMappings(mapper -> mapper.skip(ItemPedido::setId));  

		
		return modelMapper;
	}
}
