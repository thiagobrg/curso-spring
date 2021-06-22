package com.curso.util;
// Baseado em: https://brightinventions.pl/blog/clear-database-in-spring-boot-tests/

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DatabaseCleaner {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private DataSource dataSource;

	private Connection connection;

	public void clearTables() {
		try (Connection connection = dataSource.getConnection()) {
			this.connection = connection;
			
			checkTestDatabase();
			tryToClearTables();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			this.connection = null;
		}
	}
	
	private void checkTestDatabase() throws SQLException {
		String catalog = connection.getCatalog();

		if (catalog == null || !catalog.endsWith("teste")) {
			throw new RuntimeException(
					"Cannot clear database tables because '" + catalog + "' is not a test database (suffix 'test' not found).");
		}
	}

	private void tryToClearTables() throws SQLException {
		List<String> tableNames = getTableNames();
		clear(tableNames);
	}

	private List<String> getTableNames() throws SQLException {
		List<String> tableNames = new ArrayList<>();

		DatabaseMetaData metaData = connection.getMetaData();
		ResultSet rs = metaData.getTables(connection.getCatalog(), null, null, new String[] { "TABLE" });

		while (rs.next()) {
			tableNames.add(rs.getString("TABLE_NAME"));
		}

		tableNames.remove("flyway_schema_history");

		return tableNames;
	}

	private void clear(List<String> tableNames) throws SQLException {
		Statement statement = buildSqlStatement(tableNames);

		logger.debug("Executing SQL");
		statement.executeBatch();
	}

	private Statement buildSqlStatement(List<String> tableNames) throws SQLException {
		Statement statement = connection.createStatement();

		addTruncateSatements(tableNames, statement);
		clearSequences(statement);

		return statement;
	}
	
	
	private void clearSequences(Statement statement) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" DROP SEQUENCE IF EXISTS seq_cidade;");
		sql.append(" DROP SEQUENCE IF EXISTS seq_cozinha;");
		sql.append(" DROP SEQUENCE IF EXISTS seq_estado;");
		sql.append(" DROP SEQUENCE IF EXISTS seq_forma_pagamento;");
		sql.append(" DROP SEQUENCE IF EXISTS seq_grupo;");
		sql.append(" DROP SEQUENCE IF EXISTS seq_permissao;");
		sql.append(" DROP SEQUENCE IF EXISTS seq_produto;");
		sql.append(" DROP SEQUENCE IF EXISTS seq_restaurante;");
		sql.append(" DROP SEQUENCE IF EXISTS seq_usuario;");
		
		sql.append(" CREATE SEQUENCE seq_cidade START 1 INCREMENT 1;");
		sql.append(" CREATE SEQUENCE seq_cozinha START 1 INCREMENT 1;");
		sql.append(" CREATE SEQUENCE seq_estado START 1 INCREMENT 1;");
		sql.append(" CREATE SEQUENCE seq_forma_pagamento START 1 INCREMENT 1;");
		sql.append(" CREATE SEQUENCE seq_grupo START 1 INCREMENT 1;");
		sql.append(" CREATE SEQUENCE seq_permissao START 1 INCREMENT 1;");
		sql.append(" CREATE SEQUENCE seq_produto START 1 INCREMENT 1;");
		sql.append(" CREATE SEQUENCE seq_restaurante START 1 INCREMENT 1;");
		sql.append(" CREATE SEQUENCE seq_usuario START 1 INCREMENT 1;");
		
		try {
			statement.execute(sql(sql.toString()));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private void addTruncateSatements(List<String> tableNames, Statement statement) {
		tableNames.forEach(tableName -> {
			try {
				statement.addBatch(sql("TRUNCATE TABLE " + tableName+" CASCADE"));
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		});
	}

	private String sql(String sql) {
		logger.debug("Adding SQL: {}", sql);
		return sql;
	}
	
}