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
-- 2. ADICIONANDO 30 MODULOS (PROGRAMACAO E INGLES INSTRUMENTAL)
-- ==========================================================
INSERT IGNORE INTO modulos (id, titulo, descricao, ordem, ativo) VALUES
(1, 'Modulo 1: Technical Reading', 'Vocabulario essencial para leitura de documentacao tecnica e APIs.', 1, true),
(2, 'Modulo 2: Version Control & Git', 'Termos em ingles mais utilizados no fluxo de versionamento de codigo.', 2, true),
(3, 'Modulo 3: Database & SQL Terms', 'Ingles aplicado a modelagem de dados, queries e tabelas.', 3, true),
(4, 'Modulo 4: Object Orientation', 'Classes, objetos, heranca e polimorfismo explicados na lingua inglesa.', 4, true),
(5, 'Modulo 5: Exception Handling', 'Tratamento de erros, blocos try-catch e fluxo defensivo de codigo.', 5, true),
(6, 'Modulo 6: Data Structures', 'Filas, pilhas, arvores e a terminologia de algoritmos.', 6, true),
(7, 'Modulo 7: Functional Programming', 'Lambdas, streams e funcoes de alta ordem em ambientes modernos.', 7, true),
(8, 'Modulo 8: HTTP & Web Services', 'Verbos HTTP, codigos de status, mudancas de estado e contratos REST.', 8, true),
(9, 'Modulo 9: Frontend Architecture', 'Document Object Model, componentes, estilizacao e renderizacao.', 9, true),
(10, 'Modulo 10: Software Testing', 'Testes unitarios, assercoes, mocks e integracao continua.', 10, true),
(11, 'Modulo 11: Linux & Terminal', 'Comandos bash, pipes, redirecionamentos e manipulacao de arquivos.', 11, true),
(12, 'Modulo 12: CI/CD Pipelines', 'Building, automation, deployment e logs em servidores integrados.', 12, true),
(13, 'Modulo 13: Clean Code', 'Refatoracao, nomenclatura limpa, legibilidade e manutenibilidade.', 13, true),
(14, 'Modulo 14: Cloud Computing', 'Instancias escalaveis, containers, virtualizacao e nuvem.', 14, true),
(15, 'Modulo 15: Security', 'Criptografia, hashing, tokens JWT e payloads de autenticacao.', 15, true),
(16, 'Modulo 16: Concurrency', 'Processamento paralelo, sincronizacao, deadlocks e assincronismo.', 16, true),
(17, 'Modulo 17: Design Patterns', 'Padroes criacionais, estruturais, comportamentais e organizacao.', 17, true),
(18, 'Modulo 18: NoSQL Databases', 'Documentos, pares chave-valor, grafos e bancos nao relacionais.', 18, true),
(19, 'Modulo 19: Clean Architecture', 'Inversao de controle, isolamento de camadas e entidades puras.', 19, true),
(20, 'Modulo 20: Regular Expressions', 'Padroes de busca, regex, validacao de strings e parsers.', 20, true),
(21, 'Modulo 21: Microservices', 'Sistemas distribuidos, gateways, service discovery e barramentos.', 21, true),
(22, 'Modulo 22: API Documentation', 'Swagger, Open API, documentacao viva e especificacao de rotas.', 22, true),
(23, 'Modulo 23: Memory Management', 'Garbage collection, vazamentos de memoria, heap e stack allocation.', 23, true),
(24, 'Modulo 24: Package Managers', 'Dependencias, maven, npm, gerenciamento de builds e artefatos.', 24, true),
(25, 'Modulo 25: Containerization', 'Docker containers, imagens isoladas, volumes e redes virtuais.', 25, true),
(26, 'Modulo 26: Agile Frameworks', 'Scrum, sprints, backlogs, user stories e organizacao de times.', 26, true),
(27, 'Modulo 27: Message Queues', 'Produtores, consumidores, topicos e barramentos assincronos.', 27, true),
(28, 'Modulo 28: Code Optimization', 'Analise assintotica, Big O notation, gargalos e performance.', 28, true),
(29, 'Modulo 29: Data Science', 'Machine learning, processamento de dados e analises preditivas.', 29, true),
(30, 'Modulo 30: System Design', 'Escalabilidade horizontal, balanceamento de carga e alta disponibilidade.', 30, true);

