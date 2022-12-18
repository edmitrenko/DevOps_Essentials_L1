-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hospital` ;

-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 ;
USE `hospital` ;

-- -----------------------------------------------------
-- Table `hospital`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`department` ;

CREATE TABLE IF NOT EXISTS `hospital`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_descr` VARCHAR(200) NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`cabinets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`cabinets` ;

CREATE TABLE IF NOT EXISTS `hospital`.`cabinets` (
  `cabinet_id` INT NOT NULL AUTO_INCREMENT,
  `cabinet_num` VARCHAR(45) NULL,
  `cabinet_descr` VARCHAR(45) NULL,
  `department_id` INT NULL,
  PRIMARY KEY (`cabinet_id`),
  INDEX `department_id_idx` (`department_id` ASC),
  CONSTRAINT `department_id`
    FOREIGN KEY (`department_id`)
    REFERENCES `hospital`.`department` (`department_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`doctors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`doctors` ;

CREATE TABLE IF NOT EXISTS `hospital`.`doctors` (
  `doctor_id` INT NOT NULL AUTO_INCREMENT,
  `doctor_name` VARCHAR(45) NULL,
  `doctor_descr` VARCHAR(45) NULL,
  PRIMARY KEY (`doctor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`scedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`scedule` ;

CREATE TABLE IF NOT EXISTS `hospital`.`scedule` (
  `scedule_id` INT NOT NULL AUTO_INCREMENT,
  `cabinet_num` VARCHAR(45) NULL,
  `doctor_name` VARCHAR(45) NULL,
  `patient_name` VARCHAR(45) NULL,
  PRIMARY KEY (`scedule_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`diagnos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`diagnos` ;

CREATE TABLE IF NOT EXISTS `hospital`.`diagnos` (
  `diagnos_id` INT NOT NULL AUTO_INCREMENT,
  `diagnost_descr` VARCHAR(200) NULL,
  PRIMARY KEY (`diagnos_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`patients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`patients` ;

CREATE TABLE IF NOT EXISTS `hospital`.`patients` (
  `patient_id` INT NOT NULL AUTO_INCREMENT,
  `patient_name` VARCHAR(45) NULL,
  `diagnos_id` INT NULL,
  `patient_sex` VARCHAR(45) NULL,
  `patient_age` VARCHAR(45) NULL,
  `patient_address` VARCHAR(45) NULL,
  `patient_phone` INT NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `diagnos_id_idx` (`diagnos_id` ASC),
  CONSTRAINT `diagnos_id`
    FOREIGN KEY (`diagnos_id`)
    REFERENCES `hospital`.`diagnos` (`diagnos_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`scedule_date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`scedule_date` ;

CREATE TABLE IF NOT EXISTS `hospital`.`scedule_date` (
  `scedule_date_id` INT NOT NULL AUTO_INCREMENT,
  `scedule_date` DATETIME(6) NULL,
  `scedule_id` INT NULL,
  PRIMARY KEY (`scedule_date_id`),
  INDEX `scedule_id_idx` (`scedule_id` ASC),
  CONSTRAINT `scedule_id`
    FOREIGN KEY (`scedule_id`)
    REFERENCES `hospital`.`scedule` (`scedule_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `hospital` ;

