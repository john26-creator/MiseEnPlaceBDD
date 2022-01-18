-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 29 nov. 2021 à 16:13
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `menagerie`
--

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

CREATE TABLE `animaux` (
  `nom` varchar(20) NOT NULL,
  `proprietaire` varchar(20) DEFAULT NULL,
  `espece` varchar(20) DEFAULT NULL,
  `genre` char(1) DEFAULT NULL,
  `naissance` date DEFAULT NULL,
  `mort` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`nom`, `proprietaire`, `espece`, `genre`, `naissance`, `mort`) VALUES
('Archibald', 'Ralph', 'poisson', 'f', '2021-07-01', NULL),
('Bowser', 'Diane', 'chien', 'm', '1995-07-29', '1998-08-31'),
('Buffy', 'Harold', 'chien', 'f', '1989-05-13', NULL),
('Chirpy', 'Gwen', 'oiseau', 'f', '1998-09-11', NULL),
('Claws', 'Gwen', 'chat', 'm', '1994-03-17', NULL),
('Fang', 'Benny', 'chien', 'm', '1990-08-27', NULL),
('Fluffy', 'Harold', 'chat', 'f', '1993-02-04', NULL),
('Puffball', 'Diane', 'hamster', 'f', '1999-03-30', NULL),
('Rory', 'Benny', NULL, NULL, NULL, '1998-03-04'),
('Slim', 'Benny', 'serpent', 'm', '1996-04-29', NULL),
('Whistler', 'Gwen', 'oiseau', 'f', '1990-02-04', '1997-12-09');

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE `event` (
  `nom` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`nom`, `date`, `type`, `remark`) VALUES
('Fluffy', '1995-02-04', 'naissance', '4 chatons, 2 femelles, 2 males'),
('Buffy', '1991-05-17', 'naissance', '5 chiots, 2 femelles, 3 males\r'),
('Buffy', '1992-07-13', 'naissance', '3 chiots, 3 femelles'),
('Archibald', '1998-03-04', 'acte medical', 'anesthesie locale');

-- --------------------------------------------------------

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD PRIMARY KEY (`nom`);

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD KEY `nom` (`nom`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`nom`) REFERENCES `animaux` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
