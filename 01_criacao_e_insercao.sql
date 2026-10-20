-- 01_criacao_e_insercao.sql
-- Projeto: Qualidade da internet móvel em Moçambique
-- Autora: Reginalda Hortêncio Francisco Randinho

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS bd_internet_movel;
CREATE DATABASE bd_internet_movel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bd_internet_movel;

-- =========================================
-- CRIAÇÃO DAS TABELAS
-- =========================================

CREATE TABLE utilizador (
    id_utilizador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    perfil ENUM('cidadao', 'tecnico', 'administrador') NOT NULL
);

CREATE TABLE operadora (
    id_operadora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE localidade (
    id_localidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    distrito VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL,
    tipo ENUM('urbana', 'rural') NOT NULL
);

CREATE TABLE estacao_base (
    id_estacao INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    tecnologia_principal ENUM('2G', '3G', '4G') NOT NULL,
    altura_torre_m DECIMAL(5,2) NOT NULL CHECK (altura_torre_m > 0),
    id_operadora INT NOT NULL,
    id_localidade INT NOT NULL,
    FOREIGN KEY (id_operadora) REFERENCES operadora(id_operadora),
    FOREIGN KEY (id_localidade) REFERENCES localidade(id_localidade)
);

CREATE TABLE pacote (
    id_pacote INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    preco DECIMAL(10,2) NOT NULL CHECK (preco >= 0),
    dados_gb DECIMAL(6,2) NOT NULL CHECK (dados_gb > 0),
    validade_dias INT NOT NULL CHECK (validade_dias > 0),
    id_operadora INT NOT NULL,
    FOREIGN KEY (id_operadora) REFERENCES operadora(id_operadora)
);

CREATE TABLE medicao (
    id_localidade INT NOT NULL,
    nr_medicao INT NOT NULL,
    data_hora DATETIME NOT NULL,
    tecnologia ENUM('2G', '3G', '4G') NOT NULL,
    download_mbps DECIMAL(8,2) NOT NULL CHECK (download_mbps >= 0),
    upload_mbps DECIMAL(8,2) NOT NULL CHECK (upload_mbps >= 0),
    latencia_ms DECIMAL(8,2) NOT NULL CHECK (latencia_ms >= 0),
    sinal_dbm INT NOT NULL CHECK (sinal_dbm BETWEEN -140 AND 0),
    id_operadora INT NOT NULL,
    id_utilizador INT NOT NULL,
    PRIMARY KEY (id_localidade, nr_medicao),
    FOREIGN KEY (id_localidade) REFERENCES localidade(id_localidade),
    FOREIGN KEY (id_operadora) REFERENCES operadora(id_operadora),
    FOREIGN KEY (id_utilizador) REFERENCES utilizador(id_utilizador)
);

CREATE TABLE reclamacao (
    id_reclamacao INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT NOT NULL,
    data DATE NOT NULL,
    estado ENUM('aberta', 'em_analise', 'resolvida') NOT NULL DEFAULT 'aberta',
    id_utilizador INT NOT NULL,
    id_operadora INT NOT NULL,
    id_localidade INT NOT NULL,
    FOREIGN KEY (id_utilizador) REFERENCES utilizador(id_utilizador),
    FOREIGN KEY (id_operadora) REFERENCES operadora(id_operadora),
    FOREIGN KEY (id_localidade) REFERENCES localidade(id_localidade)
);

-- =========================================
-- INSERÇÃO DE REGISTOS (ordem das chaves estrangeiras)
-- =========================================

INSERT INTO utilizador (nome, email, password, perfil) VALUES
('Carlos Mabunda', 'carlos.mabunda@admin.co.mz', 'hash_admin_01', 'administrador'),
('Isabel Nhantumbo', 'isabel.nhantumbo@admin.co.mz', 'hash_admin_02', 'administrador'),
('Armando Chissano', 'armando.chissano@tecnico.co.mz', 'hash_tec_03', 'tecnico'),
('Fátima Muchanga', 'fatima.muchanga@tecnico.co.mz', 'hash_tec_04', 'tecnico'),
('Júlio Machava', 'julio.machava@tecnico.co.mz', 'hash_tec_05', 'tecnico'),
('Lúcia Sitoe', 'lucia.sitoe@tecnico.co.mz', 'hash_tec_06', 'tecnico'),
('Nelson Tembe', 'nelson.tembe@tecnico.co.mz', 'hash_tec_07', 'tecnico'),
('Maria Gonzaga', 'maria.gonzaga@gmail.com', 'hash_cid_08', 'cidadao'),
('Domingos Pereira', 'domingos.pereira@gmail.com', 'hash_cid_09', 'cidadao'),
('Esperança Cumbe', 'esperanca.cumbe@gmail.com', 'hash_cid_10', 'cidadao'),
('Adelino Bila', 'adelino.bila@hotmail.com', 'hash_cid_11', 'cidadao'),
('Celeste Macuacua', 'celeste.macuacua@gmail.com', 'hash_cid_12', 'cidadao'),
('Joaquim Nhaca', 'joaquim.nhaca@yahoo.com', 'hash_cid_13', 'cidadao'),
('Rosa Mondlane', 'rosa.mondlane@gmail.com', 'hash_cid_14', 'cidadao'),
('Eduardo Macamo', 'eduardo.macamo@gmail.com', 'hash_cid_15', 'cidadao'),
('Teresa Cossa', 'teresa.cossa@hotmail.com', 'hash_cid_16', 'cidadao'),
('Abílio Guambe', 'abilio.guambe@gmail.com', 'hash_cid_17', 'cidadao'),
('Helena Sousa', 'helena.sousa@gmail.com', 'hash_cid_18', 'cidadao'),
('Salvador Mucavele', 'salvador.mucavele@gmail.com', 'hash_cid_19', 'cidadao'),
('Olívia Tivane', 'olivia.tivane@gmail.com', 'hash_cid_20', 'cidadao');

INSERT INTO operadora (nome) VALUES
('Vodacom'),
('Tmcel'),
('Movitel');

INSERT INTO localidade (nome, distrito, provincia, tipo) VALUES
('Nhamatanda Sede', 'Nhamatanda', 'Sofala', 'urbana'),
('Terceiro Bairro', 'Nhamatanda', 'Sofala', 'urbana'),
('Siluvo', 'Nhamatanda', 'Sofala', 'rural'),
('Macurungo', 'Beira', 'Sofala', 'urbana'),
('Ponta-Gea', 'Beira', 'Sofala', 'urbana'),
('Sede', 'Dondo', 'Sofala', 'urbana'),
('Sede', 'Gondola', 'Manica', 'rural'),
('Polana Caniço', 'Maputo', 'Maputo Cidade', 'urbana'),
('Matola Rio', 'Matola', 'Maputo Província', 'urbana'),
('Machava', 'Matola', 'Maputo Província', 'urbana'),
('Manhiça Sede', 'Manhiça', 'Maputo Província', 'rural'),
('Muhala', 'Nampula', 'Nampula', 'urbana'),
('Carrupeia', 'Nampula', 'Nampula', 'urbana'),
('Quelimane Sede', 'Quelimane', 'Zambézia', 'urbana'),
('Mocuba Sede', 'Mocuba', 'Zambézia', 'rural'),
('Bairro Central', 'Chimoio', 'Manica', 'urbana'),
('Xai-Xai Sede', 'Xai-Xai', 'Gaza', 'urbana'),
('Chókwè Sede', 'Chókwè', 'Gaza', 'rural'),
('Inhambane Sede', 'Inhambane', 'Inhambane', 'urbana'),
('Vilankulo Sede', 'Vilankulo', 'Inhambane', 'rural');

INSERT INTO estacao_base (codigo, tecnologia_principal, altura_torre_m, id_operadora, id_localidade) VALUES
('EB-SOF-001', '4G', 35.00, 1, 1),
('EB-SOF-002', '3G', 28.50, 2, 1),
('EB-SOF-003', '2G', 22.00, 3, 2),
('EB-SOF-004', '4G', 40.00, 1, 2),
('EB-SOF-005', '3G', 30.00, 2, 3),
('EB-SOF-006', '2G', 18.00, 3, 3),
('EB-SOF-007', '4G', 42.00, 1, 4),
('EB-SOF-008', '4G', 38.00, 2, 5),
('EB-SOF-009', '3G', 27.00, 3, 6),
('EB-MNC-001', '4G', 36.00, 1, 7),
('EB-MPT-001', '4G', 33.00, 2, 8),
('EB-MPT-002', '3G', 25.00, 3, 8),
('EB-MPT-003', '4G', 40.00, 1, 9),
('EB-MPT-004', '4G', 34.00, 2, 10),
('EB-MNH-001', '2G', 20.00, 3, 11),
('EB-NMP-001', '4G', 32.00, 1, 12),
('EB-NMP-002', '3G', 29.00, 2, 13),
('EB-ZAM-001', '4G', 37.00, 1, 14),
('EB-ZAM-002', '2G', 21.00, 3, 15),
('EB-CHM-001', '4G', 31.00, 2, 16);

INSERT INTO pacote (nome, preco, dados_gb, validade_dias, id_operadora) VALUES
('Vodacom Dados 1GB 7 dias', 50.00, 1.00, 7, 1),
('Vodacom Dados 3GB 15 dias', 150.00, 3.00, 15, 1),
('Vodacom Dados 10GB 30 dias', 400.00, 10.00, 30, 1),
('Vodacom Dados Diário 500MB', 25.00, 0.50, 1, 1),
('Vodacom Estudante 5GB 30 dias', 180.00, 5.00, 30, 1),
('Tmcel Internet 1GB 7 dias', 45.00, 1.00, 7, 2),
('Tmcel Internet 4GB 30 dias', 200.00, 4.00, 30, 2),
('Tmcel Internet 10GB 30 dias', 380.00, 10.00, 30, 2),
('Tmcel Diário 1GB', 30.00, 1.00, 1, 2),
('Tmcel Estudante 3GB 15 dias', 120.00, 3.00, 15, 2),
('Movitel Dados 1GB 7 dias', 40.00, 1.00, 7, 3),
('Movitel Dados 5GB 30 dias', 220.00, 5.00, 30, 3),
('Movitel Dados 12GB 30 dias', 420.00, 12.00, 30, 3),
('Movitel Diário 300MB', 15.00, 0.30, 1, 3),
('Movitel Estudante 2GB 30 dias', 90.00, 2.00, 30, 3),
('Vodacom Semanal 2GB', 70.00, 2.00, 7, 1),
('Tmcel Semanal 2GB', 65.00, 2.00, 7, 2),
('Movitel Semanal 2GB', 60.00, 2.00, 7, 3),
('Vodacom Mensal 20GB', 650.00, 20.00, 30, 1),
('Tmcel Mensal 15GB', 500.00, 15.00, 30, 2);

INSERT INTO medicao (id_localidade, nr_medicao, data_hora, tecnologia, download_mbps, upload_mbps, latencia_ms, sinal_dbm, id_operadora, id_utilizador) VALUES
(1, 1, '2026-09-14 09:30:00', '4G', 8.50, 2.10, 65.00, -95, 1, 3),
(2, 1, '2026-09-14 10:15:00', '3G', 1.80, 0.70, 140.00, -108, 2, 4),
(3, 1, '2026-09-15 08:00:00', '2G', 0.12, 0.05, 480.00, -118, 3, 5),
(4, 1, '2026-09-15 11:20:00', '4G', 15.20, 4.30, 40.00, -88, 1, 3),
(5, 1, '2026-09-16 14:45:00', '3G', 3.40, 1.20, 110.00, -102, 2, 6),
(6, 1, '2026-09-16 16:10:00', '2G', 0.20, 0.08, 520.00, -121, 3, 7),
(7, 1, '2026-09-17 09:05:00', '4G', 10.10, 3.00, 58.00, -92, 1, 4),
(8, 1, '2026-09-18 10:40:00', '4G', 22.50, 6.80, 35.00, -84, 2, 5),
(9, 1, '2026-09-18 13:25:00', '3G', 2.90, 0.95, 125.00, -105, 3, 6),
(10, 1, '2026-09-19 07:50:00', '4G', 9.70, 2.60, 62.00, -96, 2, 7),
(11, 1, '2026-09-21 12:00:00', '2G', 0.15, 0.06, 510.00, -119, 3, 3),
(12, 1, '2026-09-22 15:30:00', '4G', 18.30, 5.10, 42.00, -90, 1, 4),
(13, 1, '2026-09-23 09:45:00', '3G', 4.10, 1.40, 98.00, -100, 2, 5),
(14, 1, '2026-09-24 11:10:00', '4G', 12.00, 3.70, 50.00, -93, 1, 6),
(15, 1, '2026-09-25 08:35:00', '2G', 0.18, 0.07, 495.00, -117, 3, 7),
(16, 1, '2026-09-28 10:00:00', '4G', 14.80, 4.00, 46.00, -91, 2, 3),
(1, 2, '2026-10-01 09:00:00', '4G', 6.20, 1.90, 72.00, -98, 1, 4),
(2, 2, '2026-10-02 10:30:00', '3G', 2.10, 0.80, 130.00, -106, 2, 5),
(3, 2, '2026-10-03 14:00:00', '2G', 0.10, 0.04, 530.00, -122, 3, 6),
(8, 2, '2026-10-05 16:20:00', '4G', 19.90, 5.60, 38.00, -86, 1, 7);

INSERT INTO reclamacao (descricao, data, estado, id_utilizador, id_operadora, id_localidade) VALUES
('Sinal fraco e ligação instável no bairro durante a semana', '2026-09-15', 'aberta', 8, 3, 2),
('Megas acabam em poucos dias e a velocidade é muito baixa', '2026-09-16', 'em_analise', 9, 1, 4),
('Sem cobertura de internet perto das montanhas de Siluvo', '2026-09-17', 'aberta', 10, 3, 3),
('Pacote de 5GB esgotou antes do prazo de validade', '2026-09-18', 'resolvida', 11, 2, 7),
('Chamadas caem sempre que há chuva forte', '2026-09-18', 'em_analise', 12, 1, 5),
('Velocidade de upload muito lenta para enviar fotos', '2026-09-19', 'aberta', 13, 2, 8),
('Descarregar uma aplicação de 50MB demora mais de meia hora', '2026-09-20', 'em_analise', 14, 3, 6),
('Cobrança duplicada no pacote semanal', '2026-09-21', 'resolvida', 15, 1, 9),
('Rede só funciona à noite, de dia não consigo navegar', '2026-09-22', 'aberta', 16, 2, 10),
('Poucas antenas na zona, o sinal desaparece nas casas do fundo', '2026-09-23', 'aberta', 17, 3, 11),
('Internet 2G não permite abrir sites', '2026-09-24', 'em_analise', 18, 1, 12),
('Sinal 4G muito fraco dentro das escolas', '2026-09-25', 'aberta', 19, 2, 13),
('Pacote diário foi descontado sem ter sido usado', '2026-09-26', 'resolvida', 20, 3, 14),
('Latência muito alta em videochamadas', '2026-09-27', 'aberta', 8, 1, 15),
('Operadora não responde às reclamações anteriores', '2026-09-28', 'em_analise', 9, 2, 16),
('Ligação cai a cada 10 minutos em Chimoio', '2026-09-29', 'aberta', 10, 2, 16),
('Velocidade de 2 Mbps quando o contrato prometia muito mais', '2026-10-01', 'aberta', 11, 1, 1),
('Sinal fraco em Dondo durante a tarde', '2026-10-02', 'em_analise', 12, 3, 6),
('Mensagens de erro ao ativar o novo pacote', '2026-10-03', 'resolvida', 13, 2, 4),
('Internet indisponível em Manhiça durante três dias', '2026-10-04', 'aberta', 14, 3, 11);
