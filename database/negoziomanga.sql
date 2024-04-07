-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 16, 2023 alle 11:22
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `negoziomanga`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `acquisti`
--

CREATE TABLE `acquisti` (
  `Id_Acquisto` int(11) NOT NULL,
  `Id_Utente` int(11) DEFAULT NULL,
  `Id_Prodotto` int(11) NOT NULL,
  `quantità` int(11) DEFAULT NULL,
  `dataacquisto` date DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `Id_Recapito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `acquisti`
--

INSERT INTO `acquisti` (`Id_Acquisto`, `Id_Utente`, `Id_Prodotto`, `quantità`, `dataacquisto`, `prezzo`, `Id_Recapito`) VALUES
(1, 2, 3, 2, '2023-03-11', 20, 1),
(1, 2, 24, 2, '2023-03-11', 20, 1),
(1, 2, 78, 11, '2023-03-11', 20, 1),
(2, 3, 42, 10, '2023-03-11', 20, 2),
(2, 3, 184, 10, '2023-03-11', 20, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `carrello`
--

CREATE TABLE `carrello` (
  `Id_Utente` int(11) NOT NULL,
  `Id_Prodotto` int(11) NOT NULL,
  `quantità` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `Id_Prodotto` int(11) NOT NULL,
  `Id_Serie` int(11) DEFAULT NULL,
  `nome` varchar(1000) DEFAULT NULL,
  `nvol` int(11) DEFAULT NULL,
  `stato` varchar(20) DEFAULT NULL CHECK (`stato` in ('disponibile','nondisponibile')),
  `quantità` int(11) DEFAULT NULL,
  `datapubblicazione` date DEFAULT NULL,
  `descrizione` varchar(5000) DEFAULT NULL,
  `src_image` varchar(1000) DEFAULT NULL,
  `prezzo` double NOT NULL DEFAULT 5.1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`Id_Prodotto`, `Id_Serie`, `nome`, `nvol`, `stato`, `quantità`, `datapubblicazione`, `descrizione`, `src_image`, `prezzo`) VALUES
(1, 100, 'Demon Slayer', 1, 'disponibile', 50, '2019-04-10', 'Descrizione1', 'assets/imgs/demon-slayer-1.jpg', 5.1),
(2, 100, 'Demon Slayer', 2, 'disponibile', 50, '2019-06-12', 'Descrizione2', 'assets/imgs/demon-slayer-2.jpg', 5.1),
(3, 100, 'Demon Slayer', 3, 'disponibile', 47, '2019-08-07', 'Descrizione3', 'assets/imgs/demon-slayer-3.jpg', 5.1),
(4, 100, 'Demon Slayer', 4, 'disponibile', 50, '2019-10-09', 'Descrizione4', 'assets/imgs/demon-slayer-4.jpg', 5.1),
(5, 100, 'Demon Slayer', 5, 'disponibile', 50, '2019-12-11', 'Descrizione5', 'assets/imgs/demon-slayer-5.jpg', 5.1),
(6, 100, 'Demon Slayer', 6, 'disponibile', 50, '2020-02-12', 'Descrizione6', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(7, 100, 'Demon Slayer', 7, 'disponibile', 50, '2020-05-13', 'Descrizione7', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(8, 100, 'Demon Slayer', 8, 'disponibile', 50, '2020-07-08', 'Descrizione8', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(9, 100, 'Demon Slayer', 9, 'disponibile', 50, '2020-09-09', 'Descrizione9', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(10, 100, 'Demon Slayer', 10, 'disponibile', 50, '2020-11-11', 'Descrizione10', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(11, 100, 'Demon Slayer', 11, 'disponibile', 50, '2021-01-13', 'Descrizione11', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(12, 100, 'Demon Slayer', 12, 'disponibile', 50, '2021-03-10', 'Descrizione12', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(13, 100, 'Demon Slayer', 13, 'disponibile', 50, '2021-05-12', 'Descrizione13', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(14, 100, 'Demon Slayer', 14, 'disponibile', 50, '2021-07-07', 'Descrizione14', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(15, 100, 'Demon Slayer', 15, 'disponibile', 50, '2021-09-08', 'Descrizione15', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(16, 100, 'Demon Slayer', 16, 'disponibile', 50, '2021-11-10', 'Descrizione16', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(17, 100, 'Demon Slayer', 17, 'disponibile', 50, '2022-01-12', 'Descrizione17', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(18, 100, 'Demon Slayer', 18, 'disponibile', 50, '2022-03-09', 'Descrizione18', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(19, 100, 'Demon Slayer', 19, 'disponibile', 50, '2022-05-11', 'Descrizione19', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(20, 100, 'Demon Slayer', 20, 'disponibile', 50, '2022-07-20', 'Descrizione20', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(21, 100, 'Demon Slayer', 21, 'disponibile', 50, '2022-10-26', 'Descrizione21', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(22, 100, 'Demon Slayer', 22, 'disponibile', 50, '2023-02-08', 'Descrizione22', 'assets/imgs/demon-slayer-default.jpg', 5.1),
(23, 100, 'Demon Slayer', 23, 'nondisponibile', 50, '2023-04-12', 'Descrizione23', 'assets/imgs/demon-slayer-23.jpg', 5.1),
(24, 101, 'Dragon Ball Super', 1, 'disponibile', 46, '2017-04-26', 'Descrizione1', 'assets/imgs/dragon-ball-super-1.jpg', 5.1),
(25, 101, 'Dragon Ball Super', 2, 'disponibile', 50, '2017-05-24', 'Descrizione2', 'assets/imgs/dragon-ball-super-2.jpg', 5.1),
(26, 101, 'Dragon Ball Super', 3, 'disponibile', 50, '2017-10-25', 'Descrizione3', 'assets/imgs/dragon-ball-super-3.jpg', 5.1),
(27, 101, 'Dragon Ball Super', 4, 'disponibile', 50, '2018-04-26', 'Descrizione4', 'assets/imgs/dragon-ball-super-4.jpg', 5.1),
(28, 101, 'Dragon Ball Super', 5, 'disponibile', 50, '2018-10-24', 'Descrizione5', 'assets/imgs/dragon-ball-super-5.jpg', 5.1),
(29, 101, 'Dragon Ball Super', 6, 'disponibile', 50, '2019-01-23', 'Descrizione6', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(30, 101, 'Dragon Ball Super', 7, 'disponibile', 50, '2019-04-24', 'Descrizione7', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(31, 101, 'Dragon Ball Super', 8, 'disponibile', 50, '2019-07-24', 'Descrizione8', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(32, 101, 'Dragon Ball Super', 9, 'disponibile', 50, '2019-10-23', 'Descrizione9', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(33, 101, 'Dragon Ball Super', 10, 'disponibile', 50, '2020-01-29', 'Descrizione10', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(34, 101, 'Dragon Ball Super', 11, 'disponibile', 50, '2020-05-27', 'Descrizione11', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(35, 101, 'Dragon Ball Super', 12, 'disponibile', 50, '2020-10-28', 'Descrizione12', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(36, 101, 'Dragon Ball Super', 13, 'disponibile', 50, '2021-02-24', 'Descrizione13', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(37, 101, 'Dragon Ball Super', 14, 'disponibile', 50, '2021-08-25', 'Descrizione14', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(38, 101, 'Dragon Ball Super', 15, 'disponibile', 50, '2021-12-22', 'Descrizione15', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(39, 101, 'Dragon Ball Super', 16, 'disponibile', 50, '2022-04-22', 'Descrizione16', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(40, 101, 'Dragon Ball Super', 17, 'disponibile', 50, '2022-09-21', 'Descrizione17', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(41, 101, 'Dragon Ball Super', 18, 'disponibile', 50, '2023-01-25', 'Descrizione18', 'assets/imgs/dragon-ball-default.jpg', 5.1),
(42, 102, 'My Hero Academia', 1, 'disponibile', 47, '2016-02-03', 'Descrizione1', 'assets/imgs/my-hero-academia-1.jpg', 5.1),
(43, 102, 'My Hero Academia', 2, 'disponibile', 50, '2016-04-01', 'Descrizione2', 'assets/imgs/my-hero-academia-2.jpg', 5.1),
(44, 102, 'My Hero Academia', 3, 'disponibile', 50, '2016-06-01', 'Descrizione3', 'assets/imgs/my-hero-academia-3.jpg', 5.1),
(45, 102, 'My Hero Academia', 4, 'disponibile', 50, '2016-08-03', 'Descrizione4', 'assets/imgs/my-hero-academia-4.jpg', 5.1),
(46, 102, 'My Hero Academia', 5, 'disponibile', 50, '2016-10-05', 'Descrizione5', 'assets/imgs/my-hero-academia-5.jpg', 5.1),
(47, 102, 'My Hero Academia', 6, 'disponibile', 50, '2016-12-01', 'Descrizione6', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(48, 102, 'My Hero Academia', 7, 'disponibile', 50, '2017-02-01', 'Descrizione7', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(49, 102, 'My Hero Academia', 8, 'disponibile', 50, '2017-04-04', 'Descrizione8', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(50, 102, 'My Hero Academia', 9, 'disponibile', 50, '2017-07-05', 'Descrizione9', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(51, 102, 'My Hero Academia', 10, 'disponibile', 50, '2017-09-06', 'Descrizione10', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(52, 102, 'My Hero Academia', 11, 'disponibile', 50, '2017-11-02', 'Descrizione11', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(53, 102, 'My Hero Academia', 12, 'disponibile', 50, '2018-01-03', 'Descrizione12', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(54, 102, 'My Hero Academia', 13, 'disponibile', 50, '2018-03-01', 'Descrizione13', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(55, 102, 'My Hero Academia', 14, 'disponibile', 50, '2018-05-02', 'Descrizione14', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(56, 102, 'My Hero Academia', 15, 'disponibile', 50, '2018-07-04', 'Descrizione15', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(57, 102, 'My Hero Academia', 16, 'disponibile', 50, '2018-10-03', 'Descrizione16', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(58, 102, 'My Hero Academia', 17, 'disponibile', 50, '2019-01-04', 'Descrizione17', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(59, 102, 'My Hero Academia', 18, 'disponibile', 50, '2019-03-01', 'Descrizione18', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(60, 102, 'My Hero Academia', 19, 'disponibile', 50, '2019-05-01', 'Descrizione19', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(61, 102, 'My Hero Academia', 20, 'disponibile', 50, '2019-07-03', 'Descrizione20', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(62, 102, 'My Hero Academia', 21, 'disponibile', 50, '2019-09-04', 'Descrizione21', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(63, 102, 'My Hero Academia', 22, 'disponibile', 50, '2019-12-04', 'Descrizione22', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(64, 102, 'My Hero Academia', 23, 'disponibile', 50, '2020-03-04', 'Descrizione23', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(65, 102, 'My Hero Academia', 24, 'disponibile', 50, '2020-08-05', 'Descrizione24', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(66, 102, 'My Hero Academia', 25, 'disponibile', 50, '2020-11-04', 'Descrizione25', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(67, 102, 'My Hero Academia', 26, 'disponibile', 50, '2021-01-07', 'Descrizione26', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(68, 102, 'My Hero Academia', 27, 'disponibile', 50, '2021-03-31', 'Descrizione27', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(69, 102, 'My Hero Academia', 28, 'disponibile', 50, '2021-06-30', 'Descrizione28', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(70, 102, 'My Hero Academia', 29, 'disponibile', 50, '2021-09-29', 'Descrizione29', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(71, 102, 'My Hero Academia', 30, 'disponibile', 50, '2021-12-01', 'Descrizione30', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(72, 102, 'My Hero Academia', 31, 'disponibile', 50, '2022-03-02', 'Descrizione31', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(73, 102, 'My Hero Academia', 32, 'disponibile', 50, '2022-06-01', 'Descrizione32', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(74, 102, 'My Hero Academia', 33, 'disponibile', 50, '2022-08-31', 'Descrizione33', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(75, 102, 'My Hero Academia', 34, 'disponibile', 50, '2022-10-28', 'Descrizione34', 'assets/imgs/my-hero-academia-default.jpg', 5.1),
(76, 102, 'My Hero Academia', 35, 'disponibile', 50, '2023-02-09', 'Descrizione35', 'assets/imgs/my-hero-academia-35.jpg', 5.1),
(77, 103, 'One Piece', 1, 'disponibile', 50, '2014-12-12', 'Descrizione1', 'assets/imgs/one-piece-1.jpg', 5.1),
(78, 103, 'One Piece', 2, 'disponibile', 44, '2014-12-12', 'Descrizione2', 'assets/imgs/one-piece-2.jpg', 5.1),
(79, 103, 'One Piece', 3, 'disponibile', 50, '2014-12-12', 'Descrizione3', 'assets/imgs/one-piece-3.jpg', 5.1),
(80, 103, 'One Piece', 4, 'disponibile', 50, '2014-12-12', 'Descrizione4', 'assets/imgs/one-piece-4.jpg', 5.1),
(81, 103, 'One Piece', 5, 'disponibile', 50, '2014-12-12', 'Descrizione5', 'assets/imgs/one-piece-5.jpg', 5.1),
(82, 103, 'One Piece', 6, 'disponibile', 50, '2014-12-12', 'Descrizione6', 'assets/imgs/one-piece-default.jpg', 5.1),
(83, 103, 'One Piece', 7, 'disponibile', 50, '2014-12-12', 'Descrizione7', 'assets/imgs/one-piece-default.jpg', 5.1),
(84, 103, 'One Piece', 8, 'disponibile', 50, '2014-12-12', 'Descrizione8', 'assets/imgs/one-piece-default.jpg', 5.1),
(85, 103, 'One Piece', 9, 'disponibile', 50, '2014-12-12', 'Descrizione9', 'assets/imgs/one-piece-default.jpg', 5.1),
(86, 103, 'One Piece', 10, 'disponibile', 50, '2014-12-12', 'Descrizione10', 'assets/imgs/one-piece-default.jpg', 5.1),
(87, 103, 'One Piece', 11, 'disponibile', 50, '2014-12-12', 'Descrizione11', 'assets/imgs/one-piece-default.jpg', 5.1),
(88, 103, 'One Piece', 12, 'disponibile', 50, '2014-12-12', 'Descrizione12', 'assets/imgs/one-piece-default.jpg', 5.1),
(89, 103, 'One Piece', 13, 'disponibile', 50, '2014-12-12', 'Descrizione13', 'assets/imgs/one-piece-default.jpg', 5.1),
(90, 103, 'One Piece', 14, 'disponibile', 50, '2014-12-12', 'Descrizione14', 'assets/imgs/one-piece-default.jpg', 5.1),
(91, 103, 'One Piece', 15, 'disponibile', 50, '2014-12-12', 'Descrizione15', 'assets/imgs/one-piece-default.jpg', 5.1),
(92, 103, 'One Piece', 16, 'disponibile', 50, '2014-12-12', 'Descrizione16', 'assets/imgs/one-piece-default.jpg', 5.1),
(93, 103, 'One Piece', 17, 'disponibile', 50, '2014-12-12', 'Descrizione17', 'assets/imgs/one-piece-default.jpg', 5.1),
(94, 103, 'One Piece', 18, 'disponibile', 50, '2014-12-12', 'Descrizione18', 'assets/imgs/one-piece-default.jpg', 5.1),
(95, 103, 'One Piece', 19, 'disponibile', 50, '2014-12-12', 'Descrizione19', 'assets/imgs/one-piece-default.jpg', 5.1),
(96, 103, 'One Piece', 20, 'disponibile', 50, '2014-12-12', 'Descrizione20', 'assets/imgs/one-piece-default.jpg', 5.1),
(97, 103, 'One Piece', 21, 'disponibile', 50, '2014-12-12', 'Descrizione21', 'assets/imgs/one-piece-default.jpg', 5.1),
(98, 103, 'One Piece', 22, 'disponibile', 50, '2014-12-12', 'Descrizione22', 'assets/imgs/one-piece-default.jpg', 5.1),
(99, 103, 'One Piece', 23, 'disponibile', 50, '2014-12-12', 'Descrizione23', 'assets/imgs/one-piece-default.jpg', 5.1),
(100, 103, 'One Piece', 24, 'disponibile', 50, '2014-12-12', 'Descrizione24', 'assets/imgs/one-piece-default.jpg', 5.1),
(101, 103, 'One Piece', 25, 'disponibile', 50, '2014-12-12', 'Descrizione25', 'assets/imgs/one-piece-default.jpg', 5.1),
(102, 103, 'One Piece', 26, 'disponibile', 50, '2014-12-12', 'Descrizione26', 'assets/imgs/one-piece-default.jpg', 5.1),
(103, 103, 'One Piece', 27, 'disponibile', 50, '2014-12-12', 'Descrizione27', 'assets/imgs/one-piece-default.jpg', 5.1),
(104, 103, 'One Piece', 28, 'disponibile', 50, '2014-12-12', 'Descrizione28', 'assets/imgs/one-piece-default.jpg', 5.1),
(105, 103, 'One Piece', 29, 'disponibile', 50, '2014-12-12', 'Descrizione29', 'assets/imgs/one-piece-default.jpg', 5.1),
(106, 103, 'One Piece', 30, 'disponibile', 50, '2014-12-12', 'Descrizione30', 'assets/imgs/one-piece-default.jpg', 5.1),
(107, 103, 'One Piece', 31, 'disponibile', 50, '2014-12-12', 'Descrizione31', 'assets/imgs/one-piece-default.jpg', 5.1),
(108, 103, 'One Piece', 32, 'disponibile', 50, '2014-12-12', 'Descrizione32', 'assets/imgs/one-piece-default.jpg', 5.1),
(109, 103, 'One Piece', 33, 'disponibile', 50, '2014-12-12', 'Descrizione33', 'assets/imgs/one-piece-default.jpg', 5.1),
(110, 103, 'One Piece', 34, 'disponibile', 50, '2014-12-12', 'Descrizione34', 'assets/imgs/one-piece-default.jpg', 5.1),
(111, 103, 'One Piece', 35, 'disponibile', 50, '2014-12-12', 'Descrizione35', 'assets/imgs/one-piece-default.jpg', 5.1),
(112, 103, 'One Piece', 36, 'disponibile', 50, '2014-12-12', 'Descrizione36', 'assets/imgs/one-piece-default.jpg', 5.1),
(113, 103, 'One Piece', 37, 'disponibile', 50, '2014-12-12', 'Descrizione37', 'assets/imgs/one-piece-default.jpg', 5.1),
(114, 103, 'One Piece', 38, 'disponibile', 50, '2014-12-12', 'Descrizione38', 'assets/imgs/one-piece-default.jpg', 5.1),
(115, 103, 'One Piece', 39, 'disponibile', 50, '2014-12-12', 'Descrizione39', 'assets/imgs/one-piece-default.jpg', 5.1),
(116, 103, 'One Piece', 40, 'disponibile', 50, '2014-12-12', 'Descrizione40', 'assets/imgs/one-piece-default.jpg', 5.1),
(117, 103, 'One Piece', 41, 'disponibile', 50, '2014-12-12', 'Descrizione41', 'assets/imgs/one-piece-default.jpg', 5.1),
(118, 103, 'One Piece', 42, 'disponibile', 50, '2014-12-12', 'Descrizione42', 'assets/imgs/one-piece-default.jpg', 5.1),
(119, 103, 'One Piece', 43, 'disponibile', 50, '2014-12-12', 'Descrizione43', 'assets/imgs/one-piece-default.jpg', 5.1),
(120, 103, 'One Piece', 44, 'disponibile', 50, '2014-12-12', 'Descrizione44', 'assets/imgs/one-piece-default.jpg', 5.1),
(121, 103, 'One Piece', 45, 'disponibile', 50, '2014-12-12', 'Descrizione45', 'assets/imgs/one-piece-default.jpg', 5.1),
(122, 103, 'One Piece', 46, 'disponibile', 50, '2014-12-12', 'Descrizione46', 'assets/imgs/one-piece-default.jpg', 5.1),
(123, 103, 'One Piece', 47, 'disponibile', 50, '2014-12-12', 'Descrizione47', 'assets/imgs/one-piece-default.jpg', 5.1),
(124, 103, 'One Piece', 48, 'disponibile', 50, '2014-12-12', 'Descrizione48', 'assets/imgs/one-piece-default.jpg', 5.1),
(125, 103, 'One Piece', 49, 'disponibile', 50, '2014-12-12', 'Descrizione49', 'assets/imgs/one-piece-default.jpg', 5.1),
(126, 103, 'One Piece', 50, 'disponibile', 50, '2014-12-12', 'Descrizione50', 'assets/imgs/one-piece-default.jpg', 5.1),
(127, 103, 'One Piece', 51, 'disponibile', 50, '2014-12-12', 'Descrizione51', 'assets/imgs/one-piece-default.jpg', 5.1),
(128, 103, 'One Piece', 52, 'disponibile', 50, '2014-12-12', 'Descrizione52', 'assets/imgs/one-piece-default.jpg', 5.1),
(129, 103, 'One Piece', 53, 'disponibile', 50, '2014-12-12', 'Descrizione53', 'assets/imgs/one-piece-default.jpg', 5.1),
(130, 103, 'One Piece', 54, 'disponibile', 50, '2014-12-12', 'Descrizione54', 'assets/imgs/one-piece-default.jpg', 5.1),
(131, 103, 'One Piece', 55, 'disponibile', 50, '2014-12-12', 'Descrizione55', 'assets/imgs/one-piece-default.jpg', 5.1),
(132, 103, 'One Piece', 56, 'disponibile', 50, '2014-12-12', 'Descrizione56', 'assets/imgs/one-piece-default.jpg', 5.1),
(133, 103, 'One Piece', 57, 'disponibile', 50, '2014-12-12', 'Descrizione57', 'assets/imgs/one-piece-default.jpg', 5.1),
(134, 103, 'One Piece', 58, 'disponibile', 50, '2014-12-12', 'Descrizione58', 'assets/imgs/one-piece-default.jpg', 5.1),
(135, 103, 'One Piece', 59, 'disponibile', 50, '2014-12-12', 'Descrizione59', 'assets/imgs/one-piece-default.jpg', 5.1),
(136, 103, 'One Piece', 60, 'disponibile', 50, '2014-12-12', 'Descrizione60', 'assets/imgs/one-piece-default.jpg', 5.1),
(137, 103, 'One Piece', 61, 'disponibile', 50, '2014-12-12', 'Descrizione61', 'assets/imgs/one-piece-default.jpg', 5.1),
(138, 103, 'One Piece', 62, 'disponibile', 50, '2014-12-12', 'Descrizione62', 'assets/imgs/one-piece-default.jpg', 5.1),
(139, 103, 'One Piece', 63, 'disponibile', 50, '2014-12-12', 'Descrizione63', 'assets/imgs/one-piece-default.jpg', 5.1),
(140, 103, 'One Piece', 64, 'disponibile', 50, '2014-12-12', 'Descrizione64', 'assets/imgs/one-piece-default.jpg', 5.1),
(141, 103, 'One Piece', 65, 'disponibile', 50, '2014-12-12', 'Descrizione65', 'assets/imgs/one-piece-default.jpg', 5.1),
(142, 103, 'One Piece', 66, 'disponibile', 50, '2014-12-12', 'Descrizione66', 'assets/imgs/one-piece-default.jpg', 5.1),
(143, 103, 'One Piece', 67, 'disponibile', 50, '2014-12-12', 'Descrizione67', 'assets/imgs/one-piece-default.jpg', 5.1),
(144, 103, 'One Piece', 68, 'disponibile', 50, '2014-12-12', 'Descrizione68', 'assets/imgs/one-piece-default.jpg', 5.1),
(145, 103, 'One Piece', 69, 'disponibile', 50, '2014-12-12', 'Descrizione69', 'assets/imgs/one-piece-default.jpg', 5.1),
(146, 103, 'One Piece', 70, 'disponibile', 50, '2014-12-12', 'Descrizione70', 'assets/imgs/one-piece-default.jpg', 5.1),
(147, 103, 'One Piece', 71, 'disponibile', 50, '2014-12-12', 'Descrizione71', 'assets/imgs/one-piece-default.jpg', 5.1),
(148, 103, 'One Piece', 72, 'disponibile', 50, '2014-12-12', 'Descrizione72', 'assets/imgs/one-piece-default.jpg', 5.1),
(149, 103, 'One Piece', 73, 'disponibile', 50, '2014-12-12', 'Descrizione73', 'assets/imgs/one-piece-default.jpg', 5.1),
(150, 103, 'One Piece', 74, 'disponibile', 50, '2014-12-12', 'Descrizione74', 'assets/imgs/one-piece-default.jpg', 5.1),
(151, 103, 'One Piece', 75, 'disponibile', 50, '2014-12-12', 'Descrizione75', 'assets/imgs/one-piece-default.jpg', 5.1),
(152, 103, 'One Piece', 76, 'disponibile', 50, '2014-12-12', 'Descrizione76', 'assets/imgs/one-piece-default.jpg', 5.1),
(153, 103, 'One Piece', 77, 'disponibile', 50, '2014-12-12', 'Descrizione77', 'assets/imgs/one-piece-default.jpg', 5.1),
(154, 103, 'One Piece', 78, 'disponibile', 50, '2014-12-12', 'Descrizione78', 'assets/imgs/one-piece-default.jpg', 5.1),
(155, 103, 'One Piece', 79, 'disponibile', 50, '2014-12-12', 'Descrizione79', 'assets/imgs/one-piece-default.jpg', 5.1),
(156, 103, 'One Piece', 80, 'disponibile', 50, '2014-12-12', 'Descrizione80', 'assets/imgs/one-piece-default.jpg', 5.1),
(157, 103, 'One Piece', 81, 'disponibile', 50, '2014-12-12', 'Descrizione81', 'assets/imgs/one-piece-default.jpg', 5.1),
(158, 103, 'One Piece', 82, 'disponibile', 50, '2014-12-12', 'Descrizione82', 'assets/imgs/one-piece-default.jpg', 5.1),
(159, 103, 'One Piece', 83, 'disponibile', 50, '2014-12-12', 'Descrizione83', 'assets/imgs/one-piece-default.jpg', 5.1),
(160, 103, 'One Piece', 84, 'disponibile', 50, '2014-12-12', 'Descrizione84', 'assets/imgs/one-piece-default.jpg', 5.1),
(161, 103, 'One Piece', 85, 'disponibile', 50, '2014-12-12', 'Descrizione85', 'assets/imgs/one-piece-default.jpg', 5.1),
(162, 103, 'One Piece', 86, 'disponibile', 50, '2014-12-12', 'Descrizione86', 'assets/imgs/one-piece-default.jpg', 5.1),
(163, 103, 'One Piece', 87, 'disponibile', 50, '2014-12-12', 'Descrizione87', 'assets/imgs/one-piece-default.jpg', 5.1),
(164, 103, 'One Piece', 88, 'disponibile', 50, '2014-12-12', 'Descrizione88', 'assets/imgs/one-piece-default.jpg', 5.1),
(165, 103, 'One Piece', 89, 'disponibile', 50, '2014-12-12', 'Descrizione89', 'assets/imgs/one-piece-default.jpg', 5.1),
(166, 103, 'One Piece', 90, 'disponibile', 50, '2014-12-12', 'Descrizione90', 'assets/imgs/one-piece-default.jpg', 5.1),
(167, 103, 'One Piece', 91, 'disponibile', 50, '2014-12-12', 'Descrizione91', 'assets/imgs/one-piece-default.jpg', 5.1),
(168, 103, 'One Piece', 92, 'disponibile', 50, '2014-12-12', 'Descrizione92', 'assets/imgs/one-piece-default.jpg', 5.1),
(169, 103, 'One Piece', 93, 'disponibile', 50, '2014-12-12', 'Descrizione93', 'assets/imgs/one-piece-default.jpg', 5.1),
(170, 103, 'One Piece', 94, 'disponibile', 50, '2014-12-12', 'Descrizione94', 'assets/imgs/one-piece-default.jpg', 5.1),
(171, 103, 'One Piece', 95, 'disponibile', 50, '2014-12-12', 'Descrizione95', 'assets/imgs/one-piece-default.jpg', 5.1),
(172, 103, 'One Piece', 96, 'disponibile', 50, '2014-12-12', 'Descrizione96', 'assets/imgs/one-piece-default.jpg', 5.1),
(173, 103, 'One Piece', 97, 'disponibile', 50, '2014-12-12', 'Descrizione97', 'assets/imgs/one-piece-default.jpg', 5.1),
(174, 103, 'One Piece', 98, 'disponibile', 50, '2014-12-12', 'Descrizione98', 'assets/imgs/one-piece-default.jpg', 5.1),
(175, 103, 'One Piece', 99, 'disponibile', 50, '2014-12-12', 'Descrizione99', 'assets/imgs/one-piece-default.jpg', 5.1),
(176, 103, 'One Piece', 100, 'disponibile', 50, '2014-12-12', 'Descrizione100', 'assets/imgs/one-piece-default.jpg', 5.1),
(177, 103, 'One Piece', 101, 'disponibile', 50, '2014-12-12', 'Descrizione101', 'assets/imgs/one-piece-default.jpg', 5.1),
(178, 103, 'One Piece', 102, 'disponibile', 50, '2014-12-12', 'Descrizione102', 'assets/imgs/one-piece-default.jpg', 5.1),
(179, 103, 'One Piece', 103, 'disponibile', 50, '2023-01-04', 'Descrizione103', 'assets/imgs/one-piece-103.jpg', 5.1),
(180, 104, 'Naruto', 1, 'disponibile', 50, '2014-12-12', 'Descrizione1', 'assets/imgs/naruto-1.jpg', 5.1),
(181, 104, 'Naruto', 2, 'disponibile', 50, '2014-12-12', 'Descrizione2', 'assets/imgs/naruto-2.jpg', 5.1),
(182, 104, 'Naruto', 3, 'disponibile', 50, '2014-12-12', 'Descrizione3', 'assets/imgs/naruto-3.jpg', 5.1),
(183, 104, 'Naruto', 4, 'disponibile', 50, '2014-12-12', 'Descrizione4', 'assets/imgs/naruto-4.jpg', 5.1),
(184, 104, 'Naruto', 5, 'disponibile', 47, '2014-12-12', 'Descrizione5', 'assets/imgs/naruto-5.jpg', 5.1),
(185, 104, 'Naruto', 6, 'disponibile', 50, '2014-12-12', 'Descrizione6', 'assets/imgs/naruto-default.jpg', 5.1),
(186, 104, 'Naruto', 7, 'disponibile', 50, '2014-12-12', 'Descrizione7', 'assets/imgs/naruto-default.jpg', 5.1),
(187, 104, 'Naruto', 8, 'disponibile', 50, '2014-12-12', 'Descrizione8', 'assets/imgs/naruto-default.jpg', 5.1),
(188, 104, 'Naruto', 9, 'disponibile', 50, '2014-12-12', 'Descrizione9', 'assets/imgs/naruto-default.jpg', 5.1),
(189, 104, 'Naruto', 10, 'disponibile', 50, '2014-12-12', 'Descrizione10', 'assets/imgs/naruto-default.jpg', 5.1),
(190, 104, 'Naruto', 11, 'disponibile', 50, '2014-12-12', 'Descrizione11', 'assets/imgs/naruto-default.jpg', 5.1),
(191, 104, 'Naruto', 12, 'disponibile', 50, '2014-12-12', 'Descrizione12', 'assets/imgs/naruto-default.jpg', 5.1),
(192, 104, 'Naruto', 13, 'disponibile', 50, '2014-12-12', 'Descrizione13', 'assets/imgs/naruto-default.jpg', 5.1),
(193, 104, 'Naruto', 14, 'disponibile', 50, '2014-12-12', 'Descrizione14', 'assets/imgs/naruto-default.jpg', 5.1),
(194, 104, 'Naruto', 15, 'disponibile', 50, '2014-12-12', 'Descrizione15', 'assets/imgs/naruto-default.jpg', 5.1),
(195, 104, 'Naruto', 16, 'disponibile', 50, '2014-12-12', 'Descrizione16', 'assets/imgs/naruto-default.jpg', 5.1),
(196, 104, 'Naruto', 17, 'disponibile', 50, '2014-12-12', 'Descrizione17', 'assets/imgs/naruto-default.jpg', 5.1),
(197, 104, 'Naruto', 18, 'disponibile', 50, '2014-12-12', 'Descrizione18', 'assets/imgs/naruto-default.jpg', 5.1),
(198, 104, 'Naruto', 19, 'disponibile', 50, '2014-12-12', 'Descrizione19', 'assets/imgs/naruto-default.jpg', 5.1),
(199, 104, 'Naruto', 20, 'disponibile', 50, '2014-12-12', 'Descrizione20', 'assets/imgs/naruto-default.jpg', 5.1),
(200, 104, 'Naruto', 21, 'disponibile', 50, '2014-12-12', 'Descrizione21', 'assets/imgs/naruto-default.jpg', 5.1),
(201, 104, 'Naruto', 22, 'disponibile', 50, '2014-12-12', 'Descrizione22', 'assets/imgs/naruto-default.jpg', 5.1),
(202, 104, 'Naruto', 23, 'disponibile', 50, '2014-12-12', 'Descrizione23', 'assets/imgs/naruto-default.jpg', 5.1),
(203, 104, 'Naruto', 24, 'disponibile', 50, '2014-12-12', 'Descrizione24', 'assets/imgs/naruto-default.jpg', 5.1),
(204, 104, 'Naruto', 25, 'disponibile', 50, '2014-12-12', 'Descrizione25', 'assets/imgs/naruto-default.jpg', 5.1),
(205, 104, 'Naruto', 26, 'disponibile', 50, '2014-12-12', 'Descrizione26', 'assets/imgs/naruto-default.jpg', 5.1),
(206, 104, 'Naruto', 27, 'disponibile', 50, '2014-12-12', 'Descrizione27', 'assets/imgs/naruto-default.jpg', 5.1),
(207, 104, 'Naruto', 28, 'disponibile', 50, '2014-12-12', 'Descrizione28', 'assets/imgs/naruto-default.jpg', 5.1),
(208, 104, 'Naruto', 29, 'disponibile', 50, '2014-12-12', 'Descrizione29', 'assets/imgs/naruto-default.jpg', 5.1),
(209, 104, 'Naruto', 30, 'disponibile', 50, '2014-12-12', 'Descrizione30', 'assets/imgs/naruto-default.jpg', 5.1),
(210, 104, 'Naruto', 31, 'disponibile', 50, '2014-12-12', 'Descrizione31', 'assets/imgs/naruto-default.jpg', 5.1),
(211, 104, 'Naruto', 32, 'disponibile', 50, '2014-12-12', 'Descrizione32', 'assets/imgs/naruto-default.jpg', 5.1),
(212, 104, 'Naruto', 33, 'disponibile', 50, '2014-12-12', 'Descrizione33', 'assets/imgs/naruto-default.jpg', 5.1),
(213, 104, 'Naruto', 34, 'disponibile', 50, '2014-12-12', 'Descrizione34', 'assets/imgs/naruto-default.jpg', 5.1),
(214, 104, 'Naruto', 35, 'disponibile', 50, '2014-12-12', 'Descrizione35', 'assets/imgs/naruto-default.jpg', 5.1),
(215, 104, 'Naruto', 36, 'disponibile', 50, '2014-12-12', 'Descrizione36', 'assets/imgs/naruto-default.jpg', 5.1),
(216, 104, 'Naruto', 37, 'disponibile', 50, '2014-12-12', 'Descrizione37', 'assets/imgs/naruto-default.jpg', 5.1),
(217, 104, 'Naruto', 38, 'disponibile', 50, '2014-12-12', 'Descrizione38', 'assets/imgs/naruto-default.jpg', 5.1),
(218, 104, 'Naruto', 39, 'disponibile', 50, '2014-12-12', 'Descrizione39', 'assets/imgs/naruto-default.jpg', 5.1),
(219, 104, 'Naruto', 40, 'disponibile', 50, '2014-12-12', 'Descrizione40', 'assets/imgs/naruto-default.jpg', 5.1),
(220, 104, 'Naruto', 41, 'disponibile', 50, '2014-12-12', 'Descrizione41', 'assets/imgs/naruto-default.jpg', 5.1),
(221, 104, 'Naruto', 42, 'disponibile', 50, '2014-12-12', 'Descrizione42', 'assets/imgs/naruto-default.jpg', 5.1),
(222, 104, 'Naruto', 43, 'disponibile', 50, '2014-12-12', 'Descrizione43', 'assets/imgs/naruto-default.jpg', 5.1),
(223, 104, 'Naruto', 44, 'disponibile', 50, '2014-12-12', 'Descrizione44', 'assets/imgs/naruto-default.jpg', 5.1),
(224, 104, 'Naruto', 45, 'disponibile', 50, '2014-12-12', 'Descrizione45', 'assets/imgs/naruto-default.jpg', 5.1),
(225, 104, 'Naruto', 46, 'disponibile', 50, '2014-12-12', 'Descrizione46', 'assets/imgs/naruto-default.jpg', 5.1),
(226, 104, 'Naruto', 47, 'disponibile', 50, '2014-12-12', 'Descrizione47', 'assets/imgs/naruto-default.jpg', 5.1),
(227, 104, 'Naruto', 48, 'disponibile', 50, '2014-12-12', 'Descrizione48', 'assets/imgs/naruto-default.jpg', 5.1),
(228, 104, 'Naruto', 49, 'disponibile', 50, '2014-12-12', 'Descrizione49', 'assets/imgs/naruto-default.jpg', 5.1),
(229, 104, 'Naruto', 50, 'disponibile', 50, '2014-12-12', 'Descrizione50', 'assets/imgs/naruto-default.jpg', 5.1),
(230, 104, 'Naruto', 51, 'disponibile', 50, '2014-12-12', 'Descrizione51', 'assets/imgs/naruto-default.jpg', 5.1),
(231, 104, 'Naruto', 52, 'disponibile', 50, '2014-12-12', 'Descrizione52', 'assets/imgs/naruto-default.jpg', 5.1),
(232, 104, 'Naruto', 53, 'disponibile', 50, '2014-12-12', 'Descrizione53', 'assets/imgs/naruto-default.jpg', 5.1),
(233, 104, 'Naruto', 54, 'disponibile', 50, '2014-12-12', 'Descrizione54', 'assets/imgs/naruto-default.jpg', 5.1),
(234, 104, 'Naruto', 55, 'disponibile', 50, '2014-12-12', 'Descrizione55', 'assets/imgs/naruto-default.jpg', 5.1),
(235, 104, 'Naruto', 56, 'disponibile', 50, '2014-12-12', 'Descrizione56', 'assets/imgs/naruto-default.jpg', 5.1),
(236, 104, 'Naruto', 57, 'disponibile', 50, '2014-12-12', 'Descrizione57', 'assets/imgs/naruto-default.jpg', 5.1),
(237, 104, 'Naruto', 58, 'disponibile', 50, '2014-12-12', 'Descrizione58', 'assets/imgs/naruto-default.jpg', 5.1),
(238, 104, 'Naruto', 59, 'disponibile', 50, '2014-12-12', 'Descrizione59', 'assets/imgs/naruto-default.jpg', 5.1),
(239, 104, 'Naruto', 60, 'disponibile', 50, '2014-12-12', 'Descrizione60', 'assets/imgs/naruto-default.jpg', 5.1),
(240, 104, 'Naruto', 61, 'disponibile', 50, '2014-12-12', 'Descrizione61', 'assets/imgs/naruto-default.jpg', 5.1),
(241, 104, 'Naruto', 62, 'disponibile', 50, '2014-12-12', 'Descrizione62', 'assets/imgs/naruto-default.jpg', 5.1),
(242, 104, 'Naruto', 63, 'disponibile', 50, '2014-12-12', 'Descrizione63', 'assets/imgs/naruto-default.jpg', 5.1),
(243, 104, 'Naruto', 64, 'disponibile', 50, '2014-12-12', 'Descrizione64', 'assets/imgs/naruto-default.jpg', 5.1),
(244, 104, 'Naruto', 65, 'disponibile', 50, '2014-12-12', 'Descrizione65', 'assets/imgs/naruto-default.jpg', 5.1),
(245, 104, 'Naruto', 66, 'disponibile', 50, '2014-12-12', 'Descrizione66', 'assets/imgs/naruto-default.jpg', 5.1),
(246, 104, 'Naruto', 67, 'disponibile', 50, '2014-12-12', 'Descrizione67', 'assets/imgs/naruto-default.jpg', 5.1),
(247, 104, 'Naruto', 68, 'disponibile', 50, '2014-12-12', 'Descrizione68', 'assets/imgs/naruto-default.jpg', 5.1),
(248, 104, 'Naruto', 69, 'disponibile', 50, '2014-12-12', 'Descrizione69', 'assets/imgs/naruto-default.jpg', 5.1),
(249, 104, 'Naruto', 70, 'disponibile', 50, '2014-12-12', 'Descrizione70', 'assets/imgs/naruto-default.jpg', 5.1),
(250, 104, 'Naruto', 71, 'disponibile', 50, '2014-12-12', 'Descrizione71', 'assets/imgs/naruto-default.jpg', 5.1),
(251, 104, 'Naruto', 72, 'disponibile', 50, '2014-12-12', 'Descrizione72', 'assets/imgs/naruto-72.jpg', 5.1),
(252, 105, 'Demon Slave', 1, 'disponibile', 50, '2014-12-12', 'Descrizione1', 'assets/imgs/demon-slave-1.jpg', 5.1),
(253, 105, 'Demon Slave', 2, 'disponibile', 50, '2014-12-12', 'Descrizione2', 'assets/imgs/demon-slave-2.jpg', 5.1),
(254, 105, 'Demon Slave', 3, 'disponibile', 50, '2014-12-12', 'Descrizione3', 'assets/imgs/demon-slave-3.jpg', 5.1),
(255, 105, 'Demon Slave', 4, 'disponibile', 50, '2014-12-12', 'Descrizione4', 'assets/imgs/demon-slave-4.jpg', 5.1),
(256, 105, 'Demon Slave', 5, 'disponibile', 50, '2014-12-12', 'Descrizione5', 'assets/imgs/demon-slave-5.jpg', 5.1),
(257, 105, 'Demon Slave', 6, 'disponibile', 50, '2014-12-12', 'Descrizione6', 'assets/imgs/demon-slave-6.jpg', 5.1),
(258, 105, 'Demon Slave', 7, 'disponibile', 50, '2023-02-09', 'Descrizione7', 'assets/imgs/demon-slave-7.jpg', 5.1),
(259, 106, 'Four Knights Of Apocalypse', 1, 'disponibile', 50, '2014-12-12', 'Descrizione1', 'assets/imgs/four-knights-of-apocalypse-1.jpg', 5.1),
(260, 106, 'Four Knights Of Apocalypse', 2, 'disponibile', 50, '2014-12-12', 'Descrizione2', 'assets/imgs/four-knights-of-apocalypse-2.jpg', 5.1),
(261, 106, 'Four Knights Of Apocalypse', 3, 'disponibile', 50, '2014-12-12', 'Descrizione3', 'assets/imgs/four-knights-of-apocalypse-3.jpg', 5.1),
(262, 106, 'Four Knights Of Apocalypse', 4, 'disponibile', 50, '2014-12-12', 'Descrizione4', 'assets/imgs/four-knights-of-apocalypse-4.jpg', 5.1),
(263, 106, 'Four Knights Of Apocalypse', 5, 'disponibile', 50, '2014-12-12', 'Descrizione5', 'assets/imgs/four-knights-of-apocalypse-5.jpg', 5.1),
(264, 106, 'Four Knights Of Apocalypse', 6, 'disponibile', 50, '2014-12-12', 'Descrizione6', 'assets/imgs/four-knights-of-apocalypse-6.jpg', 5.1),
(265, 106, 'Four Knights Of Apocalypse', 7, 'disponibile', 50, '2023-03-15', 'Descrizione7', 'assets/imgs/four-knights-of-apocalypse-7.jpg', 5.1),
(266, 107, 'Skeleton Knight in Another World', 1, 'disponibile', 50, '2023-03-07', 'Descrizione1', 'assets/imgs/skeleton-knight-in-another-world-1.jpg', 5.1);

-- --------------------------------------------------------

--
-- Struttura della tabella `recapiti`
--

CREATE TABLE `recapiti` (
  `Id_Recapito` int(11) NOT NULL,
  `Id_Utente` int(11) DEFAULT NULL,
  `ncivico` varchar(10) DEFAULT NULL,
  `via` varchar(1000) DEFAULT NULL,
  `città` varchar(1000) DEFAULT NULL,
  `provincia` varchar(1000) DEFAULT NULL,
  `cap` int(11) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  `stato` varchar(20) NOT NULL DEFAULT 'attivato'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `recapiti`
--

INSERT INTO `recapiti` (`Id_Recapito`, `Id_Utente`, `ncivico`, `via`, `città`, `provincia`, `cap`, `telefono`, `note`, `stato`) VALUES
(1, 2, '2', 'Via Monte', 'Parma', 'PR', 43125, '3315434667', 'Lasciare il pacco al secondo piano', 'attivato'),
(2, 3, '2', 'Via Verdi', 'Siracusa', 'SR', 96078, '3343567338', 'Citofonare a Linate', 'attivato');

-- --------------------------------------------------------

--
-- Struttura della tabella `serie`
--

CREATE TABLE `serie` (
  `Id_Serie` int(11) NOT NULL,
  `nome` varchar(1000) DEFAULT NULL,
  `volumitotali` int(11) DEFAULT NULL,
  `stato` varchar(10) DEFAULT NULL CHECK (`stato` in ('completa','incorso'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `serie`
--

INSERT INTO `serie` (`Id_Serie`, `nome`, `volumitotali`, `stato`) VALUES
(100, 'Demon Slayer', 23, 'completa'),
(101, 'Dragon Ball Super', 18, 'incorso'),
(102, 'My Hero Academia', 35, 'incorso'),
(103, 'One Piece', 103, 'incorso'),
(104, 'Naruto', 72, 'completa'),
(105, 'Demon Slave', 7, 'incorso'),
(106, 'Four Knights Of Apocalypse', 7, 'incorso'),
(107, 'Skeleton Knight in Another World', 1, 'incorso');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `Id_Utente` int(11) NOT NULL,
  `nome` varchar(500) DEFAULT NULL,
  `cognome` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `ruolo` varchar(5) DEFAULT 'user' CHECK (`ruolo` in ('user','admin'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`Id_Utente`, `nome`, `cognome`, `email`, `password`, `ruolo`) VALUES
(2, 'Donato', 'Bruno', 'donato.bruno@gmail.it', '037d9a939ab250457fe3827291a7817af01b0ebca2e141b7802f6f80dd93b5a1', 'admin'),
(3, 'Matteo', 'Gianvenuti', 'matteo.gianvenuti@gmail.com', '570da6699f97edaaf3bdb0a3de5d8a0345cdddbe98f0e6a92dd3e1ca5ee730a3', 'user');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `acquisti`
--
ALTER TABLE `acquisti`
  ADD PRIMARY KEY (`Id_Acquisto`,`Id_Prodotto`),
  ADD KEY `Id_Utente` (`Id_Utente`),
  ADD KEY `Id_Prodotto` (`Id_Prodotto`),
  ADD KEY `idrecapitoutente` (`Id_Recapito`);

--
-- Indici per le tabelle `carrello`
--
ALTER TABLE `carrello`
  ADD PRIMARY KEY (`Id_Utente`,`Id_Prodotto`),
  ADD KEY `Id_Prodotto` (`Id_Prodotto`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`Id_Prodotto`),
  ADD KEY `Id_Serie` (`Id_Serie`);

--
-- Indici per le tabelle `recapiti`
--
ALTER TABLE `recapiti`
  ADD PRIMARY KEY (`Id_Recapito`),
  ADD KEY `Id_Utente` (`Id_Utente`);

--
-- Indici per le tabelle `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`Id_Serie`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`Id_Utente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `acquisti`
--
ALTER TABLE `acquisti`
  MODIFY `Id_Acquisto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `Id_Prodotto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT per la tabella `recapiti`
--
ALTER TABLE `recapiti`
  MODIFY `Id_Recapito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `serie`
--
ALTER TABLE `serie`
  MODIFY `Id_Serie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `Id_Utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `acquisti`
--
ALTER TABLE `acquisti`
  ADD CONSTRAINT `acquisti_ibfk_1` FOREIGN KEY (`Id_Utente`) REFERENCES `utenti` (`Id_Utente`),
  ADD CONSTRAINT `acquisti_ibfk_2` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotti` (`Id_Prodotto`),
  ADD CONSTRAINT `idrecapitoutente` FOREIGN KEY (`Id_Recapito`) REFERENCES `recapiti` (`Id_Recapito`);

--
-- Limiti per la tabella `carrello`
--
ALTER TABLE `carrello`
  ADD CONSTRAINT `carrello_ibfk_1` FOREIGN KEY (`Id_Utente`) REFERENCES `utenti` (`Id_Utente`),
  ADD CONSTRAINT `carrello_ibfk_2` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotti` (`Id_Prodotto`);

--
-- Limiti per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `prodotti_ibfk_1` FOREIGN KEY (`Id_Serie`) REFERENCES `serie` (`Id_Serie`);

--
-- Limiti per la tabella `recapiti`
--
ALTER TABLE `recapiti`
  ADD CONSTRAINT `recapiti_ibfk_1` FOREIGN KEY (`Id_Utente`) REFERENCES `utenti` (`Id_Utente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
