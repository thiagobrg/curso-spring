package com.curso.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.curso.api.model.input.UsuarioInputDTO;
import com.curso.domain.model.Usuario;

/**
 * 
 * @author Thiago Guimarães
 * @date 06/07/2021
 */
@Component
public class UsuarioInputDisassembler {

    @Autowired
    private ModelMapper modelMapper;
    
    public Usuario toDomainObject(UsuarioInputDTO usuarioInput) {
        return modelMapper.map(usuarioInput, Usuario.class);
    }
    
    public void copyToDomainObject(UsuarioInputDTO usuarioInput, Usuario usuario) {
        modelMapper.map(usuarioInput, usuario);
    }            
}