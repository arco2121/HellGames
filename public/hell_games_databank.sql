-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 06, 2025 alle 13:11
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hell_games_databank`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `mini_description` varchar(1000) NOT NULL,
  `rating` int(11) NOT NULL,
  `type` int(30) NOT NULL,
  `released` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `games`
--

INSERT INTO `games` (`id`, `name`, `description`, `mini_description`, `rating`, `type`, `released`) VALUES
(1, 'Hellfire Arena', 'Un gioco d\'azione brutale in un mondo infernale.', 'Combattimenti infernali 1v1', 85, 1, '2023-10-14 22:00:00'),
(2, 'Soul Runner', 'Corri per la tua anima in questo endless runner demoniaco.', 'Endless runner tra le fiamme', 78, 2, '2022-05-31 22:00:00'),
(3, 'Demon\'s Puzzle', 'Risolvi enigmi per sfuggire a un demone crudele.', 'Puzzle game oscuro e strategico', 90, 3, '2024-01-19 23:00:00'),
(4, 'Inferno Kart', 'Corse folli tra le fiamme del purgatorio.', 'Karting a tutta velocità infernale', 82, 4, '2023-07-09 22:00:00'),
(5, 'Hell Chess', 'Una partita a scacchi contro l\'intelligenza demoniaca.', 'Scacchi strategici con twist dark', 88, 3, '2021-11-29 23:00:00'),
(6, 'Abyss City', 'Survival horror in una città abbandonata dell\'inferno.', 'Sopravvivi nella città degli abissi', 76, 1, '2022-09-18 22:00:00'),
(7, 'Flame Fighter', 'Picchiaduro 2D tra demoni e cavalieri oscuri.', 'Duelli demoniaci a colpi di fiamme', 80, 1, '2020-04-03 22:00:00'),
(8, 'Tower of Torment', 'Sali la torre, ogni piano è un enigma letale.', 'Dungeon crawler hardcore', 91, 3, '2023-02-14 23:00:00'),
(9, 'Burnout Souls', 'RPG d\'azione con progressione soulslike.', 'Combattimenti punitivi e lore profonda', 87, 1, '2024-05-05 22:00:00'),
(10, 'Underworld Tycoon', 'Gestisci il tuo regno nell\'inferno.', 'Simulazione manageriale demoniaca', 73, 5, '2021-08-21 22:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `game_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `rate` smallint(6) NOT NULL,
  `comment` varchar(150) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `reviews`
--

INSERT INTO `reviews` (`id`, `game_id`, `user_id`, `rate`, `comment`, `date`) VALUES
(1, 1, 101, 9, 'Molto frenetico, mi piace!', '2024-03-21'),
(2, 1, 102, 7, 'Troppo difficile, ma ben fatto.', '2024-04-05'),
(3, 2, 103, 8, 'Stile fantastico e buona musica.', '2023-12-12'),
(4, 3, 104, 10, 'Enigmi geniali e atmosfera cupa.', '2024-11-30'),
(5, 2, 105, 6, 'Carino, ma ripetitivo dopo un po\'.', '2023-08-09'),
(6, 4, 106, 8, 'Divertente e caotico, come piace a me.', '2023-08-14'),
(7, 4, 107, 6, 'I controlli potevano essere migliori.', '2023-08-21'),
(8, 5, 108, 9, 'Originale e impegnativo!', '2022-01-10'),
(9, 6, 109, 7, 'Buona atmosfera, ma ripetitivo.', '2022-10-01'),
(10, 6, 110, 5, 'Mi aspettavo di più.', '2022-10-15'),
(11, 7, 111, 8, 'Ottimo stile retrò.', '2021-05-20'),
(12, 8, 112, 9, 'Veramente tosto, ma gratificante.', '2023-04-10'),
(13, 8, 113, 10, 'Il miglior dungeon crawler mai giocato.', '2023-06-30'),
(14, 9, 114, 8, 'Ottimo gameplay, difficile il giusto.', '2024-05-01'),
(15, 10, 115, 7, 'Simulazione simpatica.', '2021-09-05');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
