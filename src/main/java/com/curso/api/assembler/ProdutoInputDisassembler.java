package com.curso.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.input.ProdutoInputDTO;
import com.curso.domain.model.Produto;

@Component
public class ProdutoInputDisassembler {

    @Autowired
    private ModelMapper modelMapper;
    
    public Produto toDomainObject(ProdutoInputDTO produtoInput) {
        return modelMapper.map(produtoInput, Produto.class);
    }
    
    public void copyToDomainObject(ProdutoInputDTO produtoInput, Produto produto) {
        modelMapper.map(produtoInput, produto);
    }   
}  