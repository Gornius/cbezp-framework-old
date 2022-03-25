-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 05 Sty 2022, 11:07
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.1
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
CREATE TABLE `message` (
`id` int(11) NOT NULL,
`name` varchar(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'name of the message',
`type` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'type of the message (private/public)',
`message` varchar(2000) COLLATE utf8_polish_ci NOT NULL COMMENT 'message text',
`deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'existing message - 0, deleted - 1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
--
-- Zrzut danych tabeli `message`
--
INSERT INTO `message` (`id`, `name`, `type`, `message`, `deleted`) VALUES
(1, 'New Intel technology', 'public', 'Intel has announced a new processor for desktops', 0),
(2, 'Intel shares raising', 'private', 'brokers announce: Intel shares will go up!', 0),
(3, 'New graphic card from NVidia', 'public', 'NVidia has announced a new graphic card for desktops', 0),
(4, 'Airplane crash', 'public', 'A passenger plane has crashed in Europe', 0),
(5, 'Coronavirus', 'private', 'A new version of virus was found!', 0),
(6, 'Bitcoin price raises', 'public', 'Price of bitcoin reaches new record.', 0),
(9, 'New Windows announced', 'public', 'A new version of windows was announced. Present buyers of Widows 10 can update the system to the newest version for free.', 0);
ALTER TABLE `message`
ADD PRIMARY KEY (`id`);
ALTER TABLE `message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
