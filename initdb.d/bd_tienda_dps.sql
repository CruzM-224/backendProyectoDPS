-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2024 a las 06:05:05
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
(0, 'computadoras'),
(1, 'Gaming'),
(2, 'Hardware'),
(3, 'Software'),
(4, 'Mobile'),
(5, 'Peripherals');

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
(1, 'Control de PS5', 'Control inalambrico de PlayStation 5', '00002', 10, 'PS5 Dualsense', 'PS5', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 1, 'Activo', 79.00, 10, '2024-10-05 04:34:32', NULL),
(2, 'CPU', 'CPU', '00003', 10, 'Ryzen', 'AMD', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 2, 'Activo', 339.00, 40, '2024-10-05 04:34:32', NULL),
(3, 'Office365', 'Office365', '00004', 10, 'Office365', 'Microsoft', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 3, 'Activo', 250.00, 10, '2024-10-05 04:34:32', NULL),
(29, 'Computadora', 'Computadora', '00006', 5, 'Vivobook', 'HP', 'https://i5.walmartimages.com/seo/ASUS-VivoBook-17-3-FHD-Display-Ryzen-3250U-Processor-8GB-DDR4-RAM-256GB-PCIe-SSD-Windows-10-Home-Transparent-Silver-M712DA-WH34_215741a7-87fe-49db-baf2-53a382befbf8.8b6b33df87d792072d1d87c5c65aea62.png', 0, 'Activo', 70.00, 5, '2024-10-03 13:59:59', NULL),
(30, 'Samsung', 'Samsung', '00005', 10, 'Samsung', 'Samsung', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 4, 'Activo', 399.00, 20, '2024-10-05 04:34:32', NULL),
(31, 'Teclado', 'Teclado', '00001', 10, 'Teclado', 'Razer', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 5, 'Activo', 109.99, 10, '2024-10-05 04:34:32', NULL),
(32, 'Control de PS5', 'Control inalambrico de PlayStation 5', '00002', 10, 'PS5 Dualsense', 'PS5', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 1, 'Activo', 79.00, 10, '2024-10-05 04:34:32', NULL),
(33, 'CPU', 'CPU', '00003', 10, 'Ryzen', 'AMD', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 2, 'Activo', 339.00, 40, '2024-10-05 04:34:32', NULL),
(34, 'Office365', 'Office365', '00004', 10, 'Office365', 'Microsoft', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 3, 'Activo', 250.00, 10, '2024-10-05 04:34:32', NULL),
(35, 'Computadora', 'Computadora', '00006', 5, 'Vivobook', 'HP', 'https://i5.walmartimages.com/seo/ASUS-VivoBook-17-3-FHD-Display-Ryzen-3250U-Processor-8GB-DDR4-RAM-256GB-PCIe-SSD-Windows-10-Home-Transparent-Silver-M712DA-WH34_215741a7-87fe-49db-baf2-53a382befbf8.8b6b33df87d792072d1d87c5c65aea62.png', 0, 'Activo', 70.00, 5, '2024-10-03 13:59:59', NULL),
(36, 'Samsung', 'Samsung', '00005', 10, 'Samsung', 'Samsung', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 4, 'Activo', 399.00, 20, '2024-10-05 04:34:32', NULL),
(37, 'Teclado', 'Teclado', '00001', 10, 'Teclado', 'Razer', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 5, 'Activo', 109.99, 10, '2024-10-05 04:34:32', NULL),
(38, 'Control de PS5', 'Control inalambrico de PlayStation 5', '00002', 10, 'PS5 Dualsense', 'PS5', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 1, 'Activo', 79.00, 10, '2024-10-05 04:34:32', NULL),
(39, 'CPU', 'CPU', '00003', 10, 'Ryzen', 'AMD', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 2, 'Activo', 339.00, 40, '2024-10-05 04:34:32', NULL),
(40, 'Office365', 'Office365', '00004', 10, 'Office365', 'Microsoft', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 3, 'Activo', 250.00, 10, '2024-10-05 04:34:32', NULL),
(41, 'Computadora', 'Computadora', '00006', 5, 'Vivobook', 'HP', 'https://i5.walmartimages.com/seo/ASUS-VivoBook-17-3-FHD-Display-Ryzen-3250U-Processor-8GB-DDR4-RAM-256GB-PCIe-SSD-Windows-10-Home-Transparent-Silver-M712DA-WH34_215741a7-87fe-49db-baf2-53a382befbf8.8b6b33df87d792072d1d87c5c65aea62.png', 0, 'Activo', 70.00, 5, '2024-10-03 13:59:59', NULL),
(42, 'Samsung', 'Samsung', '00005', 10, 'Samsung', 'Samsung', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 4, 'Activo', 399.00, 20, '2024-10-05 04:34:32', NULL),
(43, 'Teclado', 'Teclado', '00001', 10, 'Teclado', 'Razer', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 5, 'Activo', 109.99, 10, '2024-10-05 04:34:32', NULL),
(44, 'Control de PS5', 'Control inalambrico de PlayStation 5', '00002', 10, 'PS5 Dualsense', 'PS5', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 1, 'Activo', 79.00, 10, '2024-10-05 04:34:32', NULL),
(45, 'CPU', 'CPU', '00003', 10, 'Ryzen', 'AMD', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 2, 'Activo', 339.00, 40, '2024-10-05 04:34:32', NULL),
(46, 'Office365', 'Office365', '00004', 10, 'Office365', 'Microsoft', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 3, 'Activo', 250.00, 10, '2024-10-05 04:34:32', NULL),
(47, 'Computadora', 'Computadora', '00006', 5, 'Vivobook', 'HP', 'https://i5.walmartimages.com/seo/ASUS-VivoBook-17-3-FHD-Display-Ryzen-3250U-Processor-8GB-DDR4-RAM-256GB-PCIe-SSD-Windows-10-Home-Transparent-Silver-M712DA-WH34_215741a7-87fe-49db-baf2-53a382befbf8.8b6b33df87d792072d1d87c5c65aea62.png', 0, 'Activo', 70.00, 5, '2024-10-03 13:59:59', NULL),
(48, 'Samsung', 'Samsung', '00005', 10, 'Samsung', 'Samsung', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 4, 'Activo', 399.00, 20, '2024-10-05 04:34:32', NULL),
(49, 'Teclado', 'Teclado', '00001', 10, 'Teclado', 'Razer', 'https://store.sony.com.sg/cdn/shop/files/DualSense_WirelessController_MetallicGray_1200x.png?v=1706234652', 5, 'Activo', 109.99, 10, '2024-10-05 04:34:32', NULL);

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
  `id_cliente` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `direccion` text NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

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
  ADD KEY `fk_id_compra_estado` (`id_estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

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
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_id_cliente_v` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_compra_estado` FOREIGN KEY (`id_estado`) REFERENCES `compra_estados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
