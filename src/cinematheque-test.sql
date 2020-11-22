-- -----------------------------------------------------
-- Table `cinematheque`.`personne` ==> 15
-- -----------------------------------------------------
INSERT INTO `personne`(`nom`, `prenom`, `nationalite`)
VALUES
    ("num 01", "Joueur", "SN"),
    ("num 02", "Joueur", "SN"),
    ("num 03", "Joueur", "SN"),
    ("num 04", "Joueur", "SN"),
    ("num 05", "Joueur", "SN"),
    ("num 06", "Joueur", "SN"),
    ("num 07", "Joueur", "SN"),
    ("num 08", "Joueur", "SN"),
    ("num 09", "Joueur", "SN"),
    ("num 10", "Joueur", "SN"),
    ("num 01", "Realisateur", "SN"),
    ("num 02", "Realisateur", "SN"),
    ("num 03", "Realisateur", "SN"),
    ("num 04", "Realisateur", "SN"),
    ("num 05", "Realisateur", "SN");

-- -----------------------------------------------------
-- Table `cinematheque`.`realisateur` ==> 5
-- -----------------------------------------------------
INSERT INTO `realisateur`(`id_personne`)
    VALUES (11),(12),(13),(14),(15);

-- -----------------------------------------------------
-- Table `cinematheque`.`acteur` ==> 10
-- -----------------------------------------------------
INSERT INTO `acteur`(`id_personne`)
    VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

-- -----------------------------------------------------
-- Table `cinematheque`.`film` ==> 10
-- -----------------------------------------------------
INSERT INTO `film`(`titre`, `date_creation`, `langue`, `duree`)
VALUES
    ("Titre film 01", "2019-01-01", "ANG", "2:20"),
    ("Titre film 02", "2019-02-02", "ANG", "1:45"),
    ("Titre film 03", "2019-03-03", "ANG", "1:30"),
    ("Titre film 04", "2019-04-04", "ANG", "2:00"),
    ("Titre film 05", "2019-05-05", "ANG", "1:40"),
    ("Titre film 06", "2019-06-06", "ANG", "2:10"),
    ("Titre film 07", "2019-07-07", "ANG", "1:45"),
    ("Titre film 08", "2019-08-08", "ANG", "1:50"),
    ("Titre film 09", "2019-09-09", "ANG", "2:20"),
    ("Titre film 10", "2019-10-10", "ANG", "3:25");

-- -----------------------------------------------------
-- Table `cinematheque`.`realiser`
-- -----------------------------------------------------
INSERT INTO `realiser`(`id_realisateur`, `id_personne`, `id_film`)
VALUES
    (1, 11, 1),
    (1, 11, 2),
    (2, 12, 3),
    (2, 12, 4),
    (3, 13, 5),
    (3, 13, 6),
    (4, 14, 7),
    (4, 14, 8),
    (5, 15, 9),
    (5, 15, 10);

-- -----------------------------------------------------
-- Table `cinematheque`.`jouer`
-- -----------------------------------------------------
INSERT INTO `jouer`(`id_acteur`, `id_personne`, `id_film`)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10);

-- -----------------------------------------------------
-- Table `cinematheque`.`cinema` ==> 10
-- -----------------------------------------------------
INSERT INTO `cinema`(`nom_cinema`, `adresse`, `telephone`)
VALUES
    ("Cinema 01", "Adresse cinema 01", "33 880 80 01"),
    ("Cinema 02", "Adresse cinema 02", "33 880 80 02"),
    ("Cinema 03", "Adresse cinema 03", "33 880 80 03"),
    ("Cinema 04", "Adresse cinema 04", "33 880 80 04"),
    ("Cinema 05", "Adresse cinema 05", "33 880 80 05"),
    ("Cinema 06", "Adresse cinema 06", "33 880 80 06"),
    ("Cinema 07", "Adresse cinema 07", "33 880 80 07"),
    ("Cinema 08", "Adresse cinema 08", "33 880 80 08"),
    ("Cinema 09", "Adresse cinema 09", "33 880 80 09"),
    ("Cinema 10", "Adresse cinema 10", "33 880 80 10");

-- -----------------------------------------------------
-- Table `cinematheque`.`salle` ==> 20
-- -----------------------------------------------------
INSERT INTO `salle`(`id_salle`, `nom_cinema`, `nbr_places`, `type_ecran`, `type_son`)
VALUES
    (1, "Cinema 01", 100, "Ecran X01", "Son X01"),
    (2, "Cinema 01", 150, "Ecran X02", "Son X02"),
    (1, "Cinema 02", 100, "Ecran X01", "Son X01"),
    (2, "Cinema 02", 150, "Ecran X02", "Son X02"),
    (1, "Cinema 03", 100, "Ecran X01", "Son X01"),
    (2, "Cinema 03", 150, "Ecran X02", "Son X02"),
    (1, "Cinema 04", 100, "Ecran X01", "Son X01"),
    (2, "Cinema 04", 150, "Ecran X02", "Son X02"),
    (1, "Cinema 05", 100, "Ecran X01", "Son X01"),
    (2, "Cinema 05", 150, "Ecran X02", "Son X02"),
    (1, "Cinema 06", 100, "Ecran X01", "Son X01"),
    (2, "Cinema 06", 150, "Ecran X02", "Son X02"),
    (1, "Cinema 07", 100, "Ecran X01", "Son X01"),
    (2, "Cinema 07", 150, "Ecran X02", "Son X02"),
    (1, "Cinema 08", 100, "Ecran X01", "Son X01"),
    (2, "Cinema 08", 150, "Ecran X02", "Son X02"),
    (1, "Cinema 09", 100, "Ecran X01", "Son X01"),
    (2, "Cinema 09", 150, "Ecran X02", "Son X02"),
    (1, "Cinema 10", 100, "Ecran X01", "Son X01"),
    (2, "Cinema 10", 150, "Ecran X02", "Son X02");

-- -----------------------------------------------------
-- Table `cinematheque`.`projection` ===> 20
-- -----------------------------------------------------


-- SOURCE /home/omar/Documents/Database/m1tdsi/examen/cinematheque-test.sql
