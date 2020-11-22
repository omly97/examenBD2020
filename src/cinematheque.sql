-- -----------------------------------------------------
-- Schema cinematheque
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cinematheque` ;

-- -----------------------------------------------------
-- Schema cinematheque
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cinematheque` DEFAULT CHARACTER SET utf8 ;
USE `cinematheque` ;

-- -----------------------------------------------------
-- Table `cinematheque`.`personne`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinematheque`.`personne` ;

CREATE TABLE IF NOT EXISTS `cinematheque`.`personne` (
    `id_personne` BIGINT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(45) NOT NULL,
    `prenom` VARCHAR(45) NOT NULL,
    `nationalite` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id_personne`)
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinematheque`.`realisateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinematheque`.`realisateur` ;

CREATE TABLE IF NOT EXISTS `cinematheque`.`realisateur` (
    `id_realisateur` BIGINT NOT NULL AUTO_INCREMENT,
    `id_personne` BIGINT NOT NULL,
    PRIMARY KEY (`id_realisateur`, `id_personne`),
    CONSTRAINT `fk_realisateur_id_personne`
        FOREIGN KEY (`id_personne`)
        REFERENCES `cinematheque`.`personne` (`id_personne`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE INDEX `idx_id_personne` ON `cinematheque`.`realisateur` (`id_personne` ASC);

CREATE UNIQUE INDEX `uk_id_realisateur` ON `cinematheque`.`realisateur` (`id_realisateur` ASC);


-- -----------------------------------------------------
-- Table `cinematheque`.`acteur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinematheque`.`acteur` ;

CREATE TABLE IF NOT EXISTS `cinematheque`.`acteur` (
    `id_acteur` BIGINT NOT NULL AUTO_INCREMENT,
    `id_personne` BIGINT NOT NULL,
    PRIMARY KEY (`id_acteur`, `id_personne`),
    CONSTRAINT `fk_acteur_id_personne`
        FOREIGN KEY (`id_personne`)
        REFERENCES `cinematheque`.`personne` (`id_personne`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE INDEX `idx_id_personne` ON `cinematheque`.`acteur` (`id_personne` ASC);

CREATE UNIQUE INDEX `uk_id_acteur` ON `cinematheque`.`acteur` (`id_acteur` ASC);


-- -----------------------------------------------------
-- Table `cinematheque`.`film`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinematheque`.`film` ;

CREATE TABLE IF NOT EXISTS `cinematheque`.`film` (
    `id_film` BIGINT NOT NULL AUTO_INCREMENT,
    `titre` VARCHAR(45) NOT NULL,
    `date_creation` DATE NOT NULL,
    `langue` VARCHAR(45) NOT NULL,
    `duree` TIME NULL,
    PRIMARY KEY (`id_film`)
)ENGINE = InnoDB;

CREATE UNIQUE INDEX `uk_titre` ON `cinematheque`.`film` (`titre` ASC);


-- -----------------------------------------------------
-- Table `cinematheque`.`realiser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinematheque`.`realiser` ;

