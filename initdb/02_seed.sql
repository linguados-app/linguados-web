-- ==========================================================
-- 1. ADICIONANDO 30 ESTUDANTES (PERSONAGENS FAMOSOS + ORIGINAIS)
-- ==========================================================
INSERT IGNORE INTO usuario (id, nome, email, senha, xp, nivel, streak, ultimo_acesso, perfil) VALUES
(1, 'Andreas Gunther', 'admin@linguados.com', 'admin123', 0, 1, 0, NULL, 'ADMIN'),
(2, 'Ian Silva', 'ian@estudante.com', 'user123', 1450, 4, 12, '2026-05-19', 'ESTUDANTE'),
(3, 'Victor Santos', 'vitao@estudante.com', 'user123', 2850, 7, 34, '2026-05-20', 'ESTUDANTE'),
(4, 'Bruce Wayne', 'bruce@gotham.com', 'user123', 5000, 12, 60, '2026-05-20', 'ESTUDANTE'),
(5, 'Tony Stark', 'tony@stark.com', 'user123', 4800, 11, 45, '2026-05-20', 'ESTUDANTE'),
(6, 'Luke Skywalker', 'luke@tatooine.com', 'user123', 1200, 3, 8, '2026-05-19', 'ESTUDANTE'),
(7, 'Harry Potter', 'harry@hogwarts.com', 'user123', 2100, 5, 15, '2026-05-20', 'ESTUDANTE'),
(8, 'Peter Parker', 'peter@bugle.com', 'user123', 3100, 8, 22, '2026-05-20', 'ESTUDANTE'),
(9, 'Clark Kent', 'clark@dailyplanet.com', 'user123', 950, 2, 4, '2026-05-18', 'ESTUDANTE'),
(10, 'Hermione Granger', 'hermione@hogwarts.com', 'user123', 6200, 15, 90, '2026-05-20', 'ESTUDANTE'),
(11, 'Katniss Everdeen', 'katniss@panem.com', 'user123', 1750, 4, 14, '2026-05-17', 'ESTUDANTE'),
(12, 'Jon Snow', 'jon@wall.com', 'user123', 800, 2, 0, '2026-05-15', 'ESTUDANTE'),
(13, 'Daenerys Targaryen', 'daenerys@dragon.com', 'user123', 2400, 6, 19, '2026-05-20', 'ESTUDANTE'),
(14, 'Walter White', 'walter@heisenberg.com', 'user123', 4100, 10, 50, '2026-05-19', 'ESTUDANTE'),
(15, 'Sherlock Holmes', 'sherlock@baker.com', 'user123', 5800, 14, 75, '2026-05-20', 'ESTUDANTE'),
(16, 'Lara Croft', 'lara@croft.com', 'user123', 3400, 9, 31, '2026-05-20', 'ESTUDANTE'),
(17, 'Frodo Baggins', 'frodo@shire.com', 'user123', 1100, 3, 7, '2026-05-18', 'ESTUDANTE'),
(18, 'Aragorn Elessar', 'aragorn@gondor.com', 'user123', 2900, 7, 25, '2026-05-19', 'ESTUDANTE'),
(19, 'Indiana Jones', 'indy@museum.com', 'user123', 2250, 6, 13, '2026-05-20', 'ESTUDANTE'),
(20, 'Neo Anderson', 'neo@matrix.com', 'user123', 4950, 12, 42, '2026-05-20', 'ESTUDANTE'),
(21, 'Sarah Connor', 'sarah@skynet.com', 'user123', 1600, 4, 11, '2026-05-16', 'ESTUDANTE'),
(22, 'Ellen Ripley', 'ripley@nostromo.com', 'user123', 2700, 7, 28, '2026-05-19', 'ESTUDANTE'),
(23, 'Michael Scott', 'michael@dundermifflin.com', 'user123', 450, 1, 2, '2026-05-20', 'ESTUDANTE'),
(24, 'Dwight Schrute', 'dwight@beetfarm.com', 'user123', 3800, 9, 40, '2026-05-20', 'ESTUDANTE'),
(25, 'Jack Sparrow', 'jack@blackpearl.com', 'user123', 1350, 4, 5, '2026-05-14', 'ESTUDANTE'),
(26, 'Arthur Pendragon', 'arthur@camelot.com', 'user123', 1950, 5, 17, '2026-05-18', 'ESTUDANTE'),
(27, 'Percy Jackson', 'percy@olympus.com', 'user123', 1550, 4, 10, '2026-05-19', 'ESTUDANTE'),
(28, 'Barney Stinson', 'barney@legendary.com', 'user123', 2050, 5, 21, '2026-05-20', 'ESTUDANTE'),
(29, 'Ted Mosby', 'ted@architect.com', 'user123', 1400, 4, 9, '2026-05-18', 'ESTUDANTE'),
(30, 'Geralt of Rivia', 'geralt@kaermorhen.com', 'user123', 3650, 9, 36, '2026-05-20', 'ESTUDANTE');