-- ==========================================================
-- 3. ADICIONANDO 30 CONQUISTAS (UMA PARA CADA MODULO)
-- ==========================================================
INSERT IGNORE INTO conquista (id, codigo, titulo, descricao, badge_icone, xp_bonus) VALUES
(1, 'CONQ_MOD_1', 'Leitor Tecnico', 'Completou com sucesso o Modulo 1.', 'C1', 50),
(2, 'CONQ_MOD_2', 'Mestre do Git', 'Completou com sucesso o Modulo 2.', 'C2', 50),
(3, 'CONQ_MOD_3', 'Mestre dos Dados', 'Completou com sucesso o Modulo 3.', 'C3', 50),
(4, 'CONQ_MOD_4', 'Arquiteto OO', 'Completou com sucesso o Modulo 4.', 'C4', 50),
(5, 'CONQ_MOD_5', 'Bug Hunter', 'Completou com sucesso o Modulo 5.', 'C5', 50),
(6, 'CONQ_MOD_6', 'Estruturador', 'Completou com sucesso o Modulo 6.', 'C6', 50),
(7, 'CONQ_MOD_7', 'Dev Funcional', 'Completou com sucesso o Modulo 7.', 'C7', 50),
(8, 'CONQ_MOD_8', 'Web Navigator', 'Completou com sucesso o Modulo 8.', 'C8', 50),
(9, 'CONQ_MOD_9', 'Estilista DOM', 'Completou com sucesso o Modulo 9.', 'C9', 50),
(10, 'CONQ_MOD_10', 'Quality Assurance', 'Completou com sucesso o Modulo 10.', 'C10', 50),
(11, 'CONQ_MOD_11', 'Sysadmin Junior', 'Completou com sucesso o Modulo 11.', 'C11', 50),
(12, 'CONQ_MOD_12', 'Automation King', 'Completou com sucesso o Modulo 12.', 'C12', 50),
(13, 'CONQ_MOD_13', 'Artesao de Codigo', 'Completou com sucesso o Modulo 13.', 'C13', 50),
(14, 'CONQ_MOD_14', 'Navegador da Nuvem', 'Completou com sucesso o Modulo 14.', 'C14', 50),
(15, 'CONQ_MOD_15', 'Cripto Guardiao', 'Completou com sucesso o Modulo 15.', 'C15', 50),
(16, 'CONQ_MOD_16', 'Paralelista', 'Completou com sucesso o Modulo 16.', 'C16', 50),
(17, 'CONQ_MOD_17', 'Padronizador', 'Completou com sucesso o Modulo 17.', 'C17', 50),
(18, 'CONQ_MOD_18', 'NoSQL Expert', 'Completou com sucesso o Modulo 18.', 'C18', 50),
(19, 'CONQ_MOD_19', 'Clean Architect', 'Completou com sucesso o Modulo 19.', 'C19', 50),
(20, 'CONQ_MOD_20', 'Regex Ninja', 'Completou com sucesso o Modulo 20.', 'C20', 50),
(21, 'CONQ_MOD_21', 'Micro Dev', 'Completou com sucesso o Modulo 21.', 'C21', 50),
(22, 'CONQ_MOD_22', 'Documentador', 'Completou com sucesso o Modulo 22.', 'C22', 50),
(23, 'CONQ_MOD_23', 'Collector Senior', 'Completou com sucesso o Modulo 23.', 'C23', 50),
(24, 'CONQ_MOD_24', 'Gerente de Build', 'Completou com sucesso o Modulo 24.', 'C24', 50),
(25, 'CONQ_MOD_25', 'Capitao Docker', 'Completou com sucesso o Modulo 25.', 'C25', 50),
(26, 'CONQ_MOD_26', 'Agilista Pratico', 'Completou com sucesso o Modulo 26.', 'C26', 50),
(27, 'CONQ_MOD_27', 'Fila Ininterrupta', 'Completou com sucesso o Modulo 27.', 'C27', 50),
(28, 'CONQ_MOD_28', 'Mestre da Escala', 'Completou com sucesso o Modulo 28.', 'C28', 50),
(29, 'CONQ_MOD_29', 'Cientista de Dados', 'Completou com sucesso o Modulo 29.', 'C29', 50),
(30, 'CONQ_MOD_30', 'Arquiteto Supremo', 'Completou com sucesso o Modulo 30.', 'C30', 50);

-- ==========================================================
-- 4. ADICIONANDO 10 DESAFIOS PARA CADA MODULO (COM TRADUCOES TECNICAS REAIS)
-- ==========================================================

-- --------- MODULO 1: Technical Reading ---------
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(1, 'Keywords', 'Traduza a palavra "Void" no contexto de metodos que nao retornam valor.', 15, 'Facil', 'TRADUCAO', 'vazio', 1),
(2, 'API Reference', 'Preencha a lacuna com o termo correto em ingles: "O framework lanca uma excecao..."', 25, 'Facil', 'LACUNA', 'throws', 1),
(3, 'Technical Verbs', 'O que significa o verbo "To Deploy" no ciclo de vida de software?', 30, 'Medio', 'MULTIPLA_ESCOLHA', 'Implantar', 1),
(4, 'Data Structures', 'Traduza o termo "Array" (estrutura sequencial).', 15, 'Facil', 'TRADUCAO', 'vetor', 1),
(5, 'Loop Context', 'Traduza a expressao "While loop".', 15, 'Facil', 'TRADUCAO', 'laco de repeticao', 1),
(6, 'Framework behavior', 'Preencha a lacuna: "O container gerencia o ciclo de vida..."', 25, 'Medio', 'LACUNA', 'manages', 1),
(7, 'Package Statement', 'Qual palavra-chave e usada no Java para trazer pacotes externos?', 20, 'Facil', 'MULTIPLA_ESCOLHA', 'import', 1),
(8, 'Variables', 'Traduza o termo tecnico "String" no contexto de texto.', 15, 'Facil', 'TRADUCAO', 'cadeia de caracteres', 1),
(9, 'Class Inheritance', 'Preencha a lacuna: "A classe filha estende a classe pai."', 25, 'Medio', 'LACUNA', 'extends', 1),
(10, 'Compilation error', 'Qual termo indica um erro detectado pelo compilador antes de rodar o app?', 30, 'Medio', 'MULTIPLA_ESCOLHA', 'Compile-time error', 1);

INSERT IGNORE INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES
(2, 'The framework', 'an exception if the file is not found.', 'throws'),
(6, 'The container', 'the lifecycle of components.', 'manages'),
(9, 'The subclass', 'the base class in Java.', 'extends');

INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES
(3, 'Deletar;Implantar;Compilar;Testar'),
(7, 'import;include;require;package'),
(10, 'Runtime error;Compile-time error;Syntax error;Logic error');

-- --------- MODULO 2: Version Control & Git ---------
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(11, 'Git Workflow', 'Traduza o termo "Merge" usado ao juntar o codigo de duas branches.', 20, 'Facil', 'TRADUCAO', 'mesclar', 2),
(12, 'Git Remote', 'Complete a lacuna com o comando que apenas baixa atualizacoes do remoto sem aplicar ao codigo local.', 25, 'Medio', 'LACUNA', 'fetch', 2),
(13, 'Git Actions', 'Qual comando faz uma copia exata de um repositorio remoto para a sua maquina?', 20, 'Facil', 'MULTIPLA_ESCOLHA', 'Clone', 2),
(14, 'Git Undo', 'Traduza a acao "Stash" usada para arquivar mudancas temporarias nao commitadas.', 35, 'Dificil', 'TRADUCAO', 'armazenar', 2),
(15, 'Git History', 'Traduza o termo "Commit log".', 20, 'Facil', 'TRADUCAO', 'historico de alteracoes', 2),
(16, 'Git Worktree', 'Complete a lacuna do comando usado para trocar de branch no terminal.', 25, 'Medio', 'LACUNA', 'checkout', 2),
(17, 'Git Sharing', 'Qual comando envia definitivamente seus commits locais para o GitHub?', 20, 'Facil', 'MULTIPLA_ESCOLHA', 'git push', 2),
(18, 'Git Branching', 'O que significa a expressao "Feature branch"?', 20, 'Facil', 'TRADUCAO', 'ramificacao de funcionalidade', 2),
(19, 'Git Review', 'Complete a lacuna: "Abra um pull request para revisao de codigo."', 25, 'Medio', 'LACUNA', 'request', 2),
(20, 'Git Integration', 'Qual termo indica que o Git nao soube unir duas edicoes na mesma linha de codigo?', 30, 'Medio', 'MULTIPLA_ESCOLHA', 'Merge conflict', 2);

