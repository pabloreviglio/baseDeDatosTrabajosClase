-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyectoSpotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyectoSpotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectoSpotify` DEFAULT CHARACTER SET utf8 ;
USE `proyectoSpotify` ;

-- -----------------------------------------------------
-- Table `proyectoSpotify`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`servicio` (
  `ID` INT NOT NULL,
  `tipoServicio` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`pais` (
  `ID` INT NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`usuario` (
  `ID` INT NOT NULL,
  `pais_ID` INT NOT NULL,
  `servicio_ID1` INT NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `email` VARCHAR(70) NOT NULL,
  `fechaNacimiento` DATE NULL,
  `sexo` INT NOT NULL,
  `CP` CHAR(10) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_usuario_servicio1_idx` (`servicio_ID1` ASC) VISIBLE,
  INDEX `fk_usuario_pais1_idx` (`pais_ID` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_servicio1`
    FOREIGN KEY (`servicio_ID1`)
    REFERENCES `proyectoSpotify`.`servicio` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_pais1`
    FOREIGN KEY (`pais_ID`)
    REFERENCES `proyectoSpotify`.`pais` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`discografica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`discografica` (
  `ID` INT NOT NULL,
  `pais_ID` INT NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_discografica_pais1_idx` (`pais_ID` ASC) VISIBLE,
  CONSTRAINT `fk_discografica_pais1`
    FOREIGN KEY (`pais_ID`)
    REFERENCES `proyectoSpotify`.`pais` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`artista` (
  `ID` INT NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `imagen` VARCHAR(200) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`album` (
  `ID` INT NOT NULL,
  `discografica_ID` INT NOT NULL,
  `artista_ID` INT NOT NULL,
  `titulo` VARCHAR(25) NOT NULL,
  `portada_ruta` VARCHAR(200) NOT NULL,
  `anioPublicacion` DATE NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_album_discografica1_idx` (`discografica_ID` ASC) VISIBLE,
  INDEX `fk_album_artista1_idx` (`artista_ID` ASC) VISIBLE,
  CONSTRAINT `fk_album_discografica1`
    FOREIGN KEY (`discografica_ID`)
    REFERENCES `proyectoSpotify`.`discografica` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_ID`)
    REFERENCES `proyectoSpotify`.`artista` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`canciones` (
  `ID` INT NOT NULL,
  `album_ID` INT NOT NULL,
  `titulo` VARCHAR(25) NOT NULL,
  `duracion` TIME NOT NULL,
  `nroRepro` BIGINT NOT NULL,
  `cantLikes` BIGINT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_canciones_album1_idx` (`album_ID` ASC) VISIBLE,
  CONSTRAINT `fk_canciones_album1`
    FOREIGN KEY (`album_ID`)
    REFERENCES `proyectoSpotify`.`album` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`genero` (
  `ID` INT NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`playlist_estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`playlist_estado` (
  `ID` INT NOT NULL,
  `eliminada` TINYINT(1) NOT NULL,
  `fechaEliminada` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`playlist` (
  `ID` INT NOT NULL,
  `playlist_estado_ID` INT NOT NULL,
  `usuario_ID` INT NOT NULL,
  `titulo` VARCHAR(25) NOT NULL,
  `cant_canciones` SMALLINT NULL,
  `fechaCreacion` DATE NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_playlist_playlist_estado1_idx` (`playlist_estado_ID` ASC) VISIBLE,
  INDEX `fk_playlist_usuario1_idx` (`usuario_ID` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_playlist_estado1`
    FOREIGN KEY (`playlist_estado_ID`)
    REFERENCES `proyectoSpotify`.`playlist_estado` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_usuario1`
    FOREIGN KEY (`usuario_ID`)
    REFERENCES `proyectoSpotify`.`usuario` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`playlist_x_cancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`playlist_x_cancion` (
  `playlist_ID` INT NOT NULL,
  `canciones_ID` INT NOT NULL,
  PRIMARY KEY (`playlist_ID`, `canciones_ID`),
  INDEX `fk_playlist_x_cancion_playlist1_idx` (`playlist_ID` ASC) VISIBLE,
  INDEX `fk_playlist_x_cancion_canciones1_idx` (`canciones_ID` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_x_cancion_playlist1`
    FOREIGN KEY (`playlist_ID`)
    REFERENCES `proyectoSpotify`.`playlist` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_x_cancion_canciones1`
    FOREIGN KEY (`canciones_ID`)
    REFERENCES `proyectoSpotify`.`canciones` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`contrasenia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`contrasenia` (
  `ID` INT NOT NULL,
  `usuario_ID` INT NOT NULL,
  `contrasenia` CHAR(64) NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  `fechaModificacion` DATE NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_contrasenia_usuario1_idx` (`usuario_ID` ASC) VISIBLE,
  CONSTRAINT `fk_contrasenia_usuario1`
    FOREIGN KEY (`usuario_ID`)
    REFERENCES `proyectoSpotify`.`usuario` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoSpotify`.`genero_x_cancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoSpotify`.`genero_x_cancion` (
  `genero_ID` INT NOT NULL,
  `canciones_ID` INT NOT NULL,
  PRIMARY KEY (`genero_ID`, `canciones_ID`),
  INDEX `fk_genero_x_cancion_genero_idx` (`genero_ID` ASC) VISIBLE,
  INDEX `fk_genero_x_cancion_canciones1_idx` (`canciones_ID` ASC) VISIBLE,
  CONSTRAINT `fk_genero_x_cancion_genero`
    FOREIGN KEY (`genero_ID`)
    REFERENCES `proyectoSpotify`.`genero` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genero_x_cancion_canciones1`
    FOREIGN KEY (`canciones_ID`)
    REFERENCES `proyectoSpotify`.`canciones` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
