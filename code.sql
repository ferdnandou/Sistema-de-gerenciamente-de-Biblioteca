DROP DATABASE IF EXISTS Biblioteca;
SET SQL_SAFE_UPDATES = 0;
CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Autores (
    AutorID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Idade INT,
    Nacionalidade VARCHAR(100)
);

CREATE TABLE Livros (
    LivroID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(255),
    AutorID INT,
    AnoPublicacao INT,
    Genero VARCHAR(100),
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

CREATE TABLE Emprestimos (
    EmprestimoID INT PRIMARY KEY AUTO_INCREMENT,
    LivroID INT,
    DataEmprestimo DATE,
    DataDevolucao DATE,
    NomeUsuario VARCHAR(100),
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
);

INSERT INTO Autores (Nome, Idade, Nacionalidade) 
VALUES ('Machado de Assis', 69, 'Brasileira'),
       ('J.K. Rowling', 55, 'Britânica'),
       ('George Orwell', 46, 'Britânica'),
       ('Gabriel García Márquez', 87, 'Colombiana'),
       ('Jane Austen', 41, 'Britânica');

INSERT INTO Livros (Titulo, AutorID, AnoPublicacao, Genero) 
VALUES ('Dom Casmurro', 1, 1899, 'Romance'),
       ('Harry Potter e a Pedra Filosofal', 2, 1997, 'Fantasia'),
       ('1984', 3, 1949, 'Distopia'),
       ('Cem Anos de Solidão', 4, 1967, 'Realismo Mágico'),
       ('Orgulho e Preconceito', 5, 1813, 'Romance');

INSERT INTO Emprestimos (LivroID, DataEmprestimo, DataDevolucao, NomeUsuario) 
VALUES (1, '2024-01-01', NULL, 'João Silva'),
       (2, '2024-02-15', '2024-03-01', 'Maria Oliveira'),
       (3, '2024-03-01', NULL, 'Pedro Santos'),
       (4, '2024-04-10', '2024-05-01', 'Ana Costa'),
       (5, '2024-05-15', NULL, 'Lucas Souza');

SELECT Livros.Titulo, Autores.Nome AS Autor, Livros.AnoPublicacao 
FROM Livros 
JOIN Autores ON Livros.AutorID = Autores.AutorID;

SELECT Emprestimos.EmprestimoID, Livros.Titulo, Emprestimos.DataEmprestimo, Emprestimos.NomeUsuario 
FROM Emprestimos 
JOIN Livros ON Emprestimos.LivroID = Livros.LivroID 
WHERE Emprestimos.DataDevolucao IS NULL;

UPDATE Emprestimos 
SET DataDevolucao = '2024-06-01' 
WHERE EmprestimoID = 1;

DELETE FROM Emprestimos 
WHERE LivroID = 1;

DELETE FROM Livros 
WHERE LivroID = 1;