-- -----------------------------------------------------
-- Placeholder table for view `hospital`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `hospital`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`view1`;
DROP VIEW IF EXISTS `hospital`.`view1` ;
USE `hospital`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `hospital`.`department`
-- -----------------------------------------------------
START TRANSACTION;
USE `hospital`;
INSERT INTO `hospital`.`department` (`department_id`, `department_descr`) VALUES (1, 'Хірургія');
INSERT INTO `hospital`.`department` (`department_id`, `department_descr`) VALUES (2, 'Неврологія');
INSERT INTO `hospital`.`department` (`department_id`, `department_descr`) VALUES (3, 'Терапія');
INSERT INTO `hospital`.`department` (`department_id`, `department_descr`) VALUES (4, 'Рентгенологія');
INSERT INTO `hospital`.`department` (`department_id`, `department_descr`) VALUES (5, 'Ультра звукова діагностика');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hospital`.`cabinets`
-- -----------------------------------------------------
START TRANSACTION;
USE `hospital`;
INSERT INTO `hospital`.`cabinets` (`cabinet_id`, `cabinet_num`, `cabinet_descr`, `department_id`) VALUES (1, '10', 'Хірургічний кабінет', 1);
INSERT INTO `hospital`.`cabinets` (`cabinet_id`, `cabinet_num`, `cabinet_descr`, `department_id`) VALUES (2, '11', 'Неврологічний кабінет', 2);
INSERT INTO `hospital`.`cabinets` (`cabinet_id`, `cabinet_num`, `cabinet_descr`, `department_id`) VALUES (3, '12', 'Терапевтичний кабінет', 3);
INSERT INTO `hospital`.`cabinets` (`cabinet_id`, `cabinet_num`, `cabinet_descr`, `department_id`) VALUES (4, '20', 'Рентгенологічний кабінет', 4);
INSERT INTO `hospital`.`cabinets` (`cabinet_id`, `cabinet_num`, `cabinet_descr`, `department_id`) VALUES (5, '21', 'Кабінет ультразвукової діагностики', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hospital`.`doctors`
-- -----------------------------------------------------
START TRANSACTION;
USE `hospital`;
INSERT INTO `hospital`.`doctors` (`doctor_id`, `doctor_name`, `doctor_descr`) VALUES (1, 'Лікар1', 'лікар-хірург');
INSERT INTO `hospital`.`doctors` (`doctor_id`, `doctor_name`, `doctor_descr`) VALUES (2, 'Лікар2', 'Лікар-невропатолог');
INSERT INTO `hospital`.`doctors` (`doctor_id`, `doctor_name`, `doctor_descr`) VALUES (3, 'Лікар3', 'Лікар-терапевт');
INSERT INTO `hospital`.`doctors` (`doctor_id`, `doctor_name`, `doctor_descr`) VALUES (4, 'Лікар4', 'Лікар-ренгенолог');
INSERT INTO `hospital`.`doctors` (`doctor_id`, `doctor_name`, `doctor_descr`) VALUES (5, 'Лікар5', 'Лікар з ультразвукової діагностики');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hospital`.`scedule`
-- -----------------------------------------------------
START TRANSACTION;
USE `hospital`;
INSERT INTO `hospital`.`scedule` (`scedule_id`, `cabinet_num`, `doctor_name`, `patient_name`) VALUES (1, '10', 'Лікар1', 'Пацієнт1');
INSERT INTO `hospital`.`scedule` (`scedule_id`, `cabinet_num`, `doctor_name`, `patient_name`) VALUES (2, '10', 'Лікар2', 'Пацієнт2');
INSERT INTO `hospital`.`scedule` (`scedule_id`, `cabinet_num`, `doctor_name`, `patient_name`) VALUES (3, '11', 'Лікар3', 'Пацієнт3');
INSERT INTO `hospital`.`scedule` (`scedule_id`, `cabinet_num`, `doctor_name`, `patient_name`) VALUES (4, '20', 'Лікар4', 'Пацієнт4');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hospital`.`diagnos`
-- -----------------------------------------------------
START TRANSACTION;
USE `hospital`;
INSERT INTO `hospital`.`diagnos` (`diagnos_id`, `diagnost_descr`) VALUES (1, 'Гострий катаральний апендицит');
INSERT INTO `hospital`.`diagnos` (`diagnos_id`, `diagnost_descr`) VALUES (2, 'Гострий гангренозний апендицит.');
INSERT INTO `hospital`.`diagnos` (`diagnos_id`, `diagnost_descr`) VALUES (3, 'Гострий интерстициальний панкреатит.');
INSERT INTO `hospital`.`diagnos` (`diagnos_id`, `diagnost_descr`) VALUES (4, 'Придбана невправимая пупкова грижа');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hospital`.`patients`
-- -----------------------------------------------------
START TRANSACTION;
USE `hospital`;
INSERT INTO `hospital`.`patients` (`patient_id`, `patient_name`, `diagnos_id`, `patient_sex`, `patient_age`, `patient_address`, `patient_phone`) VALUES (1, 'Пацієнт1', 1, 'ч', '26', 'вул Виноградна', 1111111);
INSERT INTO `hospital`.`patients` (`patient_id`, `patient_name`, `diagnos_id`, `patient_sex`, `patient_age`, `patient_address`, `patient_phone`) VALUES (2, 'Пацієнт2', 2, 'ч', '69', 'вул Сливова', 2222222);
INSERT INTO `hospital`.`patients` (`patient_id`, `patient_name`, `diagnos_id`, `patient_sex`, `patient_age`, `patient_address`, `patient_phone`) VALUES (3, 'Пацієнт3', 3, 'ч', '19', 'вул Грушева', 3333333);
INSERT INTO `hospital`.`patients` (`patient_id`, `patient_name`, `diagnos_id`, `patient_sex`, `patient_age`, `patient_address`, `patient_phone`) VALUES (4, 'Пацієнт4', 4, 'ж', '64', 'вул Соняшникова', 4444444);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hospital`.`scedule_date`
-- -----------------------------------------------------
START TRANSACTION;
USE `hospital`;
INSERT INTO `hospital`.`scedule_date` (`scedule_date_id`, `scedule_date`, `scedule_id`) VALUES (1, '2022-10-25 9:00', 1);
INSERT INTO `hospital`.`scedule_date` (`scedule_date_id`, `scedule_date`, `scedule_id`) VALUES (2, '2022-10-25 10:00', 2);
INSERT INTO `hospital`.`scedule_date` (`scedule_date_id`, `scedule_date`, `scedule_id`) VALUES (3, '2022-10-25 11:00', 3);
INSERT INTO `hospital`.`scedule_date` (`scedule_date_id`, `scedule_date`, `scedule_id`) VALUES (4, '2022-10-25 12:00', 4);

COMMIT;


