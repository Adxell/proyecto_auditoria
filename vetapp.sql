-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-03-2022 a las 20:32:23
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vetapp`
--
CREATE DATABASE IF NOT EXISTS `vetapp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vetapp`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `activarcita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `activarcita` (IN `v_id` INT)  BEGIN
UPDATE cita
SET
estado = 'activo'
where IDCITA = v_id;
END$$

DROP PROCEDURE IF EXISTS `AplazarCita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AplazarCita` (IN `c_id` INT, IN `c_fecha` DATE, IN `c_tipocita` VARCHAR(30))  BEGIN
	update cita set fecha = c_fecha, tipocita = c_tipocita where IDCITA = c_id; 
END$$

DROP PROCEDURE IF EXISTS `crear_dueno`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_dueno` (IN `v_nombre` VARCHAR(30), IN `v_apellidos` VARCHAR(70), IN `v_tel` VARCHAR(45), IN `v_correo` VARCHAR(45), IN `v_dir` VARCHAR(45))  BEGIN
 insert into dueno(nombre, apellidos, telefono, correo, direccion) values (v_nombre, v_apellidos,v_tel, v_correo, v_dir);
end$$

DROP PROCEDURE IF EXISTS `crear_mascota`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_mascota` (IN `v_nombre` VARCHAR(30), IN `v_edad` INT(10), IN `v_espe` VARCHAR(30), IN `v_raza` VARCHAR(30), IN `v_color` VARCHAR(30), IN `v_fecha` DATE, IN `v_dueno` INT)  BEGIN
 insert into mascota(nombre, edad, especie, raza, color, fechanac, dueno) values (v_nombre,v_edad ,v_espe, v_raza, v_color, v_fecha, v_dueno);
END$$

DROP PROCEDURE IF EXISTS `EditMascota`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditMascota` (IN `a_id` INT, IN `a_nombre` VARCHAR(30), IN `a_edad` INT, IN `a_color` VARCHAR(30))  BEGIN
	update mascota set nombre = a_nombre, edad = a_edad, color=a_color where idMAS = a_id; 
END$$

DROP PROCEDURE IF EXISTS `eliminar_cita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cita` (IN `v_id` INT)  BEGIN
UPDATE cita
SET
estado = 'stand'
where IDCITA = v_id;
end$$

DROP PROCEDURE IF EXISTS `GetAllAnimals`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllAnimals` ()  BEGIN 
	SELECT * from mascota;
END$$

DROP PROCEDURE IF EXISTS `GetAllCitas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCitas` ()  BEGIN
SELECT * FROM cita;
END$$

DROP PROCEDURE IF EXISTS `insert_cita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_cita` (IN `v_fecha` DATE, IN `v_tipo` VARCHAR(45), IN `v_moitvo` VARCHAR(200), IN `v_valor` INT, IN `v_vet` INT, IN `v_mascota` INT)  Begin
INSERT INTO	cita (fecha, tipocita, motivo, valor, veterinario, mascota) VALUES (v_fecha, v_tipo, v_moitvo, v_valor, v_vet, v_mascota);
END$$

DROP PROCEDURE IF EXISTS `listarcita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarcita` (IN `v_fecha` DATE)  BEGIN
select * from cita where fecha >= v_fecha;
END$$

DROP PROCEDURE IF EXISTS `listarmascota`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarmascota` ()  BEGIN
select * from mascota;
end$$

DROP PROCEDURE IF EXISTS `updateDueno`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDueno` (IN `d_id` INT, IN `d_telefono` VARCHAR(30), IN `d_correo` VARCHAR(30), IN `d_direccion` VARCHAR(30))  BEGIN
update dueno set telefono = d_telefono, correo = d_correo, direccion=d_direccion where ID = d_id; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE `auditoria` (
  `IDREGISTRO` int(11) NOT NULL,
  `accion` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `usuario` varchar(15) NOT NULL DEFAULT 'root'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`IDREGISTRO`, `accion`, `fecha`, `usuario`) VALUES