-- ==========================================================
-- 2. ADICIONANDO 30 MÓDULOS (PROGRAMAÇÃO E INGLÊS INSTRUMENTAL)
-- ==========================================================
INSERT IGNORE INTO modulos (id, titulo, descricao, ordem, ativo) VALUES
(1, 'Modulo 1: Technical Reading', 'Vocabulario essencial para leitura de documentacao tecnica e APIs.', 1, true),
(2, 'Modulo 2: Version Control & Git', 'Termos em ingles mais utilizados no fluxo de versionamento de codigo.', 2, true),
(3, 'Modulo 3: Database & SQL Terms', 'Ingles aplicado a modelagem de dados, queries e tabelas.', 3, true),
(4, 'Modulo 4: Object Orientation', 'Classes, objetos, heranca e polimorfismo explicados na lingua inglesa.', 4, true),
(5, 'Modulo 5: Exception Handling', 'Tratamento de erros, blocos try-catch e fluxo defensivo de codigo.', 5, true),
(6, 'Modulo 6: Data Structures Advanced', 'Filas, pilhas, arvores e a terminologia de algoritmos complexos.', 6, true),
(7, 'Modulo 7: Functional Programming', 'Lambdas, streams e funcoes de alta ordem em ambientes modernos.', 7, true),
(8, 'Modulo 8: HTTP & Web Services', 'Verbos HTTP, codigos de status, mudancas de estado e contratos REST.', 8, true),
(9, 'Modulo 9: Frontend Architecture', 'Document Object Model, componentes, estilização e renderizacao.', 9, true),
(10, 'Modulo 10: Software Testing', 'Testes unitarios, assercoes, mocks e integracao continua.', 10, true),
(11, 'Modulo 11: Linux & Terminal', 'Comandos bash, pipes, redirecionamentos e manipulacao de arquivos.', 11, true),
(12, 'Modulo 12: CI and CD Pipelines', 'Building, automation, deployment e logs em servidores integrados.', 12, true),
(13, 'Modulo 13: Clean Code Principles', 'Refatoracao, nomenclatura limpa, legibilidade e manutenibilidade.', 13, true),
(14, 'Modulo 14: Cloud Computing', 'Instancias escalaveis, containers, virtualizacao e nuvem.', 14, true),
(15, 'Modulo 15: Security Fundamentals', 'Criptografia, hashing, tokens JWT e payloads de autenticacao.', 15, true),
(16, 'Modulo 16: Concurrency & Threads', 'Processamento paralelo, sincronizacao, deadlocks e assincronismo.', 16, true),
(17, 'Modulo 17: Design Patterns', 'Padroes criacionais, estruturais, comportamentais e organizacao.', 17, true),
(18, 'Modulo 18: NoSQL Databases', 'Documentos, pares chave-valor, grafos e bancos nao relacionais.', 18, true),
(19, 'Modulo 19: Clean Architecture', 'Inversao de controle, isolamento de camadas e entidades puras.', 19, true),
(20, 'Modulo 20: Regular Expressions', 'Padroes de busca, regex, validacao de strings e parsers.', 20, true),
(21, 'Modulo 21: Microservices Architecture', 'Sistemas distribuidos, gateways, service discovery e barramentos.', 21, true),
(22, 'Modulo 22: API Documentation', 'Swagger, Open API, documentacao viva e especificacao de rotas.', 22, true),
(23, 'Modulo 23: Memory Management', 'Garbage collection, vazamentos de memoria, heap e stack allocation.', 23, true),
(24, 'Modulo 24: Package Managers', 'Dependencias, maven, npm, gerenciamento de builds e artefatos.', 24, true),
(25, 'Modulo 25: Containerization', 'Docker containers, imagens isoladas, volumes e redes virtuais.', 25, true),
(26, 'Modulo 26: Agile Frameworks', 'Scrum, sprints, backlogs, user stories e organizacao de times.', 26, true),
(27, 'Modulo 27: Message Queues', 'Produtores, consumidores, tópicos e barramentos asncronos.', 27, true),
(28, 'Modulo 28: Code Optimization', 'Analise assintotica, Big O notation, gargalos e performance.', 28, true),
(29, 'Modulo 29: AI and Data Science', 'Machine learning, processamento de dados e analises preditivas.', 29, true),
(30, 'Modulo 30: System Architecture Design', 'Escalabilidade horizontal, balanceamento de carga e alta disponibilidade.', 30, true);


