-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2023 a las 15:07:51
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `relacionesde3_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellido`) VALUES
(25481213, 'Alejandro', 'Cihuelo'),
(26587412, 'Genaro', 'Coronel'),
(27845669, 'Rosalia', 'Gimenez'),
(28741258, 'Felipe', 'Montero'),
(29771273, 'Paola', 'Guzman'),
(29854021, 'juana', 'Cihuelo'),
(35481224, 'Pedro', 'Cler'),
(40258965, 'Soledad', 'Perez'),
(42589632, 'Analia', 'Garcia'),
(51236741, 'Horacio', 'Mantelli');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `concepto` varchar(20) NOT NULL,
  `clientes_dni` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `concepto`, `clientes_dni`) VALUES
(1, 'consumidor Final', 25481213),
(2, 'Consumidor Final', 42589632),
(3, 'Consumidor Final', 40258965),
(4, 'consumidor Final', 28741258),
(5, 'Consumidor Final', 26587412),
(6, 'Consumidor Final', 51236741),
(7, 'Consumidor Final', 29854021),
(8, 'Mayorista', 29771273),
(9, 'Mayorista', 35481224),
(10, 'Consumidor Final', 27845669);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompras`
--

CREATE TABLE `lineascompras` (
  `numero` int(11) NOT NULL,
  `compras_id` int(20) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineascompras`
--

INSERT INTO `lineascompras` (`numero`, `compras_id`, `producto`, `importe`) VALUES
(1, 1, 'Yerba', 7500),
(2, 7, 'Azucar', 9500),
(3, 6, 'Fideos', 9700),
(4, 5, 'Yogurt', 10500),
(5, 4, 'Galletitas Dulce', 14500),
(6, 10, 'Chocolates', 12500),
(7, 8, 'Queso', 14500),
(8, 9, 'Sopa', 9700),
(9, 4, 'Gaseosa', 17500),
(10, 3, 'Cafe', 13500);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_dni` (`clientes_dni`);

--
-- Indices de la tabla `lineascompras`
--
ALTER TABLE `lineascompras`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `compras_id` (`compras_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `lineascompras`
--
ALTER TABLE `lineascompras`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `clientes_dni` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`dni`);

--
-- Filtros para la tabla `lineascompras`
--
ALTER TABLE `lineascompras`
  ADD CONSTRAINT `compras_id` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
