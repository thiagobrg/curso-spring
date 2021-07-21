package com.curso.domain.model;

import java.time.OffsetDateTime;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author Thiago Guimarães
 * @date 25/05/2021
 */
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_usuario")
	@SequenceGenerator(name = "seq_usuario", sequenceName = "seq_usuario", initialValue = 1, allocationSize = 1)
	@EqualsAndHashCode.Include
	private Long id;
	private String nome;
	private String email;
	private String senha;

	@CreationTimestamp
	@Column(nullable = false)
	private OffsetDateTime dataCadastro;

	@ManyToMany
	@JoinTable(name = "usuario_grupo", joinColumns = @JoinColumn(name = "usuario_id"), inverseJoinColumns = @JoinColumn(name = "grupo_id"))
	private Set<Grupo> grupos = new HashSet<>();
	
	public boolean removerGrupo(Grupo grupo) {
	    return getGrupos().remove(grupo);
	}

	public boolean adicionarGrupo(Grupo grupo) {
	    return getGrupos().add(grupo);
	}
	
	public boolean senhaCoincideCom(String senha) {
	    return getSenha().equals(senha);
	}

	public boolean senhaNaoCoincideCom(String senha) {
	    return !senhaCoincideCom(senha);
	}

}
