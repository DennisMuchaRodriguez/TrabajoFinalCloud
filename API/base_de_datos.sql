-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2024 a las 22:29:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base de datos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game1`
--

CREATE TABLE `game1` (
  `gameid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `time_in_seconds` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `user_state` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game2`
--

CREATE TABLE `game2` (
  `gameid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `user_state` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game3`
--

CREATE TABLE `game3` (
  `gameid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `user_state` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game4`
--

CREATE TABLE `game4` (
  `gameid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `user_state` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game5`
--

CREATE TABLE `game5` (
  `gameid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `user_state` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `user_state` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usergame`
--

CREATE TABLE `usergame` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `user_state` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viewallusers`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `viewallusers` (
`IDUsuario` int(11)
,`NombreUsuario` varchar(50)
,`CorreoElectronico` varchar(100)
,`FechaCreacion` datetime
,`FechaModificacion` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viewscoregame2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `viewscoregame2` (
`IDJuego` int(11)
,`NombreUsuario` varchar(50)
,`Puntuacion` int(11)
,`FechaCreacion` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viewscoregame3`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `viewscoregame3` (
`IDJuego` int(11)
,`NombreUsuario` varchar(50)
,`Puntuacion` int(11)
,`FechaCreacion` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viewscoregame4`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `viewscoregame4` (
`IDJuego` int(11)
,`NombreUsuario` varchar(50)
,`Puntuacion` int(11)
,`FechaCreacion` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viewscoregame5`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `viewscoregame5` (
`IDJuego` int(11)
,`NombreUsuario` varchar(50)
,`Puntuacion` int(11)
,`FechaCreacion` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viewtimegame1`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `viewtimegame1` (
`IDJuego` int(11)
,`NombreUsuario` varchar(50)
,`TiempoEnSegundos` int(11)
,`FechaCreacion` datetime
);

-- --------------------------------------------------------

--
-- Estructura para la vista `viewallusers`
--
DROP TABLE IF EXISTS `viewallusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewallusers`  AS SELECT `usergame`.`user_id` AS `IDUsuario`, `usergame`.`username` AS `NombreUsuario`, `usergame`.`email` AS `CorreoElectronico`, `usergame`.`created_at` AS `FechaCreacion`, `usergame`.`modified_at` AS `FechaModificacion` FROM `usergame` WHERE `usergame`.`user_state` = 1 ORDER BY `usergame`.`created_at` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `viewscoregame2`
--
DROP TABLE IF EXISTS `viewscoregame2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewscoregame2`  AS SELECT `game2`.`gameid` AS `IDJuego`, `usergame`.`username` AS `NombreUsuario`, `game2`.`score` AS `Puntuacion`, `game2`.`created_at` AS `FechaCreacion` FROM (`game2` join `usergame` on(`game2`.`userid` = `usergame`.`user_id`)) WHERE `game2`.`user_state` = 1 ORDER BY `game2`.`score` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `viewscoregame3`
--
DROP TABLE IF EXISTS `viewscoregame3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewscoregame3`  AS SELECT `game3`.`gameid` AS `IDJuego`, `usergame`.`username` AS `NombreUsuario`, `game3`.`score` AS `Puntuacion`, `game3`.`created_at` AS `FechaCreacion` FROM (`game3` join `usergame` on(`game3`.`userid` = `usergame`.`user_id`)) WHERE `game3`.`user_state` = 1 ORDER BY `game3`.`score` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `viewscoregame4`
--
DROP TABLE IF EXISTS `viewscoregame4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewscoregame4`  AS SELECT `game4`.`gameid` AS `IDJuego`, `usergame`.`username` AS `NombreUsuario`, `game4`.`score` AS `Puntuacion`, `game4`.`created_at` AS `FechaCreacion` FROM (`game4` join `usergame` on(`game4`.`userid` = `usergame`.`user_id`)) WHERE `game4`.`user_state` = 1 ORDER BY `game4`.`score` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `viewscoregame5`
--
DROP TABLE IF EXISTS `viewscoregame5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewscoregame5`  AS SELECT `game5`.`gameid` AS `IDJuego`, `usergame`.`username` AS `NombreUsuario`, `game5`.`score` AS `Puntuacion`, `game5`.`created_at` AS `FechaCreacion` FROM (`game5` join `usergame` on(`game5`.`userid` = `usergame`.`user_id`)) WHERE `game5`.`user_state` = 1 ORDER BY `game5`.`score` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `viewtimegame1`
--
DROP TABLE IF EXISTS `viewtimegame1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewtimegame1`  AS SELECT `game1`.`gameid` AS `IDJuego`, `usergame`.`username` AS `NombreUsuario`, `game1`.`time_in_seconds` AS `TiempoEnSegundos`, `game1`.`created_at` AS `FechaCreacion` FROM (`game1` join `usergame` on(`game1`.`userid` = `usergame`.`user_id`)) WHERE `game1`.`user_state` = 1 ORDER BY `game1`.`time_in_seconds` ASC ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `game1`
--
ALTER TABLE `game1`
  ADD PRIMARY KEY (`gameid`),
  ADD KEY `userid` (`userid`);

--
-- Indices de la tabla `game2`
--
ALTER TABLE `game2`
  ADD PRIMARY KEY (`gameid`),
  ADD KEY `userid` (`userid`);

--
-- Indices de la tabla `game3`
--
ALTER TABLE `game3`
  ADD PRIMARY KEY (`gameid`),
  ADD KEY `userid` (`userid`);

--
-- Indices de la tabla `game4`
--
ALTER TABLE `game4`
  ADD PRIMARY KEY (`gameid`),
  ADD KEY `userid` (`userid`);

--
-- Indices de la tabla `game5`
--
ALTER TABLE `game5`
  ADD PRIMARY KEY (`gameid`),
  ADD KEY `userid` (`userid`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usergame`
--
ALTER TABLE `usergame`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `game1`
--
ALTER TABLE `game1`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `game2`
--
ALTER TABLE `game2`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `game3`
--
ALTER TABLE `game3`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `game4`
--
ALTER TABLE `game4`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `game5`
--
ALTER TABLE `game5`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usergame`
--
ALTER TABLE `usergame`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `game1`
--
ALTER TABLE `game1`
  ADD CONSTRAINT `game1_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `usergame` (`user_id`);

--
-- Filtros para la tabla `game2`
--
ALTER TABLE `game2`
  ADD CONSTRAINT `game2_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `usergame` (`user_id`);

--
-- Filtros para la tabla `game3`
--
ALTER TABLE `game3`
  ADD CONSTRAINT `game3_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `usergame` (`user_id`);

--
-- Filtros para la tabla `game4`
--
ALTER TABLE `game4`
  ADD CONSTRAINT `game4_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `usergame` (`user_id`);

--
-- Filtros para la tabla `game5`
--
ALTER TABLE `game5`
  ADD CONSTRAINT `game5_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `usergame` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
