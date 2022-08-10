-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Ago-2022 às 02:21
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_hardware`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `Produto_ID` int(11) NOT NULL,
  `Produto_Nome` varchar(100) DEFAULT NULL,
  `Produto_Preco` varchar(10) DEFAULT NULL,
  `Produto_Descricao` varchar(500) DEFAULT NULL,
  `Produto_Especificacoes` varchar(500) DEFAULT NULL,
  `Produto_Quantidade` varchar(5) DEFAULT NULL,
  `Produto_Codigo` varchar(10) DEFAULT NULL,
  `Produto_Caracteristicas` varchar(250) DEFAULT NULL,
  `Produto_Disponibilidade` varchar(12) DEFAULT NULL,
  `Produto_Peso` varchar(10) DEFAULT NULL,
  `Produto_Data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de um produto';

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`Produto_ID`, `Produto_Nome`, `Produto_Preco`, `Produto_Descricao`, `Produto_Especificacoes`, `Produto_Quantidade`, `Produto_Codigo`, `Produto_Caracteristicas`, `Produto_Disponibilidade`, `Produto_Peso`, `Produto_Data`) VALUES
(2, 'T-Dagger Bora RED', '189,90', 'Teclado de alta performance', 'Teclado mecânico T-Dagger', '2', '1092', 'Mecânico', 'D', '0,7', NULL),
(3, 'HyperX Cloud Stinger', '00210,99', 'HeadSet Gamer de alta performance', 'Driver 40mm', '3', '123-321', 'Marca: HyperX', 'D', '000,82', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`Produto_ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `Produto_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
