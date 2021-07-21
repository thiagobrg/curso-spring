package com.curso.domain.exception;

/**
 * 
 * @author Thiago Guimarães
 * @date 01/07/2021
 */
public class FormaPagamentoNaoEncontradaException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;

	public FormaPagamentoNaoEncontradaException(String mensagem) {
		super(mensagem);
	}
	
	public FormaPagamentoNaoEncontradaException(Long cozinhaId) {
		this(String.format("Não existe um cadastro de forma de pagamento com código %d", cozinhaId));
	}
	
}
