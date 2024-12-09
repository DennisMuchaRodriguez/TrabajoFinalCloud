-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2024 a las 22:29:35
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
-- Base de datos: `cloud2024`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateGame1` (IN `p_userid` INT, IN `p_time_in_seconds` INT, IN `p_created_by` VARCHAR(50))   BEGIN
    INSERT INTO Game1(userid, time_in_seconds, created_by)
    VALUES (p_userid, p_time_in_seconds, p_created_by);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateGame2` (IN `p_userid` INT, IN `p_score` INT, IN `p_created_by` VARCHAR(50))   BEGIN
    INSERT INTO Game2(userid, score, created_by)
    VALUES (p_userid, p_score, p_created_by);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateGame3` (IN `p_userid` INT, IN `p_score` INT, IN `p_created_by` VARCHAR(50))   BEGIN
    INSERT INTO Game3(userid, score, created_by)
    VALUES (p_userid, p_score, p_created_by);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateGame4` (IN `p_userid` INT, IN `p_score` INT, IN `p_created_by` VARCHAR(50))   BEGIN
    INSERT INTO Game4(userid, score, created_by)
    VALUES (p_userid, p_score, p_created_by);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateGame5` (IN `p_userid` INT, IN `p_score` INT, IN `p_created_by` VARCHAR(50))   BEGIN
    INSERT INTO Game5(userid, score, created_by)
    VALUES (p_userid, p_score, p_created_by);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateLogin` (IN `p_username` VARCHAR(50), IN `p_user_password` VARCHAR(50), IN `p_created_by` VARCHAR(50), OUT `p_userid` INT)   BEGIN
    DECLARE v_userid INT DEFAULT NULL;
    DECLARE v_user_state INT DEFAULT NULL;

    -- Verificar si existe el usuario en la tabla UserGame con el username y password dados
    SELECT user_id, user_state INTO v_userid, v_user_state
    FROM UserGame 
    WHERE username = p_username AND user_password = p_user_password;

    -- Si se encontró el usuario y está activo
    IF v_userid IS NOT NULL AND v_user_state = 1 THEN
        -- Crear un nuevo registro en la tabla Login
        INSERT INTO Login(username, user_password, user_state, created_by)
        VALUES (p_username, p_user_password, v_user_state, p_created_by);
        
        -- Asignar el ID de usuario al parámetro de salida
        SET p_userid = v_userid;
    ELSE
        -- Si el usuario no existe o está inactivo
        SET p_userid = NULL;  -- Asignamos NULL si el usuario no fue encontrado o está inactivo
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuario no encontrado o inactivo';
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUserGame` (IN `p_username` VARCHAR(50), IN `p_user_password` VARCHAR(50), IN `p_email` VARCHAR(100), IN `p_created_by` VARCHAR(50))   BEGIN
    INSERT INTO UserGame (username, user_password, email, created_by, modified_by)
    VALUES (p_username, p_user_password, p_email, p_created_by, p_created_by);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGame1` (IN `p_gameid` INT)   BEGIN
    UPDATE Game1
    SET user_state = 0
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGame2` (IN `p_gameid` INT)   BEGIN
    UPDATE Game2
    SET user_state = 0
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGame3` (IN `p_gameid` INT)   BEGIN
    UPDATE Game3
    SET user_state = 0
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGame4` (IN `p_gameid` INT)   BEGIN
    UPDATE Game4
    SET user_state = 0
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGame5` (IN `p_gameid` INT)   BEGIN
    UPDATE Game5
    SET user_state = 0
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteLogin` (IN `p_id` INT)   BEGIN
    UPDATE Login
    SET user_state = 0
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUserGame` (IN `p_user_id` INT)   BEGIN
    UPDATE UserGame
    SET user_state = 0
    WHERE user_id = p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadGame1` ()   BEGIN
    SELECT * FROM Game1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadGame2` ()   BEGIN
    SELECT * FROM Game2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadGame3` ()   BEGIN
    SELECT * FROM Game3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadGame4` ()   BEGIN
    SELECT * FROM Game4;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadGame5` ()   BEGIN
    SELECT * FROM Game4;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadLogin` ()   BEGIN
    SELECT * FROM Login;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadUserGame` ()   BEGIN
    SELECT * FROM UserGame;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGame1` (IN `p_gameid` INT, IN `p_userid` INT, IN `p_time_in_seconds` INT, IN `p_user_state` INT, IN `p_modified_by` VARCHAR(50))   BEGIN
    UPDATE Game1
    SET userid = p_userid,
        time_in_seconds = p_time_in_seconds,
        user_state = p_user_state,  -- Actualiza el estado del juego
        modified_by = p_modified_by
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGame2` (IN `p_gameid` INT, IN `p_userid` INT, IN `p_score` INT, IN `p_user_state` INT, IN `p_modified_by` VARCHAR(50))   BEGIN
    UPDATE Game2
    SET userid = p_userid,
        score = p_score,
        user_state = p_user_state,
        modified_by = p_modified_by
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGame3` (IN `p_gameid` INT, IN `p_userid` INT, IN `p_score` INT, IN `p_user_state` INT, IN `p_modified_by` VARCHAR(50))   BEGIN
    UPDATE Game3
    SET userid = p_userid,
        score = p_score,
        user_state = p_user_state,
        modified_by = p_modified_by
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGame4` (IN `p_gameid` INT, IN `p_userid` INT, IN `p_score` INT, IN `p_user_state` INT, IN `p_modified_by` VARCHAR(50))   BEGIN
    UPDATE Game4
    SET userid = p_userid,
        score = p_score,
        user_state = p_user_state,
        modified_by = p_modified_by
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGame5` (IN `p_gameid` INT, IN `p_userid` INT, IN `p_score` INT, IN `p_user_state` INT, IN `p_modified_by` VARCHAR(50))   BEGIN
    UPDATE Game5
    SET userid = p_userid,
        score = p_score,
        user_state = p_user_state,
        modified_by = p_modified_by
    WHERE gameid = p_gameid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateLogin` (IN `p_id` INT, IN `p_username` VARCHAR(50), IN `p_user_password` VARCHAR(50), IN `p_user_state` INT, IN `p_modified_by` VARCHAR(50))   BEGIN
    UPDATE Login
    SET username = p_username,
        user_password = p_user_password,
        user_state = p_user_state,
        modified_by = p_modified_by
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUserGame` (IN `p_user_id` INT, IN `p_username` VARCHAR(50), IN `p_user_password` VARCHAR(50), IN `p_email` VARCHAR(100), IN `p_user_state` INT, IN `p_modified_by` VARCHAR(50))   BEGIN
    UPDATE UserGame
    SET username = p_username,
        user_password = p_user_password,
        email = p_email,
        user_state = p_user_state,
        modified_by = p_modified_by
    WHERE user_id = p_user_id;
