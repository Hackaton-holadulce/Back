CREATE DATABASE `ddbb_dulce5`;
USE `ddbb_dulce5`;

CREATE TABLE `box_recipe` (
  `id_box` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` varchar(255)
);
CREATE TABLE `stock_ingredients` (
  `id_stock` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `expiration_date` date,
  `kg` int,
  `id_ingredient` int
);
CREATE TABLE `ingredient` (
  `id_ingredient` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `alergies` varchar(255)
);
CREATE TABLE `quantities_ingredient` (
  `id_ingredient` int,
  `id_box` int,
  `quantity` int
);
ALTER TABLE `quantities_ingredient` ADD FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);​
ALTER TABLE `quantities_ingredient` ADD FOREIGN KEY (`id_box`) REFERENCES `box_recipe` (`id_box`);
ALTER TABLE `stock_ingredients` ADD FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);



INSERT INTO ingredient (id_ingredient, name, alergies) VALUES(null,'Azucar', null);
INSERT INTO ingredient (id_ingredient, name) VALUES(null,'Sal');
INSERT INTO ingredient (id_ingredient, name, alergies) VALUES(null,'Almidón Maiz',null);
INSERT INTO ingredient (id_ingredient, name, alergies) VALUES(null,'Levadura química', null);
INSERT INTO ingredient (id_ingredient, name, alergies) VALUES(null,'Goma Xantana', null);
INSERT INTO ingredient (id_ingredient, name, alergies) VALUES(null,'Canela en polvo', null);


INSERT INTO stock_ingredients (id_stock, name, expiration_date, kg, id_ingredient) VALUES(null,'Azucar', '2020-12-20', 2, null);
INSERT INTO stock_ingredients (id_stock, name, expiration_date, kg, id_ingredient) VALUES(null,'Sal', '2020-12-22', 4, null);
INSERT INTO stock_ingredients (id_stock, name, expiration_date, kg, id_ingredient) VALUES(null,'Almidón Maiz', '2020-12-21', 3, null);
INSERT INTO stock_ingredients (id_stock, name, expiration_date, kg, id_ingredient) VALUES(null,'Levadura química', '2020-11-20', 1, null);
INSERT INTO stock_ingredients (id_stock, name, expiration_date, kg, id_ingredient) VALUES(null,'Goma Xantana', '2020-12-20', 0.3, null);
INSERT INTO stock_ingredients (id_stock, name, expiration_date, kg, id_ingredient) VALUES(null,'Canela en polvo', '2020-10-20', 2, null);
