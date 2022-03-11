-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2022 a las 17:33:43
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biltek_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bilancia`
--

CREATE TABLE `Bilancia` (
  `Id` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Codice` varchar(20) NOT NULL,
  `Id_Modello` int NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bilanciamodulo`
--

CREATE TABLE `BilanciaModulo` (
  `Id` int NOT NULL,
  `Id_Bilancia` int NOT NULL,
  `Id_Modulo` int NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula`
--

CREATE TABLE `Formula` (
  `Id` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Algoritmo` varchar(100) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulaprodotto`
--

CREATE TABLE `FormulaProdotto` (
  `Id` int NOT NULL,
  `Id_Prodotto` int NOT NULL,
  `Id_Formula` int NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impianto`
--

CREATE TABLE `Impianto` (
  `Id` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impiantobilancia`
--

CREATE TABLE `ImpiantoBilancia` (
  `Id` int NOT NULL,
  `Id_Impianto` int NOT NULL,
  `Id_Bilancia` int NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `misurazione`
--

CREATE TABLE `Misurazione` (
  `Id` int NOT NULL,
  `Id_Bilancia` int NOT NULL,
  `Id_Prodotto` int NOT NULL,
  `Peso` decimal(10,4) NOT NULL,
  `Id_FormulaProdotto` int NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modello`
--

CREATE TABLE `Modello` (
  `Id` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `Modulo` (
  `Id` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prodotto`
--

CREATE TABLE `Prodotto` (
  `Id` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verificamisurazione`
--

CREATE TABLE `VerificaMisurazione` (
  `Id` int NOT NULL,
  `Id_Misurazione` int NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bilancia`
--
ALTER TABLE `Bilancia`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Modello` (`Id_Modello`);

--
-- Indices de la tabla `bilanciamodulo`
--
ALTER TABLE `Bilanciamodulo`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Bilancia` (`Id_Bilancia`),
  ADD KEY `Id_Modulo` (`Id_Modulo`);

--
-- Indices de la tabla `formula`
--
ALTER TABLE `Formula`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `formulaprodotto`
--
ALTER TABLE `FormulaProdotto`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Prodotto` (`Id_Prodotto`),
  ADD KEY `Id_Formula` (`Id_Formula`);

--
-- Indices de la tabla `impianto`
--
ALTER TABLE `Impianto`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `impiantobilancia`
--
ALTER TABLE `ImpiantoBilancia`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Impianto` (`Id_Impianto`),
  ADD KEY `Id_Bilancia` (`Id_Bilancia`);

--
-- Indices de la tabla `misurazione`
--
ALTER TABLE `Misurazione`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Bilancia` (`Id_Bilancia`),
  ADD KEY `Id_Prodotto` (`Id_Prodotto`),
  ADD KEY `Id_FormulaProdotto` (`Id_FormulaProdotto`);

--
-- Indices de la tabla `modello`
--
ALTER TABLE `Modello`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `Modulo`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `prodotto`
--
ALTER TABLE `Prodotto`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `verificamisurazione`
--
ALTER TABLE `VerificaMisurazione`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Misurazione` (`Id_Misurazione`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bilancia`
--
ALTER TABLE `Bilancia`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bilanciamodulo`
--
ALTER TABLE `BilanciaModulo`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formula`
--
ALTER TABLE `Formula`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formulaprodotto`
--
ALTER TABLE `Formulaprodotto`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impianto`
--
ALTER TABLE `Impianto`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impiantobilancia`
--
ALTER TABLE `Impiantobilancia`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `misurazione`
--
ALTER TABLE `Misurazione`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modello`
--
ALTER TABLE `Modello`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `Modulo`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prodotto`
--
ALTER TABLE `Prodotto`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `verificamisurazione`
--
ALTER TABLE `VerificaMisurazione`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bilancia`
--
ALTER TABLE `Bilancia`
  ADD CONSTRAINT `bilancia_ibfk_1` FOREIGN KEY (`Id_Modello`) REFERENCES `Modello` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bilanciamodulo`
--
ALTER TABLE `BilanciaModulo`
  ADD CONSTRAINT `bilanciamodulo_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `Bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bilanciamodulo_ibfk_2` FOREIGN KEY (`Id_Modulo`) REFERENCES `Modulo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `formulaprodotto`
--
ALTER TABLE `FormulaProdotto`
  ADD CONSTRAINT `formulaprodotto_ibfk_1` FOREIGN KEY (`Id_Formula`) REFERENCES `Formula` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formulaprodotto_ibfk_2` FOREIGN KEY (`Id_Prodotto`) REFERENCES `Prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `impiantobilancia`
--
ALTER TABLE `ImpiantoBilancia`
  ADD CONSTRAINT `impiantobilancia_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `Bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `impiantobilancia_ibfk_2` FOREIGN KEY (`Id_Impianto`) REFERENCES `Impianto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `misurazione`
--
ALTER TABLE `Misurazione`
  ADD CONSTRAINT `misurazione_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `misurazione_ibfk_2` FOREIGN KEY (`Id_FormulaProdotto`) REFERENCES `FormulaProdotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `misurazione_ibfk_3` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `verificamisurazione`
--
ALTER TABLE `VerificaMisurazione`
  ADD CONSTRAINT `verificamisurazione_ibfk_1` FOREIGN KEY (`Id_Misurazione`) REFERENCES `Misurazione` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
