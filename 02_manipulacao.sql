-- 02_manipulacao.sql
-- Projeto: Qualidade da internet móvel em Moçambique
-- Autora: Reginalda Hortêncio Francisco Randinho

USE bd_internet_movel;

-- =========================================
-- 1. SELECT simples (WHERE e ORDER BY)
-- =========================================

-- Cidadãos registados, por ordem alfabética
SELECT nome, email, perfil
FROM utilizador
WHERE perfil = 'cidadao'
ORDER BY nome;

-- Estações 4G com torre acima de 30 metros, da mais alta para a mais baixa
SELECT codigo, tecnologia_principal, altura_torre_m
FROM estacao_base
WHERE tecnologia_principal = '4G' AND altura_torre_m > 30
ORDER BY altura_torre_m DESC;

-- Pacotes até 100 MT, do mais barato para o mais caro
SELECT nome, preco, dados_gb
FROM pacote
WHERE preco < 100
ORDER BY preco ASC;

-- =========================================
-- 2. SELECT com JOIN
-- =========================================

-- Reclamações com o nome do cidadão, a operadora e a localidade
SELECT r.id_reclamacao, u.nome AS cidadao, o.nome AS operadora,
       l.nome AS localidade, r.descricao, r.estado
FROM reclamacao r
JOIN utilizador u ON r.id_utilizador = u.id_utilizador
JOIN operadora o ON r.id_operadora = o.id_operadora
JOIN localidade l ON r.id_localidade = l.id_localidade
ORDER BY r.data;

-- Estações base da província de Sofala, com operadora e localidade
SELECT l.nome AS localidade, l.distrito, e.codigo,
       o.nome AS operadora, e.tecnologia_principal
FROM estacao_base e
JOIN localidade l ON e.id_localidade = l.id_localidade
JOIN operadora o ON e.id_operadora = o.id_operadora
WHERE l.provincia = 'Sofala'
ORDER BY l.nome;

-- =========================================
-- 3. UPDATE
-- =========================================

-- A reclamação 1 passou a estar em análise
UPDATE reclamacao
SET estado = 'em_analise'
WHERE id_reclamacao = 1;

-- O pacote 1 teve redução de preço
UPDATE pacote
SET preco = 45.00
WHERE id_pacote = 1;

-- =========================================
-- 4. DELETE que respeita as chaves estrangeiras
-- =========================================

-- Apaga uma reclamação (tabela filha). Não se apaga o utilizador nem a localidade,
-- porque outras tabelas dependem deles.
DELETE FROM reclamacao
WHERE id_reclamacao = 19;

-- =========================================
-- 5. Teste de integridade (ERRO ESPERADO)
-- =========================================

-- Tenta registar uma medição com id_operadora = 99, que não existe na tabela operadora.
-- O MySQL deve recusar: "#1452 Cannot add or update a child row: a foreign key constraint fails"
INSERT INTO medicao (id_localidade, nr_medicao, data_hora, tecnologia,
                     download_mbps, upload_mbps, latencia_ms, sinal_dbm,
                     id_operadora, id_utilizador)
VALUES (1, 99, '2026-10-10 10:00:00', '4G', 5.00, 1.00, 60.00, -90, 99, 3);
