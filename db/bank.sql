/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.14 : Database - banco
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`banco` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `banco`;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `tipo_doc` varchar(50) DEFAULT NULL,
  `num_documento` int(11) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `cliente` */

insert  into `cliente`(`tipo_doc`,`num_documento`,`nombres`,`apellidos`) values ('CC',1234556,'pepe','paez'),('CC',345678,'MANUEL','QUIROGA'),('CC',4567890,'OMAR','COTES');

/*Table structure for table `cuenta` */

DROP TABLE IF EXISTS `cuenta`;

CREATE TABLE `cuenta` (
  `id` int(11) DEFAULT NULL,
  `tipo_cod` varchar(50) DEFAULT NULL,
  `num_doc` int(11) DEFAULT NULL,
  `monto` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `cuenta` */

insert  into `cuenta`(`id`,`tipo_cod`,`num_doc`,`monto`) values (1,'CC',1234556,500000),(2,'CC',345678,5700000),(3,'CC',4567890,34700);

/*Table structure for table `metodos_consumo` */

DROP TABLE IF EXISTS `metodos_consumo`;

CREATE TABLE `metodos_consumo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo_http` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `metodos_consumo` */

insert  into `metodos_consumo`(`id`,`nombre`,`tipo_http`) values (1,'consultar','GET'),(2,'pagar','POST'),(3,'compensar','DELETE');

/*Table structure for table `parametros_recursos` */

DROP TABLE IF EXISTS `parametros_recursos`;

CREATE TABLE `parametros_recursos` (
  `id` int(11) DEFAULT NULL,
  `id_recurso` int(11) DEFAULT NULL,
  `nombre_atributo` varchar(50) DEFAULT NULL,
  `tipo_dato` varchar(50) DEFAULT NULL,
  `longitud` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `parametros_recursos` */

/*Table structure for table `proveedor_contrato` */

DROP TABLE IF EXISTS `proveedor_contrato`;

CREATE TABLE `proveedor_contrato` (
  `id` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_metodo` int(11) DEFAULT NULL,
  `contrato` text,
  PRIMARY KEY (`id`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_metodo` (`id_metodo`),
  CONSTRAINT `proveedor_contrato_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor_servicio` (`id`),
  CONSTRAINT `proveedor_contrato_ibfk_2` FOREIGN KEY (`id_metodo`) REFERENCES `metodos_consumo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proveedor_contrato` */

insert  into `proveedor_contrato`(`id`,`id_proveedor`,`id_metodo`,`contrato`) values (1,123,1,'<soapenv:ENVELOPE xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:sch=\"http://www.servicios.co/pagos/schemas\">\n<soapenv:Header/>\n<soapenv:Body>\n<sch:ReferenciaFactura>\n<sch:referenciaFactura>?</sch:referenciaFactura>\n</sch:ReferenciaFactura>\n</soapenv:Body>\n</soapenv:ENVELOPE>');

/*Table structure for table `proveedor_servicio` */

DROP TABLE IF EXISTS `proveedor_servicio`;

CREATE TABLE `proveedor_servicio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `tipo_servicio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proveedor_servicio` */

insert  into `proveedor_servicio`(`id`,`nombre`,`host`,`tipo_servicio`) values (123,'ETB','http://192.168.1.6:9090/servicios/pagos/v1/payments/','REST'),(567,'ACUEDUCTO','http://192.168.1.6:7070/w1-soap-svr/PagosServiceService?wsdl','SOAP');

/*Table structure for table `tipo_id` */

DROP TABLE IF EXISTS `tipo_id`;

CREATE TABLE `tipo_id` (
  `TIPID` char(2) DEFAULT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tipo_id` */

insert  into `tipo_id`(`TIPID`,`DESCRIPCION`) values ('CC','CEDULA'),('TI','TARJETA IDENTIDAD');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
