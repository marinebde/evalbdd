/* Création de la base de données */

CREATE DATABASE IF NOT EXISTS bdd_theater CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

/* Création des différentes Tables */

CREATE TABLE groupe 
(
    id_groupe INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(40)
) engine=INNODB;

CREATE TABLE theater 
(
    id_theater INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(40),
    adress VARCHAR(250),
    id_groupe int,
    FOREIGN KEY (id_groupe) REFERENCES groupe (id_groupe)
) engine=INNODB;

CREATE TABLE movies 
(
    id_movie INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    movie_name VARCHAR(250),
    release_date DATE
) engine=INNODB;

CREATE TABLE theater_movies 
(
    id_theater_movie INT PRIMARY KEY NOT NULL AUTO_INCREMENT ,
    id_movie INT,
    FOREIGN KEY (id_movie) REFERENCES movies (id_movie),
    id_theater INT,
    FOREIGN KEY (id_theater) REFERENCES theater (id_theater),
    date_diffusion DATETIME,
    number_of_place INT(3) 
) engine=INNODB;

CREATE TABLE user_theater 
(
    id_user INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(30),
    lastname VARCHAR(30),
    id_theater INT,
    FOREIGN KEY (id_theater) REFERENCES theater (id_theater)
) engine=INNODB;

CREATE TABLE admin_theater
(
    id_admin INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(30),
    lastname VARCHAR(30),
    id_groupe INT,
    FOREIGN KEY (id_groupe) REFERENCES groupe (id_groupe)
) engine=INNODB;

CREATE TABLE client
(
    id_client INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(30),
    lastname VARCHAR(30),
    adress VARCHAR(250),
    email VARCHAR(250),
    client_password VARCHAR(250)
) engine=INNODB;

CREATE TABLE ticket_price
(
    id_ticket_price INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    profil VARCHAR(30),
    price DECIMAL(3,2)
) engine=INNODB;

CREATE TABLE reservations
(
    id_reservation INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    student_quantity INT,
    children_quantity INT,
    adult_quantity INT,
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES client (id_client),
    id_movie INT,
    FOREIGN KEY (id_movie) REFERENCES movies (id_movie)
) engine=INNODB;

CREATE TABLE reservations_ticket_price 
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_reservation INT,
    FOREIGN KEY (id_reservation) REFERENCES reservations (id_reservation),
    id_ticket_price INT,
    FOREIGN KEY (id_ticket_price) REFERENCES ticket_price (id_ticket_price)
) engine=INNODB;

/* Insertion des données */
/* Insertion Groupes */

insert into groupe (id_groupe, name) 
values 
(1, 'Photobean'),
(2, 'Skidoo'),
(3, 'Miboo');

/* Insertion Cinémas */

insert into theater (id_theater, name, adress, id_groupe) 
values 
(1, 'Glover-Grady', '0 8th Pass', 1),
(2, 'Ritchie-Lueilwitz', '73993 Harbort Terrace', 1),
(3, 'Jast LLC', '3688 Gulseth Plaza', 1);

/* Insertion Films */

insert into movies (id_movie, movie_name, release_date) 
values 
(1, 'Poor Us: An Animated History of Poverty', '6.4.2021'),
(2, 'Predictions of Fire (Prerokbe Ognja)', '14.3.2021'),
(3, 'Went to Coney Island on a Mission From God... Be Back by Five', '14.4.2021'),
(4, 'Match, The', '25.1.2021'),
(5, 'Rabbit Without Ears 2 (Zweiohrküken)', '27.2.2021'),
(6, 'Prime Suspect 7: The Final Act', '24.12.2020'),
(7, 'Flypaper', '31.12.2020'),
(8, 'Sound of Redemption: The Frank Morgan Story', '7.3.2021'),
(9, 'Noose, The (Petla)', '1.10.2020'),
(10, 'Shrek the Third', '2.8.2021');

/* Insertion Liens entre Films et Cinémas */

