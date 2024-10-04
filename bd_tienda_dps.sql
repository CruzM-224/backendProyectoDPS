-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2024 a las 15:52:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_tienda_dps`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritos`
--

CREATE TABLE `carritos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_productos`
--

CREATE TABLE `carrito_productos` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `talla` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`) VALUES
(6, 'Audífonos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_estados`
--

CREATE TABLE `compra_estados` (
  `id` int(11) NOT NULL,
  `estado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra_estados`
--

INSERT INTO `compra_estados` (`id`, `estado`) VALUES
(1, 'Pedido'),
(2, 'Pagado y pedido'),
(3, 'Pagado y enviado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE `detalles` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_talla` int(11) DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `producto` text NOT NULL,
  `descripcion` text NOT NULL,
  `codigo` text NOT NULL,
  `existencias` int(11) NOT NULL,
  `modelo` text DEFAULT NULL,
  `marca` text DEFAULT NULL,
  `imagen` text NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `estado` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `producto`, `descripcion`, `codigo`, `existencias`, `modelo`, `marca`, `imagen`, `id_categoria`, `estado`, `precio`, `descuento`, `created_at`, `updated_at`) VALUES
(29, 'Computadora', 'Computadora', '00006', 5, 'Vivobook', 'HP', '1727942399_electronica.jpg', 6, 'Activo', 70.00, 5, '2024-10-03 07:59:59', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_imagenes`
--

CREATE TABLE `producto_imagenes` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `imagen1` text NOT NULL,
  `imagen2` text NOT NULL,
  `imagen3` text NOT NULL,
  `imagen4` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` text NOT NULL,
  `apellidos` text NOT NULL,
  `dui` text NOT NULL,
  `email` text NOT NULL,
  `telefono` int(8) NOT NULL,
  `password` text NOT NULL,
  `id_rol` int(11) NOT NULL,
  `direccion` text NOT NULL,
  `estado` text NOT NULL,
  `usuario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `dui`, `email`, `telefono`, `password`, `id_rol`, `direccion`, `estado`, `usuario`) VALUES
(1, 'admin', 'admin', '12345678-9', 'admin@gmail.com', 12345678, '$2y$10$NPhG.eqySK6lSIbn7FLQEuEcZkNQSWSnQsyXilEtJ9SjDF3cpWCpW', 1, 'Soyapango', 'Activo', ''),
(2, 'Spike', 'Spiegel', '12345678-2', 'spike@gmail.com', 44442222, '$2y$10$vAfCNrdoyeQxaDnYg0dDJ.BSJdCB7pOSOvvC4hZbWiRe6hNpbPnqS', 2, 'Soyapango', 'Activo', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `direccion` text NOT NULL,
  `id_estado` int(11) NOT NULL,
  `comprobante` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_metodo_pago`, `id_cliente`, `monto`, `fecha`, `direccion`, `id_estado`, `comprobante`) VALUES
(31, 2, 1, 40.00, '2024-07-16 01:55:09', 'San Salvador', 3, NULL),
(32, 1, 1, 40.00, '2024-07-16 01:55:59', 'San Salvador', 2, NULL),
(33, 1, 1, 40.00, '2024-07-16 02:21:59', 'San Salvador', 2, NULL),
(34, 2, 1, 40.00, '2024-07-16 02:23:00', 'San Salvador', 1, NULL),
(35, 2, 1, 40.00, '2024-07-22 16:07:14', 'San Salvador', 1, NULL),
(36, 2, 1, 40.00, '2024-07-22 16:46:23', 'San Salvador', 1, NULL),
(50, 3, 1, 20.00, '2024-08-05 21:01:48', 'San Salvador', 1, NULL),
(51, 3, 1, 0.00, '2024-08-05 21:01:56', 'San Salvador', 1, NULL),
(52, 3, 1, 0.00, '2024-08-05 21:02:00', 'San Salvador', 1, NULL),
(53, 3, 1, 0.00, '2024-08-05 21:02:04', 'San Salvador', 1, NULL),
(56, 2, 1, 20.00, '2024-08-07 02:36:48', 'San Salvador', 1, NULL),
(57, 2, 1, 20.00, '2024-08-07 02:37:17', 'San Salvador', 1, NULL),
(58, 2, 1, 20.00, '2024-08-07 02:37:40', 'San Salvador', 1, NULL),
(60, 2, 1, 17.60, '2024-08-08 01:54:30', 'San Salvador', 1, NULL),
(61, 2, 1, 17.60, '2024-08-08 01:54:36', 'San Salvador', 1, NULL),
(62, 2, 1, 17.60, '2024-08-08 01:55:36', 'San Salvador', 1, NULL),
(63, 2, 1, 17.60, '2024-08-08 01:55:36', 'San Salvador', 1, NULL),
(64, 2, 1, 17.60, '2024-08-08 01:57:31', 'San Salvador', 1, NULL),
(65, 3, 1, 14.70, '2024-08-28 20:12:03', 'San Salvador', 1, NULL),
(66, 2, 1, 18.00, '2024-08-28 20:19:12', 'San Salvador', 1, NULL),
(67, 2, 1, 162.00, '2024-09-02 01:10:43', 'San Salvador', 1, '1725244282_sdasdasd.pdf'),
(68, 3, 1, 70.00, '2024-09-02 06:44:21', 'San Salvador', 1, NULL),
(69, 3, 1, 140.00, '2024-09-02 06:49:44', 'San Salvador', 1, NULL),
(70, 3, 1, 140.00, '2024-09-02 06:54:53', 'San Salvador', 1, NULL),
(71, 3, 1, 44.10, '2024-09-02 07:05:40', 'San Salvador', 1, NULL),
(72, 3, 1, 29.40, '2024-09-02 07:06:46', 'San Salvador', 1, NULL),
(73, 3, 1, 20.00, '2024-09-02 07:08:37', 'San Salvador', 1, NULL),
(74, 3, 1, 20.00, '2024-09-02 07:09:03', 'San Salvador', 1, NULL),
(75, 3, 1, 20.00, '2024-09-02 07:09:22', 'San Salvador', 1, NULL),
(76, 3, 1, 20.00, '2024-09-02 07:09:51', 'San Salvador', 1, NULL),
(77, 3, 1, 52.80, '2024-09-02 07:10:21', 'San Salvador', 1, NULL),
(78, 3, 1, 18.00, '2024-09-02 08:14:16', 'San Salvador', 1, NULL),
(79, 3, 1, 18.00, '2024-09-02 08:17:57', 'San Salvador', 1, NULL),
(80, 2, 1, 20.00, '2024-09-02 08:19:48', 'San Salvador', 1, NULL),
(81, 2, 1, 16.40, '2024-09-02 08:19:57', 'San Salvador', 1, NULL),
(82, 3, 1, 16.40, '2024-09-02 08:21:48', 'San Salvador', 1, NULL),
(83, 3, 1, 0.00, '2024-09-02 08:22:21', 'San Salvador', 1, NULL),
(84, 2, 1, 0.00, '2024-09-02 08:25:32', 'San Salvador', 1, NULL),
(85, 3, 1, 17.60, '2024-09-02 08:25:39', 'San Salvador', 1, NULL),
(86, 2, 1, 0.00, '2024-09-02 08:25:48', 'San Salvador', 1, NULL),
(87, 3, 1, 17.60, '2024-09-02 08:26:43', 'San Salvador', 1, NULL),
(88, 3, 1, 16.40, '2024-09-02 08:30:33', 'San Salvador', 1, NULL),
(89, 3, 1, 19.40, '2024-09-02 08:33:07', 'San Salvador', 1, NULL),
(90, 3, 1, 19.40, '2024-09-02 08:36:55', 'San Salvador', 1, NULL),
(91, 3, 1, 20.00, '2024-09-02 08:43:02', 'San Salvador', 1, NULL),
(92, 3, 1, 19.40, '2024-09-02 08:46:52', 'San Salvador', 1, '1725377928_sdasdasd.pdf'),
(93, 2, 1, 0.00, '2024-09-03 15:45:46', 'San Salvador', 1, NULL),
(94, 2, 1, 0.00, '2024-09-03 15:45:49', 'San Salvador', 1, NULL),
(95, 2, 1, 0.00, '2024-09-03 15:46:47', 'San Salvador', 1, NULL),
(96, 2, 1, 0.00, '2024-09-03 15:46:53', 'San Salvador', 1, NULL),
(97, 2, 1, 0.00, '2024-09-03 15:47:37', 'San Salvador', 1, NULL),
(98, 2, 1, 0.00, '2024-09-03 15:47:48', 'San Salvador', 1, NULL),
(99, 2, 1, 0.00, '2024-09-03 15:47:56', 'San Salvador', 1, NULL),
(100, 2, 1, 0.00, '2024-09-03 15:48:47', 'San Salvador', 1, NULL),
(101, 2, 1, 0.00, '2024-09-03 15:49:50', 'San Salvador', 1, NULL),
(102, 2, 1, 0.00, '2024-09-03 15:50:15', 'San Salvador', 1, NULL),
(103, 2, 1, 0.00, '2024-09-03 15:50:23', 'San Salvador', 1, NULL),
(104, 2, 1, 18.00, '2024-09-03 15:50:48', 'San Salvador', 1, NULL),
(105, 2, 1, 18.00, '2024-09-03 15:52:18', 'San Salvador', 1, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_cliente_c` (`id_cliente`);

--
-- Indices de la tabla `carrito_productos`
--
ALTER TABLE `carrito_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_producto_c` (`id_producto`),
  ADD KEY `fk_id_carrito_c` (`id_carrito`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra_estados`
--
ALTER TABLE `compra_estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto_d` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_categoria` (`id_categoria`);

--
-- Indices de la tabla `producto_imagenes`
--
ALTER TABLE `producto_imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_producto_i` (`id_producto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_cliente_v` (`id_cliente`),
  ADD KEY `fk_id_metodo_pago` (`id_metodo_pago`),
  ADD KEY `fk_id_compra_estado` (`id_estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carritos`
--
ALTER TABLE `carritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `carrito_productos`
--
ALTER TABLE `carrito_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `compra_estados`
--
ALTER TABLE `compra_estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalles`
--
ALTER TABLE `detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `producto_imagenes`
--
ALTER TABLE `producto_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD CONSTRAINT `fk_id_cliente_c` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `carrito_productos`
--
ALTER TABLE `carrito_productos`
  ADD CONSTRAINT `fk_id_carrito_c` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_producto_c` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `id_producto_d` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto_imagenes`
--
ALTER TABLE `producto_imagenes`
  ADD CONSTRAINT `fk_id_producto_i` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_id_cliente_v` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_compra_estado` FOREIGN KEY (`id_estado`) REFERENCES `compra_estados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
