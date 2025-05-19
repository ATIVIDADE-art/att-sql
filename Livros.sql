CREATE DATABASE loja_livros;
use loja_livros;

CREATE TABLE autores (
  id INT PRIMARY KEY,
  nome VARCHAR(255),
  nacionalidade VARCHAR(255)
);


CREATE TABLE livros (
  id INT PRIMARY KEY,
  titulo VARCHAR(255),
  autor_id INT,
  preco DECIMAL(10, 2),
  FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE categorias (
  id INT PRIMARY KEY,
  nome VARCHAR(255)
);


CREATE TABLE livros_categorias (
  livro_id INT,
  categoria_id INT,
  FOREIGN KEY (livro_id) REFERENCES livros(id),
  FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);



INSERT INTO autores (id, nome, nacionalidade)
VALUES
  (1, 'Machado de Assis', 'Brasileiro'),
  (2, 'J.K. Rowling', 'Britânica'),
  (3, 'Stephen King', 'Americano'),
  (4, 'J.R.R. Tolkien', 'Britânico'),
  (5, 'George R.R. Martin', 'Americano'),
  (6, 'Harper Lee', 'Americana'),
  (7, 'Fyodor Dostoevsky', 'Russo'),
  (8, 'Jane Austen', 'Britânica'),
  (9, 'Leo Tolstoy', 'Russo'),
  (10, 'Gabriel Garcia Marquez', 'Colombiano');


INSERT INTO livros (id, titulo, autor_id, preco)
VALUES
  (1, 'Dom Casmurro', 1, 20.00),
  (2, 'Harry Potter e a Pedra Filosofal', 2, 30.00),
  (3, 'O Iluminado', 3, 25.00),
  (4, 'O Senhor dos Anéis', 4, 40.00),
  (5, 'A Guerra dos Tronos', 5, 35.00),
  (6, 'Matar a Cotovia', 6, 22.00),
  (7, 'Crime e Castigo', 7, 28.00),
  (8, 'Orgulho e Preconceito', 8, 24.00),
  (9, 'Guerra e Paz', 9, 50.00),
  (10, 'Cem Anos de Solidão', 10, 32.00);


INSERT INTO categorias (id, nome)
VALUES
  (1, 'Ficção'),
  (2, 'Fantasia'),
  (3, 'Terror'),
  (4, 'Romance'),
  (5, 'Clássico');


INSERT INTO livros_categorias (livro_id, categoria_id)
VALUES
  (1, 1),
  (1, 4),
  (2, 2),
  (3, 3),
  (4, 2),
  (5, 2),
  (6, 4),
  (7, 1),
  (8, 4),
  (9, 1),
  (10, 1);


SELECT l.titulo, a.nome AS autor
FROM livros l
INNER JOIN autores a ON l.autor_id = a.id
WHERE a.nome LIKE '%Machado%';

SELECT l.titulo, c.nome AS categoria
FROM livros l
INNER JOIN livros_categorias lc ON l.id = lc.livro_id
INNER JOIN categorias c ON lc.categoria_id = c.id
WHERE c.nome LIKE '%Ficção%';


SELECT l.titulo, l.preco, c.nome AS categoria
FROM livros l
INNER JOIN livros_categorias lc ON l.id = lc.livro_id
INNER JOIN categorias c ON lc.categoria_id = c.id
WHERE l.preco > 30 AND c.nome LIKE '%Fantasia%';

SELECT DISTINCT a.nome AS autor
FROM autores a
INNER JOIN livros l ON a.id = l.autor_id
INNER JOIN livros_categorias lc ON l.id = lc.livro_id
INNER JOIN categorias c ON lc.categoria_id = c.id
WHERE c.nome LIKE
