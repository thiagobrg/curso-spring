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
import com.curso.domain.model.Cidade;
import com.curso.domain.repository.CidadeRepository;
import com.curso.domain.service.CidadeService;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 07-04-2021 19:53:06
 */
@RestController
@RequestMapping("/cidades")
public class CidadeController {

	@Autowired
	private CidadeRepository cidadeRepository;

	@Autowired
	private CidadeService cidadeService;

	@GetMapping()
	public List<Cidade> listar() {
		return cidadeRepository.findAll();
	}

	@GetMapping("/{cidadeId}")
	public ResponseEntity<Cidade> porId(@PathVariable Long cidadeId) {

		Optional<Cidade> cidade = cidadeRepository.findById(cidadeId);

		if (cidade.isPresent()) {
			return ResponseEntity.ok(cidade.get());
		}

		return ResponseEntity.notFound().build();
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public ResponseEntity<?> create(@RequestBody Cidade cidade) {

		try {
			return ResponseEntity.status(HttpStatus.CREATED).body(cidadeService.save(cidade));

		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@PutMapping("/{cidadeId}")
	public ResponseEntity<Cidade> update(@PathVariable Long cidadeId, @RequestBody Cidade cidade) {

		if (cidadeRepository.existsById(cidadeId)) {
			cidade.setId(cidadeId);
			return ResponseEntity.ok(cidadeService.save(cidade));
		}

		return ResponseEntity.notFound().build();
	}

	@DeleteMapping("/{cidadeId}")
	public ResponseEntity<Void> deleteById(@PathVariable Long cidadeId) {

		try {
			cidadeService.deleteById(cidadeId);
			return ResponseEntity.noContent().build();

		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.notFound().build();

		} catch (EntidadeEmUsoException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
}
