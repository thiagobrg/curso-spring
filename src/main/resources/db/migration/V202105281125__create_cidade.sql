CREATE TABLE cidade (
  id bigint PRIMARY KEY,
  nome_cidade varchar(80) not null,
  nome_estado varchar(80) not null
);
CREATE SEQUENCE seq_cidade START 1 INCREMENT 1;