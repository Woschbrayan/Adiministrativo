-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 06-Abr-2022 às 15:52
-- Versão do servidor: 8.0.27
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `celke`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_colors`
--

DROP TABLE IF EXISTS `adms_colors`;
CREATE TABLE IF NOT EXISTS `adms_colors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `adms_colors`
--

INSERT INTO `adms_colors` (`id`, `name`, `color`, `created`, `modified`) VALUES
(1, 'Azul', '#0275d8', '2022-03-23 15:26:59', NULL),
(2, 'Cinza', '#868e95', '2022-03-23 15:26:59', NULL),
(3, 'Verde', '#5cb85c', '2022-03-23 15:26:59', NULL),
(4, 'Vermelho', '#d9534f', '2022-03-23 15:26:59', NULL),
(5, 'Laranjado', '#f0ad4e', '2022-03-23 15:26:59', NULL),
(6, 'Azul Claro', '#17a2b8', '2022-03-23 15:26:59', NULL),
(7, 'Cinza Claro', '#343a40', '2022-03-23 15:26:59', NULL),
(8, 'Branco', '#f8f9fa', '2022-03-23 15:26:59', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_confs_emails`
--

DROP TABLE IF EXISTS `adms_confs_emails`;
CREATE TABLE IF NOT EXISTS `adms_confs_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtpsecure` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `adms_confs_emails`
--

INSERT INTO `adms_confs_emails` (`id`, `title`, `name`, `email`, `host`, `username`, `password`, `smtpsecure`, `port`, `created`, `modified`) VALUES
(1, 'Atendimento', 'Atendimento da empresa xxx', 'atendimento@celke.com.br', 'smtp.mailtrap.io', 'ed12dd02941308', '3c0bf6100311cd', 'PHPMailer::ENCRYPTION_STARTTLS', 587, '2022-03-23 12:26:24', NULL),
(2, 'Suporte', 'Suporte da empresa xxx', 'suporte@celke.com.br', 'smtp.mailtrap.io', 'ed12dd02941308', '3c0bf6100311cd', 'PHPMailer::ENCRYPTION_STARTTLS', 587, '2022-03-23 12:42:44', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_sits_users`
--

DROP TABLE IF EXISTS `adms_sits_users`;
CREATE TABLE IF NOT EXISTS `adms_sits_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adms_color_id` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adms_color_id` (`adms_color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `adms_sits_users`
--

INSERT INTO `adms_sits_users` (`id`, `name`, `adms_color_id`, `created`, `modified`) VALUES
(1, 'Ativo', 3, '2022-03-23 15:28:25', NULL),
(2, 'Inativo', 5, '2022-03-23 15:26:59', NULL),
(3, 'Aguardado Confirmação', 1, '2022-03-23 15:26:59', NULL),
(4, 'Spam', 4, '2022-03-23 15:26:59', NULL),
(5, 'Descadastrado', 4, '2022-03-23 15:26:59', NULL),
(6, 'Inválido', 4, '2022-04-23 11:46:21', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_users`
--

DROP TABLE IF EXISTS `adms_users`;
CREATE TABLE IF NOT EXISTS `adms_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recover_password` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conf_email` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adms_sits_user_id` int NOT NULL DEFAULT '3',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adms_sits_user_id` (`adms_sits_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `adms_users`
--

INSERT INTO `adms_users` (`id`, `name`, `nickname`, `email`, `user`, `password`, `recover_password`, `conf_email`, `image`, `adms_sits_user_id`, `created`, `modified`) VALUES
(1, 'Cesar', 'Cesar um', 'cesar@celke.com.br', 'cesar@celke.com.br', '$2y$10$gJ30NZ7KcvfW24mMejOuQOjrVKDgmAwMFI2wgMFk42S2Jl7LnmEZG', NULL, NULL, 'celke.jpg', 1, '2022-02-23 16:22:54', '2022-04-04 20:00:26'),
(2, 'Kelly', NULL, 'kelly@celke.com.br', 'kelly@celke.com.br', '$2y$10$9IaecFD7rY/WhV23TBTxse351fvwQiozO4MzHpmajyUkCaY/uxEKm', NULL, NULL, 'celke.jpg', 3, '2022-03-08 16:10:09', '2022-04-05 16:32:35'),
(3, 'Jessica', NULL, 'jessica@celke.com.br', 'jessica@celke.com.br', '$2y$10$JFSU9tF1.7qSzOgzQh7Sae6uI4UZNQ2a2pri4J0WgImVI6McAvpP2', NULL, NULL, NULL, 2, '2022-03-08 16:13:25', NULL),
(4, 'Cesar4', NULL, 'cesar4@celke.com.br', 'cesar4@celke.com.br', '$2y$10$DnQRijdlvEOdmJcyX8teUu7wY3gK.Ade0GzuQTzBA1.QYUJK4Eitq', NULL, NULL, NULL, 4, '2022-03-08 17:37:18', NULL),
(5, 'Cesar 5', NULL, 'cesar5@celke.com.br', 'cesar5@celke.com.br', '$2y$10$7ftSaQRrQiJm7Qsr0fTcv.L/lKg2dTOMgsP6SEtRDJJF8SQR8.08i', NULL, NULL, NULL, 3, '2022-03-16 18:08:01', NULL),
(6, 'Cesar 6', NULL, 'cesar6@celke.com.br', 'cesar6@celke.com.br', '$2y$10$OWmc3VfH2uK/rzZ.w5hyGebcKx31b4OZdduLAWwkdBPn48agwR5Yq', NULL, '$2y$10$O5mx.piiYog.shVZAENliuR9MQ8mjuT1z9VDMEJnyHigO0p1kuv22', 'celke.jpg', 1, '2022-03-16 18:11:39', '2022-04-05 16:25:09'),
(7, 'Cesar 7', NULL, 'cesar7@celke.com.br', 'cesar7@celke.com.br', '$2y$10$2W1n4A.iDAFQZMoH6cR.1e.4wy7OTNtEbf31YdBByAqVZ98IslCeq', NULL, '$2y$10$YghMm/VDDlz8PKgPTPQNMOJcdmz8mlSFZLNYq1hNzXgEgYg8kAoVa', 'celke.jpg', 3, '2022-03-16 18:17:28', '2022-04-01 17:01:48'),
(8, 'Cesar 8', 'Cesar oito', 'cesar8@celke.com.br', 'cesar8@celke.com.br', '$2y$10$MnLdHOdpBBVHczSYMQ9/XeZNkhGo4oqNUW185xA2syY6Ly6deCZCG', NULL, NULL, 'celke.jpg', 1, '2022-03-22 14:55:11', '2022-04-05 16:33:07');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `adms_sits_users`
--
ALTER TABLE `adms_sits_users`
  ADD CONSTRAINT `adms_sits_users_ibfk_1` FOREIGN KEY (`adms_color_id`) REFERENCES `adms_colors` (`id`);

--
-- Limitadores para a tabela `adms_users`
--
ALTER TABLE `adms_users`
  ADD CONSTRAINT `adms_users_ibfk_1` FOREIGN KEY (`adms_sits_user_id`) REFERENCES `adms_sits_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
