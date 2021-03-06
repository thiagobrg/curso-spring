package com.curso.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.groups.ConvertGroup;
import javax.validation.groups.Default;

import com.curso.core.validation.Groups;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 24-03-2021 22:09:12
 */
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
public class Cidade {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_cozinha")
	@SequenceGenerator(name = "seq_cozinha", sequenceName = "seq_cozinha", initialValue = 1, allocationSize = 1)
	@EqualsAndHashCode.Include
	private Long id;
	
	@NotBlank
	@Column(nullable = false)
	private String nome;
	
	@ManyToOne
	@JoinColumn(nullable = false)
	@Valid
	@ConvertGroup(from = Default.class, to = Groups.EstadoId.class)
	private Estado estado;

}
