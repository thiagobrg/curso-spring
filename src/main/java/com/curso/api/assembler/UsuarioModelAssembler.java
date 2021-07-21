package com.curso.api.assembler;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.UsuarioDTO;
import com.curso.domain.model.Usuario;

/**
 * 
 * @author Thiago Guimarães
 * @date 06/07/2021
 */
@Component
public class UsuarioModelAssembler {

    @Autowired
    private ModelMapper modelMapper;
    
    public UsuarioDTO toModel(Usuario usuario) {
        return modelMapper.map(usuario, UsuarioDTO.class);
    }
    
    public List<UsuarioDTO> toCollectionModel(Collection<Usuario> usuarios) {
        return usuarios.stream()
                .map(usuario -> toModel(usuario))
                .collect(Collectors.toList());
    }            
} 