insert into theater_movies (id_theater_movie, id_movie, id_theater, date_diffusion, number_of_place) 
values 
(1, 1, 1, '2020-11-18 22:49:52', 143),
(2, 1, 1, '2020-12-21 14:20:49', 127),
(3, 2, 1, '2020-11-23 03:56:09', 121),
(4, 3, 2, '2021-03-23 20:39:55', 107),
(5, 3, 2, '2021-03-30 13:31:29', 121),
(6, 4, 2, '2021-02-19 16:40:23', 58),
(7, 6, 2, '2020-11-15 21:16:51', 133),
(8, 6, 3, '2021-06-28 18:03:30', 133),
(9, 9, 3, '2021-03-23 17:40:39', 77),
(10, 10, 3, '2021-07-27 18:46:52', 74);

/* Insertion Utilisateurs */

insert into user_theater (id_user, firstname, lastname, id_theater) 
values 
(1, 'Bécassine', 'Brookwood', 1),
(2, 'Marie-hélène', 'Sicely', 2),
(3, 'Cécilia', 'Goulter', 3);

/* Insertion Administrateurs */

insert into admin_theater (id_admin, firstname, lastname, id_groupe)
values 
(1, 'Uò', 'Kennady', 1),
(2, 'Ruò', 'Breed', 1),
(3, 'Gérald', 'Bolingbroke', 2),
(4, 'Maëlla', 'Goolden', 3),
(5, 'Maëlann', 'Buxam', 3);

/* Insertion Clients */

insert into client (id_client, firstname, lastname, adress, email, client_password) 
values 
(1, 'Pélagie', 'Villalta', '58182 Express Court', 'kvillalta0@blogs.com', '$2y$10$7nOlk4jLxnFxrOEYC/aieeVAMKCc0e47jNx.peg4QgrS7T9wXeJLO'),
(2, 'Marie-noël', 'Giannoni', '9 Shoshone Avenue', 'dgiannoni1@devhub.com', '$2y$10$I2/wK3Wtx1Vdp9ZyWpGAZeB9A7tMct9E.xdMmBGv2mfeYeg5Df0ZC'),
(3, 'Marylène', 'Parade', '174 Walton Trail', 'tparade2@skyrock.com', '$2y$10$SsGzdVaW5nqR2W582VhK0ewDN9.Ci7biGkW3VF6h8aIaW5w72erZS'),
(4, 'Maëlyss', 'Deverill', '21059 Northview Place', 'ldeverill3@ted.com', '$2y$10$swprnQzx4HeFFAVCIbRFGuKm25230b2sz2gwuMdHant5P1zFPEfc6'),
(5, 'Anaël', 'McNirlin', '8 Kings Park', 'cmcnirlin4@dmoz.org', '$2y$10$Z2xECOm7gPiyO/vNRedkT.sfEKiNffdKrOVZ3/LKczWSKiYYwuVva'),
(6, 'Lucrèce', 'Jindracek', '51 Nevada Crossing', 'ajindracek5@mashable.com', '$2y$10$MxbQiiyDwJZ9mvVCuwXW8em5TFaLqX6fBpdWbQZRm51R81Nso6452'),
(7, 'Kallisté', 'Boribal', '9200 Butternut Drive', 'bboribal6@chicagotribune.com', '$2y$10$zPDBlo3AE70lkoZbzrznEuNEegG16NHZt5e1S5nXzAPua3eVf44mu'),
(8, 'Inès', 'Gimblett', '2 Mayer Drive', 'egimblett7@nymag.com', '$2y$10$RO2JXWFKbR7OMBPlAvOcIO9TPbP8bMy4T3V6WjD2/E.fuo2Msh63O'),
(9, 'Cléopatre', 'Champken', '04437 Veith Circle', 'schampken8@weibo.com', '$2y$10$UhBvJisPr0PnIF32xxfneejHPjy.MguFc8IO.E0.savTiJvgpw5ca'),
(10, 'Marie-hélène', 'Fozzard', '06 Mayer Alley', 'vfozzard9@nymag.com', '$2y$10$VNp0Gbo27bLIfwEUMGO2K.DPfkDoWWZL7ctFCJiWINXpH.yxpF8nS'),
(11, 'Mårten', 'Farrears', '131 Colorado Park', 'mfarrearsa@github.com', '$2y$10$KvcKGbSjK5/GfvOhxyI/8uAXeoC7cmokxvivjUlNAvPsaF33zo9Ja'),
(12, 'Eliès', 'Chestnut', '8693 Sommers Circle', 'gchestnutb@icq.com', '$2y$10$6M4.Aabt9U/wECBIMmhr6eUSDrOn6F0jVlsRNJPmfgEAYKbMYy1Wi'),
(13, 'Sòng', 'Doolan', '4473 Schlimgen Road', 'tdoolanc@zimbio.com', '$2y$10$AfEAm4mWWutbN6sEbSAAIePHPj445cl2TZtJ8vKdVosJaMXO/fVxK'),
(14, 'Maïlys', 'Clavey', '08393 Brentwood Crossing', 'sclaveyd@google.nl', '$2y$10$SWGMocmi6ur4RhFTr5HOseu2CKvq8YPDf35zYJw/LArFGOFHCrJAW'),
(15, 'Mårten', 'Kidner', '19 Green Plaza', 'tkidnere@umn.edu', '$2y$10$9wgFdFjHyyDGtGSDdWI/Nu7TEy5ZzbUp5S7Ba6IyJN03VChTTZvv2');