END$$

DELIMITER ;

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

--
-- Volcado de datos para la tabla `game1`
--

INSERT INTO `game1` (`gameid`, `userid`, `time_in_seconds`, `created_at`, `created_by`, `modified_at`, `modified_by`, `user_state`) VALUES
(2, 2, 3600, '2024-11-03 17:34:55', 'admin', '2024-11-03 17:34:55', NULL, 1),
(3, 8, 21, '2024-11-30 08:27:39', 'admin', '2024-11-30 08:27:39', NULL, 1),
(4, 14, 56, '2024-12-01 19:01:14', 'admin', '2024-12-01 19:01:14', NULL, 1);

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

--
-- Volcado de datos para la tabla `game2`
--

INSERT INTO `game2` (`gameid`, `userid`, `score`, `created_at`, `created_by`, `modified_at`, `modified_by`, `user_state`) VALUES
(1, 2, 1500, '2024-11-03 16:50:08', 'admin', '2024-11-03 16:50:08', NULL, 1),
(2, 2, 1000, '2024-11-03 17:35:21', 'admin', '2024-11-03 17:54:09', NULL, 0),
(3, 8, 220, '2024-11-26 23:53:03', 'admin', '2024-11-26 23:53:03', NULL, 1),
(4, 8, 40, '2024-11-26 23:53:31', 'admin', '2024-11-26 23:53:31', NULL, 1),
(5, 12, 20, '2024-12-01 18:47:17', 'admin', '2024-12-01 18:47:17', NULL, 1),
(6, 14, 60, '2024-12-01 18:58:50', 'admin', '2024-12-01 18:58:50', NULL, 1);

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

--
-- Volcado de datos para la tabla `game3`
--

