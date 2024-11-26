-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema project_db1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project_db1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project_db1` DEFAULT CHARACTER SET utf8mb3 ;
USE `project_db1` ;

-- -----------------------------------------------------
-- Table `project_db1`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`department` (
  `Department_id` INT NOT NULL,
  `Department` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Department_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`education_index`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`education_index` (
  `Education` INT NOT NULL AUTO_INCREMENT,
  `Education_level` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Education`),
  UNIQUE INDEX `Education_index_UNIQUE` (`Education` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`travel_index`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`travel_index` (
  `Travel_id` INT NOT NULL AUTO_INCREMENT,
  `Business Travel` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Travel_id`),
  UNIQUE INDEX `Travel_id_UNIQUE` (`Travel_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`employee` (
  `Employee_Number` INT NOT NULL,
  `Gender` VARCHAR(45) NULL DEFAULT NULL,
  `Age` INT NULL DEFAULT NULL,
  `Marital Status` VARCHAR(45) NULL DEFAULT NULL,
  `Distance from Home` INT NULL DEFAULT NULL,
  `Travel_Travel_id` INT NOT NULL,
  PRIMARY KEY (`Employee_Number`),
  UNIQUE INDEX `Employee_Number_UNIQUE` (`Employee_Number` ASC) VISIBLE,
  INDEX `fk_Employee_Travel1_idx` (`Travel_Travel_id` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Travel1`
    FOREIGN KEY (`Travel_Travel_id`)
    REFERENCES `project_db1`.`travel_index` (`Travel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`education` (
  `Employee_Employee_Number` INT NOT NULL,
  `Educationfield` VARCHAR(45) NULL DEFAULT NULL,
  `Education_index_Education` INT NOT NULL,
  PRIMARY KEY (`Employee_Employee_Number`),
  INDEX `fk_Education_Education_index1_idx` (`Education_index_Education` ASC) VISIBLE,
  CONSTRAINT `fk_Education_Education_index1`
    FOREIGN KEY (`Education_index_Education`)
    REFERENCES `project_db1`.`education_index` (`Education`),
  CONSTRAINT `fk_Education_Employee1`
    FOREIGN KEY (`Employee_Employee_Number`)
    REFERENCES `project_db1`.`employee` (`Employee_Number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`performancerating_index`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`performancerating_index` (
  `PerformanceRating` INT NOT NULL AUTO_INCREMENT,
  `PerformanceRatingName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PerformanceRating`),
  UNIQUE INDEX `PerformanceRatingIndex_UNIQUE` (`PerformanceRating` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`experience` (
  `Employee_Employee_Number` INT NOT NULL,
  `TotalWorkingYears` INT NOT NULL,
  `YearsAtCompany` INT NULL DEFAULT NULL,
  `YearInCurrentRole` INT NULL DEFAULT NULL,
  `YearsSinceLastPromotion` INT NULL DEFAULT NULL,
  `YearWithCurrManager` INT NULL DEFAULT NULL,
  `TrainingTimesLastYear` INT NULL DEFAULT NULL,
  `NumCompaniesWorked` INT NULL DEFAULT NULL,
  `PerformanceRatingIndex_PerformanceRating` INT NOT NULL,
  PRIMARY KEY (`Employee_Employee_Number`),
  INDEX `fk_Experience_PerformanceRatingIndex1_idx` (`PerformanceRatingIndex_PerformanceRating` ASC) VISIBLE,
  CONSTRAINT `fk_Experience_Employee1`
    FOREIGN KEY (`Employee_Employee_Number`)
    REFERENCES `project_db1`.`employee` (`Employee_Number`),
  CONSTRAINT `fk_Experience_PerformanceRatingIndex1`
    FOREIGN KEY (`PerformanceRatingIndex_PerformanceRating`)
    REFERENCES `project_db1`.`performancerating_index` (`PerformanceRating`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`job role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`job role` (
  `JobRole_id` INT NOT NULL,
  `Job Role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`JobRole_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`job details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`job details` (
  `Employee_Employee_Number` INT NOT NULL,
  `JobLevel` INT NULL DEFAULT NULL,
  `Department_Department_id` INT NOT NULL,
  `Job Role_JobRole_id` INT NOT NULL,
  PRIMARY KEY (`Employee_Employee_Number`),
  INDEX `fk_Department_Employee1_idx` (`Employee_Employee_Number` ASC) VISIBLE,
  INDEX `fk_Job Details_Department1_idx` (`Department_Department_id` ASC) VISIBLE,
  INDEX `fk_Job Details_Job Role1_idx` (`Job Role_JobRole_id` ASC) VISIBLE,
  CONSTRAINT `fk_Department_Employee1`
    FOREIGN KEY (`Employee_Employee_Number`)
    REFERENCES `project_db1`.`employee` (`Employee_Number`),
  CONSTRAINT `fk_Job Details_Department1`
    FOREIGN KEY (`Department_Department_id`)
    REFERENCES `project_db1`.`department` (`Department_id`),
  CONSTRAINT `fk_Job Details_Job Role1`
    FOREIGN KEY (`Job Role_JobRole_id`)
    REFERENCES `project_db1`.`job role` (`JobRole_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`salary` (
  `Employee_Employee_Number` INT NOT NULL,
  `DailyRate` INT NOT NULL,
  `HourlyRate` INT NULL DEFAULT NULL,
  `MonthlyIncome` INT NULL DEFAULT NULL,
  `MonthlyRate` INT NULL DEFAULT NULL,
  `PercantageSalaryHike` INT NULL DEFAULT NULL,
  `StockOptionLevel` INT NULL DEFAULT NULL,
  `OverTime` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Employee_Employee_Number`),
  CONSTRAINT `fk_Salary_Employee1`
    FOREIGN KEY (`Employee_Employee_Number`)
    REFERENCES `project_db1`.`employee` (`Employee_Number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`worklifebalance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`worklifebalance` (
  `Worklifebalance` INT NOT NULL AUTO_INCREMENT,
  `Worklifebalance_level` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Worklifebalance`),
  UNIQUE INDEX `Worklifebalance_id_UNIQUE` (`Worklifebalance` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`satisfaction_index`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`satisfaction_index` (
  `Satisfaction_id` INT NOT NULL,
  `Satisifaction_level` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Satisfaction_id`),
  UNIQUE INDEX `Satisfaction_id_UNIQUE` (`Satisfaction_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `project_db1`.`satisfaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project_db1`.`satisfaction` (
  `Employee_Employee_Number` INT NOT NULL,
  `Attrition` VARCHAR(45) NULL DEFAULT NULL,
  `Worklifebalance_Worklifebalance` INT NOT NULL,
  `RelationshipSatisfaction` INT NOT NULL,
  `JobSatisfaction` INT NOT NULL,
  `EnvironmentSatisfaction` INT NOT NULL,
  `JobInvolvement` INT NOT NULL,
  PRIMARY KEY (`Employee_Employee_Number`),
  UNIQUE INDEX `Employee_Employee_Number_UNIQUE` (`Employee_Employee_Number` ASC) VISIBLE,
  INDEX `fk_Satisfaction_Employee1_idx` (`Employee_Employee_Number` ASC) VISIBLE,
  INDEX `fk_Satisfaction_Worklifebalance1_idx` (`Worklifebalance_Worklifebalance` ASC) VISIBLE,
  INDEX `fk_satisfaction_satisfaction_index1_idx` (`RelationshipSatisfaction` ASC, `JobSatisfaction` ASC, `EnvironmentSatisfaction` ASC, `JobInvolvement` ASC) VISIBLE,
  CONSTRAINT `fk_Satisfaction_Employee1`
    FOREIGN KEY (`Employee_Employee_Number`)
    REFERENCES `project_db1`.`employee` (`Employee_Number`),
  CONSTRAINT `fk_Satisfaction_Worklifebalance1`
    FOREIGN KEY (`Worklifebalance_Worklifebalance`)
    REFERENCES `project_db1`.`worklifebalance` (`Worklifebalance`),
  CONSTRAINT `fk_satisfaction_satisfaction_index1`
    FOREIGN KEY (`RelationshipSatisfaction` , `JobSatisfaction` , `EnvironmentSatisfaction` , `JobInvolvement`)
    REFERENCES `project_db1`.`satisfaction_index` (`Satisfaction_id` , `Satisfaction_id` , `Satisfaction_id` , `Satisfaction_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
