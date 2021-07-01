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

import com.curso.api.assembler.EstadoInputDisassembler;
import com.curso.api.assembler.EstadoModelAssembler;
import com.curso.api.model.EstadoDTO;
import com.curso.api.model.input.EstadoInputDTO;
import com.curso.domain.model.Estado;
import com.curso.domain.repository.EstadoRepository;
import com.curso.domain.service.CadastroEstadoService;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 07-04-2021 19:53:10
 */
@RestController
@RequestMapping("/estados")
public class EstadoController {

	@Autowired
	private EstadoRepository estadoRepository;
	
	@Autowired
	private CadastroEstadoService cadastroEstado;
	
	@Autowired
	private EstadoModelAssembler estadoModelAssembler;

	@Autowired
	private EstadoInputDisassembler estadoInputDisassembler;    
	
	@GetMapping
	public List<EstadoDTO> listar() {
	    List<Estado> todosEstados = estadoRepository.findAll();
	    
	    return estadoModelAssembler.toCollectionModel(todosEstados);
	}

	@GetMapping("/{estadoId}")
	public EstadoDTO buscar(@PathVariable Long estadoId) {
	    Estado estado = cadastroEstado.buscarOuFalhar(estadoId);
	    
	    return estadoModelAssembler.toModel(estado);
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public EstadoDTO adicionar(@RequestBody @Valid EstadoInputDTO estadoInput) {
	    Estado estado = estadoInputDisassembler.toDomainObject(estadoInput);
	    
	    estado = cadastroEstado.salvar(estado);
	    
	    return estadoModelAssembler.toModel(estado);
	}

	@PutMapping("/{estadoId}")
	public EstadoDTO atualizar(@PathVariable Long estadoId, @RequestBody @Valid EstadoInputDTO estadoInput) {
	    Estado estadoAtual = cadastroEstado.buscarOuFalhar(estadoId);
	    
	    estadoInputDisassembler.copyToDomainObject(estadoInput, estadoAtual);
	    
	    estadoAtual = cadastroEstado.salvar(estadoAtual);
	    
	    return estadoModelAssembler.toModel(estadoAtual);
	}       
	
	@DeleteMapping("/{estadoId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Long estadoId) {
		cadastroEstado.excluir(estadoId);	
	}
	
}
