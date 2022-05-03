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
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `user` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `id` BIGINT NOT NULL,
  `descricao` BIGINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produtos` (
  `nome_do_produto` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `foto` VARCHAR(255) NOT NULL,
  `tamanho` VARCHAR(255) NULL,
  `usuario_id` BIGINT NOT NULL,
  `categoria_id` BIGINT NOT NULL,
  `avaliacao` INT NULL,
  `fornecedor` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_usuario_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_produtos_categoria1_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `mydb`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
