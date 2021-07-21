package com.curso.api.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.curso.api.assembler.GrupoInputDisassembler;
import com.curso.api.assembler.GrupoModelAssembler;
import com.curso.api.model.GrupoDTO;
import com.curso.api.model.input.GrupoInputDTO;
import com.curso.domain.model.Grupo;
import com.curso.domain.repository.GrupoRepository;
import com.curso.domain.service.CadastroGrupoService;

/**
 * 
 * @author Thiago Guimarães
 * @date 06/07/2021
 */
@RestController
@RequestMapping("/grupos")
public class GrupoController {

	@Autowired
	private GrupoRepository grupoRepository;

	@Autowired
	private CadastroGrupoService cadastroGrupo;

	@Autowired
	private GrupoModelAssembler grupoModelAssembler;

	@Autowired
	private GrupoInputDisassembler grupoInputDisassembler;

	@GetMapping
	public List<GrupoDTO> listar() {
		List<Grupo> todosGrupos = grupoRepository.findAll();

		return grupoModelAssembler.toCollectionModel(todosGrupos);
	}

	@GetMapping("/{grupoId}")
	public GrupoDTO buscar(@PathVariable Long grupoId) {
		Grupo grupo = cadastroGrupo.buscarOuFalhar(grupoId);

		return grupoModelAssembler.toModel(grupo);
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public GrupoDTO adicionar(@RequestBody @Valid GrupoInputDTO grupoInput) {
		Grupo grupo = grupoInputDisassembler.toDomainObject(grupoInput);

		grupo = cadastroGrupo.salvar(grupo);

		return grupoModelAssembler.toModel(grupo);
	}

	@PutMapping("/{grupoId}")
	public GrupoDTO atualizar(@PathVariable Long grupoId, @RequestBody @Valid GrupoInputDTO grupoInput) {
		Grupo grupoAtual = cadastroGrupo.buscarOuFalhar(grupoId);

		grupoInputDisassembler.copyToDomainObject(grupoInput, grupoAtual);

		grupoAtual = cadastroGrupo.salvar(grupoAtual);

		return grupoModelAssembler.toModel(grupoAtual);
	}

	@DeleteMapping("/{grupoId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Long grupoId) {
		cadastroGrupo.excluir(grupoId);
	}
}