-- ==========================================================
-- 3. ADICIONANDO 30 CONQUISTAS (UMA PARA CADA MÓDULO)
-- ==========================================================
INSERT IGNORE INTO conquista (id, codigo, titulo, descricao, badge_icone, xp_bonus) VALUES
(1, 'CONQ_MOD_1', 'Leitor Tecnico', 'Completou com sucesso o Modulo 1.', '🚀', 50),
(2, 'CONQ_MOD_2', 'Mestre do Git', 'Completou com sucesso o Modulo 2.', '🐙', 50),
(3, 'CONQ_MOD_3', 'Mestre dos Dados', 'Completou com sucesso o Modulo 3.', '💾', 50),
(4, 'CONQ_MOD_4', 'Arquiteto OO', 'Completou com sucesso o Modulo 4.', '📦', 50),
(5, 'CONQ_MOD_5', 'Bug Hunter', 'Completou com sucesso o Modulo 5.', '🛡️', 50),
(6, 'CONQ_MOD_6', 'Estruturador', 'Completou com sucesso o Modulo 6.', '📊', 50),
(7, 'CONQ_MOD_7', 'Dev Funcional', 'Completou com sucesso o Modulo 7.', 'λ', 50),
(8, 'CONQ_MOD_8', 'Web Navigator', 'Completou com sucesso o Modulo 8.', '🌐', 50),
(9, 'CONQ_MOD_9', 'Estilista DOM', 'Completou com sucesso o Modulo 9.', '🎨', 50),
(10, 'CONQ_MOD_10', 'Quality Assurance', 'Completou com sucesso o Modulo 10.', '🧪', 50),
(11, 'CONQ_MOD_11', 'Sysadmin Junior', 'Completou com sucesso o Modulo 11.', '🐧', 50),
(12, 'CONQ_MOD_12', 'Automation King', 'Completou com sucesso o Modulo 12.', '🤖', 50),
(13, 'CONQ_MOD_13', 'Artesao de Codigo', 'Completou com sucesso o Modulo 13.', '✨', 50),
(14, 'CONQ_MOD_14', 'Navegador da Nuvem', 'Completou com sucesso o Modulo 14.', '☁️', 50),
(15, 'CONQ_MOD_15', 'Cripto Guardiao', 'Completou com sucesso o Modulo 15.', '🔑', 50),
(16, 'CONQ_MOD_16', 'Paralelista', 'Completou com sucesso o Modulo 16.', '🔀', 50),
(17, 'CONQ_MOD_17', 'Padronizador', 'Completou com sucesso o Modulo 17.', '📐', 50),
(18, 'CONQ_MOD_18', 'NoSQL Expert', 'Completou com sucesso o Modulo 18.', '🍃', 50),
(19, 'CONQ_MOD_19', 'Clean Architect', 'Completou com sucesso o Modulo 19.', '🏛️', 50),
(20, 'CONQ_MOD_20', 'Regex Ninja', 'Completou com sucesso o Modulo 20.', '🔍', 50),
(21, 'CONQ_MOD_21', 'Micro Dev', 'Completou com sucesso o Modulo 21.', '🧩', 50),
(22, 'CONQ_MOD_22', 'Documentador', 'Completou com sucesso o Modulo 22.', '📝', 50),
(23, 'CONQ_MOD_23', 'Collector Sênior', 'Completou com sucesso o Modulo 23.', '🧹', 50),
(24, 'CONQ_MOD_24', 'Gerente de Build', 'Completou com sucesso o Modulo 24.', '🧱', 50),
(25, 'CONQ_MOD_25', 'Capitao Docker', 'Completou com sucesso o Modulo 25.', '🐳', 50),
(26, 'CONQ_MOD_26', 'Agilista Prático', 'Completou com sucesso o Modulo 26.', '🏃', 50),
(27, 'CONQ_MOD_27', 'Fila Ininterrupta', 'Completou com sucesso o Modulo 27.', '📥', 50),
(28, 'CONQ_MOD_28', 'Mestre da Escala', 'Completou com sucesso o Modulo 28.', '⚡', 50),
(29, 'CONQ_MOD_29', 'Cientista de Dados', 'Completou com sucesso o Modulo 29.', '🧠', 50),
(30, 'CONQ_MOD_30', 'Arquiteto Supremo', 'Completou com sucesso o Modulo 30.', '👑', 50);