INSERT IGNORE INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES
(12, 'You should run git', 'to download metadata from remote branches safely.', 'fetch'),
(16, 'To switch to another branch, execute git', 'followed by the branch name.', 'checkout'),
(19, 'Please open a pull', 'so the tech lead can review your code.', 'request');

INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES
(13, 'Commit;Fork;Clone;Branch'),
(17, 'git pull;git fetch;git push;git commit'),
(20, 'Code update;Merge conflict;Version match;Branch block');

-- --------- MODULO 3: Database & SQL ---------
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(21, 'SQL Filtering', 'Traduza a clausula "Where" usada para filtrar registros.', 15, 'Facil', 'TRADUCAO', 'onde', 3),
(22, 'Database Constraints', 'Complete: "A chave estrangeira garante integridade referencial."', 30, 'Medio', 'LACUNA', 'foreign', 3),
(23, 'Database Sorting', 'Qual comando SQL instrui a ordenacao decrescente dos dados?', 25, 'Facil', 'MULTIPLA_ESCOLHA', 'DESC', 3),
(24, 'SQL Modification', 'Traduza a instrucao "Update row" no contexto de SQL.', 20, 'Facil', 'TRADUCAO', 'atualizar linha', 3),
(25, 'Database Relationships', 'Traduza o termo tecnico "Join".', 20, 'Facil', 'TRADUCAO', 'juncao', 3),
(26, 'SQL Insertion', 'Complete a lacuna do comando SQL para inserir dados.', 25, 'Facil', 'LACUNA', 'into', 3),
(27, 'Database Performance', 'Qual estrutura e criada para acelerar operacoes de busca em colunas?', 25, 'Facil', 'MULTIPLA_ESCOLHA', 'Index', 3),
(28, 'SQL Management', 'Qual o significado do comando destrutivo "Drop Table"?', 20, 'Facil', 'TRADUCAO', 'excluir tabela', 3),
(29, 'Database Concepts', 'Complete a lacuna: "Tabelas relacionais usam chaves primarias."', 25, 'Medio', 'LACUNA', 'primary', 3),
(30, 'SQL Aggregations', 'Qual funcao nativa conta a quantidade total de registros encontrados?', 30, 'Medio', 'MULTIPLA_ESCOLHA', 'COUNT', 3);

INSERT IGNORE INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES
(22, 'The', 'key constraint ensures referential integrity between tables.', 'foreign'),
(26, 'Use INSERT', 'to add new rows to the database.', 'into'),
(29, 'Relational databases use', 'keys to uniquely identify a record.', 'primary');

INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES
(23, 'ASC;DESC;GROUP;ORDER'),
(27, 'View;Index;Query;Trigger'),
(30, 'SUM;AVG;COUNT;MAX');

-- --------- MODULOS 4 A 10 (Traducoes Tecnicas e Desafios Relevantes) ---------
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(31, 'OO Concepts', 'Traduza a palavra "Class" (Molde de objetos).', 15, 'Facil', 'TRADUCAO', 'classe', 4),
(32, 'OO Lifecycle', 'Complete: "O construtor inicializa a instancia."', 25, 'Medio', 'LACUNA', 'constructor', 4),
(33, 'OO Visibility', 'Qual modificador de acesso bloqueia visibilidade de fora da classe?', 20, 'Facil', 'MULTIPLA_ESCOLHA', 'private', 4),
(34, 'OO Principles', 'Traduza o conceito "Inheritance".', 20, 'Facil', 'TRADUCAO', 'heranca', 4),
(35, 'OO Principles', 'Traduza o concept "Polymorphism" (muitas formas).', 20, 'Facil', 'TRADUCAO', 'polimorfismo', 4),
(36, 'OO Principles', 'O que significa "Encapsulation"?', 20, 'Facil', 'TRADUCAO', 'encapsulamento', 4),
(37, 'OO Contracts', 'Traduza o termo "Interface" (contrato).', 15, 'Facil', 'TRADUCAO', 'interface', 4),
(38, 'OO Actions', 'Traduza "Method" (funcao atrelada a objeto).', 15, 'Facil', 'TRADUCAO', 'metodo', 4),
(39, 'OO Data', 'Traduza "Attribute" ou "Property".', 15, 'Facil', 'TRADUCAO', 'propriedade', 4),
(40, 'OO Entities', 'Traduza "Object" (instancia).', 15, 'Facil', 'TRADUCAO', 'objeto', 4);

INSERT IGNORE INTO desafio_lacuna (id_desafio, texto_antes, texto_depois, palavra_omitida) VALUES (32, 'The', 'initializes the state of the object.', 'constructor');
INSERT IGNORE INTO desafio_multipla_escolha (id_desafio, opcoes) VALUES (33, 'public;protected;private;default');

INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(41, 'Exception Blocks', 'Qual o significado do bloco "Try"?', 15, 'Facil', 'TRADUCAO', 'tentar', 5),
(42, 'Exception Blocks', 'Qual o significado do bloco "Catch"?', 15, 'Facil', 'TRADUCAO', 'capturar', 5),
(43, 'App Failures', 'Traduza "Runtime Error".', 20, 'Medio', 'TRADUCAO', 'erro de tempo de execucao', 5),
(44, 'Handling', 'Traduza o termo "Exception".', 15, 'Facil', 'TRADUCAO', 'excecao', 5),
(45, 'Guarantees', 'Traduza a clausula "Finally" (que sempre executa).', 15, 'Facil', 'TRADUCAO', 'finalmente', 5),
(46, 'Debugging', 'O que e a "Stacktrace"?', 25, 'Medio', 'TRADUCAO', 'pilha de chamadas', 5),
(47, 'Alerts', 'Traduza "Warning".', 15, 'Facil', 'TRADUCAO', 'aviso', 5),
(48, 'Action verbs', 'O que significa "Throw" no contexto de excecoes?', 15, 'Facil', 'TRADUCAO', 'lancar', 5),
(49, 'Code Issues', 'Traduza a giria de TI "Bug".', 15, 'Facil', 'TRADUCAO', 'defeito', 5),
(50, 'Code Resolvers', 'O que e um "Error Handler"?', 20, 'Medio', 'TRADUCAO', 'manipulador de erros', 5);

INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(51, 'Collections', 'Traduza "Queue" (FIFO).', 20, 'Facil', 'TRADUCAO', 'fila', 6),
(52, 'Collections', 'Traduza "Stack" (LIFO).', 20, 'Facil', 'TRADUCAO', 'pilha', 6),
(53, 'Trees', 'Traduza "Node" (Elemento de uma arvore ou lista).', 15, 'Facil', 'TRADUCAO', 'no', 6),
(54, 'Trees', 'Traduza "Binary Tree".', 20, 'Facil', 'TRADUCAO', 'arvore binaria', 6),
(55, 'Lists', 'Traduza "Linked List".', 25, 'Medio', 'TRADUCAO', 'lista encadeada', 6),
(56, 'Algorithms', 'Traduza "Binary Search".', 20, 'Facil', 'TRADUCAO', 'busca binaria', 6),
(57, 'Advanced', 'Traduza "Graph" (vertices e arestas).', 15, 'Facil', 'TRADUCAO', 'grafo', 6),
(58, 'Memory', 'Traduza "Pointer" em C/C++.', 15, 'Facil', 'TRADUCAO', 'ponteiro', 6),
(59, 'Memory', 'Traduza "Heap allocation".', 25, 'Dificil', 'TRADUCAO', 'alocacao dinamica', 6),
(60, 'Hashing', 'Traduza "Hash map" ou dicionario.', 20, 'Medio', 'TRADUCAO', 'mapa de dispersao', 6);

INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(61, 'Data Flow', 'Traduza "Stream" (sequencia de dados).', 15, 'Facil', 'TRADUCAO', 'fluxo', 7),
(62, 'Functions', 'O que significa a expressao "Anonymous function"?', 20, 'Medio', 'TRADUCAO', 'funcao anonima', 7),
(63, 'Operations', 'Traduza "Filter" em manipulacao de arrays.', 15, 'Facil', 'TRADUCAO', 'filtrar', 7),
(64, 'Operations', 'Traduza o metodo "Map" (transformar dados).', 15, 'Facil', 'TRADUCAO', 'mapear', 7),
(65, 'Operations', 'Traduza "Reduce" (agregar resultados).', 15, 'Facil', 'TRADUCAO', 'reduzir', 7),
(66, 'State', 'O que significa "Immutable" na programacao funcional?', 20, 'Facil', 'TRADUCAO', 'imutavel', 7),
(67, 'State', 'O que e uma "Pure Function"?', 20, 'Facil', 'TRADUCAO', 'funcao pura', 7),
(68, 'Events', 'Traduza "Callback function".', 25, 'Medio', 'TRADUCAO', 'funcao de retorno', 7),
(69, 'Performance', 'Traduza a tecnica "Lazy evaluation".', 30, 'Dificil', 'TRADUCAO', 'avaliacao preguicosa', 7),
(70, 'Functions', 'O que e uma "High order function"?', 30, 'Dificil', 'TRADUCAO', 'funcao de alta ordem', 7);

INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(71, 'HTTP', 'Traduza "Request".', 15, 'Facil', 'TRADUCAO', 'requisicao', 8),
(72, 'HTTP', 'Traduza "Response".', 15, 'Facil', 'TRADUCAO', 'resposta', 8),
(73, 'HTTP', 'Traduza "Header" no pacote HTTP.', 15, 'Facil', 'TRADUCAO', 'cabecalho', 8),
(74, 'HTTP', 'Traduza "Body" onde vai o JSON.', 15, 'Facil', 'TRADUCAO', 'corpo', 8),
(75, 'HTTP', 'Traduza "Status code".', 15, 'Facil', 'TRADUCAO', 'codigo de estado', 8),
(76, 'Networking', 'O que significa "Gateway"?', 20, 'Medio', 'TRADUCAO', 'porta de entrada', 8),
(77, 'APIs', 'Traduza "Endpoint".', 25, 'Medio', 'TRADUCAO', 'ponto de acesso', 8),
(78, 'Architecture', 'Traduza "Client-side".', 20, 'Facil', 'TRADUCAO', 'lado do cliente', 8),
(79, 'Architecture', 'Traduza "Server-side".', 20, 'Facil', 'TRADUCAO', 'lado do servidor', 8),
(80, 'Data', 'O que significa "Payload"?', 25, 'Dificil', 'TRADUCAO', 'carga de dados', 8);

INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(81, 'UI', 'Traduza "Component" no React/Angular.', 15, 'Facil', 'TRADUCAO', 'componente', 9),
(82, 'UI', 'Traduza "State" (dados do componente).', 15, 'Facil', 'TRADUCAO', 'estado', 9),
(83, 'React', 'O que significa "Props" (properties)?', 15, 'Facil', 'TRADUCAO', 'propriedades', 9),
(84, 'CSS', 'Traduza "Stylesheet".', 20, 'Facil', 'TRADUCAO', 'folha de estilos', 9),
(85, 'DOM', 'O que significa "Render"?', 15, 'Facil', 'TRADUCAO', 'renderizar', 9),
(86, 'Data', 'Traduza "Data binding".', 25, 'Medio', 'TRADUCAO', 'vinculacao de dados', 9),
(87, 'Events', 'O que e um "Event listener"?', 25, 'Medio', 'TRADUCAO', 'ouvinte de eventos', 9),
(88, 'Architecture', 'Traduza "View" no MVC.', 15, 'Facil', 'TRADUCAO', 'visao', 9),
(89, 'HTML', 'Traduza "Template".', 15, 'Facil', 'TRADUCAO', 'modelo de layout', 9),
(90, 'React', 'O que significa o termo "Hook"?', 20, 'Medio', 'TRADUCAO', 'gancho', 9);

INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(91, 'Testing', 'Traduza "Assertion" (validacao de teste).', 20, 'Medio', 'TRADUCAO', 'assercao', 10),
(92, 'Testing', 'O que e um "Mock object"?', 25, 'Medio', 'TRADUCAO', 'objeto simulado', 10),
(93, 'Testing', 'Traduza "Test suite".', 20, 'Facil', 'TRADUCAO', 'suite de testes', 10),
(94, 'Metrics', 'Traduza "Code coverage".', 20, 'Medio', 'TRADUCAO', 'cobertura de codigo', 10),
(95, 'Setup', 'O que e "Test fixture"?', 30, 'Dificil', 'TRADUCAO', 'ambiente de teste', 10),
(96, 'Testing', 'Traduza "Test Case".', 15, 'Facil', 'TRADUCAO', 'caso de teste', 10),
(97, 'Execution', 'O que e um "Test Runner"?', 20, 'Facil', 'TRADUCAO', 'executor de testes', 10),
(98, 'Mocks', 'O que e um "Stub" em testes?', 30, 'Dificil', 'TRADUCAO', 'esboco', 10),
(99, 'Syntax', 'Traduza o verbo "Expect".', 15, 'Facil', 'TRADUCAO', 'esperar', 10),
(100, 'BDD', 'Traduza "Behavior Driven Development".', 30, 'Dificil', 'TRADUCAO', 'desenvolvimento orientado a comportamento', 10);

-- --------- PREENCHIMENTO RAPIDO PARA OS MODULOS 11 AO 30 ---------
INSERT IGNORE INTO desafio (id, titulo, enunciado, xp_recompensa, dificuldade, tipo, resposta_correta, id_modulo) VALUES
(101,'Bash','Traduza "Pipe" (redirecionamento |).',15,'Facil','TRADUCAO','canalizacao',11),
(102,'Bash','Traduza "Directory".',15,'Facil','TRADUCAO','diretorio',11),
(103,'Bash','Traduza "Root user".',15,'Facil','TRADUCAO','superusuario',11),
(104,'Bash','Traduza "Permission denied".',15,'Facil','TRADUCAO','permissao negada',11),
(105,'Bash','Traduza "Environment variables".',15,'Facil','TRADUCAO','variaveis de ambiente',11),
(106,'Bash','Traduza "Process ID".',15,'Facil','TRADUCAO','identificador de processo',11),
(107,'Bash','Traduza "Background task".',15,'Facil','TRADUCAO','tarefa em segundo plano',11),
(108,'Bash','Traduza "Command line".',15,'Facil','TRADUCAO','linha de comando',11),
(109,'Bash','Traduza "Kernel".',15,'Facil','TRADUCAO','nucleo do sistema',11),
(110,'Bash','Traduza "Shell".',15,'Facil','TRADUCAO','interpretador de comandos',11),

(111,'CI/CD','Traduza "Build process".',15,'Facil','TRADUCAO','processo de construcao',12),
(112,'CI/CD','Traduza "Deployment".',15,'Facil','TRADUCAO','implantacao',12),
(113,'CI/CD','Traduza "Continuous Integration".',15,'Facil','TRADUCAO','integracao continua',12),
(114,'CI/CD','Traduza "Pipeline".',15,'Facil','TRADUCAO','esteira de entrega',12),
(115,'CI/CD','Traduza "Trigger".',15,'Facil','TRADUCAO','gatilho',12),
(116,'CI/CD','Traduza "Automation".',15,'Facil','TRADUCAO','automacao',12),
(117,'CI/CD','Traduza "Staging environment".',15,'Facil','TRADUCAO','ambiente de homologacao',12),
(118,'CI/CD','Traduza "Production".',15,'Facil','TRADUCAO','producao',12),
(119,'CI/CD','Traduza "Rollback".',15,'Facil','TRADUCAO','reversao',12),
(120,'CI/CD','Traduza "Artifact".',15,'Facil','TRADUCAO','artefato gerado',12),

(121,'Clean Code','Traduza "Refactoring".',15,'Facil','TRADUCAO','refatoracao',13),
(122,'Clean Code','Traduza "Readability".',15,'Facil','TRADUCAO','legibilidade',13),
(123,'Clean Code','Traduza "Maintainability".',15,'Facil','TRADUCAO','manutenibilidade',13),
(124,'Clean Code','Traduza "Naming conventions".',15,'Facil','TRADUCAO','convencoes de nomenclatura',13),
(125,'Clean Code','Traduza "Duplicated code".',15,'Facil','TRADUCAO','codigo duplicado',13),
(126,'Clean Code','Traduza "Dead code".',15,'Facil','TRADUCAO','codigo morto',13),
(127,'Clean Code','Traduza "Magic numbers".',15,'Facil','TRADUCAO','numeros magicos',13),
(128,'Clean Code','Traduza "Comment".',15,'Facil','TRADUCAO','comentario',13),
(129,'Clean Code','Traduza "Coupling".',15,'Facil','TRADUCAO','acoplamento',13),
(130,'Clean Code','O que significa a giria "Code smell"?',15,'Facil','TRADUCAO','indicio de problema no codigo',13),

