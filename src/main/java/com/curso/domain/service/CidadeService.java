package com.curso.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.curso.domain.exception.EntidadeEmUsoException;
import com.curso.domain.exception.EntidadeNaoEncontradaException;
import com.curso.domain.model.Cidade;
import com.curso.domain.repository.CidadeRepository;
import com.curso.domain.repository.EstadoRepository;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 07-04-2021 19:24:28
 */
@Service
public class CidadeService {
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	@Autowired
	private EstadoRepository estadoRepository;

	public Cidade save(Cidade cidade) {
		
		if(!estadoRepository.existsById(cidade.getEstado().getId())) {
			throw new EntidadeNaoEncontradaException("Estado invalida!");
		}
		
		return cidadeRepository.save(cidade);
	}

	public void deleteById(Long cidadeId) {

		try {
			cidadeRepository.deleteById(cidadeId);

		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException("Cidade de codigo " + cidadeId + " não foi encontrada.");

		} catch (DataIntegrityViolationException e) {
			throw new EntidadeEmUsoException(
					"Cidade de codigo " + cidadeId + " não pode ser removida pois está em uso.");
		}

	}

}