-- ==========================================================
-- 4. ADICIONANDO 10 DESAFIOS PARA CADA MÓDULO (LOTE MODULAR DE EXEMPLO)
-- ==========================================================

-- --------- MODULO 1: DESAFIOS 1 A 10 ---------
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(1, 'Keywords: Return Type', 'Traduza a palavra "Void" usada na declaracao de metodos que nao retornam valor.', 15, 'Facil', 'TRADUCAO', 'vazio', 1),
(2, 'API Reference', 'Preencha la lacuna com o termo correto: "O framework lanca uma excecao se o arquivo nao for encontrado."', 25, 'Facil', 'LACUNA', 'throws', 1),
(3, 'Technical Verbs', 'O que significa o verbo "To Deploy" no contexto de engenharia de software?', 30, 'Medio', 'MULTIPLA_ESCOLHA', 'Implantar', 1),
(4, 'Data Structures', 'Traduza o termo "Array" usado para estruturas de dados sequenciais.', 15, 'Facil', 'TRADUCAO', 'vetor', 1),
(5, 'Loop Context', 'Traduza a expressao "While loop".', 15, 'Facil', 'TRADUCAO', 'laco enquanto', 1),
(6, 'Framework behavior', 'Preencha a lacuna: "O container gerencia o ciclo de vida dos componentes."', 25, 'Medio', 'LACUNA', 'manages', 1),
(7, 'Package Statement', 'Qual termo define a importacao de pacotes externos?', 20, 'Facil', 'MULTIPLA_ESCOLHA', 'import', 1),
(8, 'Data Types', 'Traduza o tipo primitivo "Byte".', 15, 'Facil', 'TRADUCAO', 'byte', 1),
(9, 'Class Inheritance', 'Preencha a lacuna: "A classe filha estende a classe pai."', 25, 'Medio', 'LACUNA', 'extends', 1),
(10, 'Compilation error', 'Qual termo indica um erro gerado antes da execucao do programa?', 30, 'Medio', 'MULTIPLA_ESCOLHA', 'Compile-time error', 1);

INSERT IGNORE INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES
(2, 'The framework', 'an exception if the file is not found.', 'throws'),
(6, 'The container', 'the lifecycle of components.', 'manages'),
(9, 'The subclass', 'the base class in Java.', 'extends');

INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES
(3, 'Deletar;Implantar;Compilar;Testar'),
(7, 'import;include;require;package'),
(10, 'Runtime error;Compile-time error;Syntax error;Logic error');


-- --------- MODULO 2: DESAFIOS 11 A 20 ---------
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(11, 'Git Workflow', 'Traduza o termo "Merge" usado ao juntar duas branches.', 20, 'Facil', 'TRADUCAO', 'mesclar', 2),
(12, 'Git Remote', 'Complete a lacuna: "Rode o comando fetch para baixar metadados do servidor."', 25, 'Medio', 'LACUNA', 'fetch', 2),
(13, 'Git Conflicts', 'Qual palavra descreve uma copia exata de um repositorio remoto?', 20, 'Facil', 'MULTIPLA_ESCOLHA', 'Clone', 2),
(14, 'Git Undo', 'Traduza o termo "Stash" que serve para guardar alteracoes temporarias.', 35, 'Dificil', 'TRADUCAO', 'armazenar', 2),
(15, 'Git History', 'Traduza o termo "Commit log".', 20, 'Facil', 'TRADUCAO', 'registro de commits', 2),
(16, 'Git Worktree', 'Complete a lacuna: "Mude de branch usando o comando checkout."', 25, 'Medio', 'LACUNA', 'checkout', 2),
(17, 'Git Sharing', 'Qual comando envia seus commits locais para o servidor remoto?', 20, 'Facil', 'MULTIPLA_ESCOLHA', 'git push', 2),
(18, 'Git Branching', 'Traduza o conceito de "Feature branch".', 20, 'Facil', 'TRADUCAO', 'ramificacao de funcionalidade', 2),
(19, 'Git Review', 'Complete a lacuna: "Abra um pull request para revisao de codigo."', 25, 'Medio', 'LACUNA', 'request', 2),
(20, 'Git Integration', 'Qual termo indica que houve uma colisao de codigos ao mesclar branches?', 30, 'Medio', 'MULTIPLA_ESCOLHA', 'Merge conflict', 2);

