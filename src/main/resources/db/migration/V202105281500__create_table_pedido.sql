CREATE TABLE pedido (
    id BIGINT NOT NULL PRIMARY KEY,
    subtotal NUMERIC(10,2) NOT NULL,
    taxa_frete NUMERIC(10,2) NOT NULL,
    valor_total NUMERIC(10,2) NOT NULL,

    restaurante_id BIGINT NOT NULL REFERENCES restaurante(id),
    usuario_cliente_id BIGINT NOT NULL REFERENCES usuario(id),
    forma_pagamento_id BIGINT NOT NULL REFERENCES forma_pagamento(id),
    
    endereco_cidade_id BIGINT NOT NULL REFERENCES cidade(id),
    endereco_cep VARCHAR(9) NOT NULL,
    endereco_logradouro VARCHAR(100) NOT NULL,
    endereco_numero VARCHAR(20) NOT NULL,
    endereco_complemento VARCHAR(60) NULL,
    endereco_bairro VARCHAR(60) NOT NULL,
    
    status VARCHAR(10) NOT NULL,
    data_criacao TIMESTAMP NOT NULL,
    data_confirmacao TIMESTAMP,
    data_cancelamento TIMESTAMP,
    data_entrega TIMESTAMP
);

CREATE TABLE item_pedido (
    id BIGINT NOT NULL PRIMARY KEY,
    quantidade INT NOT NULL,
    preco_unitario NUMERIC(10,2) NOT NULL,
    preco_total NUMERIC(10,2) NOT NULL,
    observacao VARCHAR(255),
    pedido_id BIGINT NOT NULL REFERENCES pedido(id),
    produto_id BIGINT NOT NULL  REFERENCES produto(id),
    UNIQUE (pedido_id, produto_id)
);

CREATE SEQUENCE seq_pedido START 1 INCREMENT 1;
CREATE SEQUENCE seq_item_pedido START 1 INCREMENT 1;