/* Insertion Réservations Clients */

insert into reservations (id_reservation, student_quantity, children_quantity, adult_quantity, id_client, id_movie) 
values 
(1, 0, 1, 1, 1, 1),
(2, 0, 2, 1, 2, 2),
(3, 0, 0, 1, 3, 3),
(4, 0, 0, 2, 4, 3),
(5, 1, 0, 0, 5, 4),
(6, 1, 0, 1, 6, 6),
(7, 2, 0, 0, 7, 6),
(8, 2, 0, 2, 8, 6),
(9, 1, 1, 1, 9, 7),
(10, 1, 1, 2, 10, 8),
(11, 1, 2, 2, 11, 8),
(12, 1, 2, 1, 12, 9),
(13, 0, 0, 3, 13, 10),
(14, 0, 0, 4, 14, 10),
(15, 0, 0, 5, 15, 10);

/* Insertion Prix des Tickets */

insert into ticket_price (id_ticket_price, price) 
values 
(1, 5.90),
(2, 7.60),
(3, 9.20);

/* Insertion des Liens entre la Réservation et le prix du Ticket */

insert into reservations_ticket_price (id, id_ticket_price, id_reservation)
values
(1,1,1),
(2,3,1),
(3,1,2),
(4,3,2),
(5,3,3),
(6,3,4),
(7,2,5),
(8,2,6),
(9,3,6),
(10,2,7),
(11,2,8),
(12,3,8),
(13,1,9),
(14,2,9),
(15,3,9),
(16,1,10),
(17,2,10),
(18,3,10),
(19,3,11),
(20,2,11),
(21,1,11),
(22,3,12),
(23,2,12),
(24,1,12),
(25,3,13),
(26,3,14),
(27,3,15);

/* Attribution des privilèges utilisateurs (1 utilisateur par cinéma) */

CREATE USER IF NOT EXISTS 'BECASSINE'@'%' IDENTIFIED BY '$2y$10$imxNChH3QiEWza7E/5LV7.bjbCLMDzt4QGOTI/k/0U00elP2okHum';

GRANT SELECT 
ON `bdd_theater`.`theater`
TO 'BECASSINE'@'%';

GRANT SELECT
ON `bdd_theater`.`movies`
TO 'BECASSINE'@'%';

GRANT SELECT, INSERT (`id_movie`, `id_theater`, `date_diffusion`, `number_of_place`), 
UPDATE (`id_movie`, `id_theater`, `date_diffusion`, `number_of_place`), 
REFERENCES (`id_movie`, `id_theater`, `date_diffusion`, `number_of_place`) 
ON `bdd_theater`.`theater_movies` 
TO 'BECASSINE'@'%';

