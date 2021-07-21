DELETE FROM restaurante_forma_pagamento;
DELETE FROM grupo_permissao;
DELETE FROM usuario_grupo;
DELETE FROM restaurante_usuario_responsavel;
DELETE FROM item_pedido;
DELETE FROM pedido;


DELETE FROM forma_pagamento;
DELETE FROM grupo;
DELETE FROM permissao;
DELETE FROM produto;
DELETE FROM restaurante;
DELETE FROM usuario;
DELETE FROM cozinha;
DELETE FROM cidade;
DELETE FROM estado;

SELECT setval('seq_cidade', 1) AS seq_cidade, 
	   setval('seq_cozinha', 1) AS seq_cozinha,
       setval('seq_estado', 1) AS seq_estado,
       setval('seq_forma_pagamento', 1) AS seq_forma_pagamento,
       setval('seq_grupo', 1) AS seq_grupo,
       setval('seq_permissao', 1) AS seq_permissao,
       setval('seq_produto', 1) AS seq_produto,
       setval('seq_restaurante', 1) AS seq_restaurante,
       setval('seq_usuario', 1) AS seq_usuario;

insert into cozinha (id, nome) values (currval('seq_cozinha'), 'Tailandesa');
insert into cozinha (id, nome) values (nextval('seq_cozinha'), 'Indiana');
insert into cozinha (id, nome) values (nextval('seq_cozinha'), 'Argentina');
insert into cozinha (id, nome) values (nextval('seq_cozinha'), 'Brasileira'); 

insert into estado (id, nome) values (currval('seq_estado'), 'Minas Gerais');
insert into estado (id, nome) values (nextval('seq_estado'), 'São Paulo');
insert into estado (id, nome) values (nextval('seq_estado'), 'Ceará');

insert into cidade (id, nome, estado_id) values (currval('seq_cidade'), 'Uberlândia', 1);
insert into cidade (id, nome, estado_id) values (nextval('seq_cidade'), 'Belo Horizonte', 1);
insert into cidade (id, nome, estado_id) values (nextval('seq_cidade'), 'São Paulo', 2);
insert into cidade (id, nome, estado_id) values (nextval('seq_cidade'), 'Campinas', 2);
insert into cidade (id, nome, estado_id) values (nextval('seq_cidade'), 'Fortaleza', 3);

insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (currval('seq_restaurante'), 'Thai Gourmet', 10, 1, now(), now(), true, true, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values (nextval('seq_restaurante'), 'Thai Delivery', 9.50, 1, now(), now(), true, true);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values (nextval('seq_restaurante'), 'Tuk Tuk Comida Indiana', 15, 2, now(), now(), true, true);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values (nextval('seq_restaurante'), 'Java Steakhouse', 12, 3, now(), now(), true, true);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values (nextval('seq_restaurante'), 'Lanchonete do Tio Sam', 11, 4, now(), now(), true, true);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values (nextval('seq_restaurante'), 'Bar da Maria', 6, 4, now(), now(), true, true);

insert into forma_pagamento (id, descricao) values (currval('seq_forma_pagamento'), 'Cartão de crédito');
insert into forma_pagamento (id, descricao) values (nextval('seq_forma_pagamento'), 'Cartão de débito');
insert into forma_pagamento (id, descricao) values (nextval('seq_forma_pagamento'), 'Dinheiro');

insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3);

insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (currval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1);
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1);

insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2);

insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3);
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3);

insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4);
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4);

insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5);

insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6);

insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');

insert into grupo (id, nome) values (1, 'Gerente'), (2, 'Vendedor'), (3, 'Secretária'), (4, 'Cadastrador');

insert into grupo_permissao (grupo_id, permissao_id) values (1, 1), (1, 2), (2, 1), (2, 2), (3, 1);
 
insert into usuario (id, nome, email, senha, data_cadastro) values
(currval('seq_usuario'), 'João da Silva', 'joao.ger@algafood.com', '123', now()),
(nextval('seq_usuario'), 'Maria Joaquina', 'maria.vnd@algafood.com', '123', now()),
(nextval('seq_usuario'), 'José Souza', 'jose.aux@algafood.com', '123', now()),
(nextval('seq_usuario'), 'Sebastião Martins', 'sebastiao.cad@algafood.com', '123', now()),   
(nextval('seq_usuario'), 'Manoel Lima', 'manoel.loja@gmail.com', '123', now());

insert into usuario_grupo (usuario_id, grupo_id) values (1, 1), (1, 2), (2, 2);
insert into restaurante_usuario_responsavel (restaurante_id, usuario_id) values (1, 5), (3, 5);

insert into pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, status, data_criacao, subtotal, taxa_frete, valor_total) values (1, '1da393c1-7a24-4357-b2af-a76f6fff9835', 1, 1, 1, 1, '38400-000', 'Rua Floriano Peixoto', '500', 'Apto 801', 'Brasil', 'CRIADO', now(), 298.90, 10, 308.90);

insert into item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao) values (1, 1, 1, 1, 78.9, 78.9, null);

insert into item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao) values (2, 1, 2, 2, 110, 220, 'Menos picante, por favor');


insert into pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, status, data_criacao, subtotal, taxa_frete, valor_total) values (2, '3e8a3919-4fc8-416f-bec9-b03fae9fc353', 4, 1, 2, 1, '38400-111', 'Rua Acre', '300', 'Casa 2', 'Centro', 'CRIADO', now(), 79, 0, 79);

insert into item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)values (3, 2, 6, 1, 79, 79, 'Ao ponto');