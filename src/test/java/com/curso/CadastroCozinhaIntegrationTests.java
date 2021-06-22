package com.curso;

import static io.restassured.RestAssured.given;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.equalTo;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;

import org.hamcrest.Matchers;
import org.hibernate.exception.ConstraintViolationException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.TestPropertySource;

import com.curso.domain.exception.CozinhaNaoEncontradaException;
import com.curso.domain.exception.EntidadeEmUsoException;
import com.curso.domain.model.Cozinha;
import com.curso.domain.model.Restaurante;
import com.curso.domain.repository.CozinhaRepository;
import com.curso.domain.repository.RestauranteRepository;
import com.curso.domain.service.CadastroCozinhaService;
import com.curso.util.DatabaseCleaner;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestPropertySource("/application-test.properties")
class CadastroCozinhaIntegrationTests {
	
	@LocalServerPort
	private int port;
	
	@Autowired
	private CadastroCozinhaService cadastroCozinha;
	
	@Autowired
	private CozinhaRepository cozinhaRepository;
	
	@Autowired
	private RestauranteRepository restauranteRepository;
	
	@Autowired
	private DatabaseCleaner databaseCleaner;
	
	private static final Long COZINHA_INEXISTENTE = Long.MAX_VALUE;
	private Long idDaCozinhaEmUso;
	private Integer quantidadeDeCozinhas;
	private Cozinha cozinhaIndiana;
	
	@BeforeEach
	public void setUp() {
		RestAssured.enableLoggingOfRequestAndResponseIfValidationFails();
		RestAssured.port = port;
		RestAssured.basePath = "/cozinhas";
		
		databaseCleaner.clearTables();
		prepararDados();
	}
	
	private void prepararDados() {
		
		Cozinha cozinha = new Cozinha();
		cozinha.setNome("Indiana");
		
		Cozinha cozinha2 = new Cozinha();
		cozinha2.setNome("Tailandesa");
		
		cozinhaIndiana = cozinhaRepository.save(cozinha);
		cozinhaRepository.save(cozinha2);
		
		
		Restaurante restaurante = new Restaurante();
		restaurante.setNome("CASA");
		restaurante.setTaxaFrete(BigDecimal.TEN);
		restaurante.setCozinha(cozinhaIndiana);
		
		restauranteRepository.save(restaurante);
		
		idDaCozinhaEmUso = cozinhaIndiana.getId();
		quantidadeDeCozinhas = (int) cozinhaRepository.count();
	}
	
	@Test
	public void deveAtribuirId_QuandoCadastradoCozinhaComDadosCorretos() {
		
		Cozinha cozinha = new Cozinha();
		cozinha.setNome("Chinesa");
		
		cozinha = cadastroCozinha.salvar(cozinha);
		
		assertThat(cozinha).isNotNull();
		assertThat(cozinha.getId()).isNotNull();
	}
	
	@Test
	public void devePossuirAQuantidadeCorretasDeCozinhas_QuandoConsultarCozinhas() {
		RestAssured.enableLoggingOfRequestAndResponseIfValidationFails();
		
		given()
			.accept(ContentType.JSON)
		.when()
			.get()
		.then()
			.body("nome", Matchers.hasSize(quantidadeDeCozinhas));
	}
	
	
	@Test
	public void deveFalhar_QuandoCadastrarCozinhaSemNome() {
		Exception exception = assertThrows(Exception.class, () -> cadastroCozinha.salvar(new Cozinha()));
		assertTrue(exception.getCause() instanceof ConstraintViolationException);
	}

	@Test
	public void deveFalhar_QuandoExcluirCozinhaEmUso() {
		Exception exception = assertThrows(Exception.class, () -> cadastroCozinha.excluir(idDaCozinhaEmUso));
		assertTrue(exception instanceof EntidadeEmUsoException);
	}
	
	@Test
	public void deveFalhar_QuandoExcluirCozinhaInexsistente() {
		Exception exception = assertThrows(Exception.class, () -> cadastroCozinha.excluir(Long.MAX_VALUE));
		assertTrue(exception instanceof CozinhaNaoEncontradaException);
	}
	
	@Test
	public void deveRetornarResposta404_QuandoConsultarCozinhaInexistente() {
		
		given()
			.pathParam("cozinhaId", COZINHA_INEXISTENTE)
			.accept(ContentType.JSON)
		.when()
			.get("/{cozinhaId}")
		.then()
			.statusCode(HttpStatus.NOT_FOUND.value());
	}
	
	@Test
	public void deveRetornarRespostaEStatusCorretos_QuandoConsultarCozinhaExistente() {
		
		given()
			.pathParam("cozinhaId", cozinhaIndiana.getId())
			.accept(ContentType.JSON)
		.when()
			.get("/{cozinhaId}")
		.then()
			.statusCode(HttpStatus.OK.value())
			.body("nome", equalTo(cozinhaIndiana.getNome()));
		
	}
	
	@Test
	public void deveRetornarStatus200_QuandoConsultarCozinhas() {
		RestAssured.enableLoggingOfRequestAndResponseIfValidationFails();
		
		given()
			.accept(ContentType.JSON)
		.when()
			.get()
		.then()
			.statusCode(200);
	}
}
