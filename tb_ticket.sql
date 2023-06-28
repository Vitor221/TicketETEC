-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 28-Jun-2023 às 12:04
-- Versão do servidor: 8.0.33-0ubuntu0.22.04.2
-- versão do PHP: 8.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_ticket`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_ticket`
--

CREATE TABLE `tb_ticket` (
  `cd_ticket` int NOT NULL,
  `ds_descricao_ticket` varchar(100) DEFAULT NULL,
  `dt_data_inicio` date DEFAULT NULL,
  `cd_atendente` int DEFAULT NULL,
  `cd_integrantes` int DEFAULT NULL,
  `ds_gravidade_ticket` varchar(50) DEFAULT NULL,
  `ds_status_ticket` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `tb_ticket`
--

INSERT INTO `tb_ticket` (`cd_ticket`, `ds_descricao_ticket`, `dt_data_inicio`, `cd_atendente`, `cd_integrantes`, `ds_gravidade_ticket`, `ds_status_ticket`) VALUES
(1, 'czcsda', '2017-01-22', 1, 1, 'sdfs', 'Descarga disparada'),
(3, 'Torneira quebrada', '2023-05-23', 1, 1, 'Medio', 'Concluido'),
(4, 'Descarga diparada', '2023-06-24', 2, 4, 'Altissima', 'Em andamento'),
(5, 'Torneira bebedouro', '2023-06-23', 3, 4, 'Alta', 'Em andamento'),
(6, 'Ventilador Danificado ', '2023-06-23', 4, 2, 'Alta', 'Em andamento'),
(7, 'Goteira na Sala 4', '2023-06-27', 5, 6, 'Alta', 'Aberta'),
(8, 'Tomada dando Choque', '2023-06-27', 5, 4, 'Altissima', 'Aberta'),
(9, 'limao', '2021-05-05', NULL, NULL, 'media', 'resolvido'),
(10, 'Açucar', '2023-06-14', NULL, NULL, 'media', 'resolvido'),
(11, 'Açucar', '2023-06-14', NULL, NULL, 'media', 'resolvido'),
(13, 'sadas', '2021-05-11', NULL, NULL, 'alta', 'resolvido');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_ticket`
--
ALTER TABLE `tb_ticket`
  ADD PRIMARY KEY (`cd_ticket`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_ticket`
--
ALTER TABLE `tb_ticket`
  MODIFY `cd_ticket` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
