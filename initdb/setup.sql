-- Script SQL (roda ao realizar build no docker)
CREATE DATABASE IF NOT EXISTS linguados;

-- 1. Tabela de Usuários
CREATE TABLE IF NOT EXISTS usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(50) NOT NULL,
    xp INT DEFAULT 0,
    nivel INT DEFAULT 1,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    streak INT DEFAULT 0,
    ultimo_acesso DATE NULL -- Adiciona a coluna ultimo_acesso
    );

-- 2. Tabela de Desafios
CREATE TABLE IF NOT EXISTS desafio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    pontos_xp INT NOT NULL,
    dificuldade ENUM('Facil', 'Medio', 'Dificil') DEFAULT 'Facil',
    tipo ENUM('TRADUCAO', 'LACUNA', 'MULTIPLA_ESCOLHA') NOT NULL, -- Valores atualizados e em maiúsculas
    resposta_correta VARCHAR(255) NULL, -- Resposta para DesafioTraducao e DesafioLacuna
    opcoes_multipla_escolha VARCHAR(1024) NULL -- Opções para DesafioMultiplaEscolha, separadas por ';'
    );

-- 3. Tabela de Progresso (Relaciona Usuário com Desafio)
-- Esta tabela registra quando um usuário conclui um desafio específico
CREATE TABLE IF NOT EXISTS progresso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    desafio_id INT NOT NULL,
    data_conclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Restrições de Chave Estrangeira
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (desafio_id) REFERENCES desafio(id) ON DELETE CASCADE
    );

-- 4. Tabela de Conquistas
-- Registra os prêmios/badges que o usuário ganhou
CREATE TABLE IF NOT EXISTS conquista (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    nome_conquista VARCHAR(100) NOT NULL,
    descricao_conquista VARCHAR(255),
    data_ganha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Restrição de Chave Estrangeira
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
    );

-- Povoamento:
-- Insere alguns registros iniciais para teste
INSERT IGNORE INTO usuario (nome, email, senha) VALUES
('admin', 'admin@admin.com', 'admin123');

INSERT IGNORE INTO desafio (titulo, descricao, pontos_xp, dificuldade, tipo, resposta_correta, opcoes_multipla_escolha) VALUES
('Hello World', 'Traduza "Hello World" para português.', 10, 'Facil', 'TRADUCAO', 'Olá Mundo', NULL),
('Variáveis em Java', 'Preencha a lacuna: "Para declarar uma variável de texto em Java, usamos o tipo _____.".', 20, 'Facil', 'LACUNA', 'String', NULL),
('Estruturas de Repetição', 'Qual estrutura de repetição executa o bloco de código pelo menos uma vez, mesmo que a condição seja falsa?', 50, 'Medio', 'MULTIPLA_ESCOLHA', 'do-while', 'for;while;do-while;foreach');

CREATE TABLE IF NOT EXISTS modulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    descricao TEXT,
    ordem INT DEFAULT 0,
    ativo BOOLEAN DEFAULT TRUE
);
