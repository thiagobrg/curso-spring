package com.curso.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.curso.domain.model.Cozinha;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 24-03-2021 21:07:29
 */
@Repository
public interface CozinhaRepository extends JpaRepository<Cozinha, Long> {
}
