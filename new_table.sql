-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema music
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema music
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `music` DEFAULT CHARACTER SET utf8 ;
USE `music` ;

-- -----------------------------------------------------
-- Table `music`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music`.`album` (
  `id` INT NOT NULL DEFAULT '아이디',
  `title` VARCHAR(100) NOT NULL,
  `singersong` VARCHAR(100) NOT NULL,
  `img` VARCHAR(45) NULL,
  `delyn` CHAR NOT NULL,
  `reg_user` VARCHAR(45) NULL,
  `reg_date` DATE NULL,
  `up_user` VARCHAR(45) NULL,
  `up_date` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music`.`item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoryid` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `delyn` CHAR NOT NULL,
  `reg_user` VARCHAR(45) NULL,
  `reg_date` DATE NULL,
  `up_user` VARCHAR(45) NULL,
  `up_date` DATE NULL,
  `itemcol` VARCHAR(45) NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_album_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_item_album`
    FOREIGN KEY (`album_id`)
    REFERENCES `music`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music`.`comcode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music`.`comcode` (
  `pcd` VARCHAR(45) NOT NULL,
  `gcd` VARCHAR(45) NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  `value` VARCHAR(45) NOT NULL,
  `oseq` INT NOT NULL,
  `delyn` CHAR NOT NULL,
  `reg_user` VARCHAR(45) NULL,
  `ret_date` DATE NULL,
  `up_user` VARCHAR(45) NULL,
  `up_date` DATE NULL,
  PRIMARY KEY (`pcd`, `gcd`, `code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music`.`member` (
  `id` VARCHAR(45) NOT NULL,
  `psw` VARCHAR(45) NOT NULL,
  `membership` VARCHAR(45) NOT NULL,
  `alies` VARCHAR(45) NOT NULL,
  `delyn` CHAR NOT NULL,
  `reg_user` VARCHAR(45) NULL,
  `reg_date` DATE NULL,
  `up_user` VARCHAR(45) NULL,
  `up_date` DATE NULL,
  `membercol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music`.`playList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music`.`playList` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `playListcol` VARCHAR(45) NULL,
  `item_id` INT NOT NULL,
  `member_id` VARCHAR(45) NOT NULL,
  `delyn` CHAR NULL,
  `reg_user` VARCHAR(45) NULL,
  `reg_date` DATE NULL,
  `up_user` VARCHAR(45) NULL,
  `up_date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_playList_item1_idx` (`item_id` ASC) VISIBLE,
  INDEX `fk_playList_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_playList_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `music`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playList_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `music`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music`.`cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_id` INT NOT NULL,
  `member_id` VARCHAR(45) NOT NULL,
  `delyn` CHAR NOT NULL DEFAULT '유저가 지우면 Y',
  `buy` CHAR NULL DEFAULT 'Y 구매 N 비구매',
  `create_dt` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cart_item1_idx` (`item_id` ASC) VISIBLE,
  INDEX `fk_cart_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `music`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `music`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music`.`orderlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music`.`orderlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` VARCHAR(45) NOT NULL,
  `delyn` CHAR NULL,
  `reg_user` VARCHAR(45) NULL,
  `reg_date` DATE NULL,
  `up_user` VARCHAR(45) NULL,
  `up_date` DATE NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orderlist_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_orderlist_item1_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `fk_orderlist_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `music`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderlist_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `music`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
