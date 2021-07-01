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

import com.curso.api.assembler.CidadeInputDisassembler;
import com.curso.api.assembler.CidadeModelAssembler;
import com.curso.api.model.CidadeDTO;
import com.curso.api.model.input.CidadeInputDTO;
import com.curso.domain.exception.EstadoNaoEncontradoException;
import com.curso.domain.exception.NegocioException;
import com.curso.domain.model.Cidade;
import com.curso.domain.repository.CidadeRepository;
import com.curso.domain.service.CadastroCidadeService;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 07-04-2021 19:53:06
 */
@RestController
@RequestMapping(value = "/cidades")
public class CidadeController {

	@Autowired
	private CidadeRepository cidadeRepository;
	
	@Autowired
	private CadastroCidadeService cadastroCidade;
	
	@Autowired
	private CidadeModelAssembler cidadeModelAssembler;

	@Autowired
	private CidadeInputDisassembler cidadeInputDisassembler;       
	
	@GetMapping
	public List<CidadeDTO> listar() {
	    List<Cidade> todasCidades = cidadeRepository.findAll();
	    
	    return cidadeModelAssembler.toCollectionModel(todasCidades);
	}
	
	@GetMapping("/{cidadeId}")
	public CidadeDTO buscar(@PathVariable Long cidadeId) {
	    Cidade cidade = cadastroCidade.buscarOuFalhar(cidadeId);
	    
	    return cidadeModelAssembler.toModel(cidade);
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public CidadeDTO adicionar(@RequestBody @Valid CidadeInputDTO cidadeInput) {
	    try {
	        Cidade cidade = cidadeInputDisassembler.toDomainObject(cidadeInput);
	        
	        cidade = cadastroCidade.salvar(cidade);
	        
	        return cidadeModelAssembler.toModel(cidade);
	    } catch (EstadoNaoEncontradoException e) {
	        throw new NegocioException(e.getMessage(), e);
	    }
	}
	
	@PutMapping("/{cidadeId}")
	public CidadeDTO atualizar(@PathVariable Long cidadeId, @RequestBody @Valid CidadeInputDTO cidadeInput) {
	    try {
	        Cidade cidadeAtual = cadastroCidade.buscarOuFalhar(cidadeId);
	        
	        cidadeInputDisassembler.copyToDomainObject(cidadeInput, cidadeAtual);
	        
	        cidadeAtual = cadastroCidade.salvar(cidadeAtual);
	        
	        return cidadeModelAssembler.toModel(cidadeAtual);
	    } catch (EstadoNaoEncontradoException e) {
	        throw new NegocioException(e.getMessage(), e);
	    }
	}
	
	@DeleteMapping("/{cidadeId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Long cidadeId) {
		cadastroCidade.excluir(cidadeId);	
	}
	
}
