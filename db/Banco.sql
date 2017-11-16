-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.0.67-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for banco
CREATE DATABASE IF NOT EXISTS `banco` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `banco`;

-- Dumping structure for table banco.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `tipo_doc` varchar(50) default NULL,
  `num_documento` int(11) default NULL,
  `nombres` varchar(50) default NULL,
  `apellidos` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table banco.cliente: 3 rows
DELETE FROM `cliente`;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`tipo_doc`, `num_documento`, `nombres`, `apellidos`) VALUES
	('CC', 1234556, 'pepe', 'paez'),
	('CC', 345678, 'MANUEL', 'QUIROGA'),
	('CC', 4567890, 'OMAR', 'COTES');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Dumping structure for table banco.cuenta
CREATE TABLE IF NOT EXISTS `cuenta` (
  `id` int(11) default NULL,
  `tipo_cod` varchar(50) default NULL,
  `num_doc` int(11) default NULL,
  `monto` double default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table banco.cuenta: 3 rows
DELETE FROM `cuenta`;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` (`id`, `tipo_cod`, `num_doc`, `monto`) VALUES
	(1, 'CC', 1234556, 500000),
	(2, 'CC', 345678, 5700000),
	(3, 'CC', 4567890, 34700);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;

-- Dumping structure for table banco.metodos_consumo
CREATE TABLE IF NOT EXISTS `metodos_consumo` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(50) default NULL,
  `tipo_http` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table banco.metodos_consumo: 3 rows
DELETE FROM `metodos_consumo`;
/*!40000 ALTER TABLE `metodos_consumo` DISABLE KEYS */;
INSERT INTO `metodos_consumo` (`id`, `nombre`, `tipo_http`) VALUES
	(1, 'consultar', 'GET'),
	(2, 'pagar', 'POST'),
	(3, 'compensar', 'DELETE');
/*!40000 ALTER TABLE `metodos_consumo` ENABLE KEYS */;

-- Dumping structure for table banco.proveedor_contrato
CREATE TABLE IF NOT EXISTS `proveedor_contrato` (
  `id` int(11) default NULL,
  `id_proveedor` int(11) default NULL,
  `id_metodo` int(11) default NULL,
  `contrato` varchar(10000) default NULL,
  `transformacion` varchar(10000) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table banco.proveedor_contrato: 6 rows
DELETE FROM `proveedor_contrato`;
/*!40000 ALTER TABLE `proveedor_contrato` DISABLE KEYS */;
INSERT INTO `proveedor_contrato` (`id`, `id_proveedor`, `id_metodo`, `contrato`, `transformacion`) VALUES
	(1, 567, 1, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" >\r\n<soapenv:Header/>\r\n<soapenv:Body>\r\n<sch:ReferenciaFactura>\r\n<sch:referenciaFactura>?</sch:referenciaFactura>\r\n</sch:ReferenciaFactura>\r\n</soapenv:Body>\r\n</soapenv:Envelope>', '<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"<xsl:template match="/"><html><body><h1>Factura</h1><table width="100%" border="1"><tr><th>Numero de Factura</th><th>Valor de la Factura</th></tr><xsl:for-each select="ns1:Resultado/ns1:Resultado"><tr><td><xsl:value-of select="ns1:referenciaFactura"/></td><td><xsl:value-of select="ns1:mensaje"/></td></tr></xsl:for-each></table></body></html></xsl:template></xsl:stylesheet>'),
	(2, 567, 2, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"> <soapenv:Header/><soapenv:Body><sch:Pago><sch:referenciaFactura><sch:referenciaFactura>?</sch:referenciaFactura></sch:referenciaFactura><sch:totalPagar>?</sch:totalPagar></sch:Pago></soapenv:Body></soapenv:Envelope>', '<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"<xsl:template match="/"><html><body><h1>Factura</h1><table width="100%" border="1"><tr><th>Numero de Factura</th><th>Valor de la Factura</th></tr><xsl:for-each select="ns1:Resultado/ns1:Resultado"><tr><td><xsl:value-of select="ns1:referenciaFactura"/></td><td><xsl:value-of select="ns1:mensaje"/></td></tr></xsl:for-each></table></body></html></xsl:template></xsl:stylesheet>'),
	(3, 567, 3, ' <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><sch:Pago><sch:referenciaFactura><sch:referenciaFactura>?</sch:referenciaFactura></sch:referenciaFactura><sch:totalPagar>?</sch:totalPagar></sch:Pago></soapenv:Body></soapenv:Envelope>', '<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"<xsl:template match="/"><html><body><h1>Factura</h1><table width="100%" border="1"><tr><th>Numero de Factura</th><th>Valor de la Factura</th></tr><xsl:for-each select="ns1:Resultado/ns1:Resultado"><tr><td><xsl:value-of select="ns1:referenciaFactura"/></td><td><xsl:value-of select="ns1:mensaje"/></td></tr></xsl:for-each></table></body></html></xsl:template></xsl:stylesheet>'),
	(4, 123, 1, NULL, '<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"<xsl:template match="/"><html><body><h1>Factura</h1><table width="100%" border="1"><tr><th>Numero de Factura</th><th>Valor de la Factura</th>        </tr><xsl:for-each select="ns1:factura/ns1:factura"><tr><td><xsl:value-of select="ns1:idFactura"/></td><td><xsl:value-of select="ns1:valorFactura"/></td></tr></xsl:for-each></table></body></html></xsl:template></xsl:stylesheet>'),
	(5, 123, 2, '(NULL)', '<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"<xsl:template match="/"><html><body><h1>Factura</h1><table width="100%" border="1"><tr><th>Numero de Factura</th><th>Valor de la Factura</th>        </tr><xsl:for-each select="ns1:factura/ns1:factura"><tr><td><xsl:value-of select="ns1:idFactura"/></td><td><xsl:value-of select="ns1:valorFactura"/></td></tr></xsl:for-each></table></body></html></xsl:template></xsl:stylesheet>'),
	(6, 123, 3, NULL, '<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"<xsl:template match="/"><html><body><h1>Factura</h1><table width="100%" border="1"><tr><th>Numero de Factura</th><th>Valor de la Factura</th>        </tr><xsl:for-each select="ns1:factura/ns1:factura"><tr><td><xsl:value-of select="ns1:idFactura"/></td><td><xsl:value-of select="ns1:valorFactura"/></td></tr></xsl:for-each></table></body></html></xsl:template></xsl:stylesheet>');
/*!40000 ALTER TABLE `proveedor_contrato` ENABLE KEYS */;

-- Dumping structure for table banco.proveedor_servicio
CREATE TABLE IF NOT EXISTS `proveedor_servicio` (
  `id` int(11) default NULL,
  `nombre` varchar(255) default NULL,
  `host` varchar(255) default NULL,
  `tipo_servicio` varchar(255) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table banco.proveedor_servicio: 2 rows
DELETE FROM `proveedor_servicio`;
/*!40000 ALTER TABLE `proveedor_servicio` DISABLE KEYS */;
INSERT INTO `proveedor_servicio` (`id`, `nombre`, `host`, `tipo_servicio`) VALUES
	(123, 'ETB', 'http://192.168.1.6:9090/servicios/pagos/v1/payments/', 'REST'),
	(567, 'ACUEDUCTO', 'http://192.168.1.6:7070/w1-soap-svr/PagosServiceService?wsdl', 'SOAP');
/*!40000 ALTER TABLE `proveedor_servicio` ENABLE KEYS */;

-- Dumping structure for table banco.tipo_id
CREATE TABLE IF NOT EXISTS `tipo_id` (
  `TIPID` char(2) default NULL,
  `DESCRIPCION` char(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table banco.tipo_id: 2 rows
DELETE FROM `tipo_id`;
/*!40000 ALTER TABLE `tipo_id` DISABLE KEYS */;
INSERT INTO `tipo_id` (`TIPID`, `DESCRIPCION`) VALUES
	('CC', 'CEDULA'),
	('TI', 'TARJETA IDENTIDAD');
/*!40000 ALTER TABLE `tipo_id` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
