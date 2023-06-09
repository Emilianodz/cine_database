-- MySQL Script generated by MySQL Workbench
-- Tue Mar 28 21:08:23 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sis_reservaciones
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sis_reservaciones
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sis_reservaciones` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sis_reservaciones` ;

-- -----------------------------------------------------
-- Table `sis_reservaciones`.`salas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sis_reservaciones`.`salas` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `N_ASIENTOS` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sis_reservaciones`.`asientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sis_reservaciones`.`asientos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `FILA` CHAR(2) NOT NULL,
  `NUMERO` INT NOT NULL,
  `ID_SALA` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_SALA` (`ID_SALA` ASC) VISIBLE,
  CONSTRAINT `asientos_ibfk_1`
    FOREIGN KEY (`ID_SALA`)
    REFERENCES `sis_reservaciones`.`salas` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 145
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sis_reservaciones`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sis_reservaciones`.`peliculas` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `DUR_MIN` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `NOMBRE` (`NOMBRE` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sis_reservaciones`.`funciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sis_reservaciones`.`funciones` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_PELICULA` INT NOT NULL,
  `ID_SALA` INT NOT NULL,
  `HORA_INICIO` DATETIME NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_PELICULA` (`ID_PELICULA` ASC) VISIBLE,
  INDEX `ID_SALA` (`ID_SALA` ASC) VISIBLE,
  CONSTRAINT `funciones_ibfk_1`
    FOREIGN KEY (`ID_PELICULA`)
    REFERENCES `sis_reservaciones`.`peliculas` (`ID`),
  CONSTRAINT `funciones_ibfk_2`
    FOREIGN KEY (`ID_SALA`)
    REFERENCES `sis_reservaciones`.`salas` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 214
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sis_reservaciones`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sis_reservaciones`.`clientes` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NULL DEFAULT NULL,
  `APELLIDO` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `EMAIL` (`EMAIL` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 121
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sis_reservaciones`.`reservaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sis_reservaciones`.`reservaciones` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_FUNCION` INT NOT NULL,
  `ID_CLIENTE` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_FUNCION` (`ID_FUNCION` ASC) VISIBLE,
  INDEX `ID_CLIENTE` (`ID_CLIENTE` ASC) VISIBLE,
  CONSTRAINT `reservaciones_ibfk_1`
    FOREIGN KEY (`ID_FUNCION`)
    REFERENCES `sis_reservaciones`.`funciones` (`ID`),
  CONSTRAINT `reservaciones_ibfk_2`
    FOREIGN KEY (`ID_CLIENTE`)
    REFERENCES `sis_reservaciones`.`clientes` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 411
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sis_reservaciones`.`asientos_reservados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sis_reservaciones`.`asientos_reservados` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_RESERVACION` INT NOT NULL,
  `ID_ASIENTO` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_RESERVACION` (`ID_RESERVACION` ASC) VISIBLE,
  INDEX `ID_ASIENTO` (`ID_ASIENTO` ASC) VISIBLE,
  CONSTRAINT `asientos_reservados_ibfk_1`
    FOREIGN KEY (`ID_RESERVACION`)
    REFERENCES `sis_reservaciones`.`reservaciones` (`ID`),
  CONSTRAINT `asientos_reservados_ibfk_2`
    FOREIGN KEY (`ID_ASIENTO`)
    REFERENCES `sis_reservaciones`.`asientos` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 744
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
