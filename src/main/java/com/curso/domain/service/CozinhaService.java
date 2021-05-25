package com.curso.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.curso.domain.exception.EntidadeEmUsoException;
import com.curso.domain.exception.EntidadeNaoEncontradaException;
import com.curso.domain.model.Cozinha;
import com.curso.domain.repository.CozinhaRepository;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 07-04-2021 18:57:38
 */
@Service
public class CozinhaService {

	@Autowired
	private CozinhaRepository cozinhaRepository;

	public Cozinha save(Cozinha cozinha) {
		return cozinhaRepository.save(cozinha);
	}

	public void deleteById(Long cozinhaId) {

		try {
			cozinhaRepository.deleteById(cozinhaId);

		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException("Cozinha de codigo " + cozinhaId + " não foi encontrada.");

		} catch (DataIntegrityViolationException e) {
			throw new EntidadeEmUsoException(
					"Cozinha de codigo " + cozinhaId + " não pode ser removida pois está em uso.");
		}

	}
}
