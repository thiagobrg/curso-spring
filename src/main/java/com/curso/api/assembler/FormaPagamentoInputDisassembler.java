package com.curso.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.input.FormaPagamentoInputDTO;
import com.curso.domain.model.FormaPagamento;

/**
 * 
 * @author Thiago Guimarães
 * @date 01/07/2021
 */
@Component
public class FormaPagamentoInputDisassembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public FormaPagamento toDomainObject(FormaPagamentoInputDTO formaPagamentoInputDTO) {
		return modelMapper.map(formaPagamentoInputDTO, FormaPagamento.class);
	}
	
	public void copyToDomainObject(FormaPagamentoInputDTO formaPagamentoInputDto, FormaPagamento formaPagamento) {
		modelMapper.map(formaPagamentoInputDto, formaPagamento);
	}
}
