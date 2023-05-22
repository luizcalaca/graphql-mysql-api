DROP DATABASE mydatabase;
-- Criação do banco de dados
CREATE DATABASE mydatabase;

-- Uso do banco de dados
USE mydatabase;

-- Criação da tabela de autores
CREATE TABLE autores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

-- Criação da tabela de livros
CREATE TABLE livros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  ano_publicacao INT NOT NULL
);

-- Criação da tabela intermediária de ligação
CREATE TABLE autores_livros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  autor_id INT NOT NULL,
  livro_id INT NOT NULL,
  FOREIGN KEY (autor_id) REFERENCES autores(id),
  FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Inserção de dados na tabela de autores
INSERT INTO autores (nome) VALUES
  ('Autor 1'),
  ('Autor 2'),
  ('Autor 3');

-- Inserção de dados na tabela de livros
INSERT INTO livros (titulo, ano_publicacao) VALUES
  ('Livro 1', 2020),
  ('Livro 2', 2018),
  ('Livro 3', 2015);

-- Inserção de dados na tabela intermediária de ligação
INSERT INTO autores_livros (autor_id, livro_id) VALUES
  (1, 1),
  (1, 2),
  (2, 2),
  (3, 3);
