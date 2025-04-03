CREATE DATABASE CASANOVA;
USE CASANOVA;

-- Tabella Provincia
CREATE TABLE IF NOT EXISTS `CasaNova`.`Provincia` (
  `id_provincia` BIGINT NOT NULL AUTO_INCREMENT,
  `nome_provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Provincia`)
) ;

-- Tabella Comune
CREATE TABLE IF NOT EXISTS `CasaNova`.`Comune` (
  `id_comune` BIGINT NOT NULL AUTO_INCREMENT,
  `id_provincia` BIGINT NOT NULL,
  `nome_comune` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_comune`),
  FOREIGN KEY (`id_provincia`) REFERENCES `CasaNova`.`Provincia` (`id_Provincia`)
) ;

-- Tabella MediazioneImmobile
CREATE TABLE IF NOT EXISTS `CasaNova`.`MediazioneImmobile` (
  `id_mediazione_immobile` BIGINT NOT NULL AUTO_INCREMENT,
  `mediazione` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_mediazione_immobile`)
) ;

-- Tabella TipologiaImmobile
CREATE TABLE IF NOT EXISTS `CasaNova`.`TipologiaImmobile` (
  `id_tipologia_immobile` BIGINT NOT NULL AUTO_INCREMENT,
  `tipologia` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipologia_Immobile`)
);

-- Tabella StatoImmobile
CREATE TABLE IF NOT EXISTS `CasaNova`.`StatoImmobile` (
  `id_stato_immobile` BIGINT NOT NULL AUTO_INCREMENT,
  `stato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Stato_Immobile`)
);

CREATE TABLE User (
  user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  phone VARCHAR(16),
  role ENUM('STANDARD', 'REVISOR', 'ADMIN') DEFAULT 'STANDARD',
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
) ;

-- User Table

-- User applications for revisor/admin
CREATE TABLE Applications (
  app_id BIGINT AUTO_INCREMENT NOT NULL UNIQUE,
  user_id BIGINT NOT NULL,
  requested_role ENUM('REVISOR', 'ADMIN') NOT NULL,
  request_status ENUM('PENDING', 'APPROVED', 'REJECTED') DEFAULT 'PENDING',
  last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  message TEXT NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
);

-- Tabella Immobile
CREATE TABLE IF NOT EXISTS `CasaNova`.`Immobile` (
  `id_immobile` BIGINT NOT NULL AUTO_INCREMENT,
  `id_comune` BIGINT NOT NULL,
  `id_provincia` BIGINT NOT NULL,
  `id_tipologia_immobile` BIGINT NOT NULL,
  `superficie` VARCHAR(45) NULL,
  `indirizzo` VARCHAR(45) NULL,
  `locali` INT NULL,
  `ascensore` TINYINT NULL,
  `terrazzo` INT NULL,
  `piano` INT NULL,  
  `balcone` INT NULL,
  `giardino` TINYINT NULL,
  `garage`TINYINT NULL,
  `bagno` INT NULL,
  PRIMARY KEY (`id_immobile`),
  FOREIGN KEY (`id_tipologia_immobile`) REFERENCES `CasaNova`.`TipologiaImmobile` (`id_tipologia_immobile`),
  FOREIGN KEY (`id_comune`) REFERENCES `CasaNova`.`Comune` (`id_comune`),
  CHECK(`ascensore` IN (0,1)),
  CHECK(`giardino` IN (0,1)),
  CHECK(`garage` IN (0,1))
);



CREATE TABLE Listing (
  id_listing BIGINT AUTO_INCREMENT PRIMARY KEY,
  id_mediazione_immobile BIGINT NOT NULL,
  id_immagine_immobile BIGINT,
  id_stato_immobile BIGINT NOT NULL,
  id_utente BIGINT NOT NULL,
  title VARCHAR(255) NULL,
  prezzo INT NULL,
  descrizione TEXT NULL,
  listing_status ENUM('RENT', 'SELL', 'PENDING') NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  id_immobile BIGINT NOT NULL,
  FOREIGN KEY (`id_mediazione_immobile`) REFERENCES `CasaNova`.`MediazioneImmobile` (`id_mediazione_immobile`),
  FOREIGN KEY (`id_stato_immobile`) REFERENCES `CasaNova`.`StatoImmobile` (`id_stato_immobile`),
  FOREIGN KEY (`id_utente`) REFERENCES `CasaNova`.`User` (`user_id`),
  FOREIGN KEY(`id_immobile`) REFERENCES `Immobile` (`id_immobile`)
);


--CREATE TABLE ImmagineImmobile (
  `id_immagine_immobile` BIGINT AUTO_INCREMENT NOT NULL ,
  `immagine` TEXT NULL,
  `id_listing` BIGINT NOT NULL,
  PRIMARY KEY (`id_immagine_immobile`),
  FOREIGN KEY (`id_listing`) REFERENCES `CasaNova`.`Listing` (`id_listing`)
);
CREATE TABLE Preferiti(
id_preferiti BIGINT  NOT NULL AUTO_INCREMENT,
id_listing BIGINT NOT NULL,
id_utente BIGINT NOT NULL,
PRIMARY KEY (`id_preferiti`),
FOREIGN KEY (`id_utente`) REFERENCES `CasaNova`.`User` (`user_id`),
FOREIGN KEY (`id_listing`) REFERENCES `CasaNova`.`Listing` (`id_listing`)
);
