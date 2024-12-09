-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actors` (
  `idActor` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `birthday` DATE NULL,
  PRIMARY KEY (`idActor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`movies` (
  `idMovies` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(45) NOT NULL,
  `image` LONGTEXT NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  `actors_idActor` INT NOT NULL,
  PRIMARY KEY (`idMovies`, `actors_idActor`),
  INDEX `fk_movies_actors1_idx` (`actors_idActor` ASC) VISIBLE,
  CONSTRAINT `fk_movies_actors1`
    FOREIGN KEY (`actors_idActor`)
    REFERENCES `mydb`.`actors` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `idUsers` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `plan_details` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users_has_movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users_has_movies` (
  `users_idUsers` INT NOT NULL,
  `movies_idMovies` INT NOT NULL,
  PRIMARY KEY (`users_idUsers`, `movies_idMovies`),
  INDEX `fk_users_has_movies_movies1_idx` (`movies_idMovies` ASC) VISIBLE,
  INDEX `fk_users_has_movies_users_idx` (`users_idUsers` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_movies_users`
    FOREIGN KEY (`users_idUsers`)
    REFERENCES `mydb`.`users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_movies_movies1`
    FOREIGN KEY (`movies_idMovies`)
    REFERENCES `mydb`.`movies` (`idMovies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
