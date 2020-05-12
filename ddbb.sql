CREATE DATABASE `ddbb_dulce`;
USE `ddbb_dulce`;

CREATE TABLE `box_recipe` (
  `id_box` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` varchar(255)
);
CREATE TABLE `stock_ingredients` (
  `id_stock` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `expiration_date` date,
  `kg` int
);
CREATE TABLE `ingredient` (
  `id_ingredient` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `alergies` varchar(255),
  `id_stock` int
);
CREATE TABLE `quantities_ingredient` (
  `id_ingredient` int,
  `id_box` int,
  `quantity` int
);
ALTER TABLE `quantities_ingredient` ADD FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);​
ALTER TABLE `quantities_ingredient` ADD FOREIGN KEY (`id_box`) REFERENCES `box_recipe` (`id_box`);
ALTER TABLE `ingredient` ADD FOREIGN KEY (`id_stock`) REFERENCES `stock_ingredients` (`id_stock`);



INSERT INTO ingredient (id_ingredient, name, alergies, id_stock) VALUES(null,'Azucar', null, null);
INSERT INTO ingredient (id_ingredient, name) VALUES(null,'Sal');
INSERT INTO ingredient (id_ingredient, name, alergies, id_stock) VALUES(null,'Almidón Maiz', null, null);
INSERT INTO ingredient (id_ingredient, name, alergies, id_stock) VALUES(null,'Levadura química', null, null);
INSERT INTO ingredient (id_ingredient, name, alergies, id_stock) VALUES(null,'Goma Xantana', null, null);
INSERT INTO ingredient (id_ingredient, name, alergies, id_stock) VALUES(null,'Canela en polvo', null, null);
