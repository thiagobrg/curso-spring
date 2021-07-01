package com.curso.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.EstadoDTO;
import com.curso.domain.model.Estado;

/**
 * 
 * @author Thiago Guimarães
 * @date 28/06/2021
 */
@Component
public class EstadoModelAssembler {

    @Autowired
    private ModelMapper modelMapper;
    
    public EstadoDTO toModel(Estado estado) {
        return modelMapper.map(estado, EstadoDTO.class);
    }
    
    public List<EstadoDTO> toCollectionModel(List<Estado> estados) {
        return estados.stream()
                .map(estado -> toModel(estado))
                .collect(Collectors.toList());
    }
    
}