package com.curso.api.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.curso.api.assembler.FormaPagamentoInputDisassembler;
import com.curso.api.assembler.FormaPagamentoModelAssembler;
import com.curso.api.model.FormaPagamentoDTO;
import com.curso.api.model.input.FormaPagamentoInputDTO;
import com.curso.domain.model.FormaPagamento;
import com.curso.domain.repository.FormaPagamentoRepository;
import com.curso.domain.service.CadastroFormaPagamentoService;

/**
 * 
 * @author Thiago Guimarães
 * @date 01/07/2021
 */
@RestController
@RequestMapping(value = "/formas-pagamento")
public class FormaPagamentoController {

	@Autowired
	private FormaPagamentoRepository formaPagamentoRepository;
	
	@Autowired
	private CadastroFormaPagamentoService formaPagamentoService;
	
	@Autowired
	private FormaPagamentoModelAssembler formaPagamentoModelAssembler;

	@Autowired
	private FormaPagamentoInputDisassembler formaPagamentoInputDisassembler;       
	
	@GetMapping
	public List<FormaPagamentoDTO> listar() {
	    List<FormaPagamento> list = formaPagamentoRepository.findAll();
	    
	    return formaPagamentoModelAssembler.toCollectionModel(list);
	}

	@GetMapping("/{formaPagamentoId}")
	public FormaPagamentoDTO buscar(@PathVariable Long formaPagamentoId) {
		FormaPagamento formaPagamento = formaPagamentoService.buscarOuFalhar(formaPagamentoId);
	    
	    return formaPagamentoModelAssembler.toModel(formaPagamento);
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public FormaPagamentoDTO adicionar(@RequestBody @Valid FormaPagamentoInputDTO formaPagamentoInputDto) {
		
	    FormaPagamento formaPagamento = formaPagamentoInputDisassembler.toDomainObject(formaPagamentoInputDto);
	    formaPagamento = formaPagamentoService.salvar(formaPagamento);
	    
	    return formaPagamentoModelAssembler.toModel(formaPagamento);
	}

	@PutMapping("/{formaPagamentoId}")
	public FormaPagamentoDTO atualizar(@PathVariable Long formaPagamentoId, @RequestBody @Valid FormaPagamentoInputDTO formaPagamento) {
		
		FormaPagamento formaPagemento = formaPagamentoService.buscarOuFalhar(formaPagamentoId);
	    formaPagamentoInputDisassembler.copyToDomainObject(formaPagamento, formaPagemento);
	    formaPagemento = formaPagamentoService.salvar(formaPagemento);
	    
	    return formaPagamentoModelAssembler.toModel(formaPagemento);
	}
	
	@DeleteMapping("/{formaPagamentoId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Long formaPagamentoId) {
		formaPagamentoService.excluir(formaPagamentoId);
	}
	
}
