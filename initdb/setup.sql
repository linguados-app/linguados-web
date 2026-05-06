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

-- Usuario Admin
INSERT IGNORE INTO usuario (nome, email, senha) VALUES
('admin', 'admin@admin.com', 'admin123');

-- Desafio 1: Traducao
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta) VALUES
(1, 'Saudacoes', 'Traduza "Good Morning" para portugues.', 15, 'Facil', 'TRADUCAO', 'Bom dia');

-- Desafio 2: Lacuna
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo) VALUES
(2, 'Gramatica: Verbo To Be', 'Arraste a palavra correta para a lacuna:', 25, 'Facil', 'LACUNA');

INSERT IGNORE INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES
(2, 'She', 'my best friend.', 'is');

-- Desafio 3: Multipla Escolha
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta) VALUES
(3, 'Vocabulario Tecnico', 'Qual termo descreve uma funcao que chama a si mesma?', 40, 'Medio', 'MULTIPLA_ESCOLHA', 'Recursao');

INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES
(3, 'Looping;Iteracao;Recursao;Abstracao');

-- Desafio 4: Traducao (Java)
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta) VALUES
(4, 'Variaveis Java', 'Como se declara uma variavel de numero inteiro chamada "pontos" com valor 50?', 20, 'Facil', 'TRADUCAO', 'int pontos = 50;');

-- Desafio 5: Multipla Escolha (SQL)
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta) VALUES
(5, 'Comandos SQL', 'Qual comando e usado para remover todos os dados de uma tabela sem excluir a tabela?', 35, 'Medio', 'MULTIPLA_ESCOLHA', 'TRUNCATE');

INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES
(5, 'DELETE;DROP;TRUNCATE;REMOVE');

-- Desafio 6: Lacuna (Logica)
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo) VALUES
(6, 'Estruturas Condicionais', 'Complete o codigo para verificar se a variavel "idade" e maior ou igual a 18:', 20, 'Facil', 'LACUNA');

INSERT IGNORE INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES
(6, 'if (idade', '18) {', '>=');

-- Desafio 7: Traducao (Git)
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta) VALUES
(7, 'Versionamento', 'Qual o comando usado para enviar suas alteracoes locais para o servidor remoto?', 25, 'Facil', 'TRADUCAO', 'git push');

-- Desafio 8: Multipla Escolha (Java)
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta) VALUES
(8, 'Orientacao a Objetos', 'Qual palavra reservada e usada para criar uma instancia de uma classe em Java?', 30, 'Facil', 'MULTIPLA_ESCOLHA', 'new');

INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES
(8, 'create;new;instance;this');