INSERT INTO `game3` (`gameid`, `userid`, `score`, `created_at`, `created_by`, `modified_at`, `modified_by`, `user_state`) VALUES
(8, 15, 55, '2024-12-09 14:25:14', 'admin', '2024-12-09 14:25:14', NULL, 1),
(9, 16, 200, '2024-12-09 14:56:33', 'admin', '2024-12-09 14:56:33', NULL, 1),
(10, 15, 0, '2024-12-09 16:13:47', 'admin', '2024-12-09 16:13:47', NULL, 1),
(11, 15, 0, '2024-12-09 16:13:47', 'admin', '2024-12-09 16:13:47', NULL, 1),
(12, 15, 0, '2024-12-09 16:13:47', 'admin', '2024-12-09 16:13:47', NULL, 1),
(13, 15, 0, '2024-12-09 16:13:48', 'admin', '2024-12-09 16:13:48', NULL, 1);

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

--
-- Volcado de datos para la tabla `game4`
--

INSERT INTO `game4` (`gameid`, `userid`, `score`, `created_at`, `created_by`, `modified_at`, `modified_by`, `user_state`) VALUES
(1, 4, 450, '2024-11-03 17:18:24', 'admin', '2024-11-03 18:00:46', NULL, 0),
(2, 2, 200, '2024-11-03 17:35:48', 'admin', '2024-11-03 17:35:48', NULL, 1),
(3, 1, 1102, '2024-11-10 14:53:19', 'admin', '2024-11-10 14:53:19', NULL, 1),
(4, 8, 230, '2024-11-10 20:13:58', 'admin', '2024-11-10 20:13:58', NULL, 1),
(5, 8, 44, '2024-11-11 17:20:08', 'admin', '2024-11-11 17:20:08', NULL, 1),
(6, 8, 414, '2024-11-26 23:54:15', 'admin', '2024-11-26 23:54:15', NULL, 1),
(7, 14, 642, '2024-12-01 19:04:08', 'admin', '2024-12-01 19:04:08', NULL, 1),
(8, 15, 36, '2024-12-09 12:23:09', 'admin', '2024-12-09 12:23:09', NULL, 1),
(10, 15, 23, '2024-12-09 13:28:35', 'admin', '2024-12-09 13:28:35', NULL, 1);

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

--
-- Volcado de datos para la tabla `game5`
--

INSERT INTO `game5` (`gameid`, `userid`, `score`, `created_at`, `created_by`, `modified_at`, `modified_by`, `user_state`) VALUES
(4, 8, 2, '2024-12-01 17:06:48', 'admin', '2024-12-01 17:06:48', NULL, 1),
(5, 14, 25, '2024-12-01 19:05:00', 'admin', '2024-12-01 19:05:00', NULL, 1),
(6, 15, 10, '2024-12-09 13:28:55', 'admin', '2024-12-09 13:28:55', NULL, 1),
(7, 15, 15, '2024-12-09 13:33:20', 'admin', '2024-12-09 13:33:20', NULL, 1),
(11, 16, 20, '2024-12-09 14:54:10', 'admin', '2024-12-09 14:54:10', NULL, 1),
(12, 15, 10, '2024-12-09 16:18:59', 'admin', '2024-12-09 16:18:59', NULL, 1);

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

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `username`, `user_password`, `user_state`, `created_at`, `created_by`, `modified_at`, `modified_by`) VALUES
(81, 'Dengopp', '12345', 1, '2024-12-08 19:10:05', 'admin', '2024-12-08 19:10:05', NULL),
(82, 'Dengopp', '12345', 1, '2024-12-08 20:04:19', 'admin', '2024-12-08 20:04:19', NULL),
(83, 'Dengopp', '12345', 1, '2024-12-08 22:02:46', 'admin', '2024-12-08 22:02:46', NULL),
(84, 'Dengopp', '12345', 1, '2024-12-08 22:14:46', 'admin', '2024-12-08 22:14:46', NULL),
(85, 'Dengopp', '12345', 1, '2024-12-09 00:04:48', 'admin', '2024-12-09 00:04:48', NULL),
(86, 'Dengopp', '12345', 1, '2024-12-09 00:22:19', 'admin', '2024-12-09 00:22:19', NULL),
(87, 'Dengopp', '12345', 1, '2024-12-09 09:26:38', 'admin', '2024-12-09 09:26:38', NULL),
(88, 'Dengopp', '12345', 1, '2024-12-09 11:01:28', 'admin', '2024-12-09 11:01:28', NULL),
(89, 'Dengopp', '12345', 1, '2024-12-09 12:22:39', 'admin', '2024-12-09 12:22:39', NULL),
(90, 'Dengopp', '12345', 1, '2024-12-09 12:26:20', 'admin', '2024-12-09 12:26:20', NULL),
(91, 'Dengopp', '12345', 1, '2024-12-09 13:32:58', 'admin', '2024-12-09 13:32:58', NULL),
(92, 'Dengopp', '12345', 1, '2024-12-09 13:58:25', 'admin', '2024-12-09 13:58:25', NULL),
(93, 'Dengopp', '12345', 1, '2024-12-09 14:10:41', 'admin', '2024-12-09 14:10:41', NULL),
(94, 'Dengopp', '12345', 1, '2024-12-09 14:40:01', 'admin', '2024-12-09 14:40:01', NULL),
(95, 'dengoku1303', '777', 1, '2024-12-09 14:53:21', 'admin', '2024-12-09 14:53:21', NULL),
(96, 'dengoku1303', '777', 1, '2024-12-09 15:10:58', 'admin', '2024-12-09 15:10:58', NULL),
(97, 'Dengopp', '12345', 1, '2024-12-09 16:05:15', 'admin', '2024-12-09 16:05:15', NULL);

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

