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
    ultimo_acesso DATE NULL
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

    FOREIGN KEY (id_modulo)
    REFERENCES modulos(id)
    ON DELETE CASCADE

    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- 4. TABELA DESAFIO LACUNA
-- ==========================================================

CREATE TABLE IF NOT EXISTS desafio_lacuna (
                                              id_desafio INT PRIMARY KEY,
                                              texto_antes VARCHAR(255),
    texto_depois VARCHAR(255),
    palavra_omitida VARCHAR(100),

    FOREIGN KEY (id_desafio)
    REFERENCES desafio(id)
    ON DELETE CASCADE

    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- 5. TABELA MÚLTIPLA ESCOLHA
-- ==========================================================

CREATE TABLE IF NOT EXISTS desafio_multipla_escolha (
                                                        id_desafio INT PRIMARY KEY,
                                                        opcoes TEXT NOT NULL,

                                                        FOREIGN KEY (id_desafio)
    REFERENCES desafio(id)
    ON DELETE CASCADE

    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- 6. TABELA DE PROGRESSO
-- ==========================================================

CREATE TABLE IF NOT EXISTS progresso (
                                         id INT AUTO_INCREMENT PRIMARY KEY,
                                         usuario_id INT NOT NULL,
                                         desafio_id INT NOT NULL,
                                         data_conclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                                         FOREIGN KEY (usuario_id)
    REFERENCES usuario(id)
    ON DELETE CASCADE,

    FOREIGN KEY (desafio_id)
    REFERENCES desafio(id)
    ON DELETE CASCADE

    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================================================
-- 7. CHAT
-- ==========================================================

CREATE TABLE IF NOT EXISTS chat_mensagens (
                                              id INT AUTO_INCREMENT PRIMARY KEY,
                                              usuario_id INT NOT NULL,
                                              conteudo TEXT NOT NULL,
                                              data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                                              FOREIGN KEY (usuario_id)
    REFERENCES usuario(id)

    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela de Conquistas Disponíveis
CREATE TABLE IF NOT EXISTS conquista (
                                         id INT AUTO_INCREMENT PRIMARY KEY,
                                         codigo VARCHAR(50) NOT NULL UNIQUE, -- Ex: 'PRIMEIRA_MISSAO'
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    badge_icone VARCHAR(50) NOT NULL,    -- Nome do arquivo de imagem ou emoji (Ex: '🚀')
    xp_bonus INT DEFAULT 0
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela Associativa de Conquistas do Usuário
CREATE TABLE IF NOT EXISTS usuario_conquista (
     usuario_id INT NOT NULL,
     conquista_id INT NOT NULL,
     data_desbloqueio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (usuario_id, conquista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (conquista_id) REFERENCES conquista(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserção da Conquista Inicial (Gatilho solicitado)
INSERT IGNORE INTO conquista (id, codigo, titulo, descricao, badge_icone, xp_bonus)
VALUES (1, 'PRIMEIRA_MISSAO', 'Primeiro Passo', 'Você completou o seu primeiro desafio no Linguados!', '🚀', 50);

-- Atualizar os módulos com títulos mais adequados
UPDATE modulos SET titulo = 'API Documentation' WHERE id = 1;
UPDATE modulos SET titulo = 'Technical Reading' WHERE id = 2;
UPDATE modulos SET titulo = 'Database & SQL' WHERE id = 3;

-- Verificar quantos desafios cada módulo tem
SELECT m.titulo, COUNT(d.id) as total_desafios
FROM modulos m
         LEFT JOIN desafio d ON d.id_modulo = m.id
GROUP BY m.id;

-- ==========================================================
-- USUÁRIOS
-- ==========================================================

INSERT IGNORE INTO usuario (nome, email, senha)
VALUES
('admin', 'admin@admin.com', 'admin123'),

('ian', 'ian@admin.com', 'admin123'),

('vitao', 'vitao@admin.com', 'admin123');

-- ==========================================================
-- MÓDULOS
-- ==========================================================

INSERT IGNORE INTO modulos (
    id,
    titulo,
    descricao,
    ordem,
    ativo
) VALUES

(1, 'Modulo 1', 'Introducao ao Ingles Tecnico', 1, true),

(2, 'Modulo 2', 'Java e Programacao', 2, true),

(3, 'Modulo 3', 'Banco de Dados e SQL', 3, true);

-- ==========================================================
-- DESAFIO 1
-- ==========================================================

INSERT IGNORE INTO desafio (
    id,
    titulo,
    enunciado,
    xp_recompensa,
    dificuldade,
    tipo,
    resposta_correta,
    id_modulo
) VALUES (
    1,
    'Saudacoes',
    'Traduza "Good Morning" para portugues.',
    15,
    'Facil',
    'TRADUCAO',
    'Bom dia',
    1
);

-- ==========================================================
-- DESAFIO 2
-- ==========================================================

INSERT IGNORE INTO desafio (
    id,
    titulo,
    enunciado,
    xp_recompensa,
    dificuldade,
    tipo,
    id_modulo
) VALUES (
    2,
    'Gramatica: Verbo To Be',
    'Arraste a palavra correta para a lacuna:',
    25,
    'Facil',
    'LACUNA',
    1
);

INSERT IGNORE INTO desafio_lacuna (
    id_desafio,
    texto_antes,
    texto_depois,
    palavra_omitida
) VALUES (
    2,
    'She',
    'my best friend.',
    'is'
);

-- ==========================================================
-- DESAFIO 3
-- ==========================================================

INSERT IGNORE INTO desafio (
    id,
    titulo,
    enunciado,
    xp_recompensa,
    dificuldade,
    tipo,
    resposta_correta,
    id_modulo
) VALUES (
    3,
    'Vocabulario Tecnico',
    'Qual termo descreve uma funcao que chama a si mesma?',
    40,
    'Medio',
    'MULTIPLA_ESCOLHA',
    'Recursao',
    1
);

INSERT IGNORE INTO desafio_multipla_escolha (
    id_desafio,
    opcoes
) VALUES (
    3,
    'Looping;Iteracao;Recursao;Abstracao'
);

-- ==========================================================
-- DESAFIO 4
-- ==========================================================

INSERT IGNORE INTO desafio (
    id,
    titulo,
    enunciado,
    xp_recompensa,
    dificuldade,
    tipo,
    resposta_correta,
    id_modulo
) VALUES (
    4,
    'Variaveis Java',
    'Como se declara uma variavel de numero inteiro chamada "pontos" com valor 50?',
    20,
    'Facil',
    'TRADUCAO',
    'int pontos = 50;',
    2
);

-- ==========================================================
-- DESAFIO 5
-- ==========================================================

INSERT IGNORE INTO desafio (
    id,
    titulo,
    enunciado,
    xp_recompensa,
    dificuldade,
    tipo,
    resposta_correta,
    id_modulo
) VALUES (
    5,
    'Comandos SQL',
    'Qual comando e usado para remover todos os dados de uma tabela sem excluir a tabela?',
    35,
    'Medio',
    'MULTIPLA_ESCOLHA',
    'TRUNCATE',
    3
);

INSERT IGNORE INTO desafio_multipla_escolha (
    id_desafio,
    opcoes
) VALUES (
    5,
    'DELETE;DROP;TRUNCATE;REMOVE'
);

-- ==========================================================
-- DESAFIO 6
-- ==========================================================

INSERT IGNORE INTO desafio (
    id,
    titulo,
    enunciado,
    xp_recompensa,
    dificuldade,
    tipo,
    id_modulo
) VALUES (
    6,
    'Estruturas Condicionais',
    'Complete o codigo para verificar se a variavel "idade" e maior ou igual a 18:',
    20,
    'Facil',
    'LACUNA',
    2
);

INSERT IGNORE INTO desafio_lacuna (
    id_desafio,
    texto_antes,
    texto_depois,
    palavra_omitida
) VALUES (
    6,
    'if (idade',
    '18) {',
    '>='
);

-- ==========================================================
-- DESAFIO 7
-- ==========================================================

INSERT IGNORE INTO desafio (
    id,
    titulo,
    enunciado,
    xp_recompensa,
    dificuldade,
    tipo,
    resposta_correta,
    id_modulo
) VALUES (
    7,
    'Versionamento',
    'Qual o comando usado para enviar suas alteracoes locais para o servidor remoto?',
    25,
    'Facil',
    'TRADUCAO',
    'git push',
    2
);

-- ==========================================================
-- DESAFIO 8
-- ==========================================================

INSERT IGNORE INTO desafio (
    id,
    titulo,
    enunciado,
    xp_recompensa,
    dificuldade,
    tipo,
    resposta_correta,
    id_modulo
) VALUES (
    8,
    'Orientacao a Objetos',
    'Qual palavra reservada e usada para criar uma instancia de uma classe em Java?',
    30,
    'Facil',
    'MULTIPLA_ESCOLHA',
    'new',
    2
);

INSERT IGNORE INTO desafio_multipla_escolha (
    id_desafio,
    opcoes
) VALUES (
    8,
    'create;new;instance;this'
);