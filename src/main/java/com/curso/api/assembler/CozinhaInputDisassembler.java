package com.curso.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.input.CozinhaInputDTO;
import com.curso.domain.model.Cozinha;

/**
 * 
 * @author Thiago Guimarães
 * @date 01/07/2021
 */
@Component
public class CozinhaInputDisassembler {

    @Autowired
    private ModelMapper modelMapper;
    
    public Cozinha toDomainObject(CozinhaInputDTO cozinhaInput) {
        return modelMapper.map(cozinhaInput, Cozinha.class);
    }
    
    public void copyToDomainObject(CozinhaInputDTO cozinhaInput, Cozinha cozinha) {
        modelMapper.map(cozinhaInput, cozinha);
    }
    
}        
