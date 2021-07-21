package com.curso.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.input.GrupoInputDTO;
import com.curso.domain.model.Grupo;

/**
 * 
 * @author Thiago Guimarães
 * @date 06/07/2021
 */
@Component
public class GrupoInputDisassembler {

    @Autowired
    private ModelMapper modelMapper;
    
    public Grupo toDomainObject(GrupoInputDTO grupoInput) {
        return modelMapper.map(grupoInput, Grupo.class);
    }
    
    public void copyToDomainObject(GrupoInputDTO grupoInput, Grupo grupo) {
        modelMapper.map(grupoInput, grupo);
    }   
} 