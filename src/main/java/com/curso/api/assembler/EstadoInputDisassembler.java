package com.curso.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.input.EstadoInputDTO;
import com.curso.domain.model.Estado;

/**
 * 
 * @author Thiago Guimarães
 * @date 01/07/2021
 */
@Component
public class EstadoInputDisassembler {

    @Autowired
    private ModelMapper modelMapper;
    
    public Estado toDomainObject(EstadoInputDTO estadoInput) {
        return modelMapper.map(estadoInput, Estado.class);
    }
    
    public void copyToDomainObject(EstadoInputDTO estadoInput, Estado estado) {
        modelMapper.map(estadoInput, estado);
    }   
}      