(131,'Cloud','Traduza "Cloud computing".',15,'Facil','TRADUCAO','computacao em nuvem',14),
(132,'Cloud','Traduza "Virtual Machine".',15,'Facil','TRADUCAO','maquina virtual',14),
(133,'Cloud','Traduza "Scalability".',15,'Facil','TRADUCAO','escalabilidade',14),
(134,'Cloud','Traduza "Load Balancer".',15,'Facil','TRADUCAO','balanceador de carga',14),
(135,'Cloud','Traduza "Storage".',15,'Facil','TRADUCAO','armazenamento',14),
(136,'Cloud','Traduza "On-premises".',15,'Facil','TRADUCAO','infraestrutura local',14),
(137,'Cloud','Traduza "Bandwidth".',15,'Facil','TRADUCAO','largura de banda',14),
(138,'Cloud','Traduza "Downtime".',15,'Facil','TRADUCAO','tempo de inatividade',14),
(139,'Cloud','Traduza "Serverless".',15,'Facil','TRADUCAO','sem servidor',14),
(140,'Cloud','Traduza "Compute Instance".',15,'Facil','TRADUCAO','instancia de computacao',14),

(141,'Security','Traduza "Encryption".',15,'Facil','TRADUCAO','criptografia',15),
(142,'Security','Traduza "Decryption".',15,'Facil','TRADUCAO','descriptografia',15),
(143,'Security','Traduza "Cipher".',15,'Facil','TRADUCAO','cifra',15),
(144,'Security','Traduza "Vulnerability".',15,'Facil','TRADUCAO','vulnerabilidade',15),
(145,'Security','Traduza "Threat".',15,'Facil','TRADUCAO','ameaca',15),
(146,'Security','Traduza "Breach".',15,'Facil','TRADUCAO','violacao',15),
(147,'Security','Traduza "Firewall".',15,'Facil','TRADUCAO','parede de fogo',15),
(148,'Security','Traduza "Authorization".',15,'Facil','TRADUCAO','autorizacao',15),
(149,'Security','Traduza "Authentication".',15,'Facil','TRADUCAO','autenticacao',15),
(150,'Security','Traduza "Access Token".',15,'Facil','TRADUCAO','chave de acesso',15),

(151,'Concurrency','Traduza "Thread".',15,'Facil','TRADUCAO','linha de execucao',16),
(152,'Concurrency','Traduza "Multithreading".',15,'Facil','TRADUCAO','multiplas linhas de execucao',16),
(153,'Concurrency','Traduza "Asynchronous".',15,'Facil','TRADUCAO','assincrono',16),
(154,'Concurrency','Traduza "Synchronous".',15,'Facil','TRADUCAO','sincrono',16),
(155,'Concurrency','Traduza "Deadlock".',15,'Facil','TRADUCAO','impasse',16),
(156,'Concurrency','Traduza "Race condition".',15,'Facil','TRADUCAO','condicao de corrida',16),
(157,'Concurrency','Traduza "Task".',15,'Facil','TRADUCAO','tarefa',16),
(158,'Concurrency','Traduza "Worker".',15,'Facil','TRADUCAO','trabalhador',16),
(159,'Concurrency','Traduza "Pool".',15,'Facil','TRADUCAO','piscina de conexoes',16),
(160,'Concurrency','Traduza "Lock".',15,'Facil','TRADUCAO','trava',16),

(161,'Design Patterns','Traduza "Design Pattern".',15,'Facil','TRADUCAO','padrao de projeto',17),
(162,'Design Patterns','Traduza "Creational".',15,'Facil','TRADUCAO','criacional',17),
(163,'Design Patterns','Traduza "Structural".',15,'Facil','TRADUCAO','estrutural',17),
(164,'Design Patterns','Traduza "Behavioral".',15,'Facil','TRADUCAO','comportamental',17),
(165,'Design Patterns','Traduza "Factory".',15,'Facil','TRADUCAO','fabrica',17),
(166,'Design Patterns','Traduza "Builder".',15,'Facil','TRADUCAO','construtor',17),
(167,'Design Patterns','Traduza "Observer".',15,'Facil','TRADUCAO','observador',17),
(168,'Design Patterns','Traduza "Strategy".',15,'Facil','TRADUCAO','estrategia',17),
(169,'Design Patterns','Traduza "Decorator".',15,'Facil','TRADUCAO','decorador',17),
(170,'Design Patterns','Traduza "Singleton".',15,'Facil','TRADUCAO','instancia unica',17),

(171,'NoSQL','Traduza "Document database".',15,'Facil','TRADUCAO','banco de dados orientado a documentos',18),
(172,'NoSQL','Traduza "Key-value pair".',15,'Facil','TRADUCAO','par chave valor',18),
(173,'NoSQL','Traduza "Graph database".',15,'Facil','TRADUCAO','banco de dados em grafos',18),
(174,'NoSQL','Traduza "Wide column".',15,'Facil','TRADUCAO','coluna larga',18),
(175,'NoSQL','Traduza "Schema-less".',15,'Facil','TRADUCAO','sem esquema fixo',18),
(176,'NoSQL','Traduza "Replication".',15,'Facil','TRADUCAO','replicacao',18),
(177,'NoSQL','Traduza "Sharding".',15,'Facil','TRADUCAO','fragmentacao',18),
(178,'NoSQL','Traduza "Node".',15,'Facil','TRADUCAO','no',18),
(179,'NoSQL','Traduza "Cluster".',15,'Facil','TRADUCAO','cluster',18),
(180,'NoSQL','Traduza "Collection" (Mongo).',15,'Facil','TRADUCAO','colecao',18),

(181,'Clean Arch','Traduza "Architecture".',15,'Facil','TRADUCAO','arquitetura',19),
(182,'Clean Arch','Traduza "Layer".',15,'Facil','TRADUCAO','camada',19),
(183,'Clean Arch','Traduza "Dependency Inversion".',15,'Facil','TRADUCAO','inversao de dependencia',19),
(184,'Clean Arch','Traduza "Entity".',15,'Facil','TRADUCAO','entidade',19),
(185,'Clean Arch','Traduza "Use Case".',15,'Facil','TRADUCAO','caso de uso',19),
(186,'Clean Arch','Traduza "Controller".',15,'Facil','TRADUCAO','controlador',19),
(187,'Clean Arch','Traduza "Presenter".',15,'Facil','TRADUCAO','apresentador',19),
(188,'Clean Arch','Traduza "Boundary".',15,'Facil','TRADUCAO','fronteira',19),
(189,'Clean Arch','Traduza "Framework".',15,'Facil','TRADUCAO','arcabouco',19),
(190,'Clean Arch','Traduza "Domain".',15,'Facil','TRADUCAO','dominio da aplicacao',19),

