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

import com.curso.api.assembler.RestauranteInputDisassembler;
import com.curso.api.assembler.RestauranteModelAssembler;
import com.curso.api.model.RestauranteDTO;
import com.curso.api.model.input.RestauranteInputDTO;
import com.curso.domain.exception.CidadeNaoEncontradaException;
import com.curso.domain.exception.CozinhaNaoEncontradaException;
import com.curso.domain.exception.NegocioException;
import com.curso.domain.exception.RestauranteNaoEncontradoException;
import com.curso.domain.model.Restaurante;
import com.curso.domain.repository.RestauranteRepository;
import com.curso.domain.service.CadastroRestauranteService;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 25-03-2021 19:09:36
 */
@RestController
@RequestMapping(value = "/restaurantes")
public class RestauranteController {

	@Autowired
	private RestauranteRepository restauranteRepository;
	
	@Autowired
	private CadastroRestauranteService cadastroRestaurante;
	
	@Autowired
	private RestauranteModelAssembler assembler;
	
	@Autowired
	private RestauranteInputDisassembler disassembler;
	
	@GetMapping
	public List<RestauranteDTO> listar() {
		return assembler.toCollectionDto(restauranteRepository.findAll());
	}
	
	@GetMapping("/{restauranteId}")
	public RestauranteDTO buscar(@PathVariable Long restauranteId) {
		Restaurante restaurante = cadastroRestaurante.buscarOuFalhar(restauranteId);
		
		RestauranteDTO restauranteDTO = assembler.toDto(restaurante);
		
		return restauranteDTO;
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public RestauranteDTO adicionar(@RequestBody @Valid RestauranteInputDTO restauranteDto) {
		try {
			return assembler.toDto(cadastroRestaurante.salvar(disassembler.toDomain(restauranteDto)));
		} catch (CozinhaNaoEncontradaException | CidadeNaoEncontradaException e) {
			throw new NegocioException(e.getMessage());
		}
	}
	
	@PutMapping("/{restauranteId}")
	public RestauranteDTO atualizar(@PathVariable Long restauranteId, @RequestBody @Valid RestauranteInputDTO restauranteInputDto) {
		try {
			
			Restaurante restauranteAtual = cadastroRestaurante.buscarOuFalhar(restauranteId);
			disassembler.copyToDomainObject(restauranteInputDto, restauranteAtual);
			
			return assembler.toDto(cadastroRestaurante.salvar(restauranteAtual));
			
		} catch (CozinhaNaoEncontradaException | CidadeNaoEncontradaException e) {
			throw new NegocioException(e.getMessage());
		}
	}
	
	@PutMapping("/ativacoes")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void ativarMultiplos(@RequestBody List<Long> restauranteIds) {
		try {
			cadastroRestaurante.ativar(restauranteIds);
		} catch (RestauranteNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}
	}
	
	@DeleteMapping("/ativacoes")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void inativarMultiplos(@RequestBody List<Long> restauranteIds) {
		try {
			cadastroRestaurante.inativar(restauranteIds);
		} catch (RestauranteNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}
	}
	
	@PutMapping("/{restauranteId}/ativo")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void ativar(@PathVariable Long restauranteId) {
		cadastroRestaurante.ativar(restauranteId);
	}
	
	@DeleteMapping("/{restauranteId}/ativo")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void inativar(@PathVariable Long restauranteId) {
		cadastroRestaurante.inativar(restauranteId);
	}
	
	@PutMapping("/{restauranteId}/abertura")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void abrir(@PathVariable Long restauranteId) {
	    cadastroRestaurante.abrir(restauranteId);
	}

	@PutMapping("/{restauranteId}/fechamento")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void fechar(@PathVariable Long restauranteId) {
	    cadastroRestaurante.fechar(restauranteId);
	}
}
