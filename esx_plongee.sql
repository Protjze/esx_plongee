
USE `yt`; /*Utilisez votre BDD*/

-- Listage de la structure de la table yt. items
/*
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/
-- Listage des données de la table yt.items : ~33 rows (environ)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('diamond', 'Diamant', 1, 0, 1),
	('fish', 'Poisson', 1, 0, 1),
	('gold', 'Or', 1, 0, 1),
	('plongee1', 'Tenue de plongée legere', 1, 0, 1),
	('plongee2', 'Tenue de plongée lourd', 1, 0, 1),
	('tenu_origin', 'Tenu d\'origine', 1, 0, 1), /*<-- Indispensable si vous activez le mode deletage d'item*/
	('stone', 'Pierre', 1, 0, 1),
	('tresor', 'Trésor', 1, 0, 1),
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
