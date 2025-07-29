/*
SQLyog - Free MySQL GUI v5.17
Host - 5.0.24-community-nt : Database - carmica
*********************************************************************
Server version : 5.0.24-community-nt
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `carmica`;

USE `carmica`;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `catalogo` */

DROP TABLE IF EXISTS `catalogo`;

CREATE TABLE `catalogo` (
  `nome` varchar(30) NOT NULL,
  `descrizione` varchar(30) NOT NULL,
  `prezzo` float NOT NULL,
  `tipo` char(1) NOT NULL,
  PRIMARY KEY  (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `catalogo` */

insert into `catalogo` (`nome`,`descrizione`,`prezzo`,`tipo`) values ('Fiori Meccanici','Cd album 2006',18.9,'C');
insert into `catalogo` (`nome`,`descrizione`,`prezzo`,`tipo`) values ('Okinawa','Cd single 2006',9.9,'C');
insert into `catalogo` (`nome`,`descrizione`,`prezzo`,`tipo`) values ('Senza suono','Cd single',9.9,'C');

/*Table structure for table `ordini` */

DROP TABLE IF EXISTS `ordini`;

CREATE TABLE `ordini` (
  `contatore` decimal(65,0) NOT NULL,
  `cd_user` varchar(30) NOT NULL,
  `flag` char(1) NOT NULL,
  `scelta` varchar(30) NOT NULL,
  `canzoni` varchar(30) NOT NULL,
  `prezzo` float NOT NULL,
  `quantita` int(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY  (`cd_user`),
  CONSTRAINT `ordini_ibfk_1` FOREIGN KEY (`cd_user`) REFERENCES `utenti` (`cd_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ordini` */

/*Table structure for table `utenti` */

DROP TABLE IF EXISTS `utenti`;

CREATE TABLE `utenti` (
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `via` varchar(30) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `data_nascita` varchar(30) NOT NULL,
  `lingua` varchar(30) NOT NULL,
  `cd_user` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY  (`cd_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `utenti` */

insert into `utenti` (`nome`,`cognome`,`via`,`telefono`,`data_nascita`,`lingua`,`cd_user`,`pwd`,`timestamp`) values ('Amministratore','Carmica','dovemipare','00998877','1/1/1990','ITA','a','a','0000-00-00 00:00:00');
insert into `utenti` (`nome`,`cognome`,`via`,`telefono`,`data_nascita`,`lingua`,`cd_user`,`pwd`,`timestamp`) values ('erick','baldi','serraglio 16 baragazza','776655','18/06/1983','ITA','er','er','0000-00-00 00:00:00');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
