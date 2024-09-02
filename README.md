Aqui está o README para o código fornecido:

```markdown
# Biblioteca Database

Este projeto configura um banco de dados simples para gerenciar uma biblioteca, incluindo autores, livros e empréstimos. Ele permite criar tabelas para armazenar informações sobre autores, livros e seus empréstimos, além de fornecer consultas para visualizar dados e executar operações de atualização e exclusão.

## Estrutura do Banco de Dados

O banco de dados `Biblioteca` contém as seguintes tabelas:

1. **Autores**
   - `AutorID`: Identificador único do autor (chave primária).
   - `Nome`: Nome do autor.
   - `Idade`: Idade do autor.
   - `Nacionalidade`: Nacionalidade do autor.

2. **Livros**
   - `LivroID`: Identificador único do livro (chave primária).
   - `Titulo`: Título do livro.
   - `AutorID`: Identificador do autor (chave estrangeira referenciando `Autores`).
   - `AnoPublicacao`: Ano de publicação do livro.
   - `Genero`: Gênero literário do livro.

3. **Empréstimos**
   - `EmprestimoID`: Identificador único do empréstimo (chave primária).
   - `LivroID`: Identificador do livro emprestado (chave estrangeira referenciando `Livros`).
   - `DataEmprestimo`: Data do empréstimo.
   - `DataDevolucao`: Data de devolução do livro.
   - `NomeUsuario`: Nome do usuário que realizou o empréstimo.

## Comandos SQL

### Criação do Banco de Dados e Tabelas

```sql
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
```

### Inserção de Dados

```sql
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
```

### Consultas

- **Lista todos os livros com seus autores:**

    ```sql
    SELECT Livros.Titulo, Autores.Nome AS Autor, Livros.AnoPublicacao 
    FROM Livros 
    JOIN Autores ON Livros.AutorID = Autores.AutorID;
    ```

- **Lista todos os empréstimos em aberto:**

    ```sql
    SELECT Emprestimos.EmprestimoID, Livros.Titulo, Emprestimos.DataEmprestimo, Emprestimos.NomeUsuario 
    FROM Emprestimos 
    JOIN Livros ON Emprestimos.LivroID = Livros.LivroID 
    WHERE Emprestimos.DataDevolucao IS NULL;
    ```

### Atualizações e Exclusões

- **Atualiza a data de devolução de um empréstimo:**

    ```sql
    UPDATE Emprestimos 
    SET DataDevolucao = '2024-06-01' 
    WHERE EmprestimoID = 1;
    ```

- **Remove um empréstimo e o livro correspondente:**

    ```sql
    DELETE FROM Emprestimos 
    WHERE LivroID = 1;

    DELETE FROM Livros 
    WHERE LivroID = 1;
    ```

## Como Executar

1. Execute o script SQL em um cliente MySQL.
2. Verifique as tabelas criadas e os dados inseridos.
3. Use as consultas para visualizar as informações da biblioteca.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests para melhorias ou novas funcionalidades.
