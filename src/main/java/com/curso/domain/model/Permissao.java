package com.curso.domain.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 24-03-2021 22:06:13
 */
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
public class Permissao {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_permissao")
	@SequenceGenerator(name = "seq_permissao", sequenceName = "seq_permissao", initialValue = 1)
	@EqualsAndHashCode.Include
	private Long id;
	
	private String nome;
	private String descricao;

}
