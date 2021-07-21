package com.curso.domain.exception;

/**
 * 
 * @author Thiago Guimarães
 * @date 06/07/2021
 */
public class GrupoNaoEncontradoException extends EntidadeNaoEncontradaException {

    private static final long serialVersionUID = 1L;

    public GrupoNaoEncontradoException(String mensagem) {
        super(mensagem);
    }
    
    public GrupoNaoEncontradoException(Long estadoId) {
        this(String.format("Não existe um cadastro de grupo com código %d", estadoId));
    }   
}   