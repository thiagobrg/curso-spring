create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
create sequence seq_cidade start 1 increment 1
create sequence seq_cozinha start 1 increment 1
create sequence seq_estado start 1 increment 1
create sequence seq_forma_pagamento start 1 increment 1
create sequence seq_grupo start 1 increment 1
create sequence seq_permissao start 1 increment 1
create sequence seq_produto start 1 increment 1
create sequence seq_restaurante start 1 increment 1
create sequence seq_usuario start 1 increment 1
create table cidade (id int8 not null, nome varchar(255) not null, estado_id int8 not null, primary key (id))
create table cozinha (id int8 not null, nome varchar(255) not null, estado_id int8, primary key (id))
create table estado (id int8 not null, nome varchar(255) not null, primary key (id))
create table forma_pagamento (id int8 not null, descricao varchar(255), primary key (id))
create table grupo (id int8 not null, nome varchar(255), primary key (id))
create table grupo_permisao (grupo_id int8 not null, permissao_id int8 not null)
create table permissao (id int8 not null, descricao varchar(255), nome varchar(255) not null, primary key (id))
create table produto (id int8 not null, ativo boolean, descricao varchar(255), nome varchar(255), preco numeric(19, 2), restaurante_id int8, primary key (id))
create table restaurante (id int8 not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete numeric(19, 2) not null, cozinha_id int8 not null, endereco_cidade_id int8, primary key (id))
create table restaurante_forma_pagamento (restaurante_id int8 not null, forma_pagamento_id int8 not null)
create table usuario (id int8 not null, data_cadastro timestamp not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id))
create table usuario_grupo (usuario_id int8 not null, grupo_id int8 not null)
alter table if exists cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado
alter table if exists cozinha add constraint FKk07ivrf648wj358ghyjaopvir foreign key (estado_id) references estado
alter table if exists grupo_permisao add constraint FKabs60soco2nxe3h5xie7j66n6 foreign key (permissao_id) references permissao
alter table if exists grupo_permisao add constraint FK90mfyn8w8p26wedfqsr3yqelf foreign key (grupo_id) references grupo
alter table if exists produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante
alter table if exists restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha
alter table if exists restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade
alter table if exists restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento
alter table if exists restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante
alter table if exists usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo
alter table if exists usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into cozinha (id, nome) values (3, 'Argentina')
insert into cozinha (id, nome) values (4, 'Brasileira')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (1, 'Thai Gourmet', 10, 1, now(), now(), 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (2, 'Thai Delivery', 9.50, 1, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (3, 'Tuk Tuk Comida Indiana', 15, 2, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, now(), now())
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, now(), now())
insert into forma_pagamento (id, descricao) values (1, 'Cartão de crédito')
insert into forma_pagamento (id, descricao) values (2, 'Cartão de débito')
insert into forma_pagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5)
insert into produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('seq_produto'),'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6)
