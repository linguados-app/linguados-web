-- Configuração de charset para evitar bugs com "ç" e acentos
CREATE DATABASE IF NOT EXISTS linguados
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE linguados;

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
    ultimo_acesso DATE NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Tabela de Desafios (Classe Pai)
CREATE TABLE IF NOT EXISTS desafio (
                                       id INT AUTO_INCREMENT PRIMARY KEY,
                                       titulo VARCHAR(150) NOT NULL,
    enunciado TEXT,
    xp_recompensa INT NOT NULL,
    dificuldade ENUM('Facil', 'Medio', 'Dificil') DEFAULT 'Facil',
    tipo ENUM('TRADUCAO', 'LACUNA', 'MULTIPLA_ESCOLHA') NOT NULL,
    resposta_correta VARCHAR(255) NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Tabela para Detalhes de Lacuna
CREATE TABLE IF NOT EXISTS desafio_lacuna (
                                              id_desafio INT PRIMARY KEY,
                                              texto_antes VARCHAR(255),
    texto_depois VARCHAR(255),
    palavra_omitida VARCHAR(100),
    FOREIGN KEY (id_desafio) REFERENCES desafio(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Tabela para Opções de Múltipla Escolha
CREATE TABLE IF NOT EXISTS desafio_multipla_escolha (
                                                        id_desafio INT PRIMARY KEY,
                                                        opcoes TEXT NOT NULL, -- Opções separadas por ponto e vírgula
                                                        FOREIGN KEY (id_desafio) REFERENCES desafio(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. Tabela de Progresso
CREATE TABLE IF NOT EXISTS progresso (
                                         id INT AUTO_INCREMENT PRIMARY KEY,
                                         usuario_id INT NOT NULL,
                                         desafio_id INT NOT NULL,
                                         data_conclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                         FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (desafio_id) REFERENCES desafio(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. Tabela de Módulos
CREATE TABLE IF NOT EXISTS modulos (
                                       id INT AUTO_INCREMENT PRIMARY KEY,
                                       titulo VARCHAR(120) NOT NULL,
    descricao TEXT,
    ordem INT DEFAULT 0,
    ativo BOOLEAN DEFAULT TRUE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- DADOS DE TESTE (POVOAMENTO)
-- ==========================================================

INSERT IGNORE INTO usuario (nome, email, senha) VALUES
('admin', 'admin@admin.com', 'admin123');

-- Desafio 1: Tradução (Usa apenas a tabela 'desafio')
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta) VALUES
(1, 'Saudações', 'Traduza "Good Morning" para português.', 15, 'Facil', 'TRADUCAO', 'Bom dia');

-- Desafio 2: Lacuna (Requer desafio + desafio_lacuna)
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo) VALUES
(2, 'Gramática: Verbo To Be', 'Arraste a palavra correta para a lacuna:', 25, 'Facil', 'LACUNA');

INSERT IGNORE INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES
(2, 'She', 'my best friend.', 'is');

-- Desafio 3: Múltipla Escolha (Requer desafio + desafio_multipla_escolha)
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta) VALUES
(3, 'Vocabulário Técnico', 'Qual termo descreve uma função que chama a si mesma?', 40, 'Medio', 'MULTIPLA_ESCOLHA', 'Recursão');

INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES
(3, 'Looping;Iteração;Recursão;Abstração');