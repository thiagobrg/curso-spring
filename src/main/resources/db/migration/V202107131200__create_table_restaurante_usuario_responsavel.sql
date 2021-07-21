CREATE TABLE restaurante_usuario_responsavel (
    restaurante_id BIGINT NOT NULL REFERENCES restaurante (id),
    usuario_id BIGINT NOT NULL REFERENCES usuario (id)
);