package com.curso.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.curso.domain.exception.EntidadeEmUsoException;
import com.curso.domain.exception.EntidadeNaoEncontradaException;
import com.curso.domain.model.Estado;
import com.curso.domain.repository.EstadoRepository;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 07-04-2021 19:51:20
 */
@Service
public class EstadoService {

	@Autowired
	private EstadoRepository estadoRepository;

	public Estado save(Estado estado) {
		return estadoRepository.save(estado);
	}

	public void deleteById(Long estadoId) {

		try {
			estadoRepository.deleteById(estadoId);

		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException("Estado de codigo " + estadoId + " não foi encontrada.");

		} catch (DataIntegrityViolationException e) {
			throw new EntidadeEmUsoException(
					"Estado de codigo " + estadoId + " não pode ser removida pois está em uso.");
		}

	}
}