CREATE TABLE IF NOT EXISTS `cinematheque`.`realiser` (
    `id_realisateur` BIGINT NOT NULL,
    `id_personne` BIGINT NOT NULL,
    `id_film` BIGINT NOT NULL,
    PRIMARY KEY (`id_realisateur`, `id_personne`, `id_film`),
    CONSTRAINT `fk_realiser_id_realisateur`
        FOREIGN KEY (`id_realisateur` , `id_personne`)
        REFERENCES `cinematheque`.`realisateur` (`id_realisateur` , `id_personne`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT `fk_realiser_id_film`
        FOREIGN KEY (`id_film`)
        REFERENCES `cinematheque`.`film` (`id_film`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE INDEX `idx_film` ON `cinematheque`.`realiser` (`id_film` ASC);

CREATE INDEX `idx_realisateur` ON `cinematheque`.`realiser` (`id_realisateur` ASC, `id_personne` ASC);


-- -----------------------------------------------------
-- Table `cinematheque`.`jouer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinematheque`.`jouer` ;

CREATE TABLE IF NOT EXISTS `cinematheque`.`jouer` (
    `id_acteur` BIGINT NOT NULL,
    `id_personne` BIGINT NOT NULL,
    `id_film` BIGINT NOT NULL,
    PRIMARY KEY (`id_acteur`, `id_personne`, `id_film`),
    CONSTRAINT `fk_jouer_id_acteur`
        FOREIGN KEY (`id_acteur` , `id_personne`)
        REFERENCES `cinematheque`.`acteur` (`id_acteur` , `id_personne`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT `fk_jouer_id_film`
        FOREIGN KEY (`id_film`)
        REFERENCES `cinematheque`.`film` (`id_film`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE INDEX `idx_film` ON `cinematheque`.`jouer` (`id_film` ASC);

CREATE INDEX `idx_acteur` ON `cinematheque`.`jouer` (`id_acteur` ASC, `id_personne` ASC);


-- -----------------------------------------------------
-- Table `cinematheque`.`cinema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinematheque`.`cinema` ;

CREATE TABLE IF NOT EXISTS `cinematheque`.`cinema` (
    `nom_cinema` VARCHAR(45) NOT NULL,
    `adresse` VARCHAR(45) NULL,
    `telephone` VARCHAR(45) NULL,
    PRIMARY KEY (`nom_cinema`)
)ENGINE = InnoDB;

CREATE UNIQUE INDEX `uk_nom_cinema` ON `cinematheque`.`cinema` (`nom_cinema` ASC);

CREATE UNIQUE INDEX `uk_telephone` ON `cinematheque`.`cinema` (`telephone` ASC);

CREATE UNIQUE INDEX `uk_adresse` ON `cinematheque`.`cinema` (`adresse` ASC);


-- -----------------------------------------------------
-- Table `cinematheque`.`salle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinematheque`.`salle` ;

CREATE TABLE IF NOT EXISTS `cinematheque`.`salle` (
    `id_salle` BIGINT NOT NULL,
    `nom_cinema` VARCHAR(45) NOT NULL,
    `nbr_places` INT NOT NULL,
    `type_ecran` VARCHAR(25) NOT NULL,
    `type_son` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id_salle`, `nom_cinema`),
    CONSTRAINT `fk_salle_nom_cinema`
        FOREIGN KEY (`nom_cinema`)
        REFERENCES `cinematheque`.`cinema` (`nom_cinema`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
)ENGINE = InnoDB;

CREATE INDEX `idx_id_salle` ON `cinematheque`.`salle` (`id_salle` ASC);
CREATE INDEX `idx_nom_cinema` ON `cinematheque`.`salle` (`nom_cinema` ASC);


-- -----------------------------------------------------
-- Table `cinematheque`.`projection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinematheque`.`projection` ;

CREATE TABLE IF NOT EXISTS `cinematheque`.`projection` (
    `moment_projection` TIMESTAMP NOT NULL,
    `version` ENUM("VO", "VF"),
    `id_film` BIGINT NOT NULL,
    `id_salle` BIGINT NOT NULL,
    `nom_cinema` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`moment_projection`, `id_film`, `id_salle`, `nom_cinema`),
    CONSTRAINT `fk_projection_id_film`
        FOREIGN KEY (`id_film`)
        REFERENCES `cinematheque`.`film` (`id_film`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_projection_salle`
        FOREIGN KEY (`id_salle` , `nom_cinema`)
        REFERENCES `cinematheque`.`salle` (`id_salle` , `nom_cinema`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
)ENGINE = InnoDB;

CREATE INDEX `idx_film` ON `cinematheque`.`projection` (`id_film` ASC);

CREATE INDEX `idx_salle` ON `cinematheque`.`projection` (`id_salle` ASC, `nom_cinema` ASC);

CREATE UNIQUE INDEX `uk_film-jour-cinema` ON `cinematheque`.`projection` (`id_film` ASC, `moment_projection` ASC, `nom_cinema` ASC);



-- -----------------------------------------------------
-- View `cinematheque`.`view_film_projection`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `cinematheque`.`view_film_projection` ;

CREATE  OR REPLACE VIEW `view_film_projection` AS
SELECT
    `film`.`id_film`,
    `film`.`duree`,
	`projection`.`nom_cinema`,
    `projection`.`id_salle`,
    `projection`.`moment_projection`
FROM `film`
LEFT JOIN `projection` ON `film`.`id_film` = `projection`.`id_film`;


-- -----------------------------------------------------
-- View `cinematheque`.`view_salle_occupation`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `cinematheque`.`view_salle_occupation` ;

CREATE  OR REPLACE VIEW `view_salle_occupation` AS
SELECT
	`nom_cinema`,
    `id_salle`,
    `id_film`,
    `moment_projection` AS `debut_occupation`,
    ADDTIME( ADDTIME(`moment_projection`, `duree`), '1:0:0:') AS `fin_occupation`
FROM `view_film_projection`;



DELIMITER //
-- -----------------------------------------------------
-- Procedure `cinematheque`.`check_disponibilite_salle`
-- -----------------------------------------------------
DROP PROCEDURE IF EXISTS `cinematheque`.`check_disponibilite_salle` //

CREATE PROCEDURE `cinematheque`.`check_disponibilite_salle`(p_nom_cinema VARCHAR(45), p_id_salle BIGINT, p_debut TIMESTAMP, p_fin TIMESTAMP)
BEGIN
    DECLARE count_resultats INT DEFAULT 0;

    SELECT COUNT(*)
    FROM `view_salle_occupation`
    WHERE `nom_cinema` = p_nom_cinema
        AND `id_salle` = p_id_salle
        AND ((`debut_occupation` BETWEEN p_debut AND p_fin) OR (`fin_occupation` BETWEEN p_debut AND p_fin))
    INTO count_resultats;

    IF count_resultats > 0 THEN
        SIGNAL SQLSTATE '09500' SET MESSAGE_TEXT = 'La salle est occupée durant cette periode', MYSQL_ERRNO = 9500;
    END IF;
END//


-- -----------------------------------------------------
-- Procedure `cinematheque`.`check_regle_projection`
-- -----------------------------------------------------
DROP PROCEDURE IF EXISTS `cinematheque`.`check_regle_projection` //

CREATE PROCEDURE `cinematheque`.`check_regle_projection` (p_nom_cinema VARCHAR(45), p_id_film BIGINT, p_moment_projection TIMESTAMP)
BEGIN
    DECLARE count_resultats INT DEFAULT 0;

    SELECT COUNT(*)
    FROM `projection`
    WHERE `nom_cinema` = p_nom_cinema
        AND `id_film` = p_id_film
        AND DATE(`moment_projection`) = DATE(`p_moment_projection`)
    INTO count_resultats;

    IF count_resultats > 1 THEN
        SIGNAL SQLSTATE '09700' SET MESSAGE_TEXT = 'Ce film est dejà projeté dans le cinema et à cette date', MYSQL_ERRNO = 9700;
    END IF;
END//



-- -----------------------------------------------------
-- Trigger `cinematheque`.`projection_BEFORE_INSERT`
-- -----------------------------------------------------
DROP TRIGGER IF EXISTS `cinematheque`.`projection_BEFORE_INSERT` //

CREATE TRIGGER `cinematheque`.`projection_BEFORE_INSERT` BEFORE INSERT ON `projection` FOR EACH ROW
BEGIN
    DECLARE v_duree TIME;
    DECLARE v_fin TIMESTAMP;

    SELECT `duree`
    FROM `film`
    WHERE `id_film` =  NEW.id_film
    INTO v_duree;

    SELECT ADDTIME( ADDTIME(NEW.moment_projection, v_duree), '1:0:0:') INTO v_fin;

    CALL check_regle_projection(NEW.nom_cinema, NEW.id_film, NEW.moment_projection);
    CALL check_disponibilite_salle(NEW.nom_cinema, NEW.id_salle, NEW.moment_projection, v_fin);
END//


-- -----------------------------------------------------
-- Trigger `cinematheque`.`projection_BEFORE_UPDATE`
-- -----------------------------------------------------
DROP TRIGGER IF EXISTS `cinematheque`.`projection_BEFORE_UPDATE` //

CREATE TRIGGER `cinematheque`.`projection_BEFORE_UPDATE` BEFORE UPDATE ON `projection` FOR EACH ROW
BEGIN
    DECLARE v_duree TIME;
    DECLARE v_fin TIMESTAMP;

    SELECT `duree`
    FROM `film`
    WHERE `id_film` =  NEW.id_film
    INTO v_duree;

    SELECT ADDTIME( ADDTIME(NEW.moment_projection, v_duree), '1:0:0:') INTO v_fin;

    CALL check_regle_projection(NEW.nom_cinema, NEW.id_film, NEW.moment_projection);
    CALL check_disponibilite_salle(NEW.nom_cinema, NEW.id_salle, NEW.moment_projection, v_fin);
END//

DELIMITER ;

-- SOURCE /home/omar/Documents/Database/m1tdsi/examen/cinematheque.sql
