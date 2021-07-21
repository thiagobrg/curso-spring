package com.curso.domain.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.curso.domain.exception.EntidadeEmUsoException;
import com.curso.domain.exception.GrupoNaoEncontradoException;
import com.curso.domain.model.Grupo;
import com.curso.domain.model.Permissao;
import com.curso.domain.repository.GrupoRepository;

/**
 * 
 * @author Thiago Guimarães
 * @date 06/07/2021
 */
@Service
public class CadastroGrupoService {

    private static final String MSG_GRUPO_EM_USO 
        = "Grupo de código %d não pode ser removido, pois está em uso";
    
    @Autowired
    private GrupoRepository grupoRepository;
    
    @Autowired
    private CadastroPermissaoService cadastroPermissao;
    
    @Transactional
    public Grupo salvar(Grupo grupo) {
        return grupoRepository.save(grupo);
    }
    
    @Transactional
    public void excluir(Long grupoId) {
        try {
            grupoRepository.deleteById(grupoId);
            grupoRepository.flush();
            
        } catch (EmptyResultDataAccessException e) {
            throw new GrupoNaoEncontradoException(grupoId);
        
        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(
                String.format(MSG_GRUPO_EM_USO, grupoId));
        }
    }

    public Grupo buscarOuFalhar(Long grupoId) {
        return grupoRepository.findById(grupoId)
            .orElseThrow(() -> new GrupoNaoEncontradoException(grupoId));
    }
    
    @Transactional
    public void desassociarPermissao(Long grupoId, Long permissaoId) {
        Grupo grupo = buscarOuFalhar(grupoId);
        Permissao permissao = cadastroPermissao.buscarOuFalhar(permissaoId);
        
        grupo.removerPermissao(permissao);
    }

    @Transactional
    public void associarPermissao(Long grupoId, Long permissaoId) {
        Grupo grupo = buscarOuFalhar(grupoId);
        Permissao permissao = cadastroPermissao.buscarOuFalhar(permissaoId);
        
        grupo.adicionarPermissao(permissao);
    }        

} 