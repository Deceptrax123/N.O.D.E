-- MySQL Script generated by MySQL Workbench
-- Fri Mar  4 11:44:30 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema user_dat
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema user_dat
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `user_dat` ;
-- -----------------------------------------------------
-- Schema org_dat
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema org_dat
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `org_dat` ;
USE `user_dat` ;

-- -----------------------------------------------------
-- Table `user_dat`.`user_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_dat`.`user_details` ;

CREATE TABLE IF NOT EXISTS `user_dat`.`user_details` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `mob_num` INT NULL,
  `email` VARCHAR(100) NULL,
  `dob` DATE NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `doe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `mob_num_UNIQUE` (`mob_num` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_dat`.`user_sevices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_dat`.`user_sevices` ;

CREATE TABLE IF NOT EXISTS `user_dat`.`user_sevices` (
  `user_id` INT NOT NULL,
  `service_req` BINARY NULL,
  `medical` VARCHAR(45) NULL,
  `teaching` VARCHAR(45) NULL,
  `donations` VARCHAR(45) NULL,
  `time` INT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user_dat`.`user_details` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `org_dat` ;

-- -----------------------------------------------------
-- Table `org_dat`.`org_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `org_dat`.`org_profile` ;

CREATE TABLE IF NOT EXISTS `org_dat`.`org_profile` (
  `org_id` INT NOT NULL,
  `org_name` VARCHAR(45) NOT NULL,
  `org_contactno` INT NOT NULL,
  `org_email` VARCHAR(100) NOT NULL,
  `org_address` VARCHAR(200) NOT NULL,
  `org_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`org_id`),
  UNIQUE INDEX `org_id_UNIQUE` (`org_id` ASC) VISIBLE,
  UNIQUE INDEX `org_name_UNIQUE` (`org_name` ASC) VISIBLE,
  UNIQUE INDEX `org_contactno_UNIQUE` (`org_contactno` ASC) VISIBLE,
  UNIQUE INDEX `org_email_UNIQUE` (`org_email` ASC) VISIBLE,
  UNIQUE INDEX `org_type_UNIQUE` (`org_type` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `org_dat`.`org_services`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `org_dat`.`org_services` ;

CREATE TABLE IF NOT EXISTS `org_dat`.`org_services` (
  `org_id` INT NOT NULL,
  `org_type` VARCHAR(45) NOT NULL,
  `medical` VARCHAR(45) NULL,
  `teaching` VARCHAR(45) NULL,
  `donations` VARCHAR(45) NULL,
  `timings` INT NULL,
  PRIMARY KEY (`org_id`),
  UNIQUE INDEX `org_id_UNIQUE` (`org_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`org_id`)
    REFERENCES `org_dat`.`org_profile` (`org_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
