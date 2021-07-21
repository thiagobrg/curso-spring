package com.curso.domain.repository;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import com.curso.domain.model.Usuario;

@Repository
public interface UsuarioRepository extends CustomJpaRepository<Usuario, Long> {
	
	/**
	 * 
	 * @param email
	 * @return
	 */
	Optional<Usuario> findByEmail(String email);
}