package com.curso.domain.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.curso.domain.exception.RestauranteNaoEncontradoException;
import com.curso.domain.model.Cidade;
import com.curso.domain.model.Cozinha;
import com.curso.domain.model.FormaPagamento;
import com.curso.domain.model.Restaurante;
import com.curso.domain.model.Usuario;
import com.curso.domain.repository.RestauranteRepository;

@Service
public class CadastroRestauranteService {

	@Autowired
	private RestauranteRepository restauranteRepository;

	@Autowired
	private CadastroCozinhaService cadastroCozinha;

	@Autowired
	private CadastroCidadeService cadastroCidade;

	@Autowired
	private CadastroFormaPagamentoService cadastroFormaPagamento;

	@Autowired
	private CadastroUsuarioService cadastroUsuario;

	@Transactional
	public Restaurante salvar(Restaurante restaurante) {
		Long cozinhaId = restaurante.getCozinha().getId();
		Long cidadeId = restaurante.getEndereco().getCidade().getId();

		Cozinha cozinha = cadastroCozinha.buscarOuFalhar(cozinhaId);
		Cidade cidade = cadastroCidade.buscarOuFalhar(cidadeId);

		restaurante.getEndereco().setCidade(cidade);
		restaurante.setCozinha(cozinha);

		return restauranteRepository.save(restaurante);
	}

	@Transactional
	public void ativar(Long restauranteId) {
		Restaurante restaurante = buscarOuFalhar(restauranteId);
		restaurante.setAtivo(true);
	}
	
	@Transactional
	public void ativar(List<Long> restauranteIds) {
		restauranteIds.forEach(this::ativar);
	}

	@Transactional
	public void inativar(Long restauranteId) {
		Restaurante restaurante = buscarOuFalhar(restauranteId);
		restaurante.setAtivo(false);
	}
	
	@Transactional
	public void inativar(List<Long> restauranteIds) {
		restauranteIds.forEach(this::inativar);
	}

	public Restaurante buscarOuFalhar(Long restauranteId) {
		return restauranteRepository.findById(restauranteId)
				.orElseThrow(() -> new RestauranteNaoEncontradoException(restauranteId));
	}
	
	/**
	 * 
	 * @param restauranteId
	 * @param formaPagamentoId
	 */
	@Transactional
	public void adicionarFormaPagamento(Long restauranteId, Long formaPagamentoId) {
		Restaurante restaurante = buscarOuFalhar(restauranteId);
		FormaPagamento formaPagamento = cadastroFormaPagamento.buscarOuFalhar(formaPagamentoId);

		restaurante.adicionarFormaPagamento(formaPagamento);
	}

	/**
	 * 
	 * @param restauranteId
	 * @param formaPagamentoId
	 */
	@Transactional
	public void removerFormaPagamento(Long restauranteId, Long formaPagamentoId) {
		Restaurante restaurante = buscarOuFalhar(restauranteId);
		FormaPagamento formaPagamento = cadastroFormaPagamento.buscarOuFalhar(formaPagamentoId);

		restaurante.removerFormaPagamento(formaPagamento);
	}

	@Transactional
	public void abrir(Long restauranteId) {
		Restaurante restauranteAtual = buscarOuFalhar(restauranteId);

		restauranteAtual.abrir();
	}

	@Transactional
	public void fechar(Long restauranteId) {
		Restaurante restauranteAtual = buscarOuFalhar(restauranteId);

		restauranteAtual.fechar();
	}

	@Transactional
	public void desassociarResponsavel(Long restauranteId, Long usuarioId) {
		Restaurante restaurante = buscarOuFalhar(restauranteId);
		Usuario usuario = cadastroUsuario.buscarOuFalhar(usuarioId);

		restaurante.removerResponsavel(usuario);
	}

	@Transactional
	public void associarResponsavel(Long restauranteId, Long usuarioId) {
		Restaurante restaurante = buscarOuFalhar(restauranteId);
		Usuario usuario = cadastroUsuario.buscarOuFalhar(usuarioId);

		restaurante.adicionarResponsavel(usuario);
	}
}