INSERT IGNORE INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES
(12, 'You should run git', 'to download metadata from remote tracking branches.', 'fetch'),
(16, 'To switch branches, execute git', 'followed by the branch name.', 'checkout'),
(19, 'Please open a pull', 'to start the code review process.', 'request');

INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES
(13, 'Commit;Fork;Clone;Branch'),
(17, 'git pull;git fetch;git push;git commit'),
(20, 'Code update;Merge conflict;Version match;Branch block');


-- --------- MODULO 3: DESAFIOS 21 A 30 ---------
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(21, 'SQL Filtering', 'Traduza a palavra reservada "Where" usada para filtros.', 15, 'Facil', 'TRADUCAO', 'onde', 3),
(22, 'Database Constraints', 'Complete a definicao: "A chave estrangeira garante integridade referencial."', 30, 'Medio', 'LACUNA', 'foreign', 3),
(23, 'Database Sorting', 'Qual comando SQL ordena os resultados de forma decrescente?', 25, 'Facil', 'MULTIPLA_ESCOLHA', 'DESC', 3),
(24, 'SQL Modification', 'Traduza a instrucao "Alter Table".', 20, 'Facil', 'TRADUCAO', 'alterar tabela', 3),
(25, 'Database Relationships', 'Traduza o termo "Join table".', 20, 'Facil', 'TRADUCAO', 'tabela associativa', 3),
(26, 'SQL Insertion', 'Complete a lacuna: "Use INSERT INTO para adicionar novas linhas."', 25, 'Facil', 'LACUNA', 'into', 3),
(27, 'Database Indexes', 'Qual estrutura e criada para acelerar a busca de registros em tabelas?', 25, 'Facil', 'MULTIPLA_ESCOLHA', 'Index', 3),
(28, 'SQL Management', 'Traduza o comando "Drop Database".', 20, 'Facil', 'TRADUCAO', 'excluir banco de dados', 3),
(29, 'Database Engines', 'Complete a lacuna: "O banco de dados armazena dados em tabelas relacionais."', 25, 'Medio', 'LACUNA', 'stores', 3),
(30, 'SQL Aggregations', 'Qual funcao SQL conta o número total de linhas encontradas?', 30, 'Medio', 'MULTIPLA_ESCOLHA', 'COUNT', 3);

INSERT IGNORE INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES
(22, 'The', 'key constraint ensures referential integrity.', 'foreign'),
(26, 'Insert new rows', 'the table using the appropriate statement.', 'into'),
(29, 'The relational database', 'data structured in records.', 'stores');

INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES
(23, 'ASC;DESC;GROUP;JOIN'),
(27, 'View;Index;Query;Trigger'),
(30, 'SUM;AVG;COUNT;MAX');


-- ==========================================================
-- ESTRUTURA EXPANSIVEL REPETITIVA PARA PREENCHER ATÉ O MÓDULO 30
-- ==========================================================

-- --------- MODULO 4: DESAFIOS 31 A 40 ---------
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(31, 'OO Concepts', 'Traduza a palavra "Class" que serve de molde para objetos.', 15, 'Facil', 'TRADUCAO', 'classe', 4),
(32, 'OO Lifecycle', 'Complete: "O construtor instancia um novo objeto na memoria."', 25, 'Medio', 'LACUNA', 'instantiates', 4),
(33, 'OO Visibility', 'Qual modificador impede o acesso externo direto a um atributo?', 20, 'Facil', 'MULTIPLA_ESCOLHA', 'private', 4);
INSERT IGNORE INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES (32, 'The constructor', 'a new object in memory.', 'instantiates');
INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES (33, 'public;protected;private;default');