(2, 'Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(3, 'Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(4, 'Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(5, 'Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(6, 'Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(7, 'Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(8, 'Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(9, 'Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(10, 'Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(11, 'Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(12, 'Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(13, 'Se registro nueva mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(14, 'Se registro nueva mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(15, 'Se registro nueva mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(16, 'Se inserto un nuevo dueno para asignarle mascotas en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(17, 'Se registro nueva mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost'),
(18, 'Se registro nueva mascota/paciente en el sistema de la veterinaria vet', '2022-03-17', 'root@localhost');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

DROP TABLE IF EXISTS `cita`;
CREATE TABLE `cita` (
  `IDCITA` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tipocita` varchar(30) NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `valor` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'activo',
  `veterinario` int(11) NOT NULL,
  `mascota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`IDCITA`, `fecha`, `tipocita`, `motivo`, `valor`, `estado`, `veterinario`, `mascota`) VALUES
(1, '2022-03-17', 'Consultapp', 'El paciente presentaba problema al respirar y los dueños decidieron traerlo a la vet', 50000, 'activo', 9, 1),
(2, '2022-03-17', 'Consultap', 'chequeo trimestral', 30000, 'stand', 1, 1);

--
-- Disparadores `cita`
--
DROP TRIGGER IF EXISTS `TRIGGER_UPDATE_CITA`;
DELIMITER $$
CREATE TRIGGER `TRIGGER_UPDATE_CITA` AFTER UPDATE ON `cita` FOR EACH ROW INSERT INTO auditoria (accion, fecha, usuario) VALUES ("Se actualizo la cita de alguna mascota/paciente en el sistema de la veterinaria vet",NOW(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dueno`
--

DROP TABLE IF EXISTS `dueno`;
CREATE TABLE `dueno` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dueno`
--

INSERT INTO `dueno` (`ID`, `nombre`, `apellidos`, `telefono`, `correo`, `direccion`) VALUES
(1, 'Arsenio', 'Byrd', '312312', 'adxell@mail.com', 'calle12#12-45'),
(2, 'Carissa', 'Woods', '1-569-210-0716', 'sodales.nisi@hotmail.org', '8257 Lectus Road'),
(3, 'Jacqueline', 'Baird', '(771) 561-5243', 'odio.aliquam.vulputate@hotmail.net', 'P.O. Box 419, 2669 Ac Av.'),
(4, 'Stewart', 'Melendez', '1-514-631-5738', 'mauris@hotmail.com', 'P.O. Box 462, 9295 Lectus Road'),
(5, 'Yoshi', 'Owens', '1-593-871-3737', 'quis.tristique.ac@google.couk', 'Ap #943-5969 Lorem St.'),
(6, 'Yuli', 'Bryan', '1-521-525-6679', 'mollis.nec@yahoo.org', '269-8430 Consectetuer Rd.'),
(7, 'Martena', 'Stephens', '1-679-322-0444', 'ullamcorper.duis@hotmail.couk', '238-9570 Erat, St.'),
(8, 'Emery', 'England', '(442) 152-3111', 'auctor.odio.a@yahoo.net', '922-9177 Gravida Ave'),
(9, 'Kenyon', 'Wolf', '(380) 732-7241', 'luctus.sit@outlook.com', '817-8126 Malesuada Street'),
(10, 'Lewis', 'Mathis', '1-746-535-2829', 'porttitor.vulputate.posuere@icloud.edu', 'P.O. Box 811, 505 Dictum Avenue'),
(11, 'Rowan', 'Tillman', '(391) 399-4538', 'quisque@aol.ca', '242-8478 Integer Avenue'),
(12, 'Chloe', 'Cantrell', '(179) 380-6848', 'justo.eu.arcu@google.couk', 'Ap #760-9157 Dolor St.'),
(13, 'Brian', 'Hopkins', '1-422-655-1239', 'et@outlook.ca', 'Ap #442-104 Mattis Rd.'),
(14, 'Grant', 'Strickland', '(153) 684-1788', 'fermentum.fermentum@hotmail.ca', 'Ap #242-1932 Donec Avenue'),
(15, 'April', 'Mccoy', '1-254-533-8884', 'cursus.et@google.couk', '131-6197 Sed Avenue'),
(16, 'Eve', 'Petersen', '1-283-513-5312', 'nunc@aol.com', 'Ap #969-1703 Eget Ave'),
(17, 'Geoffrey', 'Gillespie', '(401) 330-7483', 'mollis.nec@google.org', 'Ap #234-9352 Augue Street'),
(18, 'Athena', 'Boyd', '(202) 628-4336', 'convallis.dolor@hotmail.net', '734-9303 Dapibus Rd.'),
(19, 'Dexter', 'Calderon', '1-946-827-3316', 'dolor.dapibus.gravida@icloud.net', 'Ap #211-7465 Vitae Rd.'),
(20, 'Roth', 'Holden', '1-425-926-2438', 'consequat.lectus@yahoo.org', 'P.O. Box 560, 6617 Eget Rd.'),
(21, 'Rosalyn', 'Bowers', '(881) 658-2086', 'cursus.et@aol.com', 'Ap #889-512 Morbi Avenue'),
(22, 'Yeo', 'Hines', '1-161-921-4165', 'risus.odio@hotmail.com', 'Ap #201-5751 Porttitor Road'),
(23, 'Jackson', 'England', '1-447-507-1454', 'aenean@hotmail.com', 'Ap #302-1020 Malesuada. Av.'),
(24, 'Sandra', 'Clayton', '1-368-684-0958', 'dui.cras@aol.com', 'Ap #741-3488 Lorem Ave'),
(25, 'Galena', 'Webb', '(964) 271-7725', 'donec.tempus.lorem@yahoo.org', 'Ap #475-7437 Dui. Rd.'),
(26, 'Rhonda', 'Whitehead', '1-596-782-5965', 'phasellus.in.felis@hotmail.net', 'Ap #456-1554 Semper Road'),
(27, 'Clementine', 'Gill', '1-279-364-2731', 'morbi@yahoo.ca', '428-9507 A Avenue'),
(28, 'Phelan', 'Riddle', '(270) 445-1459', 'nascetur.ridiculus@protonmail.net', '4713 Quam, Road'),
(29, 'Zia', 'Lawrence', '(732) 832-6868', 'imperdiet@google.couk', '796-8413 Suspendisse Rd.'),
(30, 'Cleo', 'Gallagher', '(460) 307-9345', 'mi.felis@yahoo.com', 'Ap #948-8282 Porttitor Av.'),
(1010, '1010', '1010', '1010', '1010', '1001'),
(1011, 'luis', 'perte', '1-212-952-38', 'a.facilisis@icloud.com', 'calle13#54-21');

--
-- Disparadores `dueno`
--
DROP TRIGGER IF EXISTS `TRIGGER_INSERT_DUENO`;
DELIMITER $$
CREATE TRIGGER `TRIGGER_INSERT_DUENO` AFTER INSERT ON `dueno` FOR EACH ROW INSERT INTO auditoria (accion, fecha, usuario) VALUES ("Se inserto un nuevo dueno para asignarle mascotas en el sistema de la veterinaria vet",NOW(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedades`
--

DROP TABLE IF EXISTS `enfermedades`;
CREATE TABLE `enfermedades` (
  `IDENFE` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `sintomas` varchar(300) NOT NULL,
  `tratamiento` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `enfermedades`
--

INSERT INTO `enfermedades` (`IDENFE`, `nombre`, `descripcion`, `sintomas`, `tratamiento`) VALUES
(1, 'Rabia', 'Esta grave enfermedad está causada por un virus que entra en el cuerpo a través de una mordedura o de una herida contaminada por la saliva de un animal infectado. Entre los animales que pueden ser portadores del virus de la rabia, se incluyen los perros, los gatos, los mapaches, los murciélagos, los', 'Boca con saliva abundante, temperamento bipolar con desviación agresiva.', 'El uso generalizado de la vacuna antirrábica en perros y gatos ha reducido la trasmisión de la rabia en estas especies y también en los seres humanos. La rabia humana es sumamente infrecuente en Estados Unidos, y existe una vacuna antirrábica a administrar tras una mordedura de un animal potencialmente rabioso.\r\n\r\n'),
(3, 'Moquillo', 'Esta enfermedad, es para el perro, lo que la suma de los virus de neumonía, impétigo, influenza, disenteria, poliomelitis y encefalitis es para el hombre. En algunas circunstancias, donde el programa vacunal no es constante, todavía puede ser la amenaza más importante de los cachorros.La mayoría de ', 'El grado de participación epitelial y nervioso varía de un animal a otro. En algunos casos es mínimo, mientras.\r\nLos síntomas producidos por la enfermedad son muy variables y se podrían clasificar en tres grupos principales: Aquéllos perros que muestran signos mínimos, los cuales no pueden atribuirs', 'Ciclo de vacunación completa, control medico cada 3 meses, si ya presenta síntomas constante jarabe y antibiótico vía oral para apoyar la recuperación en la zona broqueal'),
(4, 'HEPATITIS, LARINGOTRAQUEITIS Y GASTROENTERITI', 'La hepatitis, laringotraqueitis, y gastroenteritis producidas por virus, tienen una menos importancia respecto a las anteriores por causar un número menor de muertes en los animales.\r\n', 'Aenean rutrum volutpat urna pretium volutpat. Quisque non sem nisi. Cras dignissim imperdiet aliquet. Phasellus lacinia felis a sollicitudin iaculis. Phasellus id volutpat felis. Nunc eleifend condimentum orci, non dapibus nisl euismod id. Suspendisse facilisis tortor vitae lacus ultricies eleifend.', 'El tratamiento de todas ellas está, como en las anteriores, limitado a evitar los efectos de los síntomas producidos por los virus. Por tanto, la mejor forma de proteger de estas enfermedades es proporcionar a los cachorros un plan vacunal adecuado.'),
(5, 'La lorem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque rutrum convallis consectetur. Curabitur nec felis ac risus maximus iaculis. Pellentesque tristique orci et nunc bibendum auctor. Ut sagittis posuere semper. Mauris ut lectus a dui accumsan condimentum a nec nisi. Mauris ut dolor risus.', 'In hac habitasse platea dictumst. Proin mattis in dolor vitae imperdiet. Praesent eget felis ut neque condimentum dignissim. Nunc pellentesque velit nec luctus tempus. Nam imperdiet turpis ac justo sagittis egestas. Mauris luctus eget orci a posuere. Sed non placerat purus. Suspendisse potenti.', 'Aenean rutrum volutpat urna pretium volutpat. Quisque non sem nisi. Cras dignissim imperdiet aliquet. Phasellus lacinia felis a sollicitudin iaculis. Phasellus id volutpat felis. Nunc eleifend condimentum orci, non dapibus nisl euismod id. Suspendisse facilisis tortor vitae lacus ultricies eleifend.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia`
--

DROP TABLE IF EXISTS `historia`;
CREATE TABLE `historia` (
  `IDHIS` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `diagnostico` varchar(90) NOT NULL,
  `mascota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

DROP TABLE IF EXISTS `mascota`;
CREATE TABLE `mascota` (
  `IDMAS` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `edad` varchar(10) NOT NULL,
  `especie` varchar(30) NOT NULL,
  `raza` varchar(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `fechanac` date NOT NULL,
  `dueno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`IDMAS`, `nombre`, `edad`, `especie`, `raza`, `color`, `fechanac`, `dueno`) VALUES
(1, 'Lunaa', '4', 'Can', 'Labrador', 'Marron', '2022-03-09', 19),
(2, 'Elan', '1', 'Can', 'Chihuahua no pura', 'Blanco y cafe', '2022-03-15', 19),
(3, 'kira', '1', 'Can', 'Chihuahua', 'Negro con maron', '2022-03-15', 15),
(4, 'Adxell', '12', 'maron1', 'can1', 'Bull dog', '2022-03-11', 1),
(5, 'Lunaa', '131', 'negro', 'can1', 'Bull dog', '2022-03-08', 1),
(6, 'Lunaa', '131', 'rojo1', 'can1', 'Bull dog', '2022-03-13', 12),
(7, 'Dog', '5', 'rojo', 'can1', 'Bull dog1', '2022-03-08', 13),
(8, 'ramon', '12', 'negro', 'can1', 'Bull dog1', '2022-03-11', 9);

--
-- Disparadores `mascota`
--
DROP TRIGGER IF EXISTS `TRIGGER_INSERT_MASCOTA`;
DELIMITER $$
CREATE TRIGGER `TRIGGER_INSERT_MASCOTA` AFTER INSERT ON `mascota` FOR EACH ROW INSERT INTO auditoria (accion, fecha, usuario) VALUES ("Se registro nueva mascota/paciente en el sistema de la veterinaria vet",NOW(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `masxenfe`
--

DROP TABLE IF EXISTS `masxenfe`;
CREATE TABLE `masxenfe` (
  `IDMASXENFE` int(11) NOT NULL,
  `mascota` int(11) NOT NULL,
  `enfermedad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `masxenfe`
--

INSERT INTO `masxenfe` (`IDMASXENFE`, `mascota`, `enfermedad`) VALUES
(0, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
CREATE TABLE `veterinario` (
  `IDVET` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `veterinario`
--

INSERT INTO `veterinario` (`IDVET`, `nombre`, `apellidos`, `telefono`, `correo`, `direccion`) VALUES
(1, 'Asher', 'Craig', '1-896-624-2306', 'ultrices.mauris@outlook.couk', '800-3013 Semper St.'),
(2, 'Eaton', 'Valdez', '(956) 717-6776', 'suspendisse.aliquet@icloud.com', '638-3250 Mauris Rd.'),
(3, 'Steven', 'Rodriguez', '1-614-707-9506', 'facilisis@google.ca', 'Ap #122-3675 Et Street'),
(4, 'Samantha', 'Mayer', '(690) 965-3355', 'tincidunt.orci.quis@google.com', 'Ap #782-4623 Dis Ave'),
(5, 'Blake', 'Molina', '(365) 110-5600', 'adipiscing.elit@icloud.ca', '268-6935 Neque. St.'),
(6, 'Bianca', 'Decker', '1-275-334-8185', 'etiam.vestibulum.massa@aol.net', '4524 Lorem Rd.'),
(7, 'Lionel', 'Joyce', '(364) 718-2153', 'lorem.ipsum@aol.org', 'P.O. Box 439, 8095 Arcu Street'),
(8, 'Martena', 'Salinas', '(932) 394-1856', 'nunc@aol.ca', 'Ap #456-2365 Aliquet Rd.'),
(9, 'Anthony', 'Hancock', '1-322-552-2108', 'erat@outlook.couk', '5524 Risus. Road'),
(10, 'Lionel', 'Mcknight', '(835) 849-6428', 'neque.morbi@hotmail.net', '847-5980 Vestibulum Road'),
(11, 'Breanna', 'Gray', '(531) 127-5801', 'vulputate@google.couk', '7773 Ipsum Rd.'),
(12, 'Chantale', 'Camacho', '(130) 758-1670', 'dolor.sit@protonmail.ca', 'P.O. Box 308, 7768 Fames Avenue'),
(13, 'Geoffrey', 'George', '1-720-761-3171', 'phasellus@google.com', 'Ap #648-5090 Proin St.'),
(14, 'Kiona', 'Wilkerson', '1-367-854-4592', 'et.nunc@hotmail.net', '4059 Dolor Ave'),
(15, 'Ian', 'Avila', '(937) 151-4228', 'a.auctor.non@outlook.com', 'P.O. Box 420, 7557 Nam Avenue'),
(16, 'Nina', 'Crane', '(606) 257-4356', 'auctor.velit.aliquam@aol.org', '820-7599 Donec Street'),
(17, 'Lisandra', 'Barlow', '1-226-745-3644', 'nonummy.ut.molestie@outlook.com', 'Ap #412-2878 Nibh. Rd.'),
(18, 'Mari', 'Whitaker', '1-434-478-8595', 'blandit.enim.consequat@hotmail.net', 'Ap #197-3846 Purus St.'),
(19, 'Quemby', 'Carney', '1-573-564-8644', 'magna.ut@google.net', 'Ap #964-2002 Facilisis Ave'),
(20, 'Yoko', 'Griffith', '1-637-274-5315', 'diam.dictum@outlook.net', '451-9377 Malesuada Rd.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`IDREGISTRO`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`IDCITA`),
  ADD KEY `mascota` (`mascota`),
  ADD KEY `veterinario` (`veterinario`);

--
-- Indices de la tabla `dueno`
--
ALTER TABLE `dueno`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  ADD PRIMARY KEY (`IDENFE`);

--
-- Indices de la tabla `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`IDHIS`),
  ADD KEY `mascota` (`mascota`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`IDMAS`),
  ADD KEY `dueno` (`dueno`) USING BTREE;

--
-- Indices de la tabla `masxenfe`
--
ALTER TABLE `masxenfe`
  ADD KEY `mascota` (`mascota`),
  ADD KEY `enfermedad` (`enfermedad`);

--
-- Indices de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`IDVET`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `IDREGISTRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `IDCITA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `dueno`
--
ALTER TABLE `dueno`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1012;

--
-- AUTO_INCREMENT de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  MODIFY `IDENFE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historia`
--
ALTER TABLE `historia`
  MODIFY `IDHIS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `IDMAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `IDVET` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`veterinario`) REFERENCES `veterinario` (`IDVET`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`mascota`) REFERENCES `mascota` (`IDMAS`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `historia`
--
ALTER TABLE `historia`
  ADD CONSTRAINT `historia_ibfk_1` FOREIGN KEY (`mascota`) REFERENCES `mascota` (`IDMAS`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`dueno`) REFERENCES `dueno` (`ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `masxenfe`
--
ALTER TABLE `masxenfe`
  ADD CONSTRAINT `masxenfe_ibfk_1` FOREIGN KEY (`mascota`) REFERENCES `mascota` (`IDMAS`) ON UPDATE CASCADE,
  ADD CONSTRAINT `masxenfe_ibfk_2` FOREIGN KEY (`enfermedad`) REFERENCES `enfermedades` (`IDENFE`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