(191,'Regex','Traduza "Regular Expression".',15,'Facil','TRADUCAO','expressao regular',20),
(192,'Regex','Traduza "Pattern matching".',15,'Facil','TRADUCAO','correspondencia de padrao',20),
(193,'Regex','Traduza "Wildcard".',15,'Facil','TRADUCAO','curinga',20),
(194,'Regex','Traduza "String parsing".',15,'Facil','TRADUCAO','analise de texto',20),
(195,'Regex','Traduza "Capture group".',15,'Facil','TRADUCAO','grupo de captura',20),
(196,'Regex','Traduza "Escape character".',15,'Facil','TRADUCAO','caractere de escape',20),
(197,'Regex','Traduza "Quantifier".',15,'Facil','TRADUCAO','quantificador',20),
(198,'Regex','Traduza "Anchor".',15,'Facil','TRADUCAO','ancora',20),
(199,'Regex','Traduza "Replace".',15,'Facil','TRADUCAO','substituir',20),
(200,'Regex','Traduza "Match".',15,'Facil','TRADUCAO','combinar',20),

(201,'Microservices','Traduza "Microservice".',15,'Facil','TRADUCAO','microsservico',21),
(202,'Microservices','Traduza "Monolith".',15,'Facil','TRADUCAO','monolito',21),
(203,'Microservices','Traduza "Service Discovery".',15,'Facil','TRADUCAO','descoberta de servico',21),
(204,'Microservices','Traduza "API Gateway".',15,'Facil','TRADUCAO','porta de entrada da api',21),
(205,'Microservices','Traduza "Orchestration".',15,'Facil','TRADUCAO','orquestracao',21),
(206,'Microservices','Traduza "Choreography".',15,'Facil','TRADUCAO','coreografia',21),
(207,'Microservices','Traduza "Resilience".',15,'Facil','TRADUCAO','resiliencia',21),
(208,'Microservices','Traduza "Fault tolerance".',15,'Facil','TRADUCAO','tolerancia a falhas',21),
(209,'Microservices','Traduza "Circuit Breaker".',15,'Facil','TRADUCAO','disjuntor',21),
(210,'Microservices','Traduza "Distributed system".',15,'Facil','TRADUCAO','sistema distribuido',21),

(211,'Docs','Traduza "Documentation".',15,'Facil','TRADUCAO','documentacao',22),
(212,'Docs','Traduza "Specification".',15,'Facil','TRADUCAO','especificacao',22),
(213,'Docs','Traduza "Parameters".',15,'Facil','TRADUCAO','parametros',22),
(214,'Docs','Traduza "Query string".',15,'Facil','TRADUCAO','cadeia de consulta',22),
(215,'Docs','Traduza "Path variable".',15,'Facil','TRADUCAO','variavel de caminho',22),
(216,'Docs','Traduza "Response body".',15,'Facil','TRADUCAO','corpo da resposta',22),
(217,'Docs','Traduza "Header params".',15,'Facil','TRADUCAO','parametros de cabecalho',22),
(218,'Docs','Traduza "Authentication token".',15,'Facil','TRADUCAO','token de autenticacao',22),
(219,'Docs','Traduza "Deprecation".',15,'Facil','TRADUCAO','obsolescencia',22),
(220,'Docs','Traduza "Route".',15,'Facil','TRADUCAO','rota',22),

(221,'Memory','Traduza "Memory leak".',15,'Facil','TRADUCAO','vazamento de memoria',23),
(222,'Memory','Traduza "Garbage Collector".',15,'Facil','TRADUCAO','coletor de lixo',23),
(223,'Memory','Traduza "Allocation".',15,'Facil','TRADUCAO','alocacao',23),
(224,'Memory','Traduza "Deallocation".',15,'Facil','TRADUCAO','liberacao',23),
(225,'Memory','Traduza "Stack memory".',15,'Facil','TRADUCAO','memoria de pilha',23),
(226,'Memory','Traduza "Heap memory".',15,'Facil','TRADUCAO','memoria dinamica',23),
(227,'Memory','Traduza "Reference".',15,'Facil','TRADUCAO','referencia',23),
(228,'Memory','Traduza "Out of memory".',15,'Facil','TRADUCAO','sem memoria',23),
(229,'Memory','Traduza "Buffer".',15,'Facil','TRADUCAO','area de transferencia',23),
(230,'Memory','Traduza "Cache".',15,'Facil','TRADUCAO','memoria temporaria',23),

(231,'Packages','Traduza "Package Manager".',15,'Facil','TRADUCAO','gerenciador de pacotes',24),
(232,'Packages','Traduza "Dependency".',15,'Facil','TRADUCAO','dependencia',24),
(233,'Packages','Traduza "Library".',15,'Facil','TRADUCAO','biblioteca',24),
(234,'Packages','Traduza "Version".',15,'Facil','TRADUCAO','versao',24),
(235,'Packages','Traduza "Repository".',15,'Facil','TRADUCAO','repositorio',24),
(236,'Packages','Traduza "Install".',15,'Facil','TRADUCAO','instalar',24),
(237,'Packages','Traduza "Update".',15,'Facil','TRADUCAO','atualizar',24),
(238,'Packages','Traduza "Uninstall".',15,'Facil','TRADUCAO','desinstalar',24),
(239,'Packages','Traduza "Script".',15,'Facil','TRADUCAO','roteiro',24),
(240,'Packages','Traduza "Registry".',15,'Facil','TRADUCAO','registro de pacotes',24),

(241,'Docker','Traduza "Container".',15,'Facil','TRADUCAO','conteiner',25),
(242,'Docker','Traduza "Image".',15,'Facil','TRADUCAO','imagem de sistema',25),
(243,'Docker','Traduza "Volume".',15,'Facil','TRADUCAO','volume de dados',25),
(244,'Docker','Traduza "Network".',15,'Facil','TRADUCAO','rede',25),
(245,'Docker','Traduza "Port mapping".',15,'Facil','TRADUCAO','mapeamento de portas',25),
(246,'Docker','Traduza "Environment".',15,'Facil','TRADUCAO','ambiente',25),
(247,'Docker','Traduza "Daemon".',15,'Facil','TRADUCAO','servico em segundo plano',25),
(248,'Docker','Traduza "Host".',15,'Facil','TRADUCAO','hospedeiro',25),
(249,'Docker','Traduza "Registry".',15,'Facil','TRADUCAO','registro de imagens',25),
(250,'Docker','Traduza "Compose".',15,'Facil','TRADUCAO','orquestrar',25),

