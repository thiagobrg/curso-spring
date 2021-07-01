package com.curso.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.CidadeDTO;
import com.curso.domain.model.Cidade;

/**
 * 
 * @author Thiago Guimarães
 * @date 01/07/2021
 */
@Component
public class CidadeModelAssembler {

    @Autowired
    private ModelMapper modelMapper;
    
    public CidadeDTO toModel(Cidade cidade) {
        return modelMapper.map(cidade, CidadeDTO.class);
    }
    
    public List<CidadeDTO> toCollectionModel(List<Cidade> cidades) {
        return cidades.stream()
                .map(cidade -> toModel(cidade))
                .collect(Collectors.toList());
    }
}