CREATE DATABASE IF NOT EXISTS eleicoes;

USE eleicoes;

CREATE TABLE IF NOT EXISTS localidade (
    id_localidade INT PRIMARY KEY AUTO_INCREMENT,
    nome_localidade VARCHAR(100) NOT NULL UNIQUE,
    estado VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS zona_eleitoral (
    id_zona INT PRIMARY KEY AUTO_INCREMENT,
    nome_zona VARCHAR(100) NOT NULL UNIQUE,
    id_localidade INT NOT NULL
);

CREATE TABLE IF NOT EXISTS secao_eleitoral (
    id_secao INT PRIMARY KEY AUTO_INCREMENT,
    nome_secao VARCHAR(100) NOT NULL UNIQUE,
    id_zona INT NOT NULL
);

ALTER TABLE zona_eleitoral
ADD FOREIGN KEY (id_localidade) REFERENCES localidade(id_localidade);

ALTER TABLE secao_eleitoral
ADD FOREIGN KEY (id_zona) REFERENCES zona_eleitoral(id_zona);

INSERT INTO localidade (nome_localidade, estado)
VALUES ('São Paulo', 'São Paulo'),
    ('Rio de Janeiro', 'Rio de Janeiro'),
    ('Belo Horizonte', 'Minas Gerais'),
    ('Curitiba', 'Paraná'),
    ('Porto Alegre', 'Rio Grande do Sul');

INSERT INTO zona_eleitoral (nome_zona, id_localidade)
VALUES ('Zona 001', 1),
    ('Zona 002', 2),
    ('Zona 003', 3),
    ('Zona 004', 4),
    ('Zona 005', 5);

INSERT INTO secao_eleitoral (nome_secao, id_zona)
VALUES ('Seção 101', 1),
    ('Seção 102', 2),
    ('Seção 103', 3),
    ('Seção 104', 4),
    ('Seção 105', 5);

UPDATE localidade
SET nome_localidade = 'São Paulo - Centro'
WHERE id_localidade = 1;

UPDATE zona_eleitoral
SET nome_zona = 'Zona Central SP'
WHERE id_zona = 1;

DELETE FROM secao_eleitoral
WHERE id_zona = 5;

DELETE FROM zona_eleitoral
WHERE id_localidade = 5;

DELETE FROM localidade
WHERE id_localidade = 5;

SELECT *
FROM localidade
WHERE estado = 'São Paulo'
ORDER BY nome_localidade ASC;

SELECT *
FROM secao_eleitoral
WHERE id_secao > 2
ORDER BY nome_secao DESC;