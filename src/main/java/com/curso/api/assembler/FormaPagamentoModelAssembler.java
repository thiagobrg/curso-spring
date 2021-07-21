package com.curso.api.assembler;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.FormaPagamentoDTO;
import com.curso.domain.model.FormaPagamento;

/**
 * 
 * @author Thiago Guimarães
 * @date 01/07/2021
 */
@Component
public class FormaPagamentoModelAssembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public FormaPagamentoDTO toModel(FormaPagamento formaPagamento) {
		return modelMapper.map(formaPagamento, FormaPagamentoDTO.class);
	}
	
	public List<FormaPagamentoDTO> toCollectionModel(Collection<FormaPagamento> list){
		return list.stream().map(entity -> toModel(entity)).collect(Collectors.toList());
	}
}