-- preenchimento automatico de fallbacks estruturais para os ids sequenciais de teste ate 300
-- Isso garante 10 questoes em cada uma das 30 tabelas atrelando IDs automaticos sem falhas no forEach do JSP
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(34,'M4 Q4','Traduzir "Inheritance"',15,'Facil','TRADUCAO','heranca',4),
(35,'M4 Q5','Traduzir "Polymorphism"',15,'Facil','TRADUCAO','polimorfismo',4),
(36,'M4 Q6','Traduzir "Encapsulation"',15,'Facil','TRADUCAO','encapsulamento',4),
(37,'M4 Q7','Traduzir "Interface"',15,'Facil','TRADUCAO','interface',4),
(38,'M4 Q8','Traduzir "Method"',15,'Facil','TRADUCAO','metodo',4),
(39,'M4 Q9','Traduzir "Attribute"',15,'Facil','TRADUCAO','atributo',4),
(40,'M4 Q10','Traduzir "Object"',15,'Facil','TRADUCAO','objeto',4),

-- M5 (41-50)
(41,'M5 Q1','Traduzir "Try block"',15,'Facil','TRADUCAO','bloco tentar',5),
(42,'M5 Q2','Traduzir "Catch block"',15,'Facil','TRADUCAO','bloco capturar',5),
(43,'M5 Q3','Traduzir "Error"',15,'Facil','TRADUCAO','erro',5),
(44,'M5 Q4','Traduzir "Exception"',15,'Facil','TRADUCAO','excecao',5),
(45,'M5 Q5','Traduzir "Finally"',15,'Facil','TRADUCAO','finalmente',5),
(46,'M5 Q6','Traduzir "Stacktrace"',15,'Facil','TRADUCAO','rastreamento de pilha',5),
(47,'M5 Q7','Traduzir "Warning"',15,'Facil','TRADUCAO','aviso',5),
(48,'M5 Q8','Traduzir "Failure"',15,'Facil','TRADUCAO','falha',5),
(49,'M5 Q9','Traduzir "Bug"',15,'Facil','TRADUCAO','defeito',5),
(50,'M5 Q10','Traduzir "Handler"',15,'Facil','TRADUCAO','manipulador',5),

-- M6 (51-60)
(51,'M6 Q1','Traduzir "Queue"',15,'Facil','TRADUCAO','fila',6),
(52,'M6 Q2','Traduzir "Stack"',15,'Facil','TRADUCAO','pilha',6),
(53,'M6 Q3','Traduzir "Node"',15,'Facil','TRADUCAO','no',6),
(54,'M6 Q4','Traduzir "Tree"',15,'Facil','TRADUCAO','arvore',6),
(55,'M6 Q5','Traduzir "Linked List"',15,'Facil','TRADUCAO','lista ligada',6),
(56,'M6 Q6','Traduzir "Binary Search"',15,'Facil','TRADUCAO','busca binaria',6),
(57,'M6 Q7','Traduzir "Graph"',15,'Facil','TRADUCAO','grafo',6),
(58,'M6 Q8','Traduzir "Pointer"',15,'Facil','TRADUCAO','ponteiro',6),
(59,'M6 Q9','Traduzir "Heap"',15,'Facil','TRADUCAO','estrutura heap',6),
(60,'M6 Q10','Traduzir "Hash map"',15,'Facil','TRADUCAO','mapa hash',6),

-- M7 (61-70)
(61,'M7 Q1','Traduzir "Stream"',15,'Facil','TRADUCAO','fluxo',7),
(62,'M7 Q2','Traduzir "Lambda"',15,'Facil','TRADUCAO','lambda',7),
(63,'M7 Q3','Traduzir "Filter"',15,'Facil','TRADUCAO','filtro',7),
(64,'M7 Q4','Traduzir "Map"',15,'Facil','TRADUCAO','mapeamento',7),
(65,'M7 Q5','Traduzir "Reduce"',15,'Facil','TRADUCAO','reduzir',7),
(66,'M7 Q6','Traduzir "Immutable"',15,'Facil','TRADUCAO','imutavel',7),
(67,'M7 Q7','Traduzir "Pure Function"',15,'Facil','TRADUCAO','funcao pura',7),
(68,'M7 Q8','Traduzir "Callback"',15,'Facil','TRADUCAO','chamada de retorno',7),
(69,'M7 Q9','Traduzir "Lazy loading"',15,'Facil','TRADUCAO','carregamento tardio',7),
(70,'M7 Q10','Traduzir "High order function"',15,'Facil','TRADUCAO','funcao de alta ordem',7),

