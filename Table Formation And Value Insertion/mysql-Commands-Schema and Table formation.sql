-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema main_project
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `main_project` ;

-- -----------------------------------------------------
-- Schema main_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `main_project` DEFAULT CHARACTER SET utf8 ;
USE `main_project` ;

-- -----------------------------------------------------
-- Table `main_project`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `main_project`.`users` ;

CREATE TABLE IF NOT EXISTS `main_project`.`users` (
  `user_id` VARCHAR(50) NOT NULL,
  `user_first_name` VARCHAR(45) NOT NULL,
  `user_last_name` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `user_mobile` BIGINT UNSIGNED NOT NULL,
  `user_address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  INDEX `user_last_name` (`user_last_name` ASC) INVISIBLE,
  INDEX `user_first_name` (`user_first_name` ASC) INVISIBLE,
  INDEX `user_password` (`user_password` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `main_project`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `main_project`.`customer` ;

CREATE TABLE IF NOT EXISTS `main_project`.`customer` (
  `cus_id` VARCHAR(40) NOT NULL,
  `cus_first_name` VARCHAR(45) NOT NULL,
  `cus_last_name` VARCHAR(45) NOT NULL,
  `cus_password` VARCHAR(45) NOT NULL,
  `cus_mobile` BIGINT UNSIGNED NOT NULL,
  `cus_email` VARCHAR(45) NOT NULL,
  `cus_address` VARCHAR(255) NOT NULL,
  `Users_user_id` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cus_id`, `Users_user_id`),
  UNIQUE INDEX `cus_id_UNIQUE` (`cus_id` ASC) VISIBLE,
  INDEX `fk_Customer_Users1_idx` (`Users_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Users1`
    FOREIGN KEY (`Users_user_id`)
    REFERENCES `main_project`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `main_project`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `main_project`.`roles` ;

CREATE TABLE IF NOT EXISTS `main_project`.`roles` (
  `role_id` VARCHAR(40) NOT NULL,
  `role_name` VARCHAR(45) NOT NULL,
  `role_description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  INDEX `role_id` (`role_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `main_project`.`login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `main_project`.`login` ;

CREATE TABLE IF NOT EXISTS `main_project`.`login` (
  `login_id` VARCHAR(45) NOT NULL,
  `login_role_id` VARCHAR(45) NOT NULL,
  `login_first_name` VARCHAR(45) NOT NULL,
  `login_last_name` VARCHAR(45) NOT NULL,
  `login_password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE INDEX `login_id_UNIQUE` (`login_id` ASC) VISIBLE,
  INDEX `login_password_idx` (`login_password` ASC) VISIBLE,
  INDEX `login_role_id` (`login_role_id` ASC) VISIBLE,
  CONSTRAINT `login_password`
    FOREIGN KEY (`login_password`)
    REFERENCES `main_project`.`users` (`user_password`),
  CONSTRAINT `login_role_id`
    FOREIGN KEY (`login_role_id`)
    REFERENCES `main_project`.`roles` (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `main_project`.`permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `main_project`.`permission` ;

CREATE TABLE IF NOT EXISTS `main_project`.`permission` (
  `per_id` VARCHAR(40) NOT NULL,
  `per_module` VARCHAR(45) NOT NULL,
  `per_name` VARCHAR(45) NOT NULL,
  `Roles_role_id` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`per_id`),
  UNIQUE INDEX `per_id_UNIQUE` (`per_id` ASC) VISIBLE,
  UNIQUE INDEX `composite_key_name` (`per_module` ASC, `per_name` ASC, `Roles_role_id` ASC) VISIBLE,
  INDEX `fk_Permisssion_Roles1_idx` (`Roles_role_id` ASC) VISIBLE,
  CONSTRAINT `fk_Permisssion_Roles1`
    FOREIGN KEY (`Roles_role_id`)
    REFERENCES `main_project`.`roles` (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `main_project`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `main_project`.`product` ;

CREATE TABLE IF NOT EXISTS `main_project`.`product` (
  `pro_id` VARCHAR(40) NOT NULL,
  `pro_type` VARCHAR(45) NULL DEFAULT NULL,
  `pro_item_name` VARCHAR(45) NULL DEFAULT NULL,
  `pro_quantity` INT NULL DEFAULT NULL,
  `pro_description` VARCHAR(255) NULL DEFAULT NULL,
  `Users_user_id` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`pro_id`),
  UNIQUE INDEX `pro_id_UNIQUE` (`pro_id` ASC) VISIBLE,
  INDEX `fk_product_Users1_idx` (`Users_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_Users1`
    FOREIGN KEY (`Users_user_id`)
    REFERENCES `main_project`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `main_project`.`schedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `main_project`.`schedule` ;

CREATE TABLE IF NOT EXISTS `main_project`.`schedule` (
  `sch_id` VARCHAR(55) NOT NULL,
  `sch_type` VARCHAR(45) NULL DEFAULT NULL,
  `sch_description` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`sch_id`),
  UNIQUE INDEX `sch_id_UNIQUE` (`sch_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `main_project`.`salesman`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `main_project`.`salesman` ;

CREATE TABLE IF NOT EXISTS `main_project`.`salesman` (
  `slmn_id` VARCHAR(40) NOT NULL,
  `slmn_first_name` VARCHAR(45) NOT NULL,
  `slmn_last_name` VARCHAR(45) NOT NULL,
  `slmn_password` VARCHAR(45) NOT NULL,
  `slmn_mobile` BIGINT UNSIGNED NOT NULL,
  `slmn_address` VARCHAR(255) NOT NULL,
  `Schedule_sch_id` VARCHAR(55) NOT NULL,
  `slmn_email` VARCHAR(45) NOT NULL,
  `Users_user_id` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`slmn_id`, `Users_user_id`),
  INDEX `fk_Salesman_Schedule1_idx` (`Schedule_sch_id` ASC) VISIBLE,
  INDEX `fk_Salesman_Users1_idx` (`Users_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Salesman_Schedule1`
    FOREIGN KEY (`Schedule_sch_id`)
    REFERENCES `main_project`.`schedule` (`sch_id`),
  CONSTRAINT `fk_Salesman_Users1`
    FOREIGN KEY (`Users_user_id`)
    REFERENCES `main_project`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `main_project` ;

-- -----------------------------------------------------
-- procedure get_order_by_cust
-- -----------------------------------------------------

USE `main_project`;
DROP procedure IF EXISTS `main_project`.`get_order_by_cust`;

DELIMITER $$
USE `main_project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_order_by_cust`(
    IN cust_no INT,
    OUT shipped INT, 
    OUT canceled INT, 
    OUT resolved INT,
    OUT disputed INT
)
BEGIN
  -- shipped 
  SELECT COUNT(*) INTO shipped FROM customers WHERE customerNumber = cust_no AND status = 'shipped';
  
  -- canceled
  SELECT COUNT(*) INTO canceled FROM customers WHERE customerNumber = cust_no AND status = 'canceled';
  
  -- resolved 
  SELECT COUNT(*) INTO resolved FROM customers WHERE customerNumber = cust_no AND status = 'Resolved';
  
  -- disputed 
  SELECT COUNT(*) INTO disputed FROM customers WHERE customerNumber = cust_no AND status = 'disputed';
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
