-- ==========================================================
-- CONFIGURAÇÃO DO BANCO
-- ==========================================================
CREATE DATABASE IF NOT EXISTS linguados
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE linguados;

-- ==========================================================
-- 1. TABELA DE USUÁRIOS
-- ==========================================================
CREATE TABLE IF NOT EXISTS usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(50) NOT NULL,
    xp INT DEFAULT 0,
    nivel INT DEFAULT 1,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    streak INT DEFAULT 0,
    ultimo_acesso DATE NULL,
    perfil VARCHAR(20) DEFAULT 'ESTUDANTE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- 2. TABELA DE MÓDULOS
-- ==========================================================
CREATE TABLE IF NOT EXISTS modulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    descricao TEXT,
    ordem INT DEFAULT 0,
    ativo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- 3. TABELA DE DESAFIOS
-- ==========================================================
CREATE TABLE IF NOT EXISTS desafio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    enunciado TEXT,
    xp_recompensa INT NOT NULL,
    dificuldade ENUM('Facil', 'Medio', 'Dificil') DEFAULT 'Facil',
    tipo ENUM('TRADUCAO', 'LACUNA', 'MULTIPLA_ESCOLHA') NOT NULL,
    resposta_correta VARCHAR(255) NULL,
    id_modulo INT,
    FOREIGN KEY (id_modulo) REFERENCES modulos(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- 4. TABELA DESAFIO LACUNA
-- ==========================================================
CREATE TABLE IF NOT EXISTS desafio_lacuna (
    id_desafio INT PRIMARY KEY,
    texto_antes VARCHAR(255),
    texto_depois VARCHAR(255),
    palavra_omitida VARCHAR(100),
    FOREIGN KEY (id_desafio) REFERENCES desafio(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- 5. TABELA MÚLTIPLA ESCOLHA
-- ==========================================================
CREATE TABLE IF NOT EXISTS desafio_multipla_escolha (
    id_desafio INT PRIMARY KEY,
    opcoes TEXT NOT NULL,
    FOREIGN KEY (id_desafio) REFERENCES desafio(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- 6. TABELA DE PROGRESSO
-- ==========================================================
CREATE TABLE IF NOT EXISTS progresso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    desafio_id INT NOT NULL,
    data_conclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (desafio_id) REFERENCES desafio(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- 7. TABELA DE CHAT
-- ==========================================================
CREATE TABLE IF NOT EXISTS chat_mensagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    conteudo TEXT NOT NULL,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- 8. TABELAS DE CONQUISTAS
-- ==========================================================
CREATE TABLE IF NOT EXISTS conquista (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    badge_icone VARCHAR(50) NOT NULL,
    xp_bonus INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS usuario_conquista (
    usuario_id INT NOT NULL,
    conquista_id INT NOT NULL,
    data_desbloqueio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, conquista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (conquista_id) REFERENCES conquista(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;