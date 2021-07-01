package com.curso.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.CozinhaDTO;
import com.curso.domain.model.Cozinha;

/**
 * 
 * @author Thiago Guimarães
 * @date 01/07/2021
 */
@Component
public class CozinhaModelAssembler {

    @Autowired
    private ModelMapper modelMapper;
    
    public CozinhaDTO toModel(Cozinha cozinha) {
        return modelMapper.map(cozinha, CozinhaDTO.class);
    }
    
    public List<CozinhaDTO> toCollectionModel(List<Cozinha> cozinhas) {
        return cozinhas.stream()
                .map(cozinha -> toModel(cozinha))
                .collect(Collectors.toList());
    }   
}   