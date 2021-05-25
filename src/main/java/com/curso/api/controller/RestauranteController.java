package com.curso.api.controller;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.curso.domain.exception.EntidadeEmUsoException;
import com.curso.domain.exception.EntidadeNaoEncontradaException;
import com.curso.domain.model.Restaurante;
import com.curso.domain.repository.RestauranteRepository;
import com.curso.domain.service.RestauranteService;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 25-03-2021 19:09:36
 */
@RestController
@RequestMapping("/restaurantes")
public class RestauranteController {

	@Autowired
	private RestauranteRepository restauranteRepository;

	@Autowired
	private RestauranteService restauranteService;

	@GetMapping()
	public List<Restaurante> listar() {
		return restauranteRepository.findAll();
	}

	@GetMapping("/{restauranteId}")
	public ResponseEntity<Restaurante> porId(@PathVariable Long restauranteId) {

		Optional<Restaurante> restaurante = restauranteRepository.findById(restauranteId);

		if (restaurante.isPresent()) {
			return ResponseEntity.ok(restaurante.get());
		}

		return ResponseEntity.notFound().build();
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public ResponseEntity<?> create(@RequestBody Restaurante restaurante) {

		try {
			return ResponseEntity.status(HttpStatus.CREATED).body(restauranteService.save(restaurante));

		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@PutMapping("/{restauranteId}")
	public ResponseEntity<Restaurante> update(@PathVariable Long restauranteId, @RequestBody Restaurante restaurante) {

		if (restauranteRepository.existsById(restauranteId)) {
			restaurante.setId(restauranteId);
			return ResponseEntity.ok(restauranteService.save(restaurante));
		}

		return ResponseEntity.notFound().build();
	}

	@DeleteMapping("/{restauranteId}")
	public ResponseEntity<Void> deleteById(@PathVariable Long restauranteId) {

		try {
			restauranteService.deleteById(restauranteId);
			return ResponseEntity.noContent().build();

		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.notFound().build();

		} catch (EntidadeEmUsoException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
	
	@PatchMapping("/{restauranteId}")
	public ResponseEntity<?> partialUpdate(@PathVariable Long restauranteId, @RequestBody Map<String, Object> campos) {
		
		Optional<Restaurante> optional = restauranteRepository.findById(restauranteId);
		
		if (optional.isEmpty()) {
			return ResponseEntity.notFound().build();
		}
		
		Restaurante restaurante = optional.get();
		merge(campos, restaurante);
		
		return update(restauranteId, restaurante);
	}

	private void merge(Map<String, Object> fields, Restaurante restaurante) {
		ObjectMapper mapper = new ObjectMapper();
		Restaurante restauranteOrigem = mapper.convertValue(fields, Restaurante.class);
		
		fields.forEach( (prop, value) -> {
			Field field = ReflectionUtils.findField(Restaurante.class, prop);
			field.setAccessible(true);
			
			Object newValue = ReflectionUtils.getField(field, restauranteOrigem);
			ReflectionUtils.setField(field, restaurante, newValue);
		});
	}
}
