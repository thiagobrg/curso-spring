package com.curso.domain.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author Thiago Guimarães
 * @email thiagobrg98@gmail.com
 * @date 24-03-2021 21:07:42
 */
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
public class Restaurante {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_restaurante")
	@SequenceGenerator(name = "seq_restaurante", sequenceName = "seq_restaurante", initialValue = 1, allocationSize = 1)
	@EqualsAndHashCode.Include
	private Long id;

	@Column(nullable = false)
	private String nome;

	@Column(name = "taxa_frete")
	private BigDecimal taxaFrete;
	
	@ManyToOne
	private Cozinha cozinha;
	
}
