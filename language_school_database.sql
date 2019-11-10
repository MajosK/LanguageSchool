-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Lis 2019, 17:37
-- Wersja serwera: 10.4.6-MariaDB
-- Wersja PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `language_school_database`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `english`
--

CREATE TABLE `english` (
  `IDEn` int(11) NOT NULL,
  `Word` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `language`
--

CREATE TABLE `language` (
  `IDlang` int(11) NOT NULL,
  `Lang` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `level`
--

CREATE TABLE `level` (
  `IDlv` int(11) NOT NULL,
  `level` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `login`
--

CREATE TABLE `login` (
  `IDUser` int(10) UNSIGNED NOT NULL,
  `login` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `passwd` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `IDTOA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `polish`
--

CREATE TABLE `polish` (
  `IDPl` int(11) NOT NULL,
  `Word` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `translation`
--

CREATE TABLE `translation` (
  `IDPl` int(11) DEFAULT NULL,
  `IDEn` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typeofaccount`
--

CREATE TABLE `typeofaccount` (
  `IDTOA` int(11) NOT NULL,
  `Type` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `userdetails`
--

CREATE TABLE `userdetails` (
  `IDUser` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `surname` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `userlang`
--

CREATE TABLE `userlang` (
  `IDUser` int(11) UNSIGNED DEFAULT NULL,
  `IDlang` int(11) DEFAULT NULL,
  `IDlv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `english`
--
ALTER TABLE `english`
  ADD PRIMARY KEY (`IDEn`);

--
-- Indeksy dla tabeli `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`IDlang`);

--
-- Indeksy dla tabeli `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`IDlv`);

--
-- Indeksy dla tabeli `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`IDUser`),
  ADD KEY `IDTOA` (`IDTOA`);

--
-- Indeksy dla tabeli `polish`
--
ALTER TABLE `polish`
  ADD PRIMARY KEY (`IDPl`);

--
-- Indeksy dla tabeli `translation`
--
ALTER TABLE `translation`
  ADD KEY `IDPl` (`IDPl`),
  ADD KEY `IDEn` (`IDEn`);

--
-- Indeksy dla tabeli `typeofaccount`
--
ALTER TABLE `typeofaccount`
  ADD PRIMARY KEY (`IDTOA`);

--
-- Indeksy dla tabeli `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`IDUser`);

--
-- Indeksy dla tabeli `userlang`
--
ALTER TABLE `userlang`
  ADD KEY `IDlv` (`IDlv`),
  ADD KEY `IDlang` (`IDlang`),
  ADD KEY `IDUser` (`IDUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `english`
--
ALTER TABLE `english`
  MODIFY `IDEn` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `language`
--
ALTER TABLE `language`
  MODIFY `IDlang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `level`
--
ALTER TABLE `level`
  MODIFY `IDlv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `login`
--
ALTER TABLE `login`
  MODIFY `IDUser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `polish`
--
ALTER TABLE `polish`
  MODIFY `IDPl` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `typeofaccount`
--
ALTER TABLE `typeofaccount`
  MODIFY `IDTOA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `IDUser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`IDTOA`) REFERENCES `typeofaccount` (`IDTOA`);

--
-- Ograniczenia dla tabeli `translation`
--
ALTER TABLE `translation`
  ADD CONSTRAINT `translation_ibfk_1` FOREIGN KEY (`IDPl`) REFERENCES `polish` (`IDPl`),
  ADD CONSTRAINT `translation_ibfk_2` FOREIGN KEY (`IDEn`) REFERENCES `english` (`IDEn`);

--
-- Ograniczenia dla tabeli `userdetails`
--
ALTER TABLE `userdetails`
  ADD CONSTRAINT `userdetails_ibfk_1` FOREIGN KEY (`IDUser`) REFERENCES `login` (`IDUser`);

--
-- Ograniczenia dla tabeli `userlang`
--
ALTER TABLE `userlang`
  ADD CONSTRAINT `userlang_ibfk_1` FOREIGN KEY (`IDlv`) REFERENCES `level` (`IDlv`),
  ADD CONSTRAINT `userlang_ibfk_2` FOREIGN KEY (`IDlang`) REFERENCES `language` (`IDlang`),
  ADD CONSTRAINT `userlang_ibfk_3` FOREIGN KEY (`IDUser`) REFERENCES `login` (`IDUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
