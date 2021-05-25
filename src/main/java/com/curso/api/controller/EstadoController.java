package com.curso.api.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.curso.domain.exception.EntidadeEmUsoException;
import com.curso.domain.exception.EntidadeNaoEncontradaException;
import com.curso.domain.model.Estado;
import com.curso.domain.repository.EstadoRepository;
import com.curso.domain.service.EstadoService;

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
	private EstadoService estadoService;
	
	@GetMapping
	public List<Estado> listar(){
		return estadoRepository.findAll();
	}
	
	@GetMapping("/{estadoId}")
	public ResponseEntity<Estado> porId(@PathVariable Long estadoId) {

		Optional<Estado> estado = estadoRepository.findById(estadoId);

		if (estado.isPresent()) {
			return ResponseEntity.ok(estado.get());
		}

		return ResponseEntity.notFound().build();
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Estado create(@RequestBody Estado estado) {
		return estadoService.save(estado);
	}

	@PutMapping("/{estadoId}")
	public ResponseEntity<Estado> update(@PathVariable Long estadoId, @RequestBody Estado estado) {

		if (estadoRepository.existsById(estadoId)) {
			estado.setId(estadoId);
			return ResponseEntity.ok(estadoService.save(estado));
		}

		return ResponseEntity.notFound().build();
	}

	@DeleteMapping("/{estadoId}")
	public ResponseEntity<Void> deleteById(@PathVariable Long estadoId) {
		
		try {
			estadoService.deleteById(estadoId);
			return ResponseEntity.noContent().build();
			
		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.notFound().build();

		} catch (EntidadeEmUsoException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}

}
