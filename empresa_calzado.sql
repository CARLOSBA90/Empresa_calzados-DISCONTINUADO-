-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-08-2020 a las 14:47:28
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `empresa_calzado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `COD_CLIENTE` int(3) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `APELLIDO` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `DNI` int(10) NOT NULL,
  `TELEFONO` int(10) NOT NULL,
  `DIRECCION` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `CORREO` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`COD_CLIENTE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`COD_CLIENTE`, `NOMBRE`, `APELLIDO`, `DNI`, `TELEFONO`, `DIRECCION`, `CORREO`) VALUES
(4, 'CARLOS', 'RAMIREZ', 12654789, 11111, 'PALERMO', 'PALERMO@SITIO.NET'),
(6, 'Mario', 'Funes', 21568753, 1122256665, 'BELGRANO ', 'FUNESM@BELGRANO.COM'),
(7, 'JOSE', 'PEREZ', 15935784, 1144445555, 'RECOLETA', 'JPEREZ@RECOLETA.COM'),
(8, 'MARIA', 'FUENTES', 9517526, 1177771111, 'PALERMO', 'MFUENTES@PALERMO.NET'),
(9, 'FITO', 'PAEZ', 2003344, 1122225555, 'LA BOCA', 'ESTEPAEZ@BOCA.COM'),
(11, 'JESUS', 'CACERES', 8523692, 1188885555, 'BALVANERA', 'CACERESJ@BALVA.NET'),
(12, 'Carlos', 'Bueno', 120344, 1122225555, 'palermo', 'este@mm.ss'),
(13, 'Paola', 'Reyes', 99581932, 1122225555, 'Uruguay 521', 'paor@gmail.com'),
(14, 'JOSE', 'GUTIERREZ', 9225446, 1133336661, 'BARRIO NORTE', 'JGUTI@NORTE.NET'),
(15, 'Benito', 'Gomez', 123568999, 22223333, 'ROSARIO', 'ROSARIO@NORTE.NET'),
(16, 'Juani', 'Moros', 92004002, 111222334, 'LA BOCA', 'ESTERIO@GMAIL.COM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inicio`
--

CREATE TABLE IF NOT EXISTS `inicio` (
  `cod_noticia` int(3) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `texto` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`cod_noticia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `inicio`
--

INSERT INTO `inicio` (`cod_noticia`, `titulo`, `texto`, `fecha`) VALUES
(1, 'Version 1.0 del CRUD "Empresa Calzados" ', 'Esta primera version tiene funciones basicas para la gestion virtual de una empresa de calzados, cuenta con datos de clientes, productos y pedidos. para la creacion de este sitio web se utiliza MySql como base de datos, JSP y SERVLET de lado del servidor, CSS, HTML y Javascript puro para el lado del cliente. Se implementeran mejoras como validaciones, Gestion de tareas, Tabloide  y obtencion de datos en formato PDF', '2020-07-21'),
(2, 'Version 1.01', 'Se arreglaron cierto enlaces que no funcionaban, retoques de CSS, se agrego un tablero de notas', '2020-07-25'),
(3, 'Version 1.04', 'Se actualiza al framework Bootstrap 4 con plantilla predefinida', '2020-08-05'),
(4, 'Version 1.08', 'Todas las secciones actualizadas al framework de Bootstraps', '2020-08-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `COD_PEDIDO` int(3) NOT NULL AUTO_INCREMENT,
  `COD_CLIENTE` int(3) NOT NULL,
  `CANTIDAD_CALZADOS` int(3) NOT NULL,
  `PRECIO_TOTAL` decimal(20,0) NOT NULL,
  `FORMA_PAGO` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `ENVIADO` tinyint(1) NOT NULL,
  `FECHA_PEDIDO` date NOT NULL,
  PRIMARY KEY (`COD_PEDIDO`),
  KEY `COD_CLIENTE` (`COD_CLIENTE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`COD_PEDIDO`, `COD_CLIENTE`, `CANTIDAD_CALZADOS`, `PRECIO_TOTAL`, `FORMA_PAGO`, `ENVIADO`, `FECHA_PEDIDO`) VALUES
(4, 4, 2, '1200', 'CONTADO', 1, '2020-06-30'),
(5, 7, 1, '700', 'CONTADO', 0, '2020-07-17'),
(12, 6, 3, '1000', 'contado', 0, '2020-07-20'),
(13, 7, 2, '800', 'contado', 0, '2020-07-20'),
(14, 7, 2, '800', 'contado', 0, '2020-07-20'),
(15, 9, 8, '4600', 'credito', 0, '2020-07-21'),
(16, 15, 11, '6000', 'credito', 0, '2020-07-25'),
(17, 8, 16, '16000', 'contado', 0, '2020-08-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE IF NOT EXISTS `pedido_producto` (
  `COD_PEDIDO_PRODUCTO` int(3) NOT NULL AUTO_INCREMENT,
  `COD_PEDIDO` int(3) NOT NULL,
  `COD_PRODUCTO` int(3) NOT NULL,
  `CANTIDAD_PRODUCTO` int(5) NOT NULL,
  `PRECIO` decimal(10,0) NOT NULL,
  `VALOR_TOTAL` decimal(20,0) NOT NULL,
  PRIMARY KEY (`COD_PEDIDO_PRODUCTO`),
  KEY `COD_PEDIDO` (`COD_PEDIDO`),
  KEY `COD_PRODUCTO` (`COD_PRODUCTO`),
  KEY `COD_PEDIDO_2` (`COD_PEDIDO`),
  KEY `COD_PRODUCTO_2` (`COD_PRODUCTO`),
  KEY `COD_PEDIDO_3` (`COD_PEDIDO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `pedido_producto`
--

INSERT INTO `pedido_producto` (`COD_PEDIDO_PRODUCTO`, `COD_PEDIDO`, `COD_PRODUCTO`, `CANTIDAD_PRODUCTO`, `PRECIO`, `VALOR_TOTAL`) VALUES
(10, 4, 2, 1, '1000', '1000'),
(11, 4, 3, 1, '200', '200'),
(12, 5, 12, 1, '700', '700'),
(25, 12, 3, 2, '200', '400'),
(26, 12, 5, 1, '600', '600'),
(27, 13, 3, 1, '200', '200'),
(28, 13, 11, 1, '600', '600'),
(29, 14, 3, 1, '200', '200'),
(30, 14, 11, 1, '600', '600'),
(31, 15, 7, 5, '200', '1000'),
(32, 15, 9, 3, '1200', '3600'),
(33, 16, 4, 6, '750', '4500'),
(34, 16, 6, 5, '300', '1500'),
(35, 17, 2, 4, '1000', '4000'),
(36, 17, 8, 5, '1000', '5000'),
(37, 17, 8, 7, '1000', '7000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_calzado`
--

CREATE TABLE IF NOT EXISTS `producto_calzado` (
  `COD_CALZADO` int(3) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `NOMBRE` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `PRECIO` decimal(10,0) NOT NULL,
  `FABRICANTE` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `TALLA` int(3) NOT NULL,
  `STOCK` int(3) NOT NULL,
  PRIMARY KEY (`COD_CALZADO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `producto_calzado`
--

INSERT INTO `producto_calzado` (`COD_CALZADO`, `TIPO`, `NOMBRE`, `PRECIO`, `FABRICANTE`, `TALLA`, `STOCK`) VALUES
(1, 'DEPORTIVO', 'CALZADO_A', '500', 'LIKES', 40, 99),
(2, 'BOTAS', 'MONTANERAS', '1000', 'MOINT', 39, 44),
(3, 'SANDALIAS', 'SANDALIA_M', '200', 'VERANOSAND', 35, 106),
(4, 'DEPORTIVO', 'FUTBOL_01', '800', 'LIKES', 38, 49),
(5, 'DEPORTIVO', 'BALONCESTO_01', '600', 'LIKES', 45, 32),
(6, 'SANDALIAS', 'SAND_01', '300', 'LIKES', 38, 35),
(7, 'SANDALIAS', 'SANDALIAS_S', '200', 'VERANOSAND', 32, 85),
(8, 'CASUAL', 'CASUAL_01', '1000', 'VESTID', 37, 88),
(9, 'CASUAL', 'CASUAL_02', '1200', 'VESTID', 42, 82),
(10, 'C_PROTECCION', 'SEGURIDAD_01', '1500', 'MOINT', 40, 59),
(11, 'DEPORTIVO', 'ZAPATILLAS_01', '600', 'TODO_FUTB', 38, 47),
(12, 'CASUAL', 'CASUAL_03', '700', 'VESTID', 38, 56),
(13, 'BOTAS', 'BOTINES', '900', 'MOINT', 40, 56),
(14, 'DEPORTIVO', 'AMERICANO', '950', 'AMERICANIN', 40, 99),
(15, 'CASUAL', 'BOTINOS', '100', 'LIKES', 40, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablero`
--

CREATE TABLE IF NOT EXISTS `tablero` (
  `cod_tablero` int(3) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `texto` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`cod_tablero`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tablero`
--

INSERT INTO `tablero` (`cod_tablero`, `titulo`, `texto`, `fecha`) VALUES
(1, 'Tablero Notas ejemplo', 'Esta seccion se utiliza para dejar notas, tareas y comentarios acerca de la gestion', '2020-07-23'),
(3, 'Nueva actualizacion', 'Ahora puedes dejar notas por medio del formulario en la parte inferior de la seccion..', '2020-07-25');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `cliente` (`COD_CLIENTE`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD CONSTRAINT `pedido_producto_ibfk_4` FOREIGN KEY (`COD_PEDIDO`) REFERENCES `pedido` (`COD_PEDIDO`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `pedido_producto_ibfk_5` FOREIGN KEY (`COD_PRODUCTO`) REFERENCES `producto_calzado` (`COD_CALZADO`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
