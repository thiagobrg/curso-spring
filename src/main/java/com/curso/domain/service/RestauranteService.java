package com.curso.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.curso.domain.exception.EntidadeEmUsoException;
import com.curso.domain.exception.EntidadeNaoEncontradaException;
import com.curso.domain.model.Restaurante;
import com.curso.domain.repository.CozinhaRepository;
import com.curso.domain.repository.RestauranteRepository;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 07-04-2021 19:24:28
 */
@Service
public class RestauranteService {
	
	@Autowired
	private RestauranteRepository restauranteRepository;
	
	@Autowired
	private CozinhaRepository cozinhaRepository;

	public Restaurante save(Restaurante restaurante) {
		
		if(!cozinhaRepository.existsById(restaurante.getCozinha().getId())) {
			throw new EntidadeNaoEncontradaException("Cozinha invalida!");
		}
		
		return restauranteRepository.save(restaurante);
	}

	public void deleteById(Long restauranteId) {

		try {
			restauranteRepository.deleteById(restauranteId);

		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException("Restaurante de codigo " + restauranteId + " não foi encontrada.");

		} catch (DataIntegrityViolationException e) {
			throw new EntidadeEmUsoException(
					"Restaurante de codigo " + restauranteId + " não pode ser removida pois está em uso.");
		}

	}

}
