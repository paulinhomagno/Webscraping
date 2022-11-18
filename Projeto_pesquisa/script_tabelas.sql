-- MySQL Script generated by MySQL Workbench
-- Fri Nov  4 17:54:10 2022
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`tb_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_pessoa` (
  `id_pessoa` INT NOT NULL,
  `genero` VARCHAR(15) NULL,
  `data_nasc` DATE NULL,
  PRIMARY KEY (`id_pessoa`),
  UNIQUE INDEX `idpessoa_UNIQUE` (`id_pessoa` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_animal_estimacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_animal_estimacao` (
  `id_animal_estimacao` INT NOT NULL AUTO_INCREMENT,
  `animal_estimacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id_animal_estimacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_clima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_clima` (
  `id_clima` INT NOT NULL AUTO_INCREMENT,
  `clima` VARCHAR(45) NULL,
  PRIMARY KEY (`id_clima`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_bebidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_bebidas` (
  `id_bebidas` INT NOT NULL AUTO_INCREMENT,
  `bebida` VARCHAR(45) NULL,
  PRIMARY KEY (`id_bebidas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_hobbies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_hobbies` (
  `id_hobbies` INT NOT NULL AUTO_INCREMENT,
  `hobbies` VARCHAR(45) NULL,
  PRIMARY KEY (`id_hobbies`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_pesquisa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_pesquisa` (
  `id_pesquisa` INT NOT NULL AUTO_INCREMENT,
  `data_coleta` DATE NULL,
  `id_pessoa` INT NOT NULL,
  `id_hobbies` INT NOT NULL,
  `id_bebidas` INT NOT NULL,
  `id_clima` INT NOT NULL,
  `id_animal_estimacao` INT NOT NULL,
  PRIMARY KEY (`id_pesquisa`),
  INDEX `fk_tb_pesquisa_tb_pessoa_idx` (`id_pessoa` ASC) VISIBLE,
  INDEX `fk_tb_pesquisa_tb_hobbies1_idx` (`id_hobbies` ASC) VISIBLE,
  INDEX `fk_tb_pesquisa_tb_bebidas1_idx` (`id_bebidas` ASC) VISIBLE,
  INDEX `fk_tb_pesquisa_tb_clima1_idx` (`id_clima` ASC) VISIBLE,
  INDEX `fk_tb_pesquisa_tb_animal_estimacao1_idx` (`id_animal_estimacao` ASC) VISIBLE,
  CONSTRAINT `fk_tb_pesquisa_tb_pessoa`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `mydb`.`tb_pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_pesquisa_tb_hobbies1`
    FOREIGN KEY (`id_hobbies`)
    REFERENCES `mydb`.`tb_hobbies` (`id_hobbies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_pesquisa_tb_bebidas1`
    FOREIGN KEY (`id_bebidas`)
    REFERENCES `mydb`.`tb_bebidas` (`id_bebidas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_pesquisa_tb_clima1`
    FOREIGN KEY (`id_clima`)
    REFERENCES `mydb`.`tb_clima` (`id_clima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_pesquisa_tb_animal_estimacao1`
    FOREIGN KEY (`id_animal_estimacao`)
    REFERENCES `mydb`.`tb_animal_estimacao` (`id_animal_estimacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
