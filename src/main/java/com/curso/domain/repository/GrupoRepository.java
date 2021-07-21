package com.curso.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.curso.domain.model.Grupo;

/**
 * 
 * @author Thiago Guimarães
 * @date 06/07/2021
 */
@Repository
public interface GrupoRepository extends JpaRepository<Grupo, Long> {

}