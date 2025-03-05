-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3308
-- Tiempo de generación: 02-03-2025 a las 17:05:55
-- Versión del servidor: 11.4.5-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `camajobs`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add persona', 7, 'add_persona'),
(26, 'Can change persona', 7, 'change_persona'),
(27, 'Can delete persona', 7, 'delete_persona'),
(28, 'Can view persona', 7, 'view_persona'),
(29, 'Can add empresa', 8, 'add_empresa'),
(30, 'Can change empresa', 8, 'change_empresa'),
(31, 'Can delete empresa', 8, 'delete_empresa'),
(32, 'Can view empresa', 8, 'view_empresa'),
(33, 'Can add oferta', 9, 'add_oferta'),
(34, 'Can change oferta', 9, 'change_oferta'),
(35, 'Can delete oferta', 9, 'delete_oferta'),
(36, 'Can view oferta', 9, 'view_oferta'),
(37, 'Can add postulacion', 10, 'add_postulacion'),
(38, 'Can change postulacion', 10, 'change_postulacion'),
(39, 'Can delete postulacion', 10, 'delete_postulacion'),
(40, 'Can view postulacion', 10, 'view_postulacion'),
(41, 'Can add calificacion', 11, 'add_calificacion'),
(42, 'Can change calificacion', 11, 'change_calificacion'),
(43, 'Can delete calificacion', 11, 'delete_calificacion'),
(44, 'Can view calificacion', 11, 'view_calificacion'),
(45, 'Can add ticket', 12, 'add_ticket'),
(46, 'Can change ticket', 12, 'change_ticket'),
(47, 'Can delete ticket', 12, 'delete_ticket'),
(48, 'Can view ticket', 12, 'view_ticket'),
(49, 'Can add formacion academica', 13, 'add_formacionacademica'),
(50, 'Can change formacion academica', 13, 'change_formacionacademica'),
(51, 'Can delete formacion academica', 13, 'delete_formacionacademica'),
(52, 'Can view formacion academica', 13, 'view_formacionacademica'),
(53, 'Can add experiencia laboral', 14, 'add_experiencialaboral'),
(54, 'Can change experiencia laboral', 14, 'change_experiencialaboral'),
(55, 'Can delete experiencia laboral', 14, 'delete_experiencialaboral'),
(56, 'Can view experiencia laboral', 14, 'view_experiencialaboral'),
(57, 'Can add ticket', 15, 'add_ticket'),
(58, 'Can change ticket', 15, 'change_ticket'),
(59, 'Can delete ticket', 15, 'delete_ticket'),
(60, 'Can view ticket', 15, 'view_ticket'),
(61, 'Can add calificacion persona', 16, 'add_calificacionpersona'),
(62, 'Can change calificacion persona', 16, 'change_calificacionpersona'),
(63, 'Can delete calificacion persona', 16, 'delete_calificacionpersona'),
(64, 'Can view calificacion persona', 16, 'view_calificacionpersona'),
(65, 'Can add calificacion empresa', 17, 'add_calificacionempresa'),
(66, 'Can change calificacion empresa', 17, 'change_calificacionempresa'),
(67, 'Can delete calificacion empresa', 17, 'delete_calificacionempresa'),
(68, 'Can view calificacion empresa', 17, 'view_calificacionempresa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$MlTGC8fyIUkoJIL7hRBe74$1jOz1DYXTpYzrAQ8/lODAComeZVHgRZ3BgZvPNf5xX8=', '2025-03-01 19:21:32.503266', 1, 'camejobs', '', '', '', 1, 1, '2025-02-21 03:09:34.950532'),
(2, 'pbkdf2_sha256$870000$qIdVg0mnOuyzvDulYbBXLg$kjjsGoWxXDUiKi0OOP+JRdRSCwypBDmA/MKAhyuWTlc=', NULL, 0, 'persona1', '', '', '', 0, 1, '2025-02-21 15:28:23.898197'),
(3, 'pbkdf2_sha256$870000$8wF2fKjtZEkNWvbER1nfxs$X9TBii6Im2CEhDd4lCNjc2ozYrFKsg+Kw/jiyea+Mh8=', '2025-02-21 15:46:09.056005', 0, 'persona2', '', '', '', 0, 1, '2025-02-21 15:46:08.031517'),
(4, 'pbkdf2_sha256$870000$STlqaj3QnuMG7vr3WH8t0j$taea+l41PyCqXxXKV9Kfgw2kv9PvO7GeZys7+MFpeIk=', '2025-02-21 15:53:23.763181', 0, 'persona3', '', '', '', 0, 1, '2025-02-21 15:53:22.724659'),
(5, 'pbkdf2_sha256$870000$sMP1oIuqwhgML0htXq8X2N$Kf+NOlaLMu/FfCU9Tolr18InSsjJ28yJggGXDGg8QaM=', '2025-02-22 00:34:49.022772', 0, 'persona7', '', '', '', 0, 1, '2025-02-22 00:34:48.059515'),
(6, 'pbkdf2_sha256$870000$v4TPOAmuUX1Y4dbUkIrazj$bOuQCH43ywF8sY3MkL28Xi9pHRpO8jWiZhgDQbNRzzc=', '2025-02-28 18:32:24.918392', 0, 'Andrew', '', '', '', 0, 1, '2025-02-22 01:13:10.243193'),
(7, 'pbkdf2_sha256$870000$IByams2B3ZprcKSQGdBvoT$4Z0XihoqPm2C6FgDFvwaGjM2Sf7J9alPdQL2SCb6svQ=', '2025-02-28 18:32:04.045214', 0, 'Game_SAS', '', '', 'gmaesas@gmail.com', 0, 1, '2025-02-22 17:53:50.644716'),
(8, 'pbkdf2_sha256$870000$rF9PpwruMfXrY1Hy0zYJys$YpQX2mU0cp/x+ONMDqhNpAtwFJJCEucvTH18VeXf7to=', '2025-03-01 19:19:06.272895', 0, 'Gratis_SAS', '', '', 'GratisSAS@gmail.com', 0, 1, '2025-03-01 19:19:04.975700');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-02-22 18:50:37.405852', '7', 'Game_SAS', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(2, '2025-02-23 16:57:27.159816', '3', 'Empresa Game SAS - En progreso (Game_SAS)', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'ofertas', 'calificacion'),
(9, 'ofertas', 'oferta'),
(10, 'ofertas', 'postulacion'),
(12, 'ofertas', 'ticket'),
(6, 'sessions', 'session'),
(15, 'tickets', 'ticket'),
(17, 'usuarios', 'calificacionempresa'),
(16, 'usuarios', 'calificacionpersona'),
(8, 'usuarios', 'empresa'),
(14, 'usuarios', 'experiencialaboral'),
(13, 'usuarios', 'formacionacademica'),
(7, 'usuarios', 'persona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-02-21 03:05:20.148804'),
(2, 'auth', '0001_initial', '2025-02-21 03:05:20.517150'),
(3, 'admin', '0001_initial', '2025-02-21 03:05:20.595810'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-02-21 03:05:20.602095'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-02-21 03:05:20.609324'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-02-21 03:05:20.674397'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-02-21 03:05:20.699849'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-02-21 03:05:20.730908'),
(9, 'auth', '0004_alter_user_username_opts', '2025-02-21 03:05:20.739921'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-02-21 03:05:20.773507'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-02-21 03:05:20.775042'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-02-21 03:05:20.784326'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-02-21 03:05:20.826369'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-02-21 03:05:20.852935'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-02-21 03:05:20.877593'),
(16, 'auth', '0011_update_proxy_permissions', '2025-02-21 03:05:20.885192'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-02-21 03:05:20.909407'),
(18, 'sessions', '0001_initial', '2025-02-21 03:05:20.949425'),
(19, 'usuarios', '0001_initial', '2025-02-21 15:35:27.641717'),
(20, 'usuarios', '0002_remove_persona_habilidades_persona_cargo_and_more', '2025-02-22 15:54:12.655642'),
(21, 'ofertas', '0001_initial', '2025-02-22 15:56:42.820819'),
(22, 'ofertas', '0002_postulacion', '2025-02-22 15:57:38.692336'),
(23, 'ofertas', '0003_calificacion', '2025-02-22 15:58:16.343480'),
(24, 'ofertas', '0004_ticket', '2025-02-22 16:03:53.740467'),
(25, 'usuarios', '0003_empresa_email_empresa_logo', '2025-02-22 16:19:06.091275'),
(26, 'usuarios', '0004_experiencialaboral_formacionacademica', '2025-02-22 16:28:02.236576'),
(27, 'ofertas', '0005_oferta_ubicacion', '2025-02-22 17:36:37.914333'),
(28, 'usuarios', '0005_empresa_ubicacion_persona_ubicacion', '2025-02-22 17:50:25.073024'),
(29, 'usuarios', '0006_persona_nombre_completo', '2025-02-22 18:37:17.319185'),
(30, 'ofertas', '0006_alter_ticket_usuario', '2025-02-23 16:39:41.813504'),
(31, 'tickets', '0001_initial', '2025-02-23 16:39:41.878201'),
(32, 'usuarios', '0007_calificacionempresa_calificacionpersona', '2025-02-25 19:38:39.041457'),
(33, 'ofertas', '0007_postulacion_fecha_contratacion', '2025-02-25 20:21:57.808459');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('lzyjf4bd5c7lhniw33gklj1qo7y8csqa', '.eJxVjDsOwjAQBe_iGln-O0tJzxmsXX9wANlSnFSIu0OkFNC-mXkvFnBba9hGXsKc2JlJdvrdCOMjtx2kO7Zb57G3dZmJ7wo_6ODXnvLzcrh_BxVH_dY6QxEAYlLOakFosjWEICcPxWsbhUPprVFGOueK8UQWs_PkE0EBqdj7A7jVNvg:1tn4JH:BgArGHQFg-aNyivf8ifL0mf0gTGQebEgiR5hZ-aLdcU', '2025-03-11 23:25:55.014193'),
('uaucocl6j3ssu73rsybv204z39fkax69', '.eJxVjEEOwiAQRe_C2hCgHei4dN8zNMAMUjWQlHZlvLsh6UK3_73332Lxx56Xo_G2rCSuwonL7xZ8fHLpgB6-3KuMtezbGmRX5EmbnCvx63a6fwfZt9xrVjqBRW11iAmMIU2RMaFhtE6hNg4GskATJ8DJajPSoADHCDamgOLzBdwmN2g:1tlw1b:_HwZkiCvql_r3phJ0RZZV5kaKp8WDdO6xo4u-meOiXw', '2025-03-08 20:22:59.702411');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas_calificacion`
--

CREATE TABLE `ofertas_calificacion` (
  `id` bigint(20) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `comentario` longtext DEFAULT NULL,
  `fecha_calificacion` date NOT NULL,
  `empresa_id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas_oferta`
--

CREATE TABLE `ofertas_oferta` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `fecha_cierre` date NOT NULL,
  `activa` tinyint(1) NOT NULL,
  `empresa_id` bigint(20) NOT NULL,
  `ubicacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ofertas_oferta`
--

INSERT INTO `ofertas_oferta` (`id`, `titulo`, `descripcion`, `salario`, `fecha_publicacion`, `fecha_cierre`, `activa`, `empresa_id`, `ubicacion`) VALUES
(1, 'Programador', 'Java', 200.11, '2025-02-22', '2025-05-05', 1, 1, 'Cali');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas_postulacion`
--

CREATE TABLE `ofertas_postulacion` (
  `id` bigint(20) NOT NULL,
  `fecha_postulacion` date NOT NULL,
  `estado` varchar(20) NOT NULL,
  `oferta_id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `fecha_contratacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ofertas_postulacion`
--

INSERT INTO `ofertas_postulacion` (`id`, `fecha_postulacion`, `estado`, `oferta_id`, `trabajador_id`, `fecha_contratacion`) VALUES
(1, '2025-02-22', 'Aprobado', 1, 4, '2025-02-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas_ticket`
--

CREATE TABLE `ofertas_ticket` (
  `id` bigint(20) NOT NULL,
  `asunto` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha_creacion` date NOT NULL,
  `estado` varchar(20) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_ticket`
--

CREATE TABLE `tickets_ticket` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tickets_ticket`
--

INSERT INTO `tickets_ticket` (`id`, `titulo`, `descripcion`, `fecha_creacion`, `estado`, `tipo`, `usuario_id`) VALUES
(2, 'Error de registro', 'olvide mi contraseña parte 2', '2025-02-23 16:50:48.006315', 'Abierto', 'Soporte técnico', 6),
(3, 'Empresa Game SAS', 'Encontré un bug', '2025-02-23 16:52:16.093256', 'En progreso', 'General', 7),
(4, 'No puedo postularme', 'Error de postulacion', '2025-02-23 17:04:57.413411', 'Abierto', 'Soporte técnico', 6),
(5, 'Error con mi BD', 'no puedo ver mi BD', '2025-02-23 17:05:56.465389', 'Abierto', 'Problema de cuenta', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_calificacionempresa`
--

CREATE TABLE `usuarios_calificacionempresa` (
  `id` bigint(20) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `comentario` longtext DEFAULT NULL,
  `fecha` datetime(6) NOT NULL,
  `empresa_id` bigint(20) NOT NULL,
  `persona_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios_calificacionempresa`
--

INSERT INTO `usuarios_calificacionempresa` (`id`, `puntuacion`, `comentario`, `fecha`, `empresa_id`, `persona_id`) VALUES
(1, 4, 'Excelente', '2025-02-25 21:42:40.327180', 1, 4),
(2, 4, 'Excelente', '2025-02-25 21:52:19.591352', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_calificacionpersona`
--

CREATE TABLE `usuarios_calificacionpersona` (
  `id` bigint(20) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `comentario` longtext DEFAULT NULL,
  `fecha` datetime(6) NOT NULL,
  `empresa_id` bigint(20) NOT NULL,
  `persona_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios_calificacionpersona`
--

INSERT INTO `usuarios_calificacionpersona` (`id`, `puntuacion`, `comentario`, `fecha`, `empresa_id`, `persona_id`) VALUES
(1, 5, 'Buen empleado', '2025-02-28 17:44:36.375466', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_empresa`
--

CREATE TABLE `usuarios_empresa` (
  `id` bigint(20) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` longtext NOT NULL,
  `sitio_web` varchar(200) DEFAULT NULL,
  `descripcion` longtext NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios_empresa`
--

INSERT INTO `usuarios_empresa` (`id`, `nit`, `razon_social`, `telefono`, `direccion`, `sitio_web`, `descripcion`, `usuario_id`, `email`, `logo`, `ubicacion`) VALUES
(1, '5555524', 'Game SAS', '3025874123', 'La floresta', 'https://www.youtube.com', 'empresa de juegos', 7, 'gmaesas@gmail.com', '', 'Cali'),
(2, '45221335', 'Gratis_SAS', '3148597', 'Empresa de programación', 'https://www.youtube.com', 'Servicio de hosting', 8, 'GratisSAS@gmail.com', 'logos_empresa/gratis.jpg', 'Cartago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_experiencialaboral`
--

CREATE TABLE `usuarios_experiencialaboral` (
  `id` bigint(20) NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` longtext NOT NULL,
  `en_progreso` tinyint(1) NOT NULL,
  `persona_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios_experiencialaboral`
--

INSERT INTO `usuarios_experiencialaboral` (`id`, `nombre_empresa`, `cargo`, `fecha_inicio`, `fecha_fin`, `descripcion`, `en_progreso`, `persona_id`) VALUES
(1, 'Comer 1', 'Cocinar', '2023-06-25', '2024-07-26', 'Temas personales un poco', 0, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_formacionacademica`
--

CREATE TABLE `usuarios_formacionacademica` (
  `id` bigint(20) NOT NULL,
  `nivel_educativo` varchar(50) NOT NULL,
  `institucion` varchar(100) NOT NULL,
  `titulo_obtenido` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `en_progreso` tinyint(1) NOT NULL,
  `persona_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios_formacionacademica`
--

INSERT INTO `usuarios_formacionacademica` (`id`, `nivel_educativo`, `institucion`, `titulo_obtenido`, `fecha_inicio`, `fecha_fin`, `en_progreso`, `persona_id`) VALUES
(2, 'Técnico', 'INS LOPEZ 1', 'Programador', '2020-06-18', '2022-12-17', 0, 4),
(3, 'Técnico', 'INS LOPEZ', 'Programador', '2020-06-18', '2022-06-16', 0, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_persona`
--

CREATE TABLE `usuarios_persona` (
  `id` bigint(20) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` longtext NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` varchar(10) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `foto_perfil` varchar(100) DEFAULT NULL,
  `perfil_laboral` longtext NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios_persona`
--

INSERT INTO `usuarios_persona` (`id`, `cedula`, `telefono`, `direccion`, `fecha_nacimiento`, `genero`, `usuario_id`, `cargo`, `email`, `foto_perfil`, `perfil_laboral`, `ubicacion`, `nombre_completo`) VALUES
(1, '111113', '3256578', 'Cali', '2001-02-14', 'M', 3, 'Desarrollador', 'ejemplo123@gmail.com', NULL, 'desarrollar programas', 'Cali', 'ejemplo'),
(2, '1111114', '3256579', 'Medellin', '2001-07-13', 'M', 4, 'Desarrollador', 'ejemplo123@gmail.com', NULL, 'desarrollar programas', 'Cali', 'ejemplo'),
(3, '1231452', '3522581478', 'Buenaventura', '2002-07-18', 'F', 5, 'Desarrollador', 'ejemplo123@gmail.com', NULL, 'desarrollar programas', 'Cali', 'ejemplo'),
(4, '1558475236', '3012581452', 'Cali', '2002-10-02', 'M', 6, 'Desarrollador', 'ejemplo123@gmail.com', NULL, 'desarrollar programas', 'Cali', 'ejemplo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `ofertas_calificacion`
--
ALTER TABLE `ofertas_calificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ofertas_calificacion_empresa_id_61ea94ce_fk_usuarios_empresa_id` (`empresa_id`),
  ADD KEY `ofertas_calificacion_trabajador_id_46d3639f_fk_usuarios_` (`trabajador_id`);

--
-- Indices de la tabla `ofertas_oferta`
--
ALTER TABLE `ofertas_oferta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ofertas_oferta_empresa_id_594afa48_fk_usuarios_empresa_id` (`empresa_id`);

--
-- Indices de la tabla `ofertas_postulacion`
--
ALTER TABLE `ofertas_postulacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ofertas_postulacion_oferta_id_05009a1b_fk_ofertas_oferta_id` (`oferta_id`),
  ADD KEY `ofertas_postulacion_trabajador_id_f003416e_fk_usuarios_` (`trabajador_id`);

--
-- Indices de la tabla `ofertas_ticket`
--
ALTER TABLE `ofertas_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ofertas_ticket_usuario_id_d888f66a_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `tickets_ticket`
--
ALTER TABLE `tickets_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_ticket_usuario_id_aad86c40_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `usuarios_calificacionempresa`
--
ALTER TABLE `usuarios_calificacionempresa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_calificacio_empresa_id_f5541357_fk_usuarios_` (`empresa_id`),
  ADD KEY `usuarios_calificacio_persona_id_341c43f4_fk_usuarios_` (`persona_id`);

--
-- Indices de la tabla `usuarios_calificacionpersona`
--
ALTER TABLE `usuarios_calificacionpersona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_calificacio_empresa_id_d7d52b26_fk_usuarios_` (`empresa_id`),
  ADD KEY `usuarios_calificacio_persona_id_9f8c9ba4_fk_usuarios_` (`persona_id`);

--
-- Indices de la tabla `usuarios_empresa`
--
ALTER TABLE `usuarios_empresa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nit` (`nit`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `usuarios_experiencialaboral`
--
ALTER TABLE `usuarios_experiencialaboral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_experiencia_persona_id_5d1d5a7c_fk_usuarios_` (`persona_id`);

--
-- Indices de la tabla `usuarios_formacionacademica`
--
ALTER TABLE `usuarios_formacionacademica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_formacionac_persona_id_7e831942_fk_usuarios_` (`persona_id`);

--
-- Indices de la tabla `usuarios_persona`
--
ALTER TABLE `usuarios_persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `ofertas_calificacion`
--
ALTER TABLE `ofertas_calificacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ofertas_oferta`
--
ALTER TABLE `ofertas_oferta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ofertas_postulacion`
--
ALTER TABLE `ofertas_postulacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ofertas_ticket`
--
ALTER TABLE `ofertas_ticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tickets_ticket`
--
ALTER TABLE `tickets_ticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios_calificacionempresa`
--
ALTER TABLE `usuarios_calificacionempresa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios_calificacionpersona`
--
ALTER TABLE `usuarios_calificacionpersona`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios_empresa`
--
ALTER TABLE `usuarios_empresa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios_experiencialaboral`
--
ALTER TABLE `usuarios_experiencialaboral`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios_formacionacademica`
--
ALTER TABLE `usuarios_formacionacademica`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios_persona`
--
ALTER TABLE `usuarios_persona`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `ofertas_calificacion`
--
ALTER TABLE `ofertas_calificacion`
  ADD CONSTRAINT `ofertas_calificacion_empresa_id_61ea94ce_fk_usuarios_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `usuarios_empresa` (`id`),
  ADD CONSTRAINT `ofertas_calificacion_trabajador_id_46d3639f_fk_usuarios_` FOREIGN KEY (`trabajador_id`) REFERENCES `usuarios_persona` (`id`);

--
-- Filtros para la tabla `ofertas_oferta`
--
ALTER TABLE `ofertas_oferta`
  ADD CONSTRAINT `ofertas_oferta_empresa_id_594afa48_fk_usuarios_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `usuarios_empresa` (`id`);

--
-- Filtros para la tabla `ofertas_postulacion`
--
ALTER TABLE `ofertas_postulacion`
  ADD CONSTRAINT `ofertas_postulacion_oferta_id_05009a1b_fk_ofertas_oferta_id` FOREIGN KEY (`oferta_id`) REFERENCES `ofertas_oferta` (`id`),
  ADD CONSTRAINT `ofertas_postulacion_trabajador_id_f003416e_fk_usuarios_` FOREIGN KEY (`trabajador_id`) REFERENCES `usuarios_persona` (`id`);

--
-- Filtros para la tabla `ofertas_ticket`
--
ALTER TABLE `ofertas_ticket`
  ADD CONSTRAINT `ofertas_ticket_usuario_id_d888f66a_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `tickets_ticket`
--
ALTER TABLE `tickets_ticket`
  ADD CONSTRAINT `tickets_ticket_usuario_id_aad86c40_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `usuarios_calificacionempresa`
--
ALTER TABLE `usuarios_calificacionempresa`
  ADD CONSTRAINT `usuarios_calificacio_empresa_id_f5541357_fk_usuarios_` FOREIGN KEY (`empresa_id`) REFERENCES `usuarios_empresa` (`id`),
  ADD CONSTRAINT `usuarios_calificacio_persona_id_341c43f4_fk_usuarios_` FOREIGN KEY (`persona_id`) REFERENCES `usuarios_persona` (`id`);

--
-- Filtros para la tabla `usuarios_calificacionpersona`
--
ALTER TABLE `usuarios_calificacionpersona`
  ADD CONSTRAINT `usuarios_calificacio_empresa_id_d7d52b26_fk_usuarios_` FOREIGN KEY (`empresa_id`) REFERENCES `usuarios_empresa` (`id`),
  ADD CONSTRAINT `usuarios_calificacio_persona_id_9f8c9ba4_fk_usuarios_` FOREIGN KEY (`persona_id`) REFERENCES `usuarios_persona` (`id`);

--
-- Filtros para la tabla `usuarios_empresa`
--
ALTER TABLE `usuarios_empresa`
  ADD CONSTRAINT `usuarios_empresa_usuario_id_c49ec920_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `usuarios_experiencialaboral`
--
ALTER TABLE `usuarios_experiencialaboral`
  ADD CONSTRAINT `usuarios_experiencia_persona_id_5d1d5a7c_fk_usuarios_` FOREIGN KEY (`persona_id`) REFERENCES `usuarios_persona` (`id`);

--
-- Filtros para la tabla `usuarios_formacionacademica`
--
ALTER TABLE `usuarios_formacionacademica`
  ADD CONSTRAINT `usuarios_formacionac_persona_id_7e831942_fk_usuarios_` FOREIGN KEY (`persona_id`) REFERENCES `usuarios_persona` (`id`);

--
-- Filtros para la tabla `usuarios_persona`
--
ALTER TABLE `usuarios_persona`
  ADD CONSTRAINT `usuarios_persona_usuario_id_b20452d5_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
