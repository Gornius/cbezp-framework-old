-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 05 Sty 2022, 13:31
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.1
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
CREATE TABLE `user` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`login` varchar(30) COLLATE utf8_polish_ci NOT NULL,
`email` varchar(60) COLLATE utf8_polish_ci NOT NULL,
`hash` varchar(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'password hash or HMAC value',
`salt` blob DEFAULT NULL COMMENT 'salt to use in password hashing',
`sms_code` varchar(6) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'security code sent via sms or e-mail',
`code_timelife` timestamp NULL DEFAULT NULL COMMENT 'timelife of security code',
`security_question` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'additional security question used while password recovering',
`answer` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'security question answer',
`lockout_time` timestamp NULL DEFAULT NULL COMMENT 'time to which user account is blocked',
`session_id` blob DEFAULT NULL COMMENT 'user session identifier',
`id_status` int(11) NOT NULL COMMENT 'account status',
`password_form` int(11) NOT NULL DEFAULT 1 COMMENT '1- SHA512, 2-SHA512+salt,3- HMAC',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
--
-- Zrzut danych tabeli `user`
--
INSERT INTO `user` (`id`, `login`, `email`, `hash`, `salt`, `sms_code`, `code_timelife`, `security_question`, `answer`, `lockout_time`, `session_id`, `id_status`, `password_form`) VALUES
(1, 'john', 'johny@gmail.com', '552d29f9290b9521e6016c2296fa4511', 'sF5%gR', '345543', '2022-01-05 13:25:36', 'Your friend\'s name?', 'Peter', NULL, NULL, 2, 1), (2, 'susie', 'susie@gmail.com', '8c90f286786c7f3b96564e1e88e0ddab', 'j67R', '674545', '2022-01-12 13:25:36', 'Where were you on your 2015\'s holiday?', 'Turkey', NULL, NULL, 5, 1),
(3, 'anie', 'anie@gmail.com', 'dcb710a566c2a24c8bfaf83618e728f7', 'sdfgh54', NULL, NULL, 'Your favorite color?', 'Navy blue', NULL, NULL, 1, 1);
ALTER TABLE `user`
ADD UNIQUE KEY `login` (`login`),
ADD UNIQUE KEY `email` (`email`),
ADD KEY `FKuser674283` (`id_status`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
