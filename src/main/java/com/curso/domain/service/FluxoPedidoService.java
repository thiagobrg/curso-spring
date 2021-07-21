package com.curso.domain.service;

import java.time.OffsetDateTime;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.curso.domain.exception.NegocioException;
import com.curso.domain.model.Pedido;
import com.curso.domain.model.StatusPedido;

/**
 * 
 * @author Thiago Guimarães
 * @date 13/07/2021
 */
@Service
public class FluxoPedidoService {
	
	private static final String NAO_PODE_SER_ALTERADO = "Status do pedido %s não pode ser alterado de %s para %s.";
	
	@Autowired
	private EmissaoPedidoService emissaoPedidoService;
	
	@Transactional
	public void confirmar(String codigoPedido) {
		Pedido pedido = emissaoPedidoService.buscarOuFalhar(codigoPedido);
		
		if(!pedido.getStatus().equals(StatusPedido.CRIADO)) {
			throw new NegocioException(String.format(NAO_PODE_SER_ALTERADO, pedido.getCodigo(), pedido.getStatus(), StatusPedido.CONFIRMADO));
		}
		
		pedido.setStatus(StatusPedido.CONFIRMADO);
		pedido.setDataConfirmacao(OffsetDateTime.now());
	}
	
	@Transactional
	public void entregue(String codigoPedido) {
		Pedido pedido = emissaoPedidoService.buscarOuFalhar(codigoPedido);
		
		if(!pedido.getStatus().equals(StatusPedido.CONFIRMADO)) {
			throw new NegocioException(String.format(NAO_PODE_SER_ALTERADO, pedido.getCodigo(), pedido.getStatus(), StatusPedido.ENTREGUE));
		}
		
		pedido.setStatus(StatusPedido.ENTREGUE);
		pedido.setDataEntrega(OffsetDateTime.now());
	}
	
	@Transactional
	public void cancelado(String codigoPedido) {
		Pedido pedido = emissaoPedidoService.buscarOuFalhar(codigoPedido);
		
		if(!pedido.getStatus().equals(StatusPedido.CRIADO)) {
			throw new NegocioException(String.format(NAO_PODE_SER_ALTERADO, pedido.getCodigo(), pedido.getStatus(), StatusPedido.CANCELADO));
		}
		
		pedido.setStatus(StatusPedido.CANCELADO);
		pedido.setDataCancelamento(OffsetDateTime.now());
	}

}
