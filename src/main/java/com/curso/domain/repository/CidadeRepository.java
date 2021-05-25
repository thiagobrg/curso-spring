package com.curso.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.curso.domain.model.Cidade;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 25-03-2021 19:23:54
 */
@Repository
public interface CidadeRepository extends JpaRepository<Cidade, Long> {
}
