-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/06/2026 às 20:01
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pratica01_01-06`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `associado`
--

CREATE TABLE `associado` (
  `id_associado` int(7) NOT NULL,
  `nome_associado` text NOT NULL,
  `endereco_associado` text NOT NULL,
  `telefone_associado` varchar(15) NOT NULL,
  `email_associado` text NOT NULL,
  `datanasc_associado` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `assunto`
--

CREATE TABLE `assunto` (
  `id_assunto` int(4) NOT NULL,
  `desc_assunto` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(11) NOT NULL,
  `nome_autor` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `id_cidade` int(11) NOT NULL,
  `nome_cidade` text NOT NULL,
  `uf` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `depedente`
--

CREATE TABLE `depedente` (
  `id_dependente` int(7) NOT NULL,
  `fk_id_cidade` int(11) NOT NULL,
  `fk_id_associado` int(7) NOT NULL,
  `nome_dependente` int(11) NOT NULL,
  `datanasc_dependente` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exemplar`
--

CREATE TABLE `exemplar` (
  `id_exemplar` int(9) NOT NULL,
  `fk_id_livro` int(11) NOT NULL,
  `aquisicao_livro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exemplar_associado`
--

CREATE TABLE `exemplar_associado` (
  `id_exemplar` int(9) NOT NULL,
  `id_associado` int(11) NOT NULL,
  `id_data_emprestimo` date NOT NULL,
  `data_devolucao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro`
--

CREATE TABLE `livro` (
  `id_livro` int(11) NOT NULL,
  `titulo_livro` char(50) NOT NULL,
  `editora_livro` char(30) NOT NULL,
  `ano_livro` year(4) NOT NULL,
  `local_livro` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro_assunto`
--

CREATE TABLE `livro_assunto` (
  `id_livro` int(11) NOT NULL,
  `id_assunto` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro_autor`
--

CREATE TABLE `livro_autor` (
  `id_autor` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `multa`
--

CREATE TABLE `multa` (
  `id_multa` int(16) NOT NULL,
  `fk_id_exemplar` int(9) NOT NULL,
  `fk_id_associado` int(7) NOT NULL,
  `valor` int(7) NOT NULL,
  `data_pagamento` date NOT NULL,
  `fk_id_data_emprestismo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `associado`
--
ALTER TABLE `associado`
  ADD PRIMARY KEY (`id_associado`);

--
-- Índices de tabela `assunto`
--
ALTER TABLE `assunto`
  ADD PRIMARY KEY (`id_assunto`);

--
-- Índices de tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id_cidade`);

--
-- Índices de tabela `depedente`
--
ALTER TABLE `depedente`
  ADD PRIMARY KEY (`id_dependente`),
  ADD KEY `fk_id_cidade` (`fk_id_cidade`),
  ADD KEY `fk_id_associado` (`fk_id_associado`);

--
-- Índices de tabela `exemplar`
--
ALTER TABLE `exemplar`
  ADD PRIMARY KEY (`id_exemplar`),
  ADD KEY `fk_id_livro` (`fk_id_livro`);

--
-- Índices de tabela `exemplar_associado`
--
ALTER TABLE `exemplar_associado`
  ADD PRIMARY KEY (`id_data_emprestimo`);

--
-- Índices de tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`id_livro`);

--
-- Índices de tabela `livro_assunto`
--
ALTER TABLE `livro_assunto`
  ADD PRIMARY KEY (`id_livro`,`id_assunto`);

--
-- Índices de tabela `livro_autor`
--
ALTER TABLE `livro_autor`
  ADD PRIMARY KEY (`id_autor`,`id_livro`);

--
-- Índices de tabela `multa`
--
ALTER TABLE `multa`
  ADD KEY `fk_id_exemplar` (`fk_id_exemplar`),
  ADD KEY `fk_id_associado` (`fk_id_associado`),
  ADD KEY `fk_id_data_emprestismo` (`fk_id_data_emprestismo`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `depedente`
--
ALTER TABLE `depedente`
  ADD CONSTRAINT `depedente_ibfk_1` FOREIGN KEY (`fk_id_cidade`) REFERENCES `cidade` (`id_cidade`),
  ADD CONSTRAINT `depedente_ibfk_2` FOREIGN KEY (`fk_id_associado`) REFERENCES `associado` (`id_associado`);

--
-- Restrições para tabelas `exemplar`
--
ALTER TABLE `exemplar`
  ADD CONSTRAINT `exemplar_ibfk_1` FOREIGN KEY (`fk_id_livro`) REFERENCES `livro` (`id_livro`);

--
-- Restrições para tabelas `multa`
--
ALTER TABLE `multa`
  ADD CONSTRAINT `multa_ibfk_1` FOREIGN KEY (`fk_id_exemplar`) REFERENCES `exemplar` (`id_exemplar`),
  ADD CONSTRAINT `multa_ibfk_2` FOREIGN KEY (`fk_id_associado`) REFERENCES `associado` (`id_associado`),
  ADD CONSTRAINT `multa_ibfk_3` FOREIGN KEY (`fk_id_data_emprestismo`) REFERENCES `exemplar_associado` (`id_data_emprestimo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
