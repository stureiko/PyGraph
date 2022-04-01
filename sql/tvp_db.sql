-- Создаём БД
CREATE DATABASE IF NOT EXISTS tvp;

-- Делаем её текущей
USE tvp;

-- Чистим базу от всех данных
DROP TABLE IF EXISTS `lines`;
DROP TABLE IF EXISTS `line_type`;
DROP TABLE IF EXISTS `nodes`;
DROP TABLE IF EXISTS `graphs`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `users_type`;
DROP TABLE IF EXISTS `scenarios`;
DROP TABLE IF EXISTS `nodes_type`;
DROP TABLE IF EXISTS `flows`;


-- типы пользователей
CREATE TABLE IF NOT EXISTS `users_type` (
	`user_type_id` INT UNSIGNED NOT NULL PRIMARY KEY,
	description VARCHAR(255) NOT NULL
);

INSERT INTO `users_type` (`user_type_id`, `description`) 
	VALUES (1, 'Standard work user');
INSERT INTO `users_type` (`user_type_id`, `description`) 
	VALUES (2, 'DB Admin');
INSERT INTO `users_type` (`user_type_id`, `description`) 
	VALUES (3, 'Main system admin');
INSERT INTO `users_type` (`user_type_id`, `description`) 
	VALUES (4, 'Using for future');
INSERT INTO `users_type` (`user_type_id`, `description`) 
	VALUES (5, 'Using for future');
INSERT INTO `users_type` (`user_type_id`, `description`) 
	VALUES (6, 'Using for future');
INSERT INTO `users_type` (`user_type_id`, `description`) 
	VALUES (7, 'Using for future');
INSERT INTO `users_type` (`user_type_id`, `description`) 
	VALUES (8, 'Using for future');
INSERT INTO `users_type` (`user_type_id`, `description`) 
	VALUES (9, 'Using for future');
INSERT INTO `users_type` (`user_type_id`, `description`) 
	VALUES (10, 'Using for future');

-- Создаём таблицу пользователей
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user first name',
  `last_name` VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user second name',
  `email` VARCHAR(120) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user email',
  `phone` VARCHAR(120) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user phone number',
  `created_at` DATETIME DEFAULT NOW(),
  `updated_at` DATETIME DEFAULT NOW() ON UPDATE NOW(),
  `user_type_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_type_user_id_fk` (`user_type_id`),
  CONSTRAINT `users_type_user_id_fk` FOREIGN KEY (`user_type_id`) REFERENCES `users_type` (`user_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='nodes table';


INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) 
	VALUES (1, 'test', 'worker', 'gvolkman@example.com', '+61(7)9244479141', NOW(), NOW(), 1);
INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) 
	VALUES (2, 'test_db_admin', 'DB_admin', 'tyshawn.tillman@example.org', '+19(1)1546760703', '1972-02-05 23:45:43', '2016-08-06 01:24:07', 2);
INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) 
	VALUES (3, 'test_system_admin', 'test_system_admin', 'tatum.hoeger@example.com', '429.104.8856', '2010-09-06 12:39:09', '1978-04-27 23:07:23', 3);
INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) 
	VALUES (4, 'null', 'using for future', 'hdach@example.org', '+74(4)1428389855', '2005-03-15 22:35:19', '1971-08-11 02:10:07', 4);
INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`, `user_type_id`) 
	VALUES (5, 'Игорь', 'Стурейко', 'i.stureyko@econom.gazprom.ru', '+7 (964) 505-11-15', NOW(), NOW(), 1); 

