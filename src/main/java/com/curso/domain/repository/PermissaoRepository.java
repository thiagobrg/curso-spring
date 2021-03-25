package com.curso.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.curso.domain.model.Permissao;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 24-03-2021 22:07:20
 */
public interface PermissaoRepository extends JpaRepository<Permissao, Long>{

}
