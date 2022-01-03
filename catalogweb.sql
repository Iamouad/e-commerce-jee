-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 03 jan. 2022 à 16:31
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `catalogweb`
--
CREATE DATABASE IF NOT EXISTS `catalogweb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `catalogweb`;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'CD'),
(2, 'Livres'),
(3, 'DVD');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `adresse`, `email`, `nom`, `telephone`) VALUES
(17, '1 Rue Antoine ', 'test1.elv@eilco-ulco.fr', 'Test1 lastname', '+33754860041'),
(20, '1 RUE ANTOINE', 'test298@gmail.com', 'test test', '0761730697'),
(34, '1 RUE ANTOINE ', 'test2.elv@eilco-ulco.fr', 'test2', '0764760877'),
(40, 'apt 100, 1 rue ANTOINE ', 'user3@mail.com', 'User3', '+33364730547'),
(44, 'calaisNr X ', 'userX@mail.com', 'user X', '+33714730553');

-- --------------------------------------------------------

--
-- Structure de la table `commande_client`
--

CREATE TABLE `commande_client` (
  `id` int(11) NOT NULL,
  `montant` decimal(19,2) DEFAULT NULL,
  `no_confirmation` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande_client`
--

INSERT INTO `commande_client` (`id`, `montant`, `no_confirmation`, `client_id`) VALUES
(18, '20.00', 17, 17),
(21, '18.00', 20, 20),
(32, '10.00', 17, 17),
(35, '2.00', 34, 34),
(37, '10.00', 17, 17),
(41, '16.00', 40, 40),
(45, '26.00', 44, 44);

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(48),
(48),
(48),
(48),
(48),
(48);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `dernier_maj` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` decimal(19,2) DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `dernier_maj`, `description`, `nom`, `prix`, `categorie_id`) VALUES
(1, '2021-12-31 00:00:00', 'Pop music', 'Snoop Dogg', '10.00', 1),
(2, '2021-12-29 00:00:00', 'Rap music', 'Booba', '2.00', 1),
(28, '2022-01-03 00:00:00', 'Oriental music', 'Cheb Mami', '10.00', 3),
(39, '2021-12-31 18:31:38', 'History book', 'Leon L\'africain', '6.00', 2);

-- --------------------------------------------------------

--
-- Structure de la table `produit_commande`
--

CREATE TABLE `produit_commande` (
  `idproduitcommande` int(11) NOT NULL,
  `commande_client_id` int(11) DEFAULT NULL,
  `quantite` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit_commande`
--

INSERT INTO `produit_commande` (`idproduitcommande`, `commande_client_id`, `quantite`, `produit_id`) VALUES
(19, 18, 2, 1),
(22, 21, 4, 2),
(23, 21, 1, 1),
(33, 32, 1, 28),
(36, 35, 1, 2),
(38, 37, 1, 1),
(42, 41, 1, 1),
(43, 41, 1, 39),
(46, 45, 1, 39),
(47, 45, 2, 28);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `lastlogin`, `password`, `username`) VALUES
(1, '2021-12-31 00:00:00', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', 'admin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande_client`
--
ALTER TABLE `commande_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK35kwhn1uxvsnwucvtt4v3cqst` (`client_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKejxvy5dl65jihv1v5k6v9vqd6` (`categorie_id`);

--
-- Index pour la table `produit_commande`
--
ALTER TABLE `produit_commande`
  ADD PRIMARY KEY (`idproduitcommande`),
  ADD KEY `FKcdnd9ohc2upcm3lherv5ww1ow` (`produit_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande_client`
--
ALTER TABLE `commande_client`
  ADD CONSTRAINT `FK35kwhn1uxvsnwucvtt4v3cqst` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FKejxvy5dl65jihv1v5k6v9vqd6` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `produit_commande`
--
ALTER TABLE `produit_commande`
  ADD CONSTRAINT `FKcdnd9ohc2upcm3lherv5ww1ow` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
