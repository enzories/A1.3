-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/12/2024 às 23:38
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `app_logs`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `metodo` varchar(255) DEFAULT NULL,
  `resultado` varchar(255) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `logs`
--

INSERT INTO `logs` (`id`, `metodo`, `resultado`, `usuario`, `timestamp`) VALUES
(5, 'QR Code', 'Gerado com sucesso para \"enzo\"', '432126', '2024-11-25 21:48:18'),
(6, 'QR Code', 'Gerado com sucesso para \"432126\"', '432126', '2024-11-27 19:59:01'),
(7, 'QR Code', 'Gerado com sucesso para \"432126\"', '432126', '2024-11-27 20:03:25'),
(8, 'QR Code', 'Gerado com sucesso para \"teste\"', '432126', '2024-11-27 20:04:37'),
(9, 'QR Code', 'Gerado com sucesso para \"enzo\"', '432126', '2024-11-27 20:08:43'),
(11, 'QR Code', 'Gerado com sucesso para \"sws\"', '432126', '2024-12-03 21:04:02'),
(12, 'QR Code', 'Gerado com sucesso para \"Q\"', '432126', '2024-12-03 21:14:21');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
