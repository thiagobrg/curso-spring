package com.curso.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.curso.domain.model.Restaurante;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 24-03-2021 22:08:20
 */
@Repository
public interface RestauranteRepository extends JpaRepository<Restaurante, Long> {

}
