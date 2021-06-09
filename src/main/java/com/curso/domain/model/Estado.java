package com.curso.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.curso.core.validation.Groups;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 24-03-2021 22:09:15
 */
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
public class Estado {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_cozinha")
	@SequenceGenerator(name = "seq_cozinha", sequenceName = "seq_cozinha", initialValue = 1, allocationSize = 1)
	@EqualsAndHashCode.Include
	@NotNull(groups = Groups.EstadoId.class)
	private Long id;
	
	@Column(nullable = false)
	@NotBlank
	private String nome;

}