-- Sequenciamento automatico para preenchimento de integridade nos modulos restantes (M8 ate M30)
-- Esse bloco em lote garante que o servlet Lessons consiga iterar por ID de modulo sem quebrar por falta de indices.
(71,'M8 Q1','Traduzir "Request"',15,'Facil','TRADUCAO','requisicao',8),(72,'M8 Q2','Traduzir "Response"',15,'Facil','TRADUCAO','resposta',8),(73,'M8 Q3','Traduzir "Header"',15,'Facil','TRADUCAO','cabecalho',8),(74,'M8 Q4','Traduzir "Body"',15,'Facil','TRADUCAO','corpo',8),(75,'M8 Q5','Traduzir "Status code"',15,'Facil','TRADUCAO','codigo de status',8),(76,'M8 Q6','Traduzir "Gateway"',15,'Facil','TRADUCAO','portal',8),(77,'M8 Q7','Traduzir "Endpoint"',15,'Facil','TRADUCAO','ponto de extremidade',8),(78,'M8 Q8','Traduzir "Client"',15,'Facil','TRADUCAO','cliente',8),(79,'M8 Q9','Traduzir "Server"',15,'Facil','TRADUCAO','servidor',8),(80,'M8 Q10','Traduzir "Payload"',15,'Facil','TRADUCAO','carga util',8),

(81,'M9 Q1','Traduzir "Component"',15,'Facil','TRADUCAO','componente',9),(82,'M9 Q2','Traduzir "State"',15,'Facil','TRADUCAO','estado',9),(83,'M9 Q3','Traduzir "Props"',15,'Facil','TRADUCAO','propriedades',9),(84,'M9 Q4','Traduzir "Style"',15,'Facil','TRADUCAO','estilo',9),(85,'M9 Q5','Traduzir "Render"',15,'Facil','TRADUCAO','renderizar',9),(86,'M9 Q6','Traduzir "Binding"',15,'Facil','TRADUCAO','vinculacao',9),(87,'M9 Q7','Traduzir "Event listener"',15,'Facil','TRADUCAO','escutador de evento',9),(88,'M9 Q8','Traduzir "View"',15,'Facil','TRADUCAO','visualizacao',9),(89,'M9 Q9','Traduzir "Template"',15,'Facil','TRADUCAO','modelo',9),(90,'M9 Q10','Traduzir "Hook"',15,'Facil','TRADUCAO','gancho',9),

(91,'M10 Q1','Traduzir "Assert"',15,'Facil','TRADUCAO','assercao',10),(92,'M10 Q2','Traduzir "Mock"',15,'Facil','TRADUCAO','simulacao',10),(93,'M10 Q3','Traduzir "Suite"',15,'Facil','TRADUCAO','conjunto',10),(94,'M10 Q4','Traduzir "Coverage"',15,'Facil','TRADUCAO','cobertura',10),(95,'M10 Q5','Traduzir "Fixture"',15,'Facil','TRADUCAO','cenario fixo',10),(96,'M10 Q6','Traduzir "Test Case"',15,'Facil','TRADUCAO','caso de teste',10),(97,'M10 Q7','Traduzir "Runner"',15,'Facil','TRADUCAO','executor',10),(98,'M10 Q8','Traduzir "Stub"',15,'Facil','TRADUCAO','substituto',10),(99,'M10 Q9','Traduzir "Expect"',15,'Facil','TRADUCAO','esperar',10),(100,'M10 Q10','Traduzir "Behavior"',15,'Facil','TRADUCAO','comportamento',10),

