-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema realestatedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `realestatedb` ;

-- -----------------------------------------------------
-- Schema realestatedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `realestatedb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema tododb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `tododb` ;

-- -----------------------------------------------------
-- Schema tododb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tododb` DEFAULT CHARACTER SET utf8 ;
USE `realestatedb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(450) NOT NULL,
  `last_name` VARCHAR(450) NOT NULL,
  `username` VARCHAR(450) NOT NULL,
  `password` VARCHAR(450) NOT NULL,
  `email` VARCHAR(450) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL,
  `street` VARCHAR(5000) NULL,
  `city` VARCHAR(5000) NULL,
  `state_abbrv` VARCHAR(2) NULL,
  `zip` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_address` ;

CREATE TABLE IF NOT EXISTS `user_has_address` (
  `user_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `address_id`),
  INDEX `fk_user_has_address_address1_idx` (`address_id` ASC),
  INDEX `fk_user_has_address_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_address_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_address_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `task` ;

CREATE TABLE IF NOT EXISTS `task` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `desc` VARCHAR(45) NULL,
  `task_location` VARCHAR(45) NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address_has_task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address_has_task` ;

CREATE TABLE IF NOT EXISTS `address_has_task` (
  `address_id` INT NOT NULL,
  `task_id` INT NOT NULL,
  `due_date` VARCHAR(45) NULL,
  PRIMARY KEY (`address_id`, `task_id`),
  INDEX `fk_address_has_task_task1_idx` (`task_id` ASC),
  INDEX `fk_address_has_task_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_address_has_task_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_has_task_task1`
    FOREIGN KEY (`task_id`)
    REFERENCES `task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `tododb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `enabled` TINYINT(4) NULL DEFAULT NULL,
  `role` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `todo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `todo` ;

CREATE TABLE IF NOT EXISTS `todo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `task` VARCHAR(55) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `completed` TINYINT(4) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `due_date` VARCHAR(50) NULL DEFAULT NULL,
  `complete_date` VARCHAR(50) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_todo_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_todo_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin;
 DROP USER admin;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `realestatedb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`) VALUES (1, 'admin', 'admin', 'admin', 'admin', 'admin@email.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `realestatedb`;
INSERT INTO `address` (`id`, `street`, `city`, `state_abbrv`, `zip`) VALUES (1, 'test st', 'hooville', 'CO', '00000');

COMMIT;


-- -----------------------------------------------------
-- Data for table `task`
-- -----------------------------------------------------
START TRANSACTION;
USE `realestatedb`;
INSERT INTO `task` (`id`, `name`, `desc`, `task_location`, `updated_at`) VALUES (1, 'gutters', 'check and clean gutters if need ', 'outdoor', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address_has_task`
-- -----------------------------------------------------
START TRANSACTION;
USE `realestatedb`;
INSERT INTO `address_has_task` (`address_id`, `task_id`, `due_date`) VALUES (1, 1, '04-24-22');

COMMIT;
