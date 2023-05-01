
DROP TABLE IF EXISTS `role`;

-- table permission
-- drop table : error syntax
DROP TABLE IF EXISTS `permision`;
CREATE TABLE `jarvis_module_permission` (
  `jarvis_module_permission_id` INT NOT NULL AUTO_INCREMENT,
  `permission_bit` INT UNSIGNED,
  `permission_name` VARCHAR(255),
  `jarvis_module_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`jarvis_module_permission_id`),
  CONSTRAINT `jarvis_module_permission_module_fk` FOREIGN KEY (`jarvis_module_id`) REFERENCES `jarvis_module` (`jarvis_module_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- populate jarvis_module_permission
INSERT INTO `jarvis_module_permission` 
(`permission_bit`, `permission_name`)
VALUES
(1, 'read'),
(2, 'create'),
(4, 'update'),
(8, 'delete');

-- table routes
DROP TABLE IF EXISTS `route`;
CREATE TABLE route (
  `route_id` INT NOT NULL AUTO_INCREMENT,
  `route_action` VARCHAR(6),
  `route_path` VARCHAR(255),
  `route_name` VARCHAR(255),
  PRIMARY KEY (`route_id`) 
);

-- Populate routes
INSERT INTO route 
(`route_action`, `route_path`, `route_name`)
VALUES 
('GET', '/user', 'Liste des utilisateurs'),
('GET', '/user/:id', 'Détail d''un utilisateur'),
('POST', '/user', 'Ajout d''un utilisateur'),
('PUT', '/user/:id', 'Mise à jour d''un utilisateur'),
('DELETE', '/user/:id', 'Suppression d''un utilisateur'),
('GET', '/acces/', 'Liste des commandes'),
('GET', '/acces/:id', 'Détail d''une commande'),
('POST', '/acces', 'Ajout d''une commande'),
('GET', '/ipe/', 'Liste des IPE'),
('GET', '/ipe/:id', 'Détail d''un IPE'),
('GET', '/error', 'Liste des erreurs'),
('GET', '/error/:id', 'Détail d''une erreur'),
('GET', '/sav', 'Liste des SAV'),
('GET', '/file', 'Liste des fichiers'),
('GET', '/oapc', 'OAPC'),
('GET', '/file/:id', 'Détail d''un fichier'),
('GET', '/export', 'Liste des exports');

ALTER TABLE auth DROP role_bit;

-- table auth_group
CREATE OR REPLACE TABLE `auth_group` (
  `auth_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_group_name` varchar(45) DEFAULT NULL,
  `auth_group_start` datetime NOT NULL,
  `auth_group_end` datetime NULL,
  `auth_group_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`auth_group_id`)
);

-- populate auth_group
INSERT INTO `auth_group` 
(`auth_group_name`, `auth_group_start`, `auth_group_end`, `auth_group_type`)
VALUES
("IFTR", 2012-09-16 18:04:16.000, NULL, 1),
("TEST 1", 2023-03-02 16:01:28.000, NULL, 2),
("Test 2", 2023-03-02 16:03:11.000, NULL, 3),
("Test 3", 2023-03-02 16:04:01.000, NULL, 4),
("Test 4", 2023-03-02 16:04:32.000, NULL, 5),
("Test 5", 2023-03-02 16:07:14.000, NULL, 6),
("Test 6", 2023-03-02 16:08:10.000, NULL, 7),
("Test 7", 2023-03-02 16:08:21.000, NULL, 8),
("Test 8", 2023-03-02 16:08:27.000, NULL, 9),
("Test 9", 2023-03-17 10:38:57.000, NULL, 10),
("Test 10", 2023-03-17 11:17:59.000, NULL, 11),
("Test 11", 2023-03-17 11:59:04.000, NULL, 12);

-- table jarvis_module
CREATE OR REPLACE TABLE `jarvis_module` (
  `jarvis_module_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jarvis_module_name` varchar(45) NOT NULL,
  `defaultperms` int(11) DEFAULT NULL,
  PRIMARY KEY (`jarvis_module_id`)
);

-- populate jarvis_module
INSERT INTO `jarvis_module` 
(`jarvis_module_name`, `defaultperms`)
VALUES
("Messages", 11),
("Clients", 11),
("Operateurs", 11),
("References", 11),
("Interconnexions", 11),
("Comptes", 11),
("Acces", 11),
("OAPC", 13),
("SAV", 11),
("NROPM", 11),
("Commande PB", 11),
("Notification adduction", 11),
("IPE", 11),
("CPN", 11),
("WebApi", 11),
("Fichiers", 15),
("Exports", 15),
("Arbre de decision", 1),
("Nommage de fichiers", 11);

-- table auth_jarvis_module 
CREATE TABLE `auth_jarvis_module` (
  `auth_jarvis_module_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(20) unsigned NOT NULL,
  `jarvis_module_id` int(10) unsigned NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NULL,
  `perms` tinyint(1) NOT NULL,
  PRIMARY KEY (`auth_jarvis_module_id`),
  KEY `auth_jarvis_module_fk_idx` (`jarvis_module_id`),
  KEY `auth_jarvis_module_auth_fk_idx` (`auth_id`),
  CONSTRAINT `auth_jarvis_module_auth_fk` FOREIGN KEY (`auth_id`) REFERENCES `auth` (`auth_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `auth_jarvis_module_module_fk` FOREIGN KEY (`jarvis_module_id`) REFERENCES `jarvis_module` (`jarvis_module_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- populate service
INSERT INTO `service`
(`name`)
VALUES
("APC"),
("API"),
("SAV"),
("CRI"),
("EMUTATION"),
("JARVIS");

DROP TABLE IF EXISTS `role_route`;