CREATE USER IF NOT EXISTS 'MARIE-HELENE'@'%' IDENTIFIED BY '$2y$10$OUalOj39VqGQQ7oEqiPK8OGQGQRrwnQJE5h/qmo7vzlLQaa12cK9K';

GRANT SELECT 
ON `bdd_theater`.`theater`
TO 'MARIE-HELENE'@'%';

GRANT SELECT
ON `bdd_theater`.`movies`
TO 'MARIE-HELENE'@'%';

GRANT SELECT, INSERT (`id_movie`, `id_theater`, `date_diffusion`, `number_of_place`), 
UPDATE (`id_movie`, `id_theater`, `date_diffusion`, `number_of_place`), 
REFERENCES (`id_movie`, `id_theater`, `date_diffusion`, `number_of_place`) 
ON `bdd_theater`.`theater_movies` 
TO 'MARIE-HELENE'@'%';

CREATE USER IF NOT EXISTS 'CECILIA'@'%' IDENTIFIED BY '$2y$10$omP/diPuuMFZrfUqj1NTFunGzvbCGLlK6YfpvDdcA5ogn8wphQuz2';

GRANT SELECT 
ON `bdd_theater`.`theater`
TO 'CECILIA'@'%';

GRANT SELECT
ON `bdd_theater`.`movies`
TO 'CECILIA'@'%';

GRANT SELECT, INSERT (`id_movie`, `id_theater`, `date_diffusion`, `number_of_place`), 
UPDATE (`id_movie`, `id_theater`, `date_diffusion`, `number_of_place`), 
REFERENCES (`id_movie`, `id_theater`, `date_diffusion`, `number_of_place`) 
ON `bdd_theater`.`theater_movies` 
TO 'CECILIA'@'%';

/* Attribution des privilèges administrateurs */

CREATE USER IF NOT EXISTS 'MAELANN'@'%' IDENTIFIED BY '$2y$10$t62k6NPn4AcdCpFFqJ4/qeQBO9W.lrZqzvgmFu7IlzHavZwEiv7pS';

GRANT ALL PRIVILEGES 
ON `bdd_theater`.*
TO 'MAELANN'@'%';

CREATE USER IF NOT EXISTS 'MAELLA'@'%' IDENTIFIED BY '$2y$10$74v5MPWHDdgZdOHtnp7FjO1vsAE.e6yT6OlCmuiXBROkJBRUcM5Oq';

GRANT ALL PRIVILEGES 
ON `bdd_theater`.*
TO 'MAELLA'@'%';

CREATE USER IF NOT EXISTS 'GERALD'@'%' IDENTIFIED BY '$2y$10$zPOy/DRhlLUcvwqqD8/wNuaBSQ0RYemzu2uIjn7JApCDw45iLrPfq';

GRANT ALL PRIVILEGES 
ON `bdd_theater`.*
TO 'GERALD'@'%';

CREATE USER IF NOT EXISTS 'RUO'@'%' IDENTIFIED BY '$2y$10$X3RwT1ACRAGvhT1O56OoeOz0OG2KzgQrFO9.cRrx8gsB1/rVHOkLa';

GRANT ALL PRIVILEGES 
ON `bdd_theater`.*
TO 'RUO'@'%';

CREATE USER IF NOT EXISTS 'UO'@'%' IDENTIFIED BY '$2y$10$/OOaFKah4nUo62wQMEcM1O/rq0SK2XoswXuvPSJn.hZkVUD0ZNcua';

GRANT ALL PRIVILEGES
ON `bdd_theater`.*
TO 'UO'@'%';

/* Sauvegarde de la base de données */


mysqldump  --user=mon_user --password=mon_password_encrypté --single-transaction --skip-lock-tables --databases bdd_theater  > bdd_theater.sql

/* Restauration de la base de données */

mysql --user=mon_user --password=mon_password_encrypté bdd_theater < bdd_theater.sql