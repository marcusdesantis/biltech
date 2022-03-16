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

CREATE TABLE `bilancia` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Codice` varchar(20) NOT NULL,
  `Id_Modello` int(11) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bilanciamodulo`
--

CREATE TABLE `bilanciamodulo` (
  `Id` int(11) NOT NULL,
  `Id_Bilancia` int(11) NOT NULL,
  `Id_Modulo` int(11) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula`
--

CREATE TABLE `formula` (
  `Id` int(11) NOT NULL,
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

CREATE TABLE `formulaprodotto` (
  `Id` int(11) NOT NULL,
  `Id_Prodotto` int(11) NOT NULL,
  `Id_Formula` int(11) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impianto`
--

CREATE TABLE `impianto` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impiantobilancia`
--

CREATE TABLE `impiantobilancia` (
  `Id` int(11) NOT NULL,
  `Id_Impianto` int(11) NOT NULL,
  `Id_Bilancia` int(11) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `misurazione`
--

CREATE TABLE `misurazione` (
  `Id` int(11) NOT NULL,
  `Id_Bilancia` int(11) NOT NULL,
  `Id_Prodotto` int(11) NOT NULL,
  `Peso` decimal(10,4) NOT NULL,
  `Id_FormulaProdotto` int(11) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modello`
--

CREATE TABLE `modello` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prodotto`
--

CREATE TABLE `prodotto` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verificamisurazione`
--

CREATE TABLE `verificamisurazione` (
  `Id` int(11) NOT NULL,
  `Id_Misurazione` int(11) NOT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bilancia`
--
ALTER TABLE `bilancia`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Modello` (`Id_Modello`);

--
-- Indices de la tabla `bilanciamodulo`
--
ALTER TABLE `bilanciamodulo`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Bilancia` (`Id_Bilancia`),
  ADD KEY `Id_Modulo` (`Id_Modulo`);

--
-- Indices de la tabla `formula`
--
ALTER TABLE `formula`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `formulaprodotto`
--
ALTER TABLE `formulaprodotto`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Prodotto` (`Id_Prodotto`),
  ADD KEY `Id_Formula` (`Id_Formula`);

--
-- Indices de la tabla `impianto`
--
ALTER TABLE `impianto`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `impiantobilancia`
--
ALTER TABLE `impiantobilancia`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Impianto` (`Id_Impianto`),
  ADD KEY `Id_Bilancia` (`Id_Bilancia`);

--
-- Indices de la tabla `misurazione`
--
ALTER TABLE `misurazione`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Bilancia` (`Id_Bilancia`),
  ADD KEY `Id_Prodotto` (`Id_Prodotto`),
  ADD KEY `Id_FormulaProdotto` (`Id_FormulaProdotto`);

--
-- Indices de la tabla `modello`
--
ALTER TABLE `modello`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `verificamisurazione`
--
ALTER TABLE `verificamisurazione`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Misurazione` (`Id_Misurazione`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bilancia`
--
ALTER TABLE `bilancia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bilanciamodulo`
--
ALTER TABLE `bilanciamodulo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formula`
--
ALTER TABLE `formula`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formulaprodotto`
--
ALTER TABLE `formulaprodotto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impianto`
--
ALTER TABLE `impianto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impiantobilancia`
--
ALTER TABLE `impiantobilancia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `misurazione`
--
ALTER TABLE `misurazione`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modello`
--
ALTER TABLE `modello`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `verificamisurazione`
--
ALTER TABLE `verificamisurazione`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bilancia`
--
ALTER TABLE `bilancia`
  ADD CONSTRAINT `bilancia_ibfk_1` FOREIGN KEY (`Id_Modello`) REFERENCES `modello` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bilanciamodulo`
--
ALTER TABLE `bilanciamodulo`
  ADD CONSTRAINT `bilanciamodulo_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bilanciamodulo_ibfk_2` FOREIGN KEY (`Id_Modulo`) REFERENCES `modulo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `formulaprodotto`
--
ALTER TABLE `formulaprodotto`
  ADD CONSTRAINT `formulaprodotto_ibfk_1` FOREIGN KEY (`Id_Formula`) REFERENCES `formula` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formulaprodotto_ibfk_2` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `impiantobilancia`
--
ALTER TABLE `impiantobilancia`
  ADD CONSTRAINT `impiantobilancia_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `impiantobilancia_ibfk_2` FOREIGN KEY (`Id_Impianto`) REFERENCES `impianto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `misurazione`
--
ALTER TABLE `misurazione`
  ADD CONSTRAINT `misurazione_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `misurazione_ibfk_2` FOREIGN KEY (`Id_FormulaProdotto`) REFERENCES `formulaprodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `misurazione_ibfk_3` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `verificamisurazione`
--
ALTER TABLE `verificamisurazione`
  ADD CONSTRAINT `verificamisurazione_ibfk_1` FOREIGN KEY (`Id_Misurazione`) REFERENCES `misurazione` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