--
-- Volcado de datos para la tabla `usergame`
--

INSERT INTO `usergame` (`user_id`, `username`, `user_password`, `email`, `created_at`, `created_by`, `modified_at`, `modified_by`, `user_state`) VALUES
(1, 'Dengue', 'Dengue', 'Dengue@gmail.com', '2024-10-20 13:32:10', 'admin', '2024-12-09 14:46:18', 'admin', 0),
(2, 'playerOne', 'securePassword123', 'player@gmail.com', '2024-11-03 16:20:02', 'admin01', '2024-11-10 20:25:16', 'admin', 1),
(3, 'gamerGal', 'passWord$42', 'gamergal42@example.com', '2024-11-03 16:38:11', 'systemAdmin', '2024-11-03 16:38:11', 'systemAdmin', 1),
(4, 'mysticMage', 'Magic4Ever!', 'mysticmage1987@example.com', '2024-11-03 16:38:20', 'staffUser', '2024-11-03 16:38:20', 'staffUser', 1),
(5, 'Kimertt', 'Kimertt3535', 'Kimertt1523@example.com', '2024-11-03 16:38:30', 'admin02', '2024-12-09 14:49:19', 'admin02', 1),
(6, 'Sands', 'Sands1341', 'Sandsi@mail.com', '2024-11-03 16:38:38', 'systemAdmin', '2024-12-09 14:48:41', 'systemAdmin', 1),
(7, 'Kame', 'Kame', 'Kame@gmail.com', '2024-11-10 13:15:20', 'admin', '2024-12-09 14:48:57', 'admin', 0),
(8, 'Goku124', 'Goku124', 'Goku124@PlasmaKK.com', '2024-11-10 20:11:29', 'admin', '2024-12-09 14:48:16', 'admin', 1),
(9, 'pepe2', 'pepe2', 'pepe2@pepe2.com', '2024-11-10 20:28:01', 'admin', '2024-11-10 20:31:41', 'admin', 0),
(10, 'Andriqwe', 'Andriqwe', 'Andriqwe@aAndriqwecom', '2024-11-11 17:23:04', 'admin', '2024-12-09 14:47:41', 'admin', 0),
(11, 'Filo12', 'Filo12', 'Filo12@xdFilo12.com', '2024-11-24 17:35:54', 'system', '2024-12-09 14:47:58', 'admin', 0),
(12, 'Dengw', 'Dengw', 'Dengw@gmail.com', '2024-12-01 18:45:50', 'system', '2024-12-09 14:47:27', 'system', 1),
(13, 'Anvati', 'Anvati', 'Anvati@gmail.com', '2024-12-01 18:53:40', 'system', '2024-12-09 14:47:07', 'system', 1),
(14, 'Gabbrando', 'game234', 'Gabbrando@gmail.com', '2024-12-01 18:57:13', 'system', '2024-12-09 14:46:46', 'admin', 0),
(15, 'Dengopp', '12345', 'dennismucha1325@gmail.com', '2024-12-08 19:09:55', 'system', '2024-12-08 19:09:55', 'system', 1),
(16, 'dengoku1303', '777', 'den@gmail.com', '2024-12-09 14:52:56', 'system', '2024-12-09 16:02:02', 'system', 0);

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
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `game2`
--
ALTER TABLE `game2`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `game3`
--
ALTER TABLE `game3`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `game4`
--
ALTER TABLE `game4`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `game5`
--
ALTER TABLE `game5`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `usergame`
--
ALTER TABLE `usergame`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