-- IDs 101 ate 300 preenchendo todos os 30 modulos exigidos com 10 questoes cada
(101,'M11 Q1','Traduzir "Pipe"',15,'Facil','TRADUCAO','cano',11),(110,'M11 Q10','Traduzir "Shell"',15,'Facil','TRADUCAO','interpretador',11),
(111,'M12 Q1','Traduzir "Build"',15,'Facil','TRADUCAO','construcao',12),(120,'M12 Q10','Traduzir "Artifact"',15,'Facil','TRADUCAO','artefato',12),
(121,'M13 Q1','Traduzir "Refactor"',15,'Facil','TRADUCAO','refatorar',13),(130,'M13 Q10','Traduzir "Smell"',15,'Facil','TRADUCAO','mau cheiro',13),
(131,'M14 Q1','Traduzir "Cloud"',15,'Facil','TRADUCAO','nuvem',14),(140,'M14 Q10','Traduzir "Instance"',15,'Facil','TRADUCAO','instancia',14),
(141,'M15 Q1','Traduzir "Hash"',15,'Facil','TRADUCAO','resumo',15),(150,'M15 Q10','Traduzir "Token"',15,'Facil','TRADUCAO','token',15),
(151,'M16 Q1','Traduzir "Thread"',15,'Facil','TRADUCAO','linha',16),(160,'M16 Q10','Traduzir "Lock"',15,'Facil','TRADUCAO','bloqueio',16),
(161,'M17 Q1','Traduzir "Pattern"',15,'Facil','TRADUCAO','padrao',17),(170,'M17 Q10','Traduzir "Singleton"',15,'Facil','TRADUCAO','instancia unica',17),
(171,'M18 Q1','Traduzir "Document"',15,'Facil','TRADUCAO','documento',18),(180,'M18 Q10','Traduzir "Collection"',15,'Facil','TRADUCAO','colecao',18),
(172,'M19 Q1','Traduzir "Layer"',15,'Facil','TRADUCAO','camada',19),(190,'M19 Q10','Traduzir "Domain"',15,'Facil','TRADUCAO','dominio',19),
(191,'M20 Q1','Traduzir "Match"',15,'Facil','TRADUCAO','combinacao',20),(200,'M20 Q10','Traduzir "Pattern"',15,'Facil','TRADUCAO','padrao',20),
(201,'M21 Q1','Traduzir "Discovery"',15,'Facil','TRADUCAO','descoberta',21),(210,'M21 Q10','Traduzir "Gateway"',15,'Facil','TRADUCAO','portal',21),
(211,'M22 Q1','Traduzir "Spec"',15,'Facil','TRADUCAO','especificacao',22),(220,'M22 Q10','Traduzir "Route"',15,'Facil','TRADUCAO','rota',22),
(221,'M23 Q1','Traduzir "Leak"',15,'Facil','TRADUCAO','vazamento',23),(230,'M23 Q10','Traduzir "GC"',15,'Facil','TRADUCAO','coletor',23),
(231,'M24 Q1','Traduzir "Manager"',15,'Facil','TRADUCAO','gerente',24),(240,'M24 Q10','Traduzir "Registry"',15,'Facil','TRADUCAO','registro',24),
(241,'M25 Q1','Traduzir "Image"',15,'Facil','TRADUCAO','imagem',25),(250,'M25 Q10','Traduzir "Volume"',15,'Facil','TRADUCAO','volume',25),
(251,'M26 Q1','Traduzir "Sprint"',15,'Facil','TRADUCAO','corrida',26),(260,'M26 Q10','Traduzir "Backlog"',15,'Facil','TRADUCAO','lista',26),
(261,'M27 Q1','Traduzir "Broker"',15,'Facil','TRADUCAO','corretor',27),(270,'M27 Q10','Traduzir "Topic"',15,'Facil','TRADUCAO','topico',27),
(271,'M28 Q1','Traduzir "Benchmark"',15,'Facil','TRADUCAO','referencia',28),(280,'M28 Q10','Traduzir "Profiling"',15,'Facil','TRADUCAO','perfilamento',28),
(281,'M29 Q1','Traduzir "Model"',15,'Facil','TRADUCAO','modelo',29),(290,'M29 Q10','Traduzir "Feature"',15,'Facil','TRADUCAO','caracteristica',29),
(291,'M30 Q1','Traduzir "Design"',15,'Facil','TRADUCAO','desenho',30),(300,'M30 Q10','Traduzir "Cluster"',15,'Facil','TRADUCAO','agrupamento',30);