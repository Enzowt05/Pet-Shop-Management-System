-- -----------------------------------------------------
-- Schema bd_tobias_pet
-- -----------------------------------------------------
CREATE DATABASE bd_tobias_pet;
USE bd_tobias_pet ;

-- -----------------------------------------------------
-- Table tb_proprietario
-- -----------------------------------------------------
CREATE TABLE tb_proprietario(
  tb_proprietario_id INT NOT NULL PRIMARY KEY auto_increment,
  tb_proprietario_nome VARCHAR(100) NOT NULL,
  tb_proprietario_telefone VARCHAR(20) NOT NULL,
  tb_proprietario_endereco VARCHAR(100) NOT NULL,
  tb_proprietario_email VARCHAR(100) NULL
  );

-- -----------------------------------------------------
-- Table tb_pet
-- -----------------------------------------------------
CREATE TABLE tb_pet (
  tb_pet_id INT NOT NULL PRIMARY KEY auto_increment,
  tb_pet_nome VARCHAR(45) NOT NULL,
  tb_pet_especie VARCHAR(45) NOT NULL,
  tb_pet_raca VARCHAR(45) NOT NULL,
  tb_pet_porte VARCHAR(45) NOT NULL,
  tb_pet_idade VARCHAR(45) NOT NULL,
  tb_proprietario_id INT NOT NULL,
  CONSTRAINT pk_tb_pet_fk_tb_proprietario
    FOREIGN KEY (tb_proprietario_id)
    REFERENCES tb_proprietario (tb_proprietario_id)
    );


-- -----------------------------------------------------
-- Table tb_funcionario
-- -----------------------------------------------------
CREATE TABLE tb_funcionario (
  tb_funcionario_id INT NOT NULL auto_increment,
  tb_funcionario_nome VARCHAR(45) NOT NULL,
  tb_funcionario_telefone VARCHAR(45) NULL,
  tb_funcionario_endereco VARCHAR(45) NULL,
  tb_funcionario_dt_cont date NULL,
  PRIMARY KEY (tb_funcionario_id));

-- -----------------------------------------------------
-- Table tb_procedimento
-- -----------------------------------------------------
CREATE TABLE tb_procedimento (
  tb_pet_id INT NOT NULL,
  tb_funcionario_id INT NOT NULL,
  tb_procedimento_id INT NOT NULL auto_increment,
  tb_procedimento_desc VARCHAR(45) NULL,
  tb_procedimento_valor VARCHAR(45) NULL,
  tb_procedimento_dt datetime,
  PRIMARY KEY (tb_procedimento_id),
  CONSTRAINT fk_tb_pet_pk_tb_procedimento
    FOREIGN KEY (tb_pet_id)
    REFERENCES tb_pet (tb_pet_id),
  CONSTRAINT fk_tb_funcionario_pk_tb_procedimento
    FOREIGN KEY (tb_funcionario_id)
    REFERENCES tb_funcionario (tb_funcionario_id)
);