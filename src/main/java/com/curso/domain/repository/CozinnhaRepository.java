package com.curso.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.curso.domain.model.Cozinha;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 24-03-2021 21:07:29
 */
public interface CozinnhaRepository extends JpaRepository<Cozinha, Long> {
}
