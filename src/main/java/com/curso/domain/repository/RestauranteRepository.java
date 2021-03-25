package com.curso.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.curso.domain.model.Restaurante;

public interface RestauranteRepository extends JpaRepository<Restaurante, Long> {

}
