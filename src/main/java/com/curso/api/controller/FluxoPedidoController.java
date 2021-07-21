package com.curso.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.curso.domain.service.FluxoPedidoService;

@RestController
@RequestMapping(value = "/pedidos/{codigoPedido}")
public class FluxoPedidoController {

	@Autowired
	private FluxoPedidoService fluxoPedidoService;
	
	@PutMapping(value = "/confirmacao")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void confirmar(@PathVariable String codigoPedido) {
		fluxoPedidoService.confirmar(codigoPedido);
	}
	
	@PutMapping(value = "/entregue")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void entregue(@PathVariable String codigoPedido) {
		fluxoPedidoService.entregue(codigoPedido);
	}
	
	@PutMapping(value = "/cancelado")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void cancelamento(@PathVariable String codigoPedido) {
		fluxoPedidoService.cancelado(codigoPedido);
	}

}