-- graph table
CREATE TABLE IF NOT EXISTS `graphs` (
 `graph_id` int(10) unsigned NOT NULL,
 `graph_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'name',
 `graph_caption` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'caption',
 `graph_description` varchar(255) COLLATE utf8_unicode_ci COMMENT 'description',
 `created_at` datetime DEFAULT current_timestamp(),
 `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
 `user_id` int(10) unsigned NOT NULL,
 PRIMARY KEY (`graph_id`),
 KEY `users_user_id_fk` (`user_id`),
 CONSTRAINT `users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='graphs table';

INSERT INTO `graphs` (`graph_id`, `graph_name`, `graph_caption`, `graph_description`, `created_at`, `updated_at`, `user_id`) 
	VALUES (1, 'GTS', 'GTS_graph', 'Graph GTS 2022', NOW(), NOW(), 1);


CREATE TABLE IF NOT EXISTS `nodes_type` (
 `node_type_id` int(10) unsigned NOT NULL,
 `node_type_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'type name',
 `node_type_caption` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'node type caption',
 `node_type_description` varchar(255) COLLATE utf8_unicode_ci COMMENT 'description',
 `created_at` datetime DEFAULT current_timestamp(),
 `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
 PRIMARY KEY (`node_type_id`),
 UNIQUE KEY `node_type_name` (`node_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='nodes type table';

INSERT INTO `nodes_type` (`node_type_id`, `node_type_name`, `node_type_caption`, `created_at`) 
	VALUES (1, 'gts_node', 'node of flow graph', NOW());
INSERT INTO `nodes_type` (`node_type_id`, `node_type_name`, `node_type_caption`, `created_at`) 
	VALUES (2, 'gts_field', 'node of gas field', '2021-01-07 03:40:02');
INSERT INTO `nodes_type` (`node_type_id`, `node_type_name`, `node_type_caption`, `created_at`) 
	VALUES (3, 'gts_consumer', 'node of consumption', '1983-05-07 13:40:02');
INSERT INTO `nodes_type` (`node_type_id`, `node_type_name`, `node_type_caption`, `created_at`) 
	VALUES (4, 'gts_phg', 'node of phg', '1991-05-07 10:00:02');


-- nodes table
CREATE TABLE IF NOT EXISTS `nodes` (
 `node_id` int(10) unsigned NOT NULL,
 `node_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'name',
 `node_caption` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'caption',
 `node_description` varchar(255) COLLATE utf8_unicode_ci COMMENT 'description',
 `created_at` datetime DEFAULT current_timestamp(),
 `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
 `node_type_id` int(10) unsigned NOT NULL,
 `graph_id` INT(10) UNSIGNED NOT NULL DEFAULT 1,
 `x` float unsigned not null default 0,
 `y` float unsigned not null default 0, 
 PRIMARY KEY (`node_id`),
 UNIQUE KEY `node_name` (`node_name`),
 KEY `node_types_node_id_fk` (`node_type_id`),
 KEY `graphs_graph_id` (`graph_id`),
 CONSTRAINT `node_types_node_id_fk` FOREIGN KEY (`node_type_id`) REFERENCES `nodes_type` (`node_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT `graphs_graph_id` FOREIGN KEY (`graph_id`) REFERENCES `graphs` (`graph_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='nodes table';

INSERT INTO `nodes` (`node_id`, `node_name`, `node_caption`, `node_description`, `created_at`, `node_type_id`, `graph_id`) 
	VALUES (1, 'node_1', 'node_1_caption', 'node of flow graph', NOW(), 1, 1);
INSERT INTO `nodes` (`node_id`, `node_name`, `node_caption`, `node_description`, `created_at`, `node_type_id`, `graph_id`) 
	VALUES (2, 'node_2', 'node_2_caption', 'node of field', NOW(), 2, 1);
INSERT INTO `nodes` (`node_id`, `node_name`, `node_caption`, `node_description`, `created_at`, `node_type_id`, `graph_id`) 
	VALUES (3, 'node_3', 'node_3_caption', 'node of consumption', NOW(), 3, 1);
INSERT INTO `nodes` (`node_id`, `node_name`, `node_caption`, `node_description`, `created_at`, `node_type_id`, `graph_id`) 
	VALUES (4, 'node_4', 'node_4_caption', 'node of PHG', NOW(), 4, 1);

-- line types table
CREATE TABLE IF NOT EXISTS `line_type` (
 `line_type_id` int(10) unsigned NOT NULL,
 `line_type_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'type name',
 `line_type_caption` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'line type caption',
 `line_type_description` varchar(255) COLLATE utf8_unicode_ci COMMENT 'description',
 `created_at` datetime DEFAULT current_timestamp(),
 `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
 PRIMARY KEY (`line_type_id`),
 UNIQUE KEY `line_type_name` (`line_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lines type table';

INSERT INTO `line_type` (`line_type_id`, `line_type_name`, `line_type_caption`, `created_at`) 
	VALUES (1, 'gts_line', 'line of flow graph', NOW());
INSERT INTO `line_type` (`line_type_id`, `line_type_name`, `line_type_caption`, `created_at`) 
	VALUES (2, 'other_type_of_line', 'other type of line for flow graph', NOW());
    
-- lines table
CREATE TABLE IF NOT EXISTS `lines` (
 `line_id` int unsigned NOT NULL,
 `line_name` varchar(20) NOT NULL COMMENT 'name',
 `line_caption` varchar(100) NOT NULL COMMENT 'caption',
 `line_description` varchar(255) COMMENT 'description',
 `created_at` datetime DEFAULT current_timestamp(),
 `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
 `line_type_id` int(10) unsigned NOT NULL DEFAULT 1,
 `graph_id` INT(10) UNSIGNED NOT NULL DEFAULT 1,
 `start_node_id` INT(10) UNSIGNED NOT NULL,
 `finish_node_id` INT(10) UNSIGNED NOT NULL,
 PRIMARY KEY (`line_id`),
 UNIQUE KEY `line_name` (`line_name`),
 KEY `line_type_line_id_fk` (`line_type_id`),
 KEY `graphs_graph_id_fk` (`graph_id`),
 KEY `nodes_start_node_id_fk` (`start_node_id`),
 KEY `nodes_finish_node_id_fk` (`finish_node_id`),
 CONSTRAINT `line_type_line_id_fk` FOREIGN KEY (`line_type_id`) REFERENCES `line_type` (`line_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT `graphs_graph_id_fk` FOREIGN KEY (`graph_id`) REFERENCES `graphs` (`graph_id`) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT `nodes_start_node_id_fk` FOREIGN KEY (`start_node_id`) REFERENCES `nodes` (`node_id`) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT `nodes_finish_node_id_fk` FOREIGN KEY (`finish_node_id`) REFERENCES `nodes` (`node_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lines table';

INSERT INTO `lines` (`line_id`, `line_name`, `line_caption`, `line_description`, `created_at`, `line_type_id`, `graph_id`,`start_node_id`, `finish_node_id`) 
	VALUES (1, 'line_1', 'line_1_caption', 'line of flow graph', NOW(), 1, 1, 1, 3);
    
-- Table Scenarios
CREATE TABLE IF NOT EXISTS `scenarios` (
`sc_id` INT UNSIGNED NOT NULL,
`sc_name` varchar(100) NOT NULL COMMENT 'name',
`sc_desc` varchar(200) NOT NULL COMMENT 'scenario description',
 `created_at` datetime DEFAULT current_timestamp(),
 `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
 `graph_id` INT(10) UNSIGNED NOT NULL DEFAULT 1,
 `user_id` int(10) unsigned NOT NULL,
 PRIMARY KEY (`sc_id`),
 UNIQUE KEY `sc_name` (`sc_name`),
 KEY `graphs_scenario_graph_id_fk` (`graph_id`),
 KEY `sc_users_user_id_fk` (`user_id`),
 CONSTRAINT `graphs_scenario_graph_id_fk` FOREIGN KEY (`graph_id`) REFERENCES `graphs` (`graph_id`) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT `sc_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='scenarios table';

INSERT INTO `scenarios` (`sc_id`, `sc_name`, `sc_desc`, `created_at`, `graph_id`, `user_id`) 
	VALUES (1, 'Sc_2_2021_07', 'Scenario 2 middle', '2021-07-07 10:00:00', 1, 1);
    
-- Table flows
CREATE TABLE IF NOT EXISTS `flows`(
`sc_id` INT UNSIGNED NOT NULL,
`line_id` INT UNSIGNED NOT NULL,
`year` DATE NOT NULL,
`flow` FLOAT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='flows table';