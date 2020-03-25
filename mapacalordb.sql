/*
 Navicat Premium Data Transfer

 Source Server         : Mapa de Calor 2.0
 Source Server Type    : MariaDB
 Source Server Version : 100410
 Source Host           : localhost:3306
 Source Schema         : mapacalordb

 Target Server Type    : MariaDB
 Target Server Version : 100410
 File Encoding         : 65001

 Date: 09/03/2020 12:06:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for armas
-- ----------------------------
DROP TABLE IF EXISTS `armas`;
CREATE TABLE `armas`  (
  `ID_Armas` int(10) NOT NULL,
  `Nombre_Armas` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Armas`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of armas
-- ----------------------------
INSERT INTO `armas` VALUES (1, 'Indeterminado');
INSERT INTO `armas` VALUES (2, 'Por Arma Punzo Cortante');
INSERT INTO `armas` VALUES (3, 'Por Arma Contusa');
INSERT INTO `armas` VALUES (4, 'Por Arma de Fuego');
INSERT INTO `armas` VALUES (5, 'Por arma blanca');
INSERT INTO `armas` VALUES (6, 'Por Arma Casera');
INSERT INTO `armas` VALUES (7, 'Desarmado');

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos`  (
  `ID_Departamentos` int(10) NOT NULL,
  `Nombre_Departamentos` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Departamentos`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departamentos
-- ----------------------------
INSERT INTO `departamentos` VALUES (1, 'Atlantida');
INSERT INTO `departamentos` VALUES (2, 'Choluteca');
INSERT INTO `departamentos` VALUES (3, 'Colon');
INSERT INTO `departamentos` VALUES (4, 'Comayagua');
INSERT INTO `departamentos` VALUES (5, 'Copan');
INSERT INTO `departamentos` VALUES (6, 'Cortes');
INSERT INTO `departamentos` VALUES (7, 'El Paraiso');
INSERT INTO `departamentos` VALUES (8, 'Francisco Morazan');
INSERT INTO `departamentos` VALUES (9, 'Gracias a Dios');
INSERT INTO `departamentos` VALUES (10, 'Intibuca');
INSERT INTO `departamentos` VALUES (11, 'Islas de la Bahia');
INSERT INTO `departamentos` VALUES (12, 'La Paz');
INSERT INTO `departamentos` VALUES (13, 'Lempira');
INSERT INTO `departamentos` VALUES (14, 'Ocotepeque');
INSERT INTO `departamentos` VALUES (15, 'Olancho');
INSERT INTO `departamentos` VALUES (16, 'Santa Barbara');
INSERT INTO `departamentos` VALUES (17, 'Valle');
INSERT INTO `departamentos` VALUES (18, 'Yoro');
INSERT INTO `departamentos` VALUES (19, 'Indeterminado');

-- ----------------------------
-- Table structure for despachos
-- ----------------------------
DROP TABLE IF EXISTS `despachos`;
CREATE TABLE `despachos`  (
  `ID_Despachos` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre_Despachos` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Siglas_Despachos` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Despachos`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of despachos
-- ----------------------------
INSERT INTO `despachos` VALUES (1, 'Fuerza Nacional Anti-Maras y pandillas ', 'FNAMP');
INSERT INTO `despachos` VALUES (2, 'Dirección Nacional de Investigaciones ', 'DPI');
INSERT INTO `despachos` VALUES (3, 'Dirección Nacional de Investigaciones e Inteligencia', 'DNII');
INSERT INTO `despachos` VALUES (4, 'Dirección de Inteligencia Policial ', 'DIPOl');
INSERT INTO `despachos` VALUES (5, 'Policía Nacional de Honduras ', 'PN');
INSERT INTO `despachos` VALUES (6, 'Policía Militar del Orden Público ', 'PMOP');
INSERT INTO `despachos` VALUES (7, 'Agencia Técnica de Investigaciones ', 'ATIC');
INSERT INTO `despachos` VALUES (8, 'Fuerza Nacional de Seguridad y Transporte Urbano ', 'FNSTU');

-- ----------------------------
-- Table structure for eventos
-- ----------------------------
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE `eventos`  (
  `ID_Eventos` int(10) NOT NULL,
  `Nombre_Eventos` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Eventos`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eventos
-- ----------------------------
INSERT INTO `eventos` VALUES (1, 'Maras y pandillas\r\n');
INSERT INTO `eventos` VALUES (2, 'Barras de futbol\r\n');
INSERT INTO `eventos` VALUES (3, 'Enfrentamientos armados.\r\n');
INSERT INTO `eventos` VALUES (4, 'Venta de drogas');
INSERT INTO `eventos` VALUES (5, 'Extorsión');

-- ----------------------------
-- Table structure for ficha_general
-- ----------------------------
DROP TABLE IF EXISTS `ficha_general`;
CREATE TABLE `ficha_general`  (
  `ID_Ficha` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `FK_Usuario_Creacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `FK_Sospechoso` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL,
  `Fecha_Creacion` date NOT NULL,
  `Latitud` decimal(12, 6) NULL DEFAULT NULL,
  `Longitud` decimal(12, 6) NULL DEFAULT NULL,
  `FK_Incidente` int(10) NOT NULL,
  `FK_Departamento` int(10) NOT NULL,
  `Ticket` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Expediente` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL,
  `Descripcion` varchar(10000) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `FK_Armas` int(10) NULL DEFAULT NULL,
  `FK_Usuario_Ultimo_Modificacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL,
  `FK_Municipio` int(11) NOT NULL,
  `FK_Info_Externa` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Ficha`) USING BTREE,
  INDEX `FK_Usuario_Creacion`(`FK_Usuario_Creacion`) USING BTREE,
  INDEX `FK_Sospechoso`(`FK_Sospechoso`) USING BTREE,
  INDEX `FK_Incidente`(`FK_Incidente`) USING BTREE,
  INDEX `FK_Departamento`(`FK_Departamento`) USING BTREE,
  INDEX `FK_Armas`(`FK_Armas`) USING BTREE,
  INDEX `FK_Usuario_Ultimo_Modificacion`(`FK_Usuario_Ultimo_Modificacion`) USING BTREE,
  INDEX `FK_Municipio`(`FK_Municipio`) USING BTREE,
  INDEX `FK_Info_Externa`(`FK_Info_Externa`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for incidentes
-- ----------------------------
DROP TABLE IF EXISTS `incidentes`;
CREATE TABLE `incidentes`  (
  `ID_Incidente` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre_Incidente` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Incidente`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of incidentes
-- ----------------------------
INSERT INTO `incidentes` VALUES (1, 'Accidente de Transito(simple)');
INSERT INTO `incidentes` VALUES (2, 'Accidente de Transito(Multiples o Combinado)');
INSERT INTO `incidentes` VALUES (3, 'Desastres Naturales');
INSERT INTO `incidentes` VALUES (4, 'Delitos contra la Mujer u Hombre');
INSERT INTO `incidentes` VALUES (5, 'Emergencia Medica');
INSERT INTO `incidentes` VALUES (6, 'Delitos Contra la Vida');
INSERT INTO `incidentes` VALUES (7, 'Delitos Contra la Propiedad');
INSERT INTO `incidentes` VALUES (8, 'Delitos Comunes');
INSERT INTO `incidentes` VALUES (9, 'Delitos contra la ninies y Adolecencia ');
INSERT INTO `incidentes` VALUES (10, 'Incendio');

-- ----------------------------
-- Table structure for informacion_externa
-- ----------------------------
DROP TABLE IF EXISTS `informacion_externa`;
CREATE TABLE `informacion_externa`  (
  `ID_Info_Externa` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Descripcion_Info_Externa` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL,
  `FK_Tipo_Info_Externa` int(10) NOT NULL,
  `Fuente_Info_Externa` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL,
  `FK_Usuario_Creacion_Info_Externa` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Fecha_Creacion_Info_Externa` date NOT NULL,
  PRIMARY KEY (`ID_Info_Externa`) USING BTREE,
  INDEX `FK_Tipo_Info_Externa`(`FK_Tipo_Info_Externa`) USING BTREE,
  INDEX `FK_Usuario_Creacion_Info_Externo`(`FK_Usuario_Creacion_Info_Externa`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for municipios
-- ----------------------------
DROP TABLE IF EXISTS `municipios`;
CREATE TABLE `municipios`  (
  `ID_Municipios` int(10) NOT NULL,
  `Nombre_Municipios` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `FK_ID_Departamentos` int(10) NOT NULL,
  PRIMARY KEY (`ID_Municipios`) USING BTREE,
  INDEX `Id_Departamentos`(`FK_ID_Departamentos`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of municipios
-- ----------------------------
INSERT INTO `municipios` VALUES (1, 'La Ceiba', 1);
INSERT INTO `municipios` VALUES (2, 'El Porvenir', 1);
INSERT INTO `municipios` VALUES (3, 'Esparta', 1);
INSERT INTO `municipios` VALUES (4, 'Jutiapa', 1);
INSERT INTO `municipios` VALUES (5, 'La Masica', 1);
INSERT INTO `municipios` VALUES (6, 'San Francisco', 1);
INSERT INTO `municipios` VALUES (7, 'Tela', 1);
INSERT INTO `municipios` VALUES (8, 'Arizona', 1);
INSERT INTO `municipios` VALUES (9, 'Indeterminado', 1);
INSERT INTO `municipios` VALUES (10, 'Choluteca', 2);
INSERT INTO `municipios` VALUES (11, 'Apacilagua', 2);
INSERT INTO `municipios` VALUES (12, 'Concepcion de Maria', 2);
INSERT INTO `municipios` VALUES (13, 'Duyure', 2);
INSERT INTO `municipios` VALUES (14, 'El Corpus', 2);
INSERT INTO `municipios` VALUES (15, 'El Triunfo', 2);
INSERT INTO `municipios` VALUES (16, 'Marcovia', 2);
INSERT INTO `municipios` VALUES (17, 'Morolica', 2);
INSERT INTO `municipios` VALUES (18, 'Namasigue', 2);
INSERT INTO `municipios` VALUES (19, 'Orocuina', 2);
INSERT INTO `municipios` VALUES (20, 'Pespire', 2);
INSERT INTO `municipios` VALUES (21, 'San Antonio de Flores', 2);
INSERT INTO `municipios` VALUES (22, 'San Isidro', 2);
INSERT INTO `municipios` VALUES (23, 'San Jose', 2);
INSERT INTO `municipios` VALUES (24, 'San Marcos de Colon', 2);
INSERT INTO `municipios` VALUES (25, 'Santa Ana de Yusguare', 2);
INSERT INTO `municipios` VALUES (26, 'Indeterminado', 2);
INSERT INTO `municipios` VALUES (27, 'Trujillo', 3);
INSERT INTO `municipios` VALUES (28, 'Balfate', 3);
INSERT INTO `municipios` VALUES (29, 'Iriona', 3);
INSERT INTO `municipios` VALUES (30, 'Limon', 3);
INSERT INTO `municipios` VALUES (31, 'Saba', 3);
INSERT INTO `municipios` VALUES (32, 'Santa Fe', 3);
INSERT INTO `municipios` VALUES (33, 'Santa Rosa de Aguan', 3);
INSERT INTO `municipios` VALUES (34, 'Sonagueria', 3);
INSERT INTO `municipios` VALUES (35, 'Tocoa', 3);
INSERT INTO `municipios` VALUES (36, 'Bonito Oriental', 3);
INSERT INTO `municipios` VALUES (37, 'Indeterminado', 3);
INSERT INTO `municipios` VALUES (38, 'Comayagua', 4);
INSERT INTO `municipios` VALUES (39, 'Ajuterique', 4);
INSERT INTO `municipios` VALUES (40, 'El Rosario', 4);
INSERT INTO `municipios` VALUES (41, 'Esquias', 4);
INSERT INTO `municipios` VALUES (42, 'Humuya', 4);
INSERT INTO `municipios` VALUES (43, 'La Libertad', 4);
INSERT INTO `municipios` VALUES (44, 'Lamani', 4);
INSERT INTO `municipios` VALUES (45, 'La Trinidad', 4);
INSERT INTO `municipios` VALUES (46, 'Lejamani', 4);
INSERT INTO `municipios` VALUES (47, 'Meambar', 4);
INSERT INTO `municipios` VALUES (48, 'Minas de Oro', 4);
INSERT INTO `municipios` VALUES (49, 'Ojos de Agua', 4);
INSERT INTO `municipios` VALUES (50, 'San Jeronimo', 4);
INSERT INTO `municipios` VALUES (51, 'San Jose de Comayagua', 4);
INSERT INTO `municipios` VALUES (52, 'San Jose del Potrero', 4);
INSERT INTO `municipios` VALUES (53, 'San Luis', 4);
INSERT INTO `municipios` VALUES (54, 'San Sebastian', 4);
INSERT INTO `municipios` VALUES (55, 'Siguatepeque', 4);
INSERT INTO `municipios` VALUES (56, 'Villa de San Antonio', 4);
INSERT INTO `municipios` VALUES (57, 'Lajas', 4);
INSERT INTO `municipios` VALUES (58, 'Taulabe', 4);
INSERT INTO `municipios` VALUES (59, 'Indeterminado', 4);
INSERT INTO `municipios` VALUES (60, 'Santa Rosa de Copan', 5);
INSERT INTO `municipios` VALUES (61, 'CabaÃ±as', 5);
INSERT INTO `municipios` VALUES (62, 'Concepcion', 5);
INSERT INTO `municipios` VALUES (63, 'Copan Ruinas', 5);
INSERT INTO `municipios` VALUES (64, 'Corquin', 5);
INSERT INTO `municipios` VALUES (65, 'Cucuyagua', 5);
INSERT INTO `municipios` VALUES (66, 'Dolores', 5);
INSERT INTO `municipios` VALUES (67, 'Dulce Nombre', 5);
INSERT INTO `municipios` VALUES (68, 'El Paraiso', 5);
INSERT INTO `municipios` VALUES (69, 'Florida', 5);
INSERT INTO `municipios` VALUES (70, 'La Jigua', 5);
INSERT INTO `municipios` VALUES (71, 'La Union', 5);
INSERT INTO `municipios` VALUES (72, 'Nueva Arcadia', 5);
INSERT INTO `municipios` VALUES (73, 'San Agustin', 5);
INSERT INTO `municipios` VALUES (74, 'San Antonio', 5);
INSERT INTO `municipios` VALUES (75, 'San Jeronimo', 5);
INSERT INTO `municipios` VALUES (76, 'San Jose', 5);
INSERT INTO `municipios` VALUES (77, 'San Juan de Opoa', 5);
INSERT INTO `municipios` VALUES (78, 'San Nicolas', 5);
INSERT INTO `municipios` VALUES (79, 'San Pedro', 5);
INSERT INTO `municipios` VALUES (80, 'Santa Rita', 5);
INSERT INTO `municipios` VALUES (81, 'Trinidad', 5);
INSERT INTO `municipios` VALUES (82, 'Veracruz', 5);
INSERT INTO `municipios` VALUES (83, 'Indeterminado', 5);
INSERT INTO `municipios` VALUES (84, 'San Pedro Sula', 6);
INSERT INTO `municipios` VALUES (85, 'Choloma', 6);
INSERT INTO `municipios` VALUES (86, 'Omoa', 6);
INSERT INTO `municipios` VALUES (87, 'Pimienta', 6);
INSERT INTO `municipios` VALUES (88, 'Potrerillos', 6);
INSERT INTO `municipios` VALUES (89, 'Puerto Cortes', 6);
INSERT INTO `municipios` VALUES (90, 'San Antonio de Cortes', 6);
INSERT INTO `municipios` VALUES (91, 'San Francisco de Yojoa', 6);
INSERT INTO `municipios` VALUES (92, 'San Manuel', 6);
INSERT INTO `municipios` VALUES (93, 'Santa Cruz de Yojoa', 6);
INSERT INTO `municipios` VALUES (94, 'Villanueva', 6);
INSERT INTO `municipios` VALUES (95, 'La Lima', 6);
INSERT INTO `municipios` VALUES (96, 'Indeterminado', 6);
INSERT INTO `municipios` VALUES (97, 'Yuscaran', 7);
INSERT INTO `municipios` VALUES (98, 'Alauca', 7);
INSERT INTO `municipios` VALUES (99, 'Danli', 7);
INSERT INTO `municipios` VALUES (100, 'El Paraiso', 7);
INSERT INTO `municipios` VALUES (101, 'Guinope', 7);
INSERT INTO `municipios` VALUES (102, 'Jacaleapa', 7);
INSERT INTO `municipios` VALUES (103, 'Liure', 7);
INSERT INTO `municipios` VALUES (104, 'Moroceli', 7);
INSERT INTO `municipios` VALUES (105, 'Oropoli', 7);
INSERT INTO `municipios` VALUES (106, 'Potrerillos', 7);
INSERT INTO `municipios` VALUES (107, 'San Antonio de Flores', 7);
INSERT INTO `municipios` VALUES (108, 'San Lucas', 7);
INSERT INTO `municipios` VALUES (109, 'San Matias', 7);
INSERT INTO `municipios` VALUES (110, 'Soledad', 7);
INSERT INTO `municipios` VALUES (111, 'Teupasenti', 7);
INSERT INTO `municipios` VALUES (112, 'Texiguat', 7);
INSERT INTO `municipios` VALUES (113, 'Vado Ancho', 7);
INSERT INTO `municipios` VALUES (114, 'Yauyupe', 7);
INSERT INTO `municipios` VALUES (115, 'Trojes', 7);
INSERT INTO `municipios` VALUES (116, 'Indeterminado', 7);
INSERT INTO `municipios` VALUES (117, 'Distrito Central', 8);
INSERT INTO `municipios` VALUES (118, 'Alubaren', 8);
INSERT INTO `municipios` VALUES (119, ' Cedros', 8);
INSERT INTO `municipios` VALUES (120, 'Curaren', 8);
INSERT INTO `municipios` VALUES (121, 'Maraita', 8);
INSERT INTO `municipios` VALUES (122, 'Marale', 8);
INSERT INTO `municipios` VALUES (123, 'Nueva Armenia', 8);
INSERT INTO `municipios` VALUES (124, 'Ojojona', 8);
INSERT INTO `municipios` VALUES (125, 'Orica', 8);
INSERT INTO `municipios` VALUES (126, 'Reitoca', 8);
INSERT INTO `municipios` VALUES (127, 'Sabanagrande', 8);
INSERT INTO `municipios` VALUES (128, 'San Antonio de Oriente', 8);
INSERT INTO `municipios` VALUES (129, 'San Buena Aventura', 8);
INSERT INTO `municipios` VALUES (130, 'San Ignacio', 8);
INSERT INTO `municipios` VALUES (131, 'San Juan de Flores', 8);
INSERT INTO `municipios` VALUES (132, 'San Miguelito', 8);
INSERT INTO `municipios` VALUES (133, 'Santa Ana', 8);
INSERT INTO `municipios` VALUES (134, 'Santa Lucia', 8);
INSERT INTO `municipios` VALUES (135, 'Talanga', 8);
INSERT INTO `municipios` VALUES (136, ' Tatumbla', 8);
INSERT INTO `municipios` VALUES (137, 'Valle de Angeles', 8);
INSERT INTO `municipios` VALUES (138, 'Villa de San Francisco', 8);
INSERT INTO `municipios` VALUES (139, 'Vallecillo', 8);
INSERT INTO `municipios` VALUES (140, 'El Porvenir', 8);
INSERT INTO `municipios` VALUES (141, 'Guaimaca', 8);
INSERT INTO `municipios` VALUES (142, 'La Libertad', 8);
INSERT INTO `municipios` VALUES (143, 'La Venta', 8);
INSERT INTO `municipios` VALUES (144, 'Lepaterique', 8);
INSERT INTO `municipios` VALUES (145, 'Indeterminado', 8);
INSERT INTO `municipios` VALUES (146, 'Puerto Lempira', 9);
INSERT INTO `municipios` VALUES (147, 'Brus Laguna', 9);
INSERT INTO `municipios` VALUES (148, 'Ahuas', 9);
INSERT INTO `municipios` VALUES (149, 'Juan Francisco Bulnes', 9);
INSERT INTO `municipios` VALUES (150, 'Villeda Morales', 9);
INSERT INTO `municipios` VALUES (151, 'Wampusirpe', 9);
INSERT INTO `municipios` VALUES (152, 'Indeterminado', 9);
INSERT INTO `municipios` VALUES (153, 'La Esperanza', 10);
INSERT INTO `municipios` VALUES (154, 'Camasca', 10);
INSERT INTO `municipios` VALUES (155, 'Colomoncagua', 10);
INSERT INTO `municipios` VALUES (156, 'Concepcion', 10);
INSERT INTO `municipios` VALUES (157, 'Dolores', 10);
INSERT INTO `municipios` VALUES (158, 'Intibuca', 10);
INSERT INTO `municipios` VALUES (159, 'Jesus de Otoro', 10);
INSERT INTO `municipios` VALUES (160, 'Magdalena', 10);
INSERT INTO `municipios` VALUES (161, 'Masaguara', 10);
INSERT INTO `municipios` VALUES (162, 'San Antonio', 10);
INSERT INTO `municipios` VALUES (163, 'San Isidro', 10);
INSERT INTO `municipios` VALUES (164, 'San Juan de Flores', 10);
INSERT INTO `municipios` VALUES (165, 'San Marcos de la Sierra', 10);
INSERT INTO `municipios` VALUES (166, 'San Miguel Guancapla', 10);
INSERT INTO `municipios` VALUES (167, 'Santa Lucia', 10);
INSERT INTO `municipios` VALUES (168, 'Yamaranguila', 10);
INSERT INTO `municipios` VALUES (169, 'San Francisco Opalaca', 10);
INSERT INTO `municipios` VALUES (170, 'Indeterminado', 10);
INSERT INTO `municipios` VALUES (171, 'Roatan', 11);
INSERT INTO `municipios` VALUES (172, 'Guanaja', 11);
INSERT INTO `municipios` VALUES (173, 'Jose Santos Guardiola', 11);
INSERT INTO `municipios` VALUES (174, 'Utila', 11);
INSERT INTO `municipios` VALUES (175, 'Indeterminado', 11);
INSERT INTO `municipios` VALUES (176, 'La Paz', 12);
INSERT INTO `municipios` VALUES (177, 'Aguanqueterique', 12);
INSERT INTO `municipios` VALUES (178, 'Cabañas', 12);
INSERT INTO `municipios` VALUES (179, 'Cane', 12);
INSERT INTO `municipios` VALUES (180, 'Chinacla', 12);
INSERT INTO `municipios` VALUES (181, 'Guajiquiro', 12);
INSERT INTO `municipios` VALUES (182, 'Luterique', 12);
INSERT INTO `municipios` VALUES (183, 'Marcala', 12);
INSERT INTO `municipios` VALUES (184, 'Mercedes de Oriente', 12);
INSERT INTO `municipios` VALUES (185, 'Opatoro', 12);
INSERT INTO `municipios` VALUES (186, 'San Antonio del Norte', 12);
INSERT INTO `municipios` VALUES (187, 'San Jose', 12);
INSERT INTO `municipios` VALUES (188, 'San Juan', 12);
INSERT INTO `municipios` VALUES (189, 'San Pedro de Tutule', 12);
INSERT INTO `municipios` VALUES (190, 'Santa Ana', 12);
INSERT INTO `municipios` VALUES (191, 'Santa Elena', 12);
INSERT INTO `municipios` VALUES (192, 'Santa Maria', 12);
INSERT INTO `municipios` VALUES (193, 'Santiago Puringla', 12);
INSERT INTO `municipios` VALUES (194, 'Yarula', 12);
INSERT INTO `municipios` VALUES (195, 'Indeterminado', 12);
INSERT INTO `municipios` VALUES (196, 'Gracias', 13);
INSERT INTO `municipios` VALUES (197, 'Belen', 13);
INSERT INTO `municipios` VALUES (198, 'Candelaria', 13);
INSERT INTO `municipios` VALUES (199, 'Cololaca', 13);
INSERT INTO `municipios` VALUES (200, 'Erandique', 13);
INSERT INTO `municipios` VALUES (201, 'Gualcinse', 13);
INSERT INTO `municipios` VALUES (202, 'Guarita', 13);
INSERT INTO `municipios` VALUES (203, 'La Campa', 13);
INSERT INTO `municipios` VALUES (204, 'La Iguala', 13);
INSERT INTO `municipios` VALUES (205, 'Piraera', 13);
INSERT INTO `municipios` VALUES (206, 'San Andres', 13);
INSERT INTO `municipios` VALUES (207, 'San Francisco', 13);
INSERT INTO `municipios` VALUES (208, 'San Juan Guarita', 13);
INSERT INTO `municipios` VALUES (209, 'San Manuel Colohete', 13);
INSERT INTO `municipios` VALUES (210, 'San Rafael', 13);
INSERT INTO `municipios` VALUES (211, 'San Sebastian', 13);
INSERT INTO `municipios` VALUES (212, 'Santa Cruz', 13);
INSERT INTO `municipios` VALUES (213, 'Talgua', 13);
INSERT INTO `municipios` VALUES (214, 'Tambla', 13);
INSERT INTO `municipios` VALUES (215, 'Tomala', 13);
INSERT INTO `municipios` VALUES (216, 'Valladolid', 13);
INSERT INTO `municipios` VALUES (217, 'Virginia', 13);
INSERT INTO `municipios` VALUES (218, 'San Marcos de Caiquin', 13);
INSERT INTO `municipios` VALUES (219, 'Las Flores', 13);
INSERT INTO `municipios` VALUES (220, 'La Union', 13);
INSERT INTO `municipios` VALUES (221, 'La Virtud', 13);
INSERT INTO `municipios` VALUES (222, 'Lepaera', 13);
INSERT INTO `municipios` VALUES (223, 'Mapulaca', 13);
INSERT INTO `municipios` VALUES (224, 'Indeterminado', 13);
INSERT INTO `municipios` VALUES (225, 'Nueva Ocotepeque', 14);
INSERT INTO `municipios` VALUES (226, 'Belen Gualcho', 14);
INSERT INTO `municipios` VALUES (227, 'Concepcion', 14);
INSERT INTO `municipios` VALUES (228, 'Dolores Merendon', 14);
INSERT INTO `municipios` VALUES (229, 'Fraternidad', 14);
INSERT INTO `municipios` VALUES (230, 'La Encarnacion', 14);
INSERT INTO `municipios` VALUES (231, 'La Labor', 14);
INSERT INTO `municipios` VALUES (232, 'Lucerna', 14);
INSERT INTO `municipios` VALUES (233, 'Mercedes', 14);
INSERT INTO `municipios` VALUES (234, 'San Fernando', 14);
INSERT INTO `municipios` VALUES (235, 'San Francisco del Valle', 14);
INSERT INTO `municipios` VALUES (236, 'San Jorge', 14);
INSERT INTO `municipios` VALUES (237, 'San Marcos', 14);
INSERT INTO `municipios` VALUES (238, 'Santa Fe', 14);
INSERT INTO `municipios` VALUES (239, 'Sensenti', 14);
INSERT INTO `municipios` VALUES (240, 'Sinuapa', 14);
INSERT INTO `municipios` VALUES (241, 'Indeterminado', 14);
INSERT INTO `municipios` VALUES (242, 'Juticalpa', 15);
INSERT INTO `municipios` VALUES (243, 'Campamento', 15);
INSERT INTO `municipios` VALUES (244, 'Catacamas', 15);
INSERT INTO `municipios` VALUES (245, 'Concordia', 15);
INSERT INTO `municipios` VALUES (246, 'Dulce Nombre de Culmi', 15);
INSERT INTO `municipios` VALUES (247, 'El Rosario', 15);
INSERT INTO `municipios` VALUES (248, 'Esquipulas del Norte', 15);
INSERT INTO `municipios` VALUES (249, 'Gualaco', 15);
INSERT INTO `municipios` VALUES (250, 'Guarizama', 15);
INSERT INTO `municipios` VALUES (251, 'Guata', 15);
INSERT INTO `municipios` VALUES (252, 'Guayape', 15);
INSERT INTO `municipios` VALUES (253, 'Jano', 15);
INSERT INTO `municipios` VALUES (254, 'La Union', 15);
INSERT INTO `municipios` VALUES (255, 'Mangulile', 15);
INSERT INTO `municipios` VALUES (256, 'Manto', 15);
INSERT INTO `municipios` VALUES (257, 'Salama', 15);
INSERT INTO `municipios` VALUES (258, 'San Esteban', 15);
INSERT INTO `municipios` VALUES (259, 'San Francisco de Becerra', 15);
INSERT INTO `municipios` VALUES (260, 'San Francisco de la Paz', 15);
INSERT INTO `municipios` VALUES (261, 'Santa Maria del Real', 15);
INSERT INTO `municipios` VALUES (262, 'Silca', 15);
INSERT INTO `municipios` VALUES (263, 'Yocon', 15);
INSERT INTO `municipios` VALUES (264, 'Froylan Turcios', 15);
INSERT INTO `municipios` VALUES (265, 'Patuca', 15);
INSERT INTO `municipios` VALUES (266, 'Indeterminado', 15);
INSERT INTO `municipios` VALUES (267, 'Santa Barbara', 16);
INSERT INTO `municipios` VALUES (268, 'Arada', 16);
INSERT INTO `municipios` VALUES (269, 'Atima', 16);
INSERT INTO `municipios` VALUES (270, 'Azacualpa', 16);
INSERT INTO `municipios` VALUES (271, 'Ceguaca', 16);
INSERT INTO `municipios` VALUES (272, 'Colinas', 16);
INSERT INTO `municipios` VALUES (273, 'Concepcion del Norte', 16);
INSERT INTO `municipios` VALUES (274, 'Concepcion del Sur', 16);
INSERT INTO `municipios` VALUES (275, 'Chinda', 16);
INSERT INTO `municipios` VALUES (276, 'El Nispero', 16);
INSERT INTO `municipios` VALUES (277, 'Gualala', 16);
INSERT INTO `municipios` VALUES (278, 'Ilama', 16);
INSERT INTO `municipios` VALUES (279, 'Macuelizo', 16);
INSERT INTO `municipios` VALUES (280, 'Naranjito', 16);
INSERT INTO `municipios` VALUES (281, 'Nuevo Celilac', 16);
INSERT INTO `municipios` VALUES (282, 'Petoa', 16);
INSERT INTO `municipios` VALUES (283, 'Proteccion', 16);
INSERT INTO `municipios` VALUES (284, 'Quimistan', 16);
INSERT INTO `municipios` VALUES (285, 'San Francisco de Ojuera', 16);
INSERT INTO `municipios` VALUES (286, 'San Luis', 16);
INSERT INTO `municipios` VALUES (287, 'San Marcos', 16);
INSERT INTO `municipios` VALUES (288, 'San Nicolas', 16);
INSERT INTO `municipios` VALUES (289, 'San Pedro Zacapa', 16);
INSERT INTO `municipios` VALUES (290, 'Santa Rita', 16);
INSERT INTO `municipios` VALUES (291, 'San Vicente Centenario', 16);
INSERT INTO `municipios` VALUES (292, 'Trinidad', 16);
INSERT INTO `municipios` VALUES (293, 'Las Vegas', 16);
INSERT INTO `municipios` VALUES (294, 'Nueva Frontera', 16);
INSERT INTO `municipios` VALUES (295, 'Indeterminado', 16);
INSERT INTO `municipios` VALUES (296, 'Nacaome', 17);
INSERT INTO `municipios` VALUES (297, 'Alianza', 17);
INSERT INTO `municipios` VALUES (298, 'Amapala', 17);
INSERT INTO `municipios` VALUES (299, 'Aramecina', 17);
INSERT INTO `municipios` VALUES (300, 'Caridad', 17);
INSERT INTO `municipios` VALUES (301, 'Goascoran', 17);
INSERT INTO `municipios` VALUES (302, 'Langue', 17);
INSERT INTO `municipios` VALUES (303, 'San Fco. de Coray', 17);
INSERT INTO `municipios` VALUES (304, 'San Lorenzo', 17);
INSERT INTO `municipios` VALUES (305, 'Indeterminado', 17);
INSERT INTO `municipios` VALUES (306, 'Yoro', 18);
INSERT INTO `municipios` VALUES (307, 'Arenal', 18);
INSERT INTO `municipios` VALUES (308, 'El Negrito', 18);
INSERT INTO `municipios` VALUES (309, 'El Progreso', 18);
INSERT INTO `municipios` VALUES (310, 'Jocon', 18);
INSERT INTO `municipios` VALUES (311, 'Morazan', 18);
INSERT INTO `municipios` VALUES (312, 'Olanchito', 18);
INSERT INTO `municipios` VALUES (313, 'Santa Rita', 18);
INSERT INTO `municipios` VALUES (314, 'Sulaco', 18);
INSERT INTO `municipios` VALUES (315, 'Victoria', 18);
INSERT INTO `municipios` VALUES (316, 'Yorito', 18);
INSERT INTO `municipios` VALUES (317, 'Indeterminado', 18);

-- ----------------------------
-- Table structure for permisos
-- ----------------------------
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos`  (
  `ID_Permiso` int(10) NOT NULL,
  `Nombre_Permiso` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Permiso`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permisos
-- ----------------------------
INSERT INTO `permisos` VALUES (1, 'Admin');
INSERT INTO `permisos` VALUES (2, 'Invitado');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `ID_Rol` int(11) NOT NULL,
  `Nombre_Rol` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `FK_Permiso` int(10) NOT NULL,
  PRIMARY KEY (`ID_Rol`) USING BTREE,
  INDEX `FK_Permiso`(`FK_Permiso`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Administrador', 1);
INSERT INTO `roles` VALUES (2, 'Invitado', 2);
INSERT INTO `roles` VALUES (3, 'GPS', 1);
INSERT INTO `roles` VALUES (4, 'UAFI', 1);

-- ----------------------------
-- Table structure for sospechosos
-- ----------------------------
DROP TABLE IF EXISTS `sospechosos`;
CREATE TABLE `sospechosos`  (
  `ID_Sospechoso` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Descripcion_Sospechoso` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL,
  `Fecha_Creacion` datetime(6) NOT NULL,
  `Genero_Sospechoso` varchar(20) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL,
  `FK_Usuario_Creacion_Sospechoso` varbinary(255) NOT NULL,
  `Edad_Sospechoso` int(10) NOT NULL,
  `FK_Arma` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Sospechoso`) USING BTREE,
  INDEX `FK_Usuario_Creacion_Sospechoso`(`FK_Usuario_Creacion_Sospechoso`) USING BTREE,
  INDEX `FK_Arma`(`FK_Arma`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sub_evento
-- ----------------------------
DROP TABLE IF EXISTS `sub_evento`;
CREATE TABLE `sub_evento`  (
  `ID_Sub_Evento` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre_Sub_Evento` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `FK_Evento` int(10) NOT NULL,
  PRIMARY KEY (`ID_Sub_Evento`) USING BTREE,
  INDEX `FK_Evento`(`FK_Evento`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sub_evento
-- ----------------------------
INSERT INTO `sub_evento` VALUES (1, 'Pandilla 18\r\n', 1);
INSERT INTO `sub_evento` VALUES (2, 'Mara MS-13\r\n', 1);
INSERT INTO `sub_evento` VALUES (3, 'Combo que no se deja\r\n', 1);
INSERT INTO `sub_evento` VALUES (4, 'Benjamins\r\n', 1);
INSERT INTO `sub_evento` VALUES (5, 'Chirizos\r\n', 1);
INSERT INTO `sub_evento` VALUES (6, 'Los Olanchanos\r\n', 1);
INSERT INTO `sub_evento` VALUES (7, 'La Rumba\r\n', 1);
INSERT INTO `sub_evento` VALUES (8, 'Los Pumas\r\n', 1);
INSERT INTO `sub_evento` VALUES (9, 'Vatos Locos\r\n', 1);
INSERT INTO `sub_evento` VALUES (10, 'Indeterminado.\r\n', 1);
INSERT INTO `sub_evento` VALUES (11, 'Ultrafiel\r\n', 2);
INSERT INTO `sub_evento` VALUES (12, 'Revolucionarios\r\n', 2);
INSERT INTO `sub_evento` VALUES (13, 'Pandilla 18\r\n', 3);
INSERT INTO `sub_evento` VALUES (14, 'Mara MS-13\r\n', 3);
INSERT INTO `sub_evento` VALUES (15, 'Combo que no se deja\r\n', 3);
INSERT INTO `sub_evento` VALUES (16, 'Benjamins\r\n', 3);
INSERT INTO `sub_evento` VALUES (17, 'Chirizos\r\n', 3);
INSERT INTO `sub_evento` VALUES (18, 'Ultrafiel\r\n', 3);
INSERT INTO `sub_evento` VALUES (19, 'Revolucionarios', 3);
INSERT INTO `sub_evento` VALUES (20, 'Indeterminado', 3);
INSERT INTO `sub_evento` VALUES (21, 'Pandilla 18\r\n', 4);
INSERT INTO `sub_evento` VALUES (22, 'Mara MS-13\r\n', 4);
INSERT INTO `sub_evento` VALUES (23, 'Combo que no se deja\r\n', 4);
INSERT INTO `sub_evento` VALUES (24, 'Benjamins', 4);
INSERT INTO `sub_evento` VALUES (25, 'Chirizos', 4);
INSERT INTO `sub_evento` VALUES (26, 'Indeterminado', 4);
INSERT INTO `sub_evento` VALUES (27, 'Pandilla 18\r\n', 5);
INSERT INTO `sub_evento` VALUES (28, 'Mara MS-13\r\n', 5);
INSERT INTO `sub_evento` VALUES (29, 'Combo que no se deja\r\n', 5);
INSERT INTO `sub_evento` VALUES (30, 'Benjamins\r\n', 5);
INSERT INTO `sub_evento` VALUES (31, 'Chirizos', 5);
INSERT INTO `sub_evento` VALUES (32, 'Indeterminado', 5);

-- ----------------------------
-- Table structure for sub_incidente
-- ----------------------------
DROP TABLE IF EXISTS `sub_incidente`;
CREATE TABLE `sub_incidente`  (
  `ID_Sub_Incidente` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre_Sub_Incidente` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `FK_Incidente` int(10) NOT NULL,
  PRIMARY KEY (`ID_Sub_Incidente`) USING BTREE,
  INDEX `FK_Incidente`(`FK_Incidente`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 115 CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sub_incidente
-- ----------------------------
INSERT INTO `sub_incidente` VALUES (1, 'Indeterminado', 1);
INSERT INTO `sub_incidente` VALUES (2, 'Despiste', 1);
INSERT INTO `sub_incidente` VALUES (3, 'Tonel', 1);
INSERT INTO `sub_incidente` VALUES (4, 'Vuelta de Campana', 1);
INSERT INTO `sub_incidente` VALUES (5, 'Volteo', 1);
INSERT INTO `sub_incidente` VALUES (6, 'Salto', 1);
INSERT INTO `sub_incidente` VALUES (7, 'Caida', 1);
INSERT INTO `sub_incidente` VALUES (8, 'Choque', 1);
INSERT INTO `sub_incidente` VALUES (9, 'Incendio', 1);
INSERT INTO `sub_incidente` VALUES (10, 'Raspado', 1);
INSERT INTO `sub_incidente` VALUES (11, 'Indeterminado', 2);
INSERT INTO `sub_incidente` VALUES (12, 'Atropello', 2);
INSERT INTO `sub_incidente` VALUES (13, 'Colisión', 2);
INSERT INTO `sub_incidente` VALUES (14, '\r\nColisión Frontal\r\n', 2);
INSERT INTO `sub_incidente` VALUES (15, 'Alcance', 2);
INSERT INTO `sub_incidente` VALUES (16, 'Por Rose', 2);
INSERT INTO `sub_incidente` VALUES (17, 'Colisión Lateral', 2);
INSERT INTO `sub_incidente` VALUES (18, 'Indeterminado', 3);
INSERT INTO `sub_incidente` VALUES (19, 'Incendio', 3);
INSERT INTO `sub_incidente` VALUES (20, 'Terremoto', 3);
INSERT INTO `sub_incidente` VALUES (21, 'Inundación', 3);
INSERT INTO `sub_incidente` VALUES (22, 'Derrumbes', 3);
INSERT INTO `sub_incidente` VALUES (23, 'Deslave', 3);
INSERT INTO `sub_incidente` VALUES (24, 'Desbordamiento', 3);
INSERT INTO `sub_incidente` VALUES (25, 'Vientos Racheados', 3);
INSERT INTO `sub_incidente` VALUES (26, 'Marejadas', 3);
INSERT INTO `sub_incidente` VALUES (27, 'Tsunami', 3);
INSERT INTO `sub_incidente` VALUES (28, 'Fenómeno de Sequia', 3);
INSERT INTO `sub_incidente` VALUES (29, 'Indeterminado', 4);
INSERT INTO `sub_incidente` VALUES (30, 'Acoso Sexual', 4);
INSERT INTO `sub_incidente` VALUES (31, 'Tentativa de Violación', 4);
INSERT INTO `sub_incidente` VALUES (32, 'Violación', 4);
INSERT INTO `sub_incidente` VALUES (33, 'Violencia Domestica', 4);
INSERT INTO `sub_incidente` VALUES (34, 'Violencia Intrafamiliar', 4);
INSERT INTO `sub_incidente` VALUES (35, 'Trata de Personas', 4);
INSERT INTO `sub_incidente` VALUES (36, 'Violencia de Genero', 4);
INSERT INTO `sub_incidente` VALUES (37, 'Indeterminado', 5);
INSERT INTO `sub_incidente` VALUES (38, 'Emergencia Medica', 5);
INSERT INTO `sub_incidente` VALUES (39, 'Indeterminado', 6);
INSERT INTO `sub_incidente` VALUES (40, 'Asesinato', 6);
INSERT INTO `sub_incidente` VALUES (41, 'Homicidio', 6);
INSERT INTO `sub_incidente` VALUES (42, 'Parricidio', 6);
INSERT INTO `sub_incidente` VALUES (43, 'Otras Causas de Muerte', 6);
INSERT INTO `sub_incidente` VALUES (44, 'Tentativas', 6);
INSERT INTO `sub_incidente` VALUES (45, 'Suicidio', 6);
INSERT INTO `sub_incidente` VALUES (46, 'Secuestro', 6);
INSERT INTO `sub_incidente` VALUES (47, 'Terrorismo', 6);
INSERT INTO `sub_incidente` VALUES (48, 'Aborto', 6);
INSERT INTO `sub_incidente` VALUES (49, 'Indeterminado', 7);
INSERT INTO `sub_incidente` VALUES (50, 'Robo', 7);
INSERT INTO `sub_incidente` VALUES (51, 'Robo Agravado', 7);
INSERT INTO `sub_incidente` VALUES (52, 'Robo a Personas', 7);
INSERT INTO `sub_incidente` VALUES (53, 'Robo a Vivienda', 7);
INSERT INTO `sub_incidente` VALUES (54, 'Robo a Vehículos', 7);
INSERT INTO `sub_incidente` VALUES (55, 'Robo de Vehículo', 7);
INSERT INTO `sub_incidente` VALUES (56, 'Robo de Ganado', 7);
INSERT INTO `sub_incidente` VALUES (57, 'Robo a Comercio', 7);
INSERT INTO `sub_incidente` VALUES (58, 'Hurto', 7);
INSERT INTO `sub_incidente` VALUES (59, 'Hurto a Vivienda', 7);
INSERT INTO `sub_incidente` VALUES (60, 'Hurto Agravado', 7);
INSERT INTO `sub_incidente` VALUES (61, 'Hurto Continuado', 7);
INSERT INTO `sub_incidente` VALUES (62, 'Hurto de Arma', 7);
INSERT INTO `sub_incidente` VALUES (63, 'Hurto de Vehiculo', 7);
INSERT INTO `sub_incidente` VALUES (64, 'Indeterminado', 8);
INSERT INTO `sub_incidente` VALUES (65, 'Abuso de Autoridad', 8);
INSERT INTO `sub_incidente` VALUES (66, 'Actos de Lujuria', 8);
INSERT INTO `sub_incidente` VALUES (67, 'Agiotaje', 8);
INSERT INTO `sub_incidente` VALUES (68, 'Alteracion de linderos', 8);
INSERT INTO `sub_incidente` VALUES (69, 'Amenazas a Muerte', 8);
INSERT INTO `sub_incidente` VALUES (70, 'Escandalo en Via Publica', 8);
INSERT INTO `sub_incidente` VALUES (71, 'Ley Seca', 8);
INSERT INTO `sub_incidente` VALUES (72, 'Manifestaciones', 8);
INSERT INTO `sub_incidente` VALUES (73, 'Extorsion', 8);
INSERT INTO `sub_incidente` VALUES (74, 'Extravio de celular', 8);
INSERT INTO `sub_incidente` VALUES (75, 'Extravio chapa identificación', 8);
INSERT INTO `sub_incidente` VALUES (76, 'Asociacion Ilicita', 8);
INSERT INTO `sub_incidente` VALUES (77, 'Atentado', 8);
INSERT INTO `sub_incidente` VALUES (78, 'Cómplice de Homicidio', 8);
INSERT INTO `sub_incidente` VALUES (79, 'Auto Secuestro', 8);
INSERT INTO `sub_incidente` VALUES (80, 'Bigamia', 8);
INSERT INTO `sub_incidente` VALUES (81, 'Calumnia e Injuria', 8);
INSERT INTO `sub_incidente` VALUES (82, 'Chantaje', 8);
INSERT INTO `sub_incidente` VALUES (83, 'Cobros Indebidos', 8);
INSERT INTO `sub_incidente` VALUES (84, 'Cohecho', 8);
INSERT INTO `sub_incidente` VALUES (85, 'Cultivo de Marihuana', 8);
INSERT INTO `sub_incidente` VALUES (86, 'Difamacion', 8);
INSERT INTO `sub_incidente` VALUES (87, 'Discriminacion', 8);
INSERT INTO `sub_incidente` VALUES (88, 'Estafa', 8);
INSERT INTO `sub_incidente` VALUES (89, 'Evasion', 8);
INSERT INTO `sub_incidente` VALUES (90, 'Falsificacion de Documentos', 8);
INSERT INTO `sub_incidente` VALUES (91, 'Falsificacion de Firmas', 8);
INSERT INTO `sub_incidente` VALUES (92, 'Fraude', 8);
INSERT INTO `sub_incidente` VALUES (93, 'Hostigamiento', 8);
INSERT INTO `sub_incidente` VALUES (94, 'Juegos Ilicitos', 8);
INSERT INTO `sub_incidente` VALUES (95, 'Negacion de Asistencia Familiar', 8);
INSERT INTO `sub_incidente` VALUES (96, 'Tortura', 8);
INSERT INTO `sub_incidente` VALUES (97, 'Venta de Loteria Clandestina', 8);
INSERT INTO `sub_incidente` VALUES (98, 'Portacion Ilegal de Armas', 8);
INSERT INTO `sub_incidente` VALUES (99, 'Trafico de Armas', 8);
INSERT INTO `sub_incidente` VALUES (100, 'Indeterminado', 9);
INSERT INTO `sub_incidente` VALUES (101, 'Abandono de menores', 9);
INSERT INTO `sub_incidente` VALUES (102, 'Abusos deshonestos', 9);
INSERT INTO `sub_incidente` VALUES (103, 'Acoso Sexual Infantil', 9);
INSERT INTO `sub_incidente` VALUES (104, 'Tráfico de Menores', 9);
INSERT INTO `sub_incidente` VALUES (105, 'Violación Sexual', 9);
INSERT INTO `sub_incidente` VALUES (106, 'Estupro', 9);
INSERT INTO `sub_incidente` VALUES (107, 'Proxenetismo', 9);
INSERT INTO `sub_incidente` VALUES (108, 'Pornografia Infantil', 9);
INSERT INTO `sub_incidente` VALUES (109, 'Sustracción de Menores', 9);
INSERT INTO `sub_incidente` VALUES (110, 'Estructural', 10);
INSERT INTO `sub_incidente` VALUES (111, 'Vehicular', 10);
INSERT INTO `sub_incidente` VALUES (112, 'Forestal', 10);
INSERT INTO `sub_incidente` VALUES (113, 'Zacatera', 10);
INSERT INTO `sub_incidente` VALUES (114, 'Quema de Basura', 10);

-- ----------------------------
-- Table structure for tipo informacion externa
-- ----------------------------
DROP TABLE IF EXISTS `tipo informacion externa`;
CREATE TABLE `tipo informacion externa`  (
  `ID_Tipo_Inf_Externa` int(10) NOT NULL,
  `Nombre_Tipo_Info_Externa` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Tipo_Inf_Externa`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `ID_Usuario` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Usuario` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Fecha_Creacion` datetime(6) NOT NULL,
  `Nombre_Completo` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Estado` int(10) NOT NULL,
  `FK_Rol` int(10) NOT NULL,
  PRIMARY KEY (`ID_Usuario`) USING BTREE,
  INDEX `FK_Rol`(`FK_Rol`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
