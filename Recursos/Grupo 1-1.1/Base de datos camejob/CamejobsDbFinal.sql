-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2024 a las 05:25:01
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
-- Base de datos: `nero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `idCalificacion` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `descripcionCalifi` varchar(450) NOT NULL,
  `codEmpresa` int(11) NOT NULL,
  `codTrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`idCalificacion`, `calificacion`, `descripcionCalifi`, `codEmpresa`, `codTrabajador`) VALUES
(1, 5, 'Excelente ambiente laboral', 1, 1),
(2, 3, 'Cómoda en los horarios', 2, 2),
(3, 4, 'Instalaciones muy bien diseñadas', 3, 3),
(4, 1, 'Retraso en pago y justificaciones para ello', 4, 4),
(5, 2, 'Jefes pésimos! ', 5, 5),
(6, 5, 'Muy buen seguimiento por parte de RH', 6, 6),
(7, 4, 'Horarios muy flexibles', 7, 7),
(8, 2, 'Muy malos horarios, horas extras que no se pagan', 8, 8),
(9, 1, 'Mucho acoso laboral', 9, 9),
(12, 1, 'Muchas vulgaridades por parte del jefe', 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chats`
--

CREATE TABLE `chats` (
  `codChat` int(11) NOT NULL,
  `fechaChat` date NOT NULL,
  `codEmpresa` int(11) NOT NULL,
  `codTrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `chats`
--

INSERT INTO `chats` (`codChat`, `fechaChat`, `codEmpresa`, `codTrabajador`) VALUES
(1, '2024-12-01', 1, 1),
(2, '2024-12-02', 2, 3),
(3, '2024-12-03', 3, 3),
(4, '2024-12-04', 4, 4),
(5, '2024-12-05', 5, 5),
(6, '2024-12-06', 6, 6),
(9, '2024-12-07', 7, 7),
(10, '2024-12-08', 8, 8),
(11, '2024-12-09', 9, 9),
(12, '2024-12-10', 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `codEmpresa` int(11) NOT NULL,
  `nitEmpresa` varchar(45) NOT NULL,
  `nombreEmpresa` varchar(45) NOT NULL,
  `perfilEmpresa` varchar(450) NOT NULL,
  `logoEmpresa` tinyblob DEFAULT NULL,
  `emailEmpresa` varchar(45) NOT NULL,
  `numeroEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`codEmpresa`, `nitEmpresa`, `nombreEmpresa`, `perfilEmpresa`, `logoEmpresa`, `emailEmpresa`, `numeroEmpresa`) VALUES
(1, '900123456', 'Tech Solutions', 'Tecnología', NULL, 'contacto@techsolutions.com', 2147483647),
(2, '900223457', 'Emcali', 'Electricidad', NULL, 'info@globalfoods.com', 2147483647),
(3, '900323458', 'EcoEnergy', 'Energía Renovable', NULL, 'support@ecoenergy.com', 2147483647),
(4, '900423459', 'MedicLife', 'Salud', NULL, 'ventas@mediclife.com', 2147483647),
(5, '900523460', 'EduSmart', 'Educación', NULL, 'info@edusmart.com', 2147483647),
(6, '900623461', 'BuildPro', 'Gimnasio', NULL, 'contacto@buildpro.com', 2147483647),
(7, '900723462', 'TravelMax', 'Turismo', NULL, 'reservas@travelmax.com', 2147483647),
(8, '900823463', 'Movistar', 'Servicios mobiles', NULL, 'info@greenworld.com', 2147483647),
(9, '900923464', 'LogiTrans', 'Logística', NULL, 'contact@logitrans.com', 2147483647),
(10, '901023465', 'FashionHub', 'Ecommerce', NULL, 'ventas@fashionhub.com', 2147483647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencialaboral`
--

CREATE TABLE `experiencialaboral` (
  `idExperiencias` int(11) NOT NULL,
  `nombreEmpresa` varchar(45) NOT NULL,
  `inicioEtapaLaboral` date NOT NULL,
  `finEtapaLaboral` date NOT NULL,
  `cargoLaboral` varchar(45) NOT NULL,
  `descripcionLabo` varchar(450) NOT NULL,
  `codTrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `experiencialaboral`
--

INSERT INTO `experiencialaboral` (`idExperiencias`, `nombreEmpresa`, `inicioEtapaLaboral`, `finEtapaLaboral`, `cargoLaboral`, `descripcionLabo`, `codTrabajador`) VALUES
(1, 'emcali', '2015-11-02', '2019-12-04', 'Programador de software', 'Trabajé para Emcali como programador de Software para el manejo de la página web con acceso a los usuarios.', 1),
(2, 'tigo', '2020-08-19', '2023-04-11', 'Administrador de Bases de datos', 'Controlé las bases de datos, gestioné y administré el registro de ventas', 6),
(3, 'sara', '2018-12-16', '2024-03-07', 'Diseñador web', 'Encargado del diseño web de la pagina de ventas de Sara, dando diseños responsives y óptimos para los clientes', 3),
(4, 'TechSolutions', '2019-12-18', '2023-03-15', 'Tecnico en sistemas', 'Encargado del mantenimiento de computadores y programador de interfaces en java', 4),
(5, 'HadesPos', '2020-01-15', '2023-07-03', 'Programador', 'Encargado de dar reportes de la base de datos y analizar fluctuaciones en esta', 5),
(6, 'TechnologyToday', '2021-07-14', '2024-03-07', 'Programador', 'Encargado de crear una BD óptima para la empresa, y mantenimiento de esta', 2),
(7, 'Sins', '2022-01-07', '2022-12-18', 'Administrador', 'Encargado de administrar un equipo de trabajo para un proyecto de aplicativo movil', 7),
(8, 'POSeidon', '2018-12-16', '2024-03-07', 'Programador Java', 'Encargado de crear interfaces para sistemas POS en una empresa enfocada en estos', 8),
(9, 'Camejobs', '2023-04-16', '2024-12-07', 'Lider', 'Encargado del proyecto Camejobs', 9),
(10, 'Comfandi', '2023-03-02', '2024-03-30', 'Analista', 'Encargado del manejo de la base de datos de inventario de los supermercados Comfandi', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formacion`
--

CREATE TABLE `formacion` (
  `idFormacion` int(11) NOT NULL,
  `añoInicio` date NOT NULL,
  `añoFinal` date NOT NULL,
  `academia` varchar(45) NOT NULL,
  `nombreCarrera` varchar(45) NOT NULL,
  `codTrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `formacion`
--

INSERT INTO `formacion` (`idFormacion`, `añoInicio`, `añoFinal`, `academia`, `nombreCarrera`, `codTrabajador`) VALUES
(1, '2018-07-01', '2024-01-10', 'Universidad Nacional de Colombia', 'Ingeniería de Sistemas', 1),
(2, '2018-02-01', '2022-06-07', 'Politécnico Grancolombiano', 'Desarrollo de Software', 2),
(3, '2019-03-03', '2023-06-18', 'Universidad de los Andes', 'Ciencias de la Computación', 3),
(4, '2021-02-02', '2022-09-10', 'SENA', 'Análisis y Desarrollo de Sistemas de Informac', 4),
(5, '2017-02-11', '2023-06-18', 'Universidad del Valle', 'Ingeniería de Software', 5),
(6, '2022-01-28', '2022-12-14', 'Platzi', 'Curso de Desarrollo Web Full Stack', 6),
(7, '2020-07-01', '2022-07-29', 'Coursera', 'Especialización en Programación en Python', 7),
(8, '2020-08-16', '2024-10-24', 'Universidad Javeriana', 'Ingeniería Informática', 8),
(9, '2023-08-11', '2024-05-10', 'EdX', 'Diplomado en Inteligencia Artificial', 9),
(10, '2022-01-14', '2024-10-13', 'Universidad de Antioquia', 'Tecnología en Desarrollo de Software', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `idMensajes` int(11) NOT NULL,
  `fechaEnvio` date NOT NULL,
  `descripcionMensaje` varchar(100) NOT NULL,
  `chats_codChat` int(11) NOT NULL,
  `codEmpresa` int(11) NOT NULL,
  `codTrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

CREATE TABLE `ofertas` (
  `codOferta` int(11) NOT NULL,
  `salarioOferta` bigint(20) NOT NULL,
  `fechaPublicacion` date NOT NULL,
  `disponibilidad` varchar(45) NOT NULL,
  `experienciaOferta` varchar(45) NOT NULL,
  `descripcionOferta` varchar(450) NOT NULL,
  `modalidadOferta` varchar(45) NOT NULL,
  `horLaboralOFerta` varchar(80) NOT NULL,
  `requisitosOferta` varchar(450) NOT NULL,
  `seleccionOferta` varchar(100) NOT NULL,
  `codEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ofertas`
--

INSERT INTO `ofertas` (`codOferta`, `salarioOferta`, `fechaPublicacion`, `disponibilidad`, `experienciaOferta`, `descripcionOferta`, `modalidadOferta`, `horLaboralOFerta`, `requisitosOferta`, `seleccionOferta`, `codEmpresa`) VALUES
(1, 2500000, '2024-12-01', 'disponible', '1 año', 'Desarrollador Web Full Stack: Responsable de crear y mantener aplicaciones web utilizando tecnologías modernas como React y Node.js.', 'remota', '8 a 4', 'Estudios óptimos para el buen manejo del cargo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', 1),
(2, 3600000, '2024-12-02', 'disponible', '2 año', 'Especialista en Ciberseguridad: Encargado de implementar y gestionar medidas de seguridad informática para proteger datos y sistemas.', 'presencial', '6 a 2, 2 a 10 y 10 a 6.', 'Disponibilidad de tiempo y actitud proactiva ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', 2),
(3, 2800000, '2024-12-03', 'no disponible', '1 año', 'Analista de Datos: Procesa grandes volúmenes de datos para generar informes y aportar insights estratégicos a la empresa.', 'remota', '8 a 4', 'Actitud positiva y conocimientos validos para el correcto desempeño de su labor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', 3),
(4, 3600000, '2024-12-04', 'disponible', '2 año', 'Administrador de Bases de Datos: Diseña, implementa y gestiona bases de datos para garantizar su rendimiento y seguridad.', 'remota', '12 a 8', 'Manejar SQL de manera optima ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', 4),
(5, 3900000, '2024-12-05', 'disponible', '2 año', 'Ingeniero DevOps: Optimiza procesos de desarrollo y despliegue continuo utilizando herramientas como Docker y Kubernetes.', 'remota', '7 a 3', 'Experiencia sustentable y capacidad de optimización para codigos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', 5),
(6, 3900000, '2024-12-06', 'no disponible', '1 año', 'Diseñador UI/UX: Crea experiencias de usuario atractivas y funcionales para aplicaciones y sitios web.', 'remota', '7 a 4', 'Conocimiento en diseño web para crear interfaces llamativas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', 6),
(7, 2700000, '2024-12-07', 'disponible', '1 año', 'Especialista en Cloud Computing: Administra infraestructuras en la nube (AWS, Azure, Google Cloud) y optimiza su rendimiento.', 'presencial', '7 a 2', 'Conocimiento en aplicativos remotos en la nube', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', 7),
(8, 2600000, '2024-12-08', 'disponible', '2 año', 'Desarrollador de Software Móvil: Diseña y programa aplicaciones nativas para iOS y Android.', 'remota', '9 a 1', 'Programador movil con ganas de aprender', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', 8),
(9, 2800000, '2024-12-09', 'no disponible', '1 año', 'Ingeniero en Machine Learning: Desarrolla modelos de aprendizaje automático para resolver problemas complejos de negocio.', 'presencial', '8 a 5 y 9 a 6', 'Actitud positiva para el trabajo en equipo ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', 9),
(10, 2700000, '2024-12-10', 'disponible', '1 año', 'Soporte Técnico TI: Proporciona asistencia y soluciones rápidas a problemas relacionados con hardware y software.', 'remota', '5 a 12', 'Conocimiento en mantenimiento de dispositivos electronicos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postular`
--

CREATE TABLE `postular` (
  `codPostulacion` int(11) NOT NULL,
  `codTrabajador` int(11) NOT NULL,
  `codOferta` int(11) NOT NULL,
  `codEmpresa` int(11) NOT NULL,
  `fechaPostulacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `postular`
--

INSERT INTO `postular` (`codPostulacion`, `codTrabajador`, `codOferta`, `codEmpresa`, `fechaPostulacion`) VALUES
(1, 1, 1, 1, '2024-12-01'),
(2, 2, 2, 2, '2024-12-03'),
(3, 3, 3, 3, '2024-12-09'),
(4, 4, 4, 4, '2024-12-04'),
(5, 5, 5, 5, '2024-12-01'),
(6, 6, 6, 6, '2024-12-03'),
(7, 7, 7, 7, '2024-12-09'),
(8, 8, 8, 8, '2024-12-03'),
(9, 9, 9, 9, '2024-12-11'),
(10, 10, 10, 10, '2024-12-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `idTickets` int(11) NOT NULL,
  `descripcion` varchar(450) NOT NULL,
  `fechaInicial` date NOT NULL,
  `fechaRespuesta` date DEFAULT NULL,
  `codEmpresa` int(11) NOT NULL,
  `codTrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`idTickets`, `descripcion`, `fechaInicial`, `fechaRespuesta`, `codEmpresa`, `codTrabajador`) VALUES
(1, 'Me retuvieron un pago y no me han dado respuesta a los correos que envié', '2024-12-01', NULL, 1, 1),
(2, 'Me mandaron un mensaje separando mi perfil laboral y luego no me dieron el contrato, pero quedé bloqueado en la plataforma ', '2024-12-02', NULL, 2, 2),
(3, 'El trabajador firmó contrato, pero nunca asistió', '2024-12-03', NULL, 3, 3),
(4, 'Firmé contrato, pero me pusieron a hacer otras labores que no tenían que ver con la oferta', '2024-12-04', NULL, 4, 4),
(5, 'La oferta era remota y me hacen ir presencial', '2024-12-05', NULL, 5, 5),
(6, 'La oferta es presencial y me exigen buen internet en casa para trabajar remoto', '2024-12-06', NULL, 6, 6),
(7, 'Un jefe de area me estuvo acosando físicamente ', '2024-12-07', NULL, 7, 7),
(8, 'El empleado golpeó a un administrador', '2024-12-08', NULL, 8, 8),
(9, 'Yanosé q poner', '2024-12-09', NULL, 10, 10),
(10, 'El trabajador borró la BD>:C', '2024-12-10', NULL, 9, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `codTrabajador` int(11) NOT NULL,
  `idTrabajador` int(11) NOT NULL,
  `cargoTrabajador` varchar(45) NOT NULL,
  `nombreTrabajador` varchar(45) NOT NULL,
  `telTrabajador` varchar(45) NOT NULL,
  `emailTrabajador` varchar(45) NOT NULL,
  `perfilLaboral` varchar(450) NOT NULL,
  `infoTrabajador` varchar(800) NOT NULL,
  `imgTrabajador` tinyblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`codTrabajador`, `idTrabajador`, `cargoTrabajador`, `nombreTrabajador`, `telTrabajador`, `emailTrabajador`, `perfilLaboral`, `infoTrabajador`, `imgTrabajador`) VALUES
(1, 12345, 'Programador senior', 'Gustavo Cardona', '3001234567', 'gustavo.cardona@mail.com', 'Administración', 'Programador Senior con conocimientos de múltiples lenguajes, enfocado en el Backend.', NULL),
(2, 24739, 'Programador de PHP', 'Andres Carvajal', '3019876543', 'andres.carvajal@mail.com', 'Operaciones', 'Programador especializado en PHP en el área de Bases de datos.', NULL),
(3, 24829, 'Programador senior', 'Kevin Rojas', '3021122334', 'kevin.rojas@mail.com', 'Oficina', 'Programador senior con dominio de múltiples lenguajes, enfocado en Front y diseño Web responsive.', NULL),
(4, 21434, 'Técnico en programacion', 'Angel Castrillon', '3039988776', 'angel.castrillon@mail.com', 'Soporte Técnico', 'Técnico en programación, especialista en mantenimiento de equipos y alto manejo de Java en creación de interfaces', NULL),
(5, 59687, 'Analista de datos', 'Eduardo Leudo', '3047766554', 'eduardo.leudo@mail.com', 'Datos', 'Analista de bases de datos y generación de reportes', NULL),
(6, 58642, 'Gerente general', 'Jhon Triana', '3053344556', 'jhon.triana@mail.com', 'Proyectos', 'Líder de proyectos con experiencia en planificación y control de requerimientos', NULL),
(7, 28490, 'Supervisor de area', 'Santiago Cerrano', '3068877665', 'santiago.cerrano@mail.com', 'Producción', 'Encargado de supervisar areas de producción y control de equipos con sus respectivos Softwares', NULL),
(8, 28190, 'Programador de java', 'Diego Diaz', '3074455667', 'diego.diaz@mail.com', 'Oficina', 'Apoyo en procesos administrativos y logísticos', NULL),
(9, 58692, 'Gerente de area', 'Oscar Gomez', '3082233445', 'oscar.gomez@mail.com', 'Soporte Técnico', 'Programador senior con manejo de múltiples lenguajes, encargado del manejo del personal y distribución de tareas', NULL),
(10, 44284, 'Analista', 'Julian Medina', '3095566778', 'julian.medina@mail.com', 'Finanzas', 'Analista financiero con habilidades en auditoría', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`idCalificacion`,`codEmpresa`,`codTrabajador`),
  ADD KEY `fk_calificaciones_empresas1_idx` (`codEmpresa`),
  ADD KEY `fk_calificaciones_trabajadores1_idx` (`codTrabajador`);

--
-- Indices de la tabla `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`codChat`,`codEmpresa`,`codTrabajador`),
  ADD KEY `fk_chats_empresas1_idx` (`codEmpresa`),
  ADD KEY `fk_chats_trabajadores1_idx` (`codTrabajador`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`codEmpresa`);

--
-- Indices de la tabla `experiencialaboral`
--
ALTER TABLE `experiencialaboral`
  ADD PRIMARY KEY (`idExperiencias`,`codTrabajador`),
  ADD KEY `fk_experienciaLaboral_trabajadores1_idx` (`codTrabajador`);

--
-- Indices de la tabla `formacion`
--
ALTER TABLE `formacion`
  ADD PRIMARY KEY (`idFormacion`,`codTrabajador`),
  ADD KEY `fk_formacion_trabajadores1_idx` (`codTrabajador`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`idMensajes`,`chats_codChat`,`codEmpresa`,`codTrabajador`),
  ADD KEY `fk_mensajes_chats1_idx` (`chats_codChat`,`codEmpresa`,`codTrabajador`);

--
-- Indices de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD PRIMARY KEY (`codOferta`,`codEmpresa`),
  ADD KEY `fk_oferta_empresa_idx` (`codEmpresa`);

--
-- Indices de la tabla `postular`
--
ALTER TABLE `postular`
  ADD PRIMARY KEY (`codPostulacion`,`codTrabajador`,`codOferta`,`codEmpresa`),
  ADD KEY `fk_empleado_has_oferta_oferta1_idx` (`codOferta`,`codEmpresa`),
  ADD KEY `fk_empleado_has_oferta_empleado1_idx` (`codTrabajador`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`idTickets`,`codEmpresa`,`codTrabajador`),
  ADD KEY `fk_tickets_empresa1_idx` (`codEmpresa`),
  ADD KEY `fk_tickets_trabajadores1_idx` (`codTrabajador`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`codTrabajador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `idCalificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `chats`
--
ALTER TABLE `chats`
  MODIFY `codChat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `codEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `experiencialaboral`
--
ALTER TABLE `experiencialaboral`
  MODIFY `idExperiencias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `formacion`
--
ALTER TABLE `formacion`
  MODIFY `idFormacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `idMensajes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  MODIFY `codOferta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `postular`
--
ALTER TABLE `postular`
  MODIFY `codPostulacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `idTickets` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `codTrabajador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `fk_calificaciones_empresas1` FOREIGN KEY (`codEmpresa`) REFERENCES `empresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_calificaciones_trabajadores1` FOREIGN KEY (`codTrabajador`) REFERENCES `trabajadores` (`codTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `fk_chats_empresas1` FOREIGN KEY (`codEmpresa`) REFERENCES `empresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chats_trabajadores1` FOREIGN KEY (`codTrabajador`) REFERENCES `trabajadores` (`codTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `experiencialaboral`
--
ALTER TABLE `experiencialaboral`
  ADD CONSTRAINT `fk_experienciaLaboral_trabajadores1` FOREIGN KEY (`codTrabajador`) REFERENCES `trabajadores` (`codTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `formacion`
--
ALTER TABLE `formacion`
  ADD CONSTRAINT `fk_formacion_trabajadores1` FOREIGN KEY (`codTrabajador`) REFERENCES `trabajadores` (`codTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `fk_mensajes_chats1` FOREIGN KEY (`chats_codChat`,`codEmpresa`,`codTrabajador`) REFERENCES `chats` (`codChat`, `codEmpresa`, `codTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD CONSTRAINT `fk_oferta_empresa` FOREIGN KEY (`codEmpresa`) REFERENCES `empresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `postular`
--
ALTER TABLE `postular`
  ADD CONSTRAINT `fk_empleado_has_oferta_empleado1` FOREIGN KEY (`codTrabajador`) REFERENCES `trabajadores` (`codTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_has_oferta_oferta1` FOREIGN KEY (`codOferta`,`codEmpresa`) REFERENCES `ofertas` (`codOferta`, `codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_tickets_empresa1` FOREIGN KEY (`codEmpresa`) REFERENCES `empresas` (`codEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tickets_trabajadores1` FOREIGN KEY (`codTrabajador`) REFERENCES `trabajadores` (`codTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