(251,'Agile','Traduza "Agile".',15,'Facil','TRADUCAO','agil',26),
(252,'Agile','O que significa "Sprint" no Scrum?',15,'Facil','TRADUCAO','ciclo de desenvolvimento',26),
(253,'Agile','Traduza "Backlog".',15,'Facil','TRADUCAO','lista de tarefas',26),
(254,'Agile','Traduza "User Story".',15,'Facil','TRADUCAO','historia de usuario',26),
(255,'Agile','Traduza "Task".',15,'Facil','TRADUCAO','tarefa',26),
(256,'Agile','Traduza "Daily meeting".',15,'Facil','TRADUCAO','reuniao diaria',26),
(257,'Agile','Traduza "Review".',15,'Facil','TRADUCAO','revisao',26),
(258,'Agile','Traduza "Retrospective".',15,'Facil','TRADUCAO','retrospectiva',26),
(259,'Agile','Traduza "Stakeholder".',15,'Facil','TRADUCAO','parte interessada',26),
(260,'Agile','Traduza "Estimates".',15,'Facil','TRADUCAO','estimativas',26),

(261,'MQ','Traduza "Message Broker".',15,'Facil','TRADUCAO','corretor de mensagens',27),
(262,'MQ','Traduza "Producer".',15,'Facil','TRADUCAO','produtor',27),
(263,'MQ','Traduza "Consumer".',15,'Facil','TRADUCAO','consumidor',27),
(264,'MQ','Traduza "Queue".',15,'Facil','TRADUCAO','fila de mensagens',27),
(265,'MQ','Traduza "Topic".',15,'Facil','TRADUCAO','topico',27),
(266,'MQ','Traduza "Publish".',15,'Facil','TRADUCAO','publicar',27),
(267,'MQ','Traduza "Subscribe".',15,'Facil','TRADUCAO','inscrever',27),
(268,'MQ','Traduza "Acknowledgment".',15,'Facil','TRADUCAO','confirmacao de recebimento',27),
(269,'MQ','Traduza "Payload".',15,'Facil','TRADUCAO','conteudo da mensagem',27),
(270,'MQ','Traduza "Dead letter queue".',15,'Facil','TRADUCAO','fila de mensagens mortas',27),

(271,'Optimization','Traduza "Performance".',15,'Facil','TRADUCAO','desempenho',28),
(272,'Optimization','Traduza "Bottleneck".',15,'Facil','TRADUCAO','gargalo',28),
(273,'Optimization','Traduza "Throughput".',15,'Facil','TRADUCAO','taxa de transferencia',28),
(274,'Optimization','Traduza "Latency".',15,'Facil','TRADUCAO','latencia',28),
(275,'Optimization','Traduza "Caching".',15,'Facil','TRADUCAO','armazenamento em cache',28),
(276,'Optimization','Traduza "Complexity".',15,'Facil','TRADUCAO','complexidade',28),
(277,'Optimization','Traduza "Time complexity".',15,'Facil','TRADUCAO','complexidade de tempo',28),
(278,'Optimization','Traduza "Space complexity".',15,'Facil','TRADUCAO','complexidade de espaco',28),
(279,'Optimization','Traduza "Optimization".',15,'Facil','TRADUCAO','otimizacao',28),
(280,'Optimization','Traduza "Profiling".',15,'Facil','TRADUCAO','analise de desempenho',28),

(281,'AI & ML','Traduza "Machine Learning".',15,'Facil','TRADUCAO','aprendizado de maquina',29),
(282,'AI & ML','Traduza "Dataset".',15,'Facil','TRADUCAO','conjunto de dados',29),
(283,'AI & ML','Traduza "Training".',15,'Facil','TRADUCAO','treinamento',29),
(284,'AI & ML','Traduza "Model".',15,'Facil','TRADUCAO','modelo',29),
(285,'AI & ML','Traduza "Algorithm".',15,'Facil','TRADUCAO','algoritmo',29),
(286,'AI & ML','Traduza "Neural Network".',15,'Facil','TRADUCAO','rede neural',29),
(287,'AI & ML','Traduza "Deep Learning".',15,'Facil','TRADUCAO','aprendizado profundo',29),
(288,'AI & ML','Traduza "Accuracy".',15,'Facil','TRADUCAO','precisao',29),
(289,'AI & ML','Traduza "Feature extraction".',15,'Facil','TRADUCAO','extracao de caracteristicas',29),
(290,'AI & ML','Traduza "Prediction".',15,'Facil','TRADUCAO','previsao',29),

(291,'System Design','Traduza "System Architecture".',15,'Facil','TRADUCAO','arquitetura de sistemas',29),
(292,'System Design','Traduza "Scalability".',15,'Facil','TRADUCAO','escalabilidade',30),
(293,'System Design','Traduza "High Availability".',15,'Facil','TRADUCAO','alta disponibilidade',30),
(294,'System Design','Traduza "Fault Tolerance".',15,'Facil','TRADUCAO','tolerancia a falhas',30),
(295,'System Design','Traduza "Load Balancing".',15,'Facil','TRADUCAO','balanceamento de carga',30),
(296,'System Design','Traduza "Proxy".',15,'Facil','TRADUCAO','intermediario',30),
(297,'System Design','Traduza "CDN".',15,'Facil','TRADUCAO','rede de distribuicao de conteudo',30),
(298,'System Design','Traduza "Redundancy".',15,'Facil','TRADUCAO','redundancia',30),
(299,'System Design','Traduza "Throughput".',15,'Facil','TRADUCAO','vazao',30),
(300,'System Design','Traduza "Latency".',15,'Facil','TRADUCAO','tempo de resposta',30);