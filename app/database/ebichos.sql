-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Dez-2019 às 22:25
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ebichos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `biological_sample`
--

CREATE TABLE `biological_sample` (
  `id` int(11) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `distance` double(10,2) DEFAULT NULL,
  `latit` varchar(200) DEFAULT NULL,
  `longi` varchar(200) DEFAULT NULL,
  `utm` varchar(100) DEFAULT NULL,
  `species_cientific_id` int(11) DEFAULT NULL,
  `species_common_id` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `habitat` varchar(250) DEFAULT NULL,
  `pickup_location` varchar(200) DEFAULT NULL,
  `larvas` varchar(2) DEFAULT NULL,
  `carrapatos` varchar(2) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `ufms` varchar(2) DEFAULT NULL,
  `collection_user_id` int(11) DEFAULT NULL,
  `direction_road` varchar(15) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `king_id` int(11) DEFAULT NULL,
  `phylum_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `biological_sample`
--

INSERT INTO `biological_sample` (`id`, `route_id`, `date_time`, `distance`, `latit`, `longi`, `utm`, `species_cientific_id`, `species_common_id`, `age`, `habitat`, `pickup_location`, `larvas`, `carrapatos`, `location`, `ufms`, `collection_user_id`, `direction_road`, `gender`, `king_id`, `phylum_id`, `class_id`, `status`) VALUES
(1, 1, '2019-11-30 09:00:00', 575.00, '-22.133448', '-47.409094', '151541', 1, 2, 5, 'Mata / Cerrado', 'Leme - SP', 'N', 'N', 'Leme - SP', 'N', 1, 'E', 'M', 1, 1, 1, 'F'),
(2, 3, '2019-11-30 20:43:00', 20.00, '-23.063917', '-54.157944', '252366', 2, 3, 3, 'Mata Fechada / Cerrado', 'Naviraí/MS', 'N', 'S', 'Rodovia MS 489', 'N', 3, 'D', 'M', 1, 1, 1, 'F'),
(3, 4, '2019-12-02 06:07:00', 490.00, '-23.416804', '-52.547687', '10025891', 1, 2, 7, 'Mata Ciliar', 'Jurupuá/PR', 'S', 'S', 'Jurupuá/PR', 'N', 3, 'E', 'F', 1, 1, 1, 'F');

-- --------------------------------------------------------

--
-- Estrutura da tabela `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `class`
--

INSERT INTO `class` (`id`, `name`) VALUES
(1, 'Mamíferos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `king`
--

CREATE TABLE `king` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `king`
--

INSERT INTO `king` (`id`, `name`) VALUES
(1, 'Animal');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `map_biological`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `map_biological` (
`id` int(11)
,`route` varchar(250)
,`date_time` datetime
,`distance` double(10,2)
,`latit` varchar(200)
,`longi` varchar(200)
,`utm` varchar(100)
,`species_cientifc` varchar(250)
,`species_common` varchar(250)
,`icon` varchar(250)
,`age` int(11)
,`habitat` varchar(250)
,`pickup_location` varchar(200)
,`larvas` varchar(2)
,`carrapatos` varchar(2)
,`location` varchar(100)
,`ufms` varchar(2)
,`usuario` varchar(100)
,`direction_road` varchar(15)
,`gender` varchar(20)
,`reino` varchar(150)
,`phylum` varchar(100)
,`classe` varchar(100)
,`status` varchar(10)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `id_biological_sample` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `register_time` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `note`
--

INSERT INTO `note` (`id`, `id_biological_sample`, `id_user`, `note`, `register_date`, `register_time`) VALUES
(1, 1, 1, '<p>teste</p>', '2019-11-30', '22:59'),
(2, 2, 1, '<p>Animal Levado para o Hospital ABC</p>', '2019-11-30', '23:21'),
(3, 2, 3, '<p>teste 2</p>', '2019-12-11', '18:46');

-- --------------------------------------------------------

--
-- Estrutura da tabela `phylum`
--

CREATE TABLE `phylum` (
  `id` int(11) NOT NULL,
  `phylum` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `phylum`
--

INSERT INTO `phylum` (`id`, `phylum`) VALUES
(1, 'Cordados');

-- --------------------------------------------------------

--
-- Estrutura da tabela `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `route` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `routes`
--

INSERT INTO `routes` (`id`, `route`) VALUES
(1, 'BR163/BR267 - Campo Grande - Nova Alvorada - Casa Verde'),
(2, 'SP330 - Porto Ferreira /SP - Pirassununga/SP'),
(3, 'MS 489 Naviraí/MS - Rio Paraná'),
(4, 'PR 498 - Jurupuá/PR - Porto São Carlos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `species_cientifc`
--

CREATE TABLE `species_cientifc` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `species_cientifc`
--

INSERT INTO `species_cientifc` (`id`, `name`) VALUES
(1, 'Tamandua tetradactyla'),
(2, ' Leopardus pardalis');

-- --------------------------------------------------------

--
-- Estrutura da tabela `species_common`
--

CREATE TABLE `species_common` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `icon` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `species_common`
--

INSERT INTO `species_common` (`id`, `name`, `icon`) VALUES
(2, 'Tamanduá Mirim', 'tamandua.png'),
(3, 'Jaguatirica', 'jaguatirica.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_access_log`
--

CREATE TABLE `system_access_log` (
  `id` int(11) NOT NULL,
  `sessionid` text DEFAULT NULL,
  `login` text DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_access_log`
--

INSERT INTO `system_access_log` (`id`, `sessionid`, `login`, `login_time`, `logout_time`) VALUES
(1, 'f1i2toqqojdbgjj67qkt8an5o6', 'admin', '2019-11-17 17:42:26', '0000-00-00 00:00:00'),
(2, 'oki52c4k4dqlftngafohedlop4', 'admin', '2019-11-20 22:15:10', '2019-11-20 22:19:42'),
(3, '7q05il5lm8211sjoo2trflc1ue', 'admin', '2019-11-20 22:23:52', '2019-11-21 00:13:36'),
(4, 'bmc0eik9r5mot8e5vevm7uipro', 'admin', '2019-11-21 00:13:44', '0000-00-00 00:00:00'),
(5, 'rqppu4irc807ofpa45qsv3moff', 'admin', '2019-11-21 22:21:36', '2019-11-21 23:52:41'),
(6, 'shuekd2a75a3t98t95kmbp5gjo', 'leonardo', '2019-11-21 23:53:00', '2019-11-21 23:53:46'),
(7, '94f4issoufbbv1taofp07o9pan', 'admin', '2019-11-21 23:53:58', '2019-11-21 23:55:56'),
(8, 'kv9n0ppd72110i20287qq6bm4k', 'leonardo', '2019-11-21 23:56:02', '0000-00-00 00:00:00'),
(9, 'cvv247mrjafq6b29hailnlv211', 'leonardo', '2019-11-30 18:11:25', '2019-11-30 18:21:43'),
(10, 'jpkchg8r56kv92ocq9t803fghb', 'admin', '2019-11-30 18:21:53', '0000-00-00 00:00:00'),
(11, '3bcp2qkl72v8tm2gt4h932r31v', 'leonardo', '2019-12-01 11:44:54', '2019-12-01 12:12:43'),
(12, 'cptmokp251flt6h78qkkesqurq', 'admin', '2019-12-01 12:12:52', '0000-00-00 00:00:00'),
(13, '0hajo6qq83qbkm6v0mgvnavn4n', 'leonardo', '2019-12-02 08:52:20', '2019-12-02 09:21:48'),
(14, 'j7v9n185f1gnndte371pb4vl41', 'admin', '2019-12-02 09:21:59', '0000-00-00 00:00:00'),
(15, 'buf1vfhdr7u6b6106v8276eh7b', 'leonardo', '2019-12-08 13:00:52', '2019-12-08 13:21:10'),
(16, 'h5n47d7sv04r10g5l9iimoj1pa', 'admin', '2019-12-08 13:21:20', '2019-12-08 13:24:19'),
(17, 'elvog5ba941r4flbdhtq7b3amv', 'leonardo', '2019-12-08 13:24:22', '2019-12-08 17:33:03'),
(18, 'l6ofqcak3iak1hslmhu1g0atev', 'leonardo', '2019-12-08 17:40:24', '2019-12-08 20:43:36'),
(19, 'gf93jh5kva5i0oc2etnn79fnvg', 'admin', '2019-12-08 20:43:43', '0000-00-00 00:00:00'),
(20, 'j46m89mmfkpqp226dvi5vs32nk', 'leonardo', '2019-12-09 08:49:37', '2019-12-09 08:50:37'),
(21, '3j9gbsg9l6al79rknivbgj9lqf', 'admin', '2019-12-09 08:50:47', '0000-00-00 00:00:00'),
(22, '0r56i6fuc8gu83s7n97idttieh', 'leonardo', '2019-12-11 21:45:57', '2019-12-11 23:12:22'),
(23, 'iq3knk5togj3iuc3utnrigga5g', 'leonardo', '2019-12-11 23:12:36', '0000-00-00 00:00:00'),
(24, 'dioph65s922bjeeavkivvj67hb', 'leonardo', '2019-12-11 23:38:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_change_log`
--

CREATE TABLE `system_change_log` (
  `id` int(11) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login` text DEFAULT NULL,
  `tablename` text DEFAULT NULL,
  `primarykey` text DEFAULT NULL,
  `pkvalue` text DEFAULT NULL,
  `operation` text DEFAULT NULL,
  `columnname` text DEFAULT NULL,
  `oldvalue` text DEFAULT NULL,
  `newvalue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_change_log`
--

INSERT INTO `system_change_log` (`id`, `logdate`, `login`, `tablename`, `primarykey`, `pkvalue`, `operation`, `columnname`, `oldvalue`, `newvalue`) VALUES
(1, '2019-12-09 08:50:05', 'leonardo', 'biological_sample', 'id', '3', 'changed', 'date_time', '2019-12-02 06:07:00', '2019-12-02 06:07'),
(2, '2019-12-09 08:50:05', 'leonardo', 'biological_sample', 'id', '3', 'changed', 'age', '2', '7'),
(3, '2019-12-11 23:17:36', 'leonardo', 'biological_sample', 'id', '2', 'changed', 'status', 'E', 'F'),
(4, '2019-12-11 23:39:49', 'leonardo', 'biological_sample', 'id', '3', 'changed', 'date_time', '2019-12-02 06:07:00', '2019-12-02 06:07'),
(5, '2019-12-11 23:39:49', 'leonardo', 'biological_sample', 'id', '3', 'changed', 'utm', '1002589', '10025891'),
(6, '2019-12-11 23:41:49', 'leonardo', 'biological_sample', 'id', '3', 'changed', 'status', 'E', 'F');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_document`
--

CREATE TABLE `system_document` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `biological_sample_id` int(11) DEFAULT NULL,
  `submission_date` date DEFAULT NULL,
  `archive_date` date DEFAULT NULL,
  `filename` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_document`
--

INSERT INTO `system_document` (`id`, `system_user_id`, `title`, `description`, `category_id`, `biological_sample_id`, `submission_date`, `archive_date`, `filename`) VALUES
(1, 3, 'Teste de Upload', 'Teste', 1, 1, '2019-11-21', NULL, 'Demultiplexador.pdf'),
(2, 3, 'teste', 'teste', 3, 2, '2019-12-11', NULL, 'Modelo.pdf'),
(3, 3, 'hjvhjvhjb', 'hgughh', 2, 3, '2019-12-11', NULL, 'Modelo.pdf');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_document_category`
--

CREATE TABLE `system_document_category` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_document_category`
--

INSERT INTO `system_document_category` (`id`, `name`) VALUES
(1, 'Documentação'),
(2, 'Exames'),
(3, 'Laudos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_document_group`
--

CREATE TABLE `system_document_group` (
  `id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `system_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_document_group`
--

INSERT INTO `system_document_group` (`id`, `document_id`, `system_group_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 2, 6),
(4, 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_document_user`
--

CREATE TABLE `system_document_user` (
  `id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `system_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_group`
--

CREATE TABLE `system_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_group`
--

INSERT INTO `system_group` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Pesquisador'),
(3, 'Ecologia'),
(4, 'Morfologia'),
(5, 'Parisotologia'),
(6, 'Pesquisador - Sênior');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_group_program`
--

CREATE TABLE `system_group_program` (
  `id` int(11) NOT NULL,
  `system_group_id` int(11) DEFAULT NULL,
  `system_program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_group_program`
--

INSERT INTO `system_group_program` (`id`, `system_group_id`, `system_program_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 8),
(8, 1, 9),
(9, 1, 11),
(10, 1, 14),
(11, 1, 15),
(20, 1, 21),
(25, 1, 26),
(26, 1, 27),
(27, 1, 28),
(28, 1, 29),
(30, 1, 31),
(31, 1, 32),
(32, 1, 33),
(33, 1, 34),
(34, 1, 8),
(36, 1, 56),
(38, 1, 57),
(40, 1, 58),
(44, 1, 60),
(46, 1, 61),
(48, 1, 59),
(50, 1, 62),
(73, 1, 63),
(75, 1, 64),
(76, 2, 10),
(77, 2, 12),
(78, 2, 13),
(79, 2, 16),
(80, 2, 17),
(81, 2, 18),
(82, 2, 19),
(83, 2, 20),
(84, 2, 22),
(85, 2, 23),
(86, 2, 24),
(87, 2, 25),
(88, 2, 30),
(89, 2, 56),
(90, 2, 57),
(91, 2, 58),
(92, 2, 60),
(93, 2, 61),
(94, 2, 59),
(95, 2, 62),
(96, 2, 1),
(97, 2, 2),
(98, 2, 63),
(99, 2, 64),
(100, 2, 5),
(101, 2, 6),
(102, 1, 65),
(103, 6, 65);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_message`
--

CREATE TABLE `system_message` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_user_to_id` int(11) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `dt_message` text DEFAULT NULL,
  `checked` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_notification`
--

CREATE TABLE `system_notification` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_user_to_id` int(11) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `dt_message` text DEFAULT NULL,
  `action_url` text DEFAULT NULL,
  `action_label` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `checked` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_notification`
--

INSERT INTO `system_notification` (`id`, `system_user_id`, `system_user_to_id`, `subject`, `message`, `dt_message`, `action_url`, `action_label`, `icon`, `checked`) VALUES
(1, 3, 2, 'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3', 'Clique para acessar o Dossiê', '2019-12-02 06:08:25', 'class=DossieView&method=onView&key=3&id=3', 'Acessar', 'fa fa-table green', 'N'),
(2, 3, 1, 'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3', 'Clique para acessar o Dossiê', '2019-12-02 06:08:25', 'class=DossieView&method=onView&key=3&id=3', 'Acessar', 'fa fa-table green', 'N'),
(3, 3, 3, 'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3', 'Clique para acessar o Dossiê', '2019-12-02 06:08:25', 'class=DossieView&method=onView&key=3&id=3', 'Acessar', 'fa fa-table green', 'Y'),
(4, 3, 2, 'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3', 'Clique para acessar o Dossiê', '2019-12-09 05:50:05', 'class=DossieView&method=onView&key=3&id=3', 'Acessar', 'fa fa-table green', 'N'),
(5, 3, 1, 'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3', 'Clique para acessar o Dossiê', '2019-12-09 05:50:06', 'class=DossieView&method=onView&key=3&id=3', 'Acessar', 'fa fa-table green', 'N'),
(6, 3, 3, 'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3', 'Clique para acessar o Dossiê', '2019-12-09 05:50:06', 'class=DossieView&method=onView&key=3&id=3', 'Acessar', 'fa fa-table green', 'N'),
(7, 3, 2, 'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3', 'Clique para acessar o Dossiê', '2019-12-11 20:39:49', 'class=DossieView&method=onView&key=3&id=3', 'Acessar', 'fa fa-table green', 'N'),
(8, 3, 1, 'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3', 'Clique para acessar o Dossiê', '2019-12-11 20:39:50', 'class=DossieView&method=onView&key=3&id=3', 'Acessar', 'fa fa-table green', 'N'),
(9, 3, 3, 'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3', 'Clique para acessar o Dossiê', '2019-12-11 20:39:50', 'class=DossieView&method=onView&key=3&id=3', 'Acessar', 'fa fa-table green', 'N');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_preference`
--

CREATE TABLE `system_preference` (
  `id` text DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_program`
--

CREATE TABLE `system_program` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `controller` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_program`
--

INSERT INTO `system_program` (`id`, `name`, `controller`) VALUES
(1, 'System Group Form', 'SystemGroupForm'),
(2, 'System Group List', 'SystemGroupList'),
(3, 'System Program Form', 'SystemProgramForm'),
(4, 'System Program List', 'SystemProgramList'),
(5, 'System User Form', 'SystemUserForm'),
(6, 'System User List', 'SystemUserList'),
(7, 'Common Page', 'CommonPage'),
(8, 'System PHP Info', 'SystemPHPInfoView'),
(9, 'System ChangeLog View', 'SystemChangeLogView'),
(10, 'Welcome View', 'WelcomeView'),
(11, 'System Sql Log', 'SystemSqlLogList'),
(12, 'System Profile View', 'SystemProfileView'),
(13, 'System Profile Form', 'SystemProfileForm'),
(14, 'System SQL Panel', 'SystemSQLPanel'),
(15, 'System Access Log', 'SystemAccessLogList'),
(16, 'System Message Form', 'SystemMessageForm'),
(17, 'System Message List', 'SystemMessageList'),
(18, 'System Message Form View', 'SystemMessageFormView'),
(19, 'System Notification List', 'SystemNotificationList'),
(20, 'System Notification Form View', 'SystemNotificationFormView'),
(21, 'System Document Category List', 'SystemDocumentCategoryFormList'),
(22, 'System Document Form', 'SystemDocumentForm'),
(23, 'System Document Upload Form', 'SystemDocumentUploadForm'),
(24, 'System Document List', 'SystemDocumentList'),
(25, 'System Shared Document List', 'SystemSharedDocumentList'),
(26, 'System Unit Form', 'SystemUnitForm'),
(27, 'System Unit List', 'SystemUnitList'),
(28, 'System Access stats', 'SystemAccessLogStats'),
(29, 'System Preference form', 'SystemPreferenceForm'),
(30, 'System Support form', 'SystemSupportForm'),
(31, 'System PHP Error', 'SystemPHPErrorLogView'),
(32, 'System Database Browser', 'SystemDatabaseExplorer'),
(33, 'System Table List', 'SystemTableList'),
(34, 'System Data Browser', 'SystemDataBrowser'),
(35, 'System ChangeLog View', 'SystemChangeLogView'),
(36, 'Welcome View', 'WelcomeView'),
(37, 'System Sql Log', 'SystemSqlLogList'),
(38, 'System Profile View', 'SystemProfileView'),
(39, 'System Profile Form', 'SystemProfileForm'),
(40, 'System SQL Panel', 'SystemSQLPanel'),
(41, 'System Access Log', 'SystemAccessLogList'),
(42, 'System Message List', 'SystemMessageList'),
(43, 'System Message Form View', 'SystemMessageFormView'),
(44, 'System Notification List', 'SystemNotificationList'),
(45, 'System Notification Form View', 'SystemNotificationFormView'),
(46, 'System Document Category List', 'SystemDocumentCategoryFormList'),
(47, 'System Document Form', 'SystemDocumentForm'),
(48, 'System Document Upload Form', 'SystemDocumentUploadForm'),
(49, 'System Document List', 'SystemDocumentList'),
(50, 'System Shared Document List', 'SystemSharedDocumentList'),
(51, 'System Unit Form', 'SystemUnitForm'),
(52, 'System Unit List', 'SystemUnitList'),
(53, 'System Access stats', 'SystemAccessLogStats'),
(54, 'System Preference form', 'SystemPreferenceForm'),
(55, 'System Support form', 'SystemSupportForm'),
(56, 'Species Cientifc Form List', 'SpeciesCientifcFormList'),
(57, 'Nomes de Espécies Comuns', 'SpeciesCommonFormList'),
(58, 'Routes Form List', 'RoutesFormList'),
(59, 'Classe', 'ClasseFormList'),
(60, 'Reino', 'KingFormList'),
(61, 'Phylum', 'PhylumFormList'),
(62, 'Amostra Biológica', 'BiologicalSampleForm'),
(63, 'Dossie View', 'DossieView'),
(64, 'Note Form', 'NoteForm'),
(65, 'Map Biological Update List', 'MapBiologicalUpdateList');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_sql_log`
--

CREATE TABLE `system_sql_log` (
  `id` int(11) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login` text DEFAULT NULL,
  `database_name` text DEFAULT NULL,
  `sql_command` text DEFAULT NULL,
  `statement_type` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_sql_log`
--

INSERT INTO `system_sql_log` (`id`, `logdate`, `login`, `database_name`, `sql_command`, `statement_type`) VALUES
(1, '2019-12-09 08:50:05', 'leonardo', 'permission', 'UPDATE biological_sample SET status = \'E\', route_id = \'4\', date_time = \'2019-12-02 06:07\', distance = \'490.00\', latit = \'-23.416804\', longi = \'-52.547687\', utm = \'1002589\', species_cientific_id = \'1\', species_common_id = \'2\', king_id = \'1\', class_id = \'1\', phylum_id = \'1\', age = \'7\', habitat = \'Mata Ciliar\', pickup_location = \'Jurupuá/PR\', larvas = \'S\', carrapatos = \'S\', location = \'Jurupuá/PR\', ufms = \'N\', collection_user_id = \'3\', direction_road = \'E\', gender = \'F\' WHERE (id = \'3\')', 'UPDATE'),
(2, '2019-12-09 08:50:05', 'leonardo', 'communication', 'INSERT INTO system_notification (system_user_id, system_user_to_id, subject, message, dt_message, action_url, action_label, icon, checked, id) values (\'3\', \'2\', \'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3\', \'Clique para acessar o Dossiê\', \'2019-12-09 05:50:05\', \'class=DossieView&method=onView&key=3&id=3\', \'Acessar\', \'fa fa-table green\', \'N\', 4)', 'INSERT'),
(3, '2019-12-09 08:50:06', 'leonardo', 'communication', 'INSERT INTO system_notification (system_user_id, system_user_to_id, subject, message, dt_message, action_url, action_label, icon, checked, id) values (\'3\', \'1\', \'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3\', \'Clique para acessar o Dossiê\', \'2019-12-09 05:50:06\', \'class=DossieView&method=onView&key=3&id=3\', \'Acessar\', \'fa fa-table green\', \'N\', 5)', 'INSERT'),
(4, '2019-12-09 08:50:06', 'leonardo', 'communication', 'INSERT INTO system_notification (system_user_id, system_user_to_id, subject, message, dt_message, action_url, action_label, icon, checked, id) values (\'3\', \'3\', \'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3\', \'Clique para acessar o Dossiê\', \'2019-12-09 05:50:06\', \'class=DossieView&method=onView&key=3&id=3\', \'Acessar\', \'fa fa-table green\', \'N\', 6)', 'INSERT'),
(5, '2019-12-11 21:46:56', 'leonardo', 'permission', 'INSERT INTO note (id_biological_sample, note, id_user, register_date, register_time, id) values (\'2\', \'<p>teste 2</p>\', \'3\', \'2019-12-11\', \'18:46\', 3)', 'INSERT'),
(6, '2019-12-11 21:48:10', 'leonardo', 'communication', 'INSERT INTO system_document (id, title, description, category_id, biological_sample_id, submission_date, archive_date, system_user_id, filename) values (2, \'teste\', \'teste\', \'3\', \'2\', \'2019-12-11\', NULL, \'3\', \'Modelo.pdf\')', 'INSERT'),
(7, '2019-12-11 21:48:10', 'leonardo', 'communication', 'INSERT INTO system_document_group (system_group_id, document_id, id) values (\'2\', 2, 2)', 'INSERT'),
(8, '2019-12-11 21:48:10', 'leonardo', 'communication', 'INSERT INTO system_document_group (system_group_id, document_id, id) values (\'6\', 2, 3)', 'INSERT'),
(9, '2019-12-11 23:15:34', 'leonardo', 'permission', 'INSERT INTO note (id_biological_sample, note, id_user, register_date, register_time, id) values (\'3\', \'<p>tamandua</p>\', \'3\', \'2019-12-11\', \'20:15\', 4)', 'INSERT'),
(10, '2019-12-11 23:17:35', 'leonardo', 'permission', 'UPDATE biological_sample SET route_id = \'1\', date_time = \'2019-11-30 09:00:00\', distance = \'575.00\', latit = \'-22.133448\', longi = \'-47.409094\', utm = \'151541\', species_cientific_id = \'1\', species_common_id = \'2\', age = \'5\', habitat = \'Mata / Cerrado\', pickup_location = \'Leme - SP\', larvas = \'N\', carrapatos = \'N\', location = \'Leme - SP\', ufms = \'N\', collection_user_id = \'1\', direction_road = \'E\', gender = \'M\', king_id = \'1\', phylum_id = \'1\', class_id = \'1\', status = \'F\' WHERE (id = \'1\')', 'UPDATE'),
(11, '2019-12-11 23:17:36', 'leonardo', 'permission', 'UPDATE biological_sample SET route_id = \'3\', date_time = \'2019-11-30 20:43:00\', distance = \'20.00\', latit = \'-23.063917\', longi = \'-54.157944\', utm = \'252366\', species_cientific_id = \'2\', species_common_id = \'3\', age = \'3\', habitat = \'Mata Fechada / Cerrado\', pickup_location = \'Naviraí/MS\', larvas = \'N\', carrapatos = \'S\', location = \'Rodovia MS 489\', ufms = \'N\', collection_user_id = \'3\', direction_road = \'D\', gender = \'M\', king_id = \'1\', phylum_id = \'1\', class_id = \'1\', status = \'F\' WHERE (id = \'2\')', 'UPDATE'),
(12, '2019-12-11 23:17:36', 'leonardo', 'permission', 'UPDATE biological_sample SET route_id = \'4\', date_time = \'2019-12-02 06:07:00\', distance = \'490.00\', latit = \'-23.416804\', longi = \'-52.547687\', utm = \'1002589\', species_cientific_id = \'1\', species_common_id = \'2\', age = \'7\', habitat = \'Mata Ciliar\', pickup_location = \'Jurupuá/PR\', larvas = \'S\', carrapatos = \'S\', location = \'Jurupuá/PR\', ufms = \'N\', collection_user_id = \'3\', direction_road = \'E\', gender = \'F\', king_id = \'1\', phylum_id = \'1\', class_id = \'1\', status = \'E\' WHERE (id = \'3\')', 'UPDATE'),
(13, '2019-12-11 23:39:49', 'leonardo', 'permission', 'UPDATE biological_sample SET status = \'E\', route_id = \'4\', date_time = \'2019-12-02 06:07\', distance = \'490.00\', latit = \'-23.416804\', longi = \'-52.547687\', utm = \'10025891\', species_cientific_id = \'1\', species_common_id = \'2\', king_id = \'1\', class_id = \'1\', phylum_id = \'1\', age = \'7\', habitat = \'Mata Ciliar\', pickup_location = \'Jurupuá/PR\', larvas = \'S\', carrapatos = \'S\', location = \'Jurupuá/PR\', ufms = \'N\', collection_user_id = \'3\', direction_road = \'E\', gender = \'F\' WHERE (id = \'3\')', 'UPDATE'),
(14, '2019-12-11 23:39:49', 'leonardo', 'communication', 'INSERT INTO system_notification (system_user_id, system_user_to_id, subject, message, dt_message, action_url, action_label, icon, checked, id) values (\'3\', \'2\', \'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3\', \'Clique para acessar o Dossiê\', \'2019-12-11 20:39:49\', \'class=DossieView&method=onView&key=3&id=3\', \'Acessar\', \'fa fa-table green\', \'N\', 7)', 'INSERT'),
(15, '2019-12-11 23:39:50', 'leonardo', 'communication', 'INSERT INTO system_notification (system_user_id, system_user_to_id, subject, message, dt_message, action_url, action_label, icon, checked, id) values (\'3\', \'1\', \'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3\', \'Clique para acessar o Dossiê\', \'2019-12-11 20:39:50\', \'class=DossieView&method=onView&key=3&id=3\', \'Acessar\', \'fa fa-table green\', \'N\', 8)', 'INSERT'),
(16, '2019-12-11 23:39:50', 'leonardo', 'communication', 'INSERT INTO system_notification (system_user_id, system_user_to_id, subject, message, dt_message, action_url, action_label, icon, checked, id) values (\'3\', \'3\', \'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº3\', \'Clique para acessar o Dossiê\', \'2019-12-11 20:39:50\', \'class=DossieView&method=onView&key=3&id=3\', \'Acessar\', \'fa fa-table green\', \'N\', 9)', 'INSERT'),
(17, '2019-12-11 23:40:06', 'leonardo', 'permission', 'INSERT INTO note (id_biological_sample, note, id_user, register_date, register_time, id) values (\'3\', \'<p>fcgcgh</p>\', \'3\', \'2019-12-11\', \'20:40\', 4)', 'INSERT'),
(18, '2019-12-11 23:40:59', 'leonardo', 'communication', 'INSERT INTO system_document (id, title, description, category_id, biological_sample_id, submission_date, archive_date, system_user_id, filename) values (3, \'hjvhjvhjb\', \'hgughh\', \'2\', \'3\', \'2019-12-11\', NULL, \'3\', \'Modelo.pdf\')', 'INSERT'),
(19, '2019-12-11 23:40:59', 'leonardo', 'communication', 'INSERT INTO system_document_group (system_group_id, document_id, id) values (\'2\', 3, 4)', 'INSERT'),
(20, '2019-12-11 23:41:49', 'leonardo', 'permission', 'UPDATE biological_sample SET route_id = \'1\', date_time = \'2019-11-30 09:00:00\', distance = \'575.00\', latit = \'-22.133448\', longi = \'-47.409094\', utm = \'151541\', species_cientific_id = \'1\', species_common_id = \'2\', age = \'5\', habitat = \'Mata / Cerrado\', pickup_location = \'Leme - SP\', larvas = \'N\', carrapatos = \'N\', location = \'Leme - SP\', ufms = \'N\', collection_user_id = \'1\', direction_road = \'E\', gender = \'M\', king_id = \'1\', phylum_id = \'1\', class_id = \'1\', status = \'F\' WHERE (id = \'1\')', 'UPDATE'),
(21, '2019-12-11 23:41:49', 'leonardo', 'permission', 'UPDATE biological_sample SET route_id = \'3\', date_time = \'2019-11-30 20:43:00\', distance = \'20.00\', latit = \'-23.063917\', longi = \'-54.157944\', utm = \'252366\', species_cientific_id = \'2\', species_common_id = \'3\', age = \'3\', habitat = \'Mata Fechada / Cerrado\', pickup_location = \'Naviraí/MS\', larvas = \'N\', carrapatos = \'S\', location = \'Rodovia MS 489\', ufms = \'N\', collection_user_id = \'3\', direction_road = \'D\', gender = \'M\', king_id = \'1\', phylum_id = \'1\', class_id = \'1\', status = \'F\' WHERE (id = \'2\')', 'UPDATE'),
(22, '2019-12-11 23:41:49', 'leonardo', 'permission', 'UPDATE biological_sample SET route_id = \'4\', date_time = \'2019-12-02 06:07:00\', distance = \'490.00\', latit = \'-23.416804\', longi = \'-52.547687\', utm = \'10025891\', species_cientific_id = \'1\', species_common_id = \'2\', age = \'7\', habitat = \'Mata Ciliar\', pickup_location = \'Jurupuá/PR\', larvas = \'S\', carrapatos = \'S\', location = \'Jurupuá/PR\', ufms = \'N\', collection_user_id = \'3\', direction_road = \'E\', gender = \'F\', king_id = \'1\', phylum_id = \'1\', class_id = \'1\', status = \'F\' WHERE (id = \'3\')', 'UPDATE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_unit`
--

CREATE TABLE `system_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user`
--

CREATE TABLE `system_user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `frontpage_id` int(11) DEFAULT NULL,
  `system_unit_id` int(11) DEFAULT NULL,
  `active` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_user`
--

INSERT INTO `system_user` (`id`, `name`, `login`, `password`, `email`, `frontpage_id`, `system_unit_id`, `active`) VALUES
(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.net', 10, NULL, 'Y'),
(2, 'User', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@user.net', 7, NULL, 'Y'),
(3, 'Leonardo Marconi', 'leonardo', '202cb962ac59075b964b07152d234b70', 'leonardo.marconi.pf@hotmail.com', 10, NULL, 'Y');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_group`
--

CREATE TABLE `system_user_group` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_user_group`
--

INSERT INTO `system_user_group` (`id`, `system_user_id`, `system_group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 2),
(4, 3, 2),
(5, 3, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_program`
--

CREATE TABLE `system_user_program` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `system_user_program`
--

INSERT INTO `system_user_program` (`id`, `system_user_id`, `system_program_id`) VALUES
(1, 2, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_unit`
--

CREATE TABLE `system_user_unit` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para vista `map_biological`
--
DROP TABLE IF EXISTS `map_biological`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `map_biological`  AS  select `bs`.`id` AS `id`,`ro`.`route` AS `route`,`bs`.`date_time` AS `date_time`,`bs`.`distance` AS `distance`,`bs`.`latit` AS `latit`,`bs`.`longi` AS `longi`,`bs`.`utm` AS `utm`,`sc`.`name` AS `species_cientifc`,`sco`.`name` AS `species_common`,`sco`.`icon` AS `icon`,`bs`.`age` AS `age`,`bs`.`habitat` AS `habitat`,`bs`.`pickup_location` AS `pickup_location`,`bs`.`larvas` AS `larvas`,`bs`.`carrapatos` AS `carrapatos`,`bs`.`location` AS `location`,`bs`.`ufms` AS `ufms`,`su`.`name` AS `usuario`,`bs`.`direction_road` AS `direction_road`,`bs`.`gender` AS `gender`,`ki`.`name` AS `reino`,`ph`.`phylum` AS `phylum`,`cl`.`name` AS `classe`,`bs`.`status` AS `status` from (((((((`biological_sample` `bs` left join `routes` `ro` on(`bs`.`route_id` = `ro`.`id`)) left join `species_cientifc` `sc` on(`bs`.`species_cientific_id` = `sc`.`id`)) left join `species_common` `sco` on(`bs`.`species_common_id` = `sco`.`id`)) left join `system_user` `su` on(`bs`.`collection_user_id` = `su`.`id`)) left join `king` `ki` on(`bs`.`king_id` = `ki`.`id`)) left join `phylum` `ph` on(`bs`.`phylum_id` = `ph`.`id`)) left join `class` `cl` on(`bs`.`class_id` = `cl`.`id`)) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `biological_sample`
--
ALTER TABLE `biological_sample`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `king`
--
ALTER TABLE `king`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `phylum`
--
ALTER TABLE `phylum`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `species_cientifc`
--
ALTER TABLE `species_cientifc`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `species_common`
--
ALTER TABLE `species_common`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_access_log`
--
ALTER TABLE `system_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_change_log`
--
ALTER TABLE `system_change_log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_document`
--
ALTER TABLE `system_document`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_document_category`
--
ALTER TABLE `system_document_category`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_document_group`
--
ALTER TABLE `system_document_group`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_document_user`
--
ALTER TABLE `system_document_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_group`
--
ALTER TABLE `system_group`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_group_program`
--
ALTER TABLE `system_group_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_group_program_program_idx` (`system_program_id`),
  ADD KEY `sys_group_program_group_idx` (`system_group_id`);

--
-- Índices para tabela `system_message`
--
ALTER TABLE `system_message`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_notification`
--
ALTER TABLE `system_notification`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_program`
--
ALTER TABLE `system_program`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_sql_log`
--
ALTER TABLE `system_sql_log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_unit`
--
ALTER TABLE `system_unit`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_user`
--
ALTER TABLE `system_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_user_program_idx` (`frontpage_id`);

--
-- Índices para tabela `system_user_group`
--
ALTER TABLE `system_user_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_user_group_group_idx` (`system_group_id`),
  ADD KEY `sys_user_group_user_idx` (`system_user_id`);

--
-- Índices para tabela `system_user_program`
--
ALTER TABLE `system_user_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_user_program_program_idx` (`system_program_id`),
  ADD KEY `sys_user_program_user_idx` (`system_user_id`);

--
-- Índices para tabela `system_user_unit`
--
ALTER TABLE `system_user_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_user_id` (`system_user_id`),
  ADD KEY `system_unit_id` (`system_unit_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `biological_sample`
--
ALTER TABLE `biological_sample`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `king`
--
ALTER TABLE `king`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `phylum`
--
ALTER TABLE `phylum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `species_cientifc`
--
ALTER TABLE `species_cientifc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `species_common`
--
ALTER TABLE `species_common`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`id_biological_sample`) REFERENCES `biological_sample` (`id`);

--
-- Limitadores para a tabela `system_group_program`
--
ALTER TABLE `system_group_program`
  ADD CONSTRAINT `system_group_program_ibfk_1` FOREIGN KEY (`system_group_id`) REFERENCES `system_group` (`id`),
  ADD CONSTRAINT `system_group_program_ibfk_2` FOREIGN KEY (`system_program_id`) REFERENCES `system_program` (`id`);

--
-- Limitadores para a tabela `system_user`
--
ALTER TABLE `system_user`
  ADD CONSTRAINT `system_user_ibfk_1` FOREIGN KEY (`frontpage_id`) REFERENCES `system_program` (`id`);

--
-- Limitadores para a tabela `system_user_group`
--
ALTER TABLE `system_user_group`
  ADD CONSTRAINT `system_user_group_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  ADD CONSTRAINT `system_user_group_ibfk_2` FOREIGN KEY (`system_group_id`) REFERENCES `system_group` (`id`);

--
-- Limitadores para a tabela `system_user_program`
--
ALTER TABLE `system_user_program`
  ADD CONSTRAINT `system_user_program_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  ADD CONSTRAINT `system_user_program_ibfk_2` FOREIGN KEY (`system_program_id`) REFERENCES `system_program` (`id`);

--
-- Limitadores para a tabela `system_user_unit`
--
ALTER TABLE `system_user_unit`
  ADD CONSTRAINT `system_user_unit_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  ADD CONSTRAINT `system_user_unit_ibfk_2` FOREIGN KEY (`system_unit_id`) REFERENCES `system_unit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
