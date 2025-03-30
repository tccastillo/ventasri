

CREATE TABLE `abono` (
  `idabono` int(11) NOT NULL AUTO_INCREMENT,
  `idcredito` int(11) NOT NULL,
  `fecha_abono` datetime NOT NULL,
  `monto_abono` decimal(8,2) NOT NULL,
  `total_abonado` decimal(8,2) DEFAULT '0.00',
  `restante_credito` decimal(8,2) NOT NULL DEFAULT '0.00',
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idabono`),
  KEY `fk_abono_credito1_idx` (`idcredito`),
  KEY `fk_abono_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_abono_credito1` FOREIGN KEY (`idcredito`) REFERENCES `credito` (`idcredito`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_abono_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






CREATE TABLE `apartado` (
  `idapartado` int(11) NOT NULL AUTO_INCREMENT,
  `numero_apartado` varchar(175) DEFAULT NULL,
  `fecha_apartado` datetime NOT NULL,
  `fecha_limite_retiro` datetime NOT NULL,
  `sumas` decimal(8,2) NOT NULL,
  `iva` decimal(8,2) NOT NULL,
  `exento` decimal(8,2) NOT NULL,
  `retenido` decimal(8,2) NOT NULL,
  `descuento` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `abonado_apartado` decimal(8,2) NOT NULL DEFAULT '0.00',
  `restante_pagar` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sonletras` varchar(150) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `idcliente` int(11) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idapartado`),
  UNIQUE KEY `numero_venta_UNIQUE` (`numero_apartado`),
  KEY `fk_venta_cliente1_idx` (`idcliente`),
  KEY `fk_venta_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_venta_cliente0` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_usuario0` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






CREATE TABLE `caja` (
  `idcaja` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_apertura` datetime NOT NULL,
  `monto_apertura` decimal(8,2) NOT NULL,
  `monto_cierre` decimal(8,2) DEFAULT '0.00',
  `fecha_cierre` datetime DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcaja`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

INSERT INTO caja VALUES("39","2022-11-19 21:59:08","100.00","0.00","","1");
INSERT INTO caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1");
INSERT INTO caja VALUES("41","2022-11-21 17:28:35","1.00","0.00","","1");
INSERT INTO caja VALUES("42","2022-11-22 12:08:09","100.00","0.00","","1");
INSERT INTO caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1");
INSERT INTO caja VALUES("44","2022-11-25 10:10:00","1.00","0.00","","1");





CREATE TABLE `caja_movimiento` (
  `idcaja` int(11) NOT NULL,
  `tipo_movimiento` tinyint(1) NOT NULL DEFAULT '0',
  `monto_movimiento` decimal(8,2) NOT NULL,
  `descripcion_movimiento` varchar(80) DEFAULT NULL,
  `fecha_movimiento` date NOT NULL,
  KEY `fk_caja_movimiento_caja1_idx` (`idcaja`),
  CONSTRAINT `fk_caja_movimiento_caja` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`idcaja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO caja_movimiento VALUES("39","1","25.00","POR VENTA FACTURA # 8","2022-11-19");
INSERT INTO caja_movimiento VALUES("39","1","25.00","POR VENTA FACTURA # 9","2022-11-19");
INSERT INTO caja_movimiento VALUES("40","1","25.00","POR VENTA FACTURA # 10","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","25.00","POR VENTA FACTURA # 11","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","25.00","POR VENTA FACTURA # 12","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","25.00","POR VENTA FACTURA # 13","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","25.00","POR VENTA FACTURA # 14","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","25.00","POR VENTA FACTURA # 15","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","25.00","POR VENTA FACTURA # 16","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","25.00","POR VENTA FACTURA # 17","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","25.00","POR VENTA FACTURA # 18","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","1.00","POR VENTA FACTURA # 19","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","1.00","POR VENTA FACTURA # 20","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","1.00","POR VENTA FACTURA # 21","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","1.00","POR VENTA FACTURA # 22","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","1.00","POR VENTA FACTURA # 23","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","1.00","POR VENTA FACTURA # 24","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","1.00","POR VENTA FACTURA # 25","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","1.00","POR VENTA FACTURA # 26","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","1.00","POR VENTA FACTURA # 27","2022-11-20");
INSERT INTO caja_movimiento VALUES("40","1","1.00","POR VENTA FACTURA # 28","2022-11-20");
INSERT INTO caja_movimiento VALUES("41","1","1.00","POR VENTA TICKET # 77","2022-11-21");
INSERT INTO caja_movimiento VALUES("41","1","61.00","POR VENTA TICKET # 78","2022-11-21");
INSERT INTO caja_movimiento VALUES("42","1","1.00","POR VENTA FACTURA # 29","2022-11-22");
INSERT INTO caja_movimiento VALUES("42","1","1.00","POR VENTA FACTURA # 30","2022-11-22");
INSERT INTO caja_movimiento VALUES("42","1","1.00","POR VENTA FACTURA # 31","2022-11-22");
INSERT INTO caja_movimiento VALUES("43","1","1.00","POR VENTA FACTURA # 32","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","55.00","POR VENTA FACTURA # 33","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","55.00","POR VENTA FACTURA # 34","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","80.00","POR VENTA FACTURA # 35","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","80.00","POR VENTA FACTURA # 36","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","25.00","POR VENTA FACTURA # 37","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","25.00","POR VENTA TICKET # 79","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","80.00","POR VENTA FACTURA # 38","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","56.00","POR VENTA FACTURA # 39","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","56.00","POR VENTA FACTURA # 40","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","25.00","POR VENTA FACTURA # 41","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","25.00","POR VENTA FACTURA # 42","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","25.00","POR VENTA FACTURA # 43","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","25.00","POR VENTA FACTURA # 44","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","25.00","POR VENTA FACTURA # 45","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","25.00","POR VENTA FACTURA # 46","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","25.00","POR VENTA FACTURA # 47","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","56.00","POR VENTA FACTURA # 48","2022-11-24");
INSERT INTO caja_movimiento VALUES("43","1","25.00","POR VENTA FACTURA # 49","2022-11-24");
INSERT INTO caja_movimiento VALUES("44","1","34.00","POR VENTA FACTURA # 50","2022-11-25");
INSERT INTO caja_movimiento VALUES("44","1","34.00","POR VENTA FACTURA # 51","2022-11-25");
INSERT INTO caja_movimiento VALUES("44","1","12.00","POR VENTA FACTURA # 52","2022-11-25");





CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(120) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO categoria VALUES("1","FERRETERIA","1");





CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_cliente` varchar(175) DEFAULT NULL,
  `nombre_cliente` varchar(150) NOT NULL,
  `numero_nit` varchar(14) DEFAULT NULL,
  `direccion_cliente` varchar(100) DEFAULT NULL,
  `numero_telefono` varchar(8) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `giro` varchar(80) DEFAULT NULL,
  `limite_credito` decimal(8,2) NOT NULL DEFAULT '0.00',
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `codigo_cliente_UNIQUE` (`codigo_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO cliente VALUES("1","CL00000001","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","54620710","internetvalleverde@outlook.com","","400.00","1");
INSERT INTO cliente VALUES("2","CL00000002","GINA ALEXANDRA ALVAREZ MEZA","1205546664","","09374839","gaam_ginaeacha87@hotmail.com","","0.00","1");
INSERT INTO cliente VALUES("3","CL00000003","CONSUMIDOR FINAL","9999999999999","","0000","","","1400.00","1");





CREATE TABLE `compra` (
  `idcompra` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_compra` datetime NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `tipo_pago` varchar(75) NOT NULL,
  `numero_comprobante` varchar(60) NOT NULL,
  `tipo_comprobante` varchar(60) NOT NULL,
  `fecha_comprobante` date DEFAULT NULL,
  `sumas` decimal(8,2) NOT NULL,
  `iva` decimal(8,2) NOT NULL,
  `exento` decimal(8,2) NOT NULL,
  `retenido` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `sonletras` varchar(150) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcompra`),
  KEY `fk_compra_proveedor1_idx` (`idproveedor`),
  CONSTRAINT `fk_compra_proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO compra VALUES("1","2022-11-20 18:18:28","1","1","1235","2","2022-11-20","200.00","24.00","0.00","0.00","224.00","DOSCIENTOS VEINTICUATRO 00/100 USD","1");





CREATE TABLE `comprobante` (
  `idcomprobante` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_comprobante` varchar(75) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcomprobante`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO comprobante VALUES("1","TICKET","1");
INSERT INTO comprobante VALUES("2","FACTURA","1");
INSERT INTO comprobante VALUES("3","BOLETA","1");





CREATE TABLE `cotizacion` (
  `idcotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `numero_cotizacion` varchar(175) DEFAULT NULL,
  `fecha_cotizacion` datetime NOT NULL,
  `a_nombre` varchar(175) DEFAULT NULL,
  `tipo_pago` varchar(60) NOT NULL,
  `entrega` varchar(60) NOT NULL,
  `sumas` decimal(8,2) NOT NULL,
  `iva` decimal(8,2) NOT NULL,
  `exento` decimal(8,2) NOT NULL,
  `retenido` decimal(8,2) NOT NULL,
  `descuento` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `sonletras` varchar(150) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  PRIMARY KEY (`idcotizacion`),
  KEY `fk_cotizacion_usuario1_idx` (`idusuario`),
  KEY `fk_cotizacion_cliente1_idx` (`idcliente`),
  CONSTRAINT `fk_cotizacion_cliente1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_cotizacion_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO cotizacion VALUES("1","COTI00000001","2022-11-20 18:16:29","CONSUMIDOR FINAL","AL CONTADO","POR PEDIDO","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","3");





CREATE TABLE `credito` (
  `idcredito` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) DEFAULT NULL,
  `codigo_credito` varchar(175) DEFAULT NULL,
  `nombre_credito` varchar(120) NOT NULL,
  `fecha_credito` datetime NOT NULL,
  `monto_credito` decimal(8,2) NOT NULL,
  `monto_abonado` decimal(8,2) NOT NULL DEFAULT '0.00',
  `monto_restante` decimal(8,2) NOT NULL DEFAULT '0.00',
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  `idcliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcredito`),
  KEY `fk_credito_venta1_idx` (`idventa`),
  KEY `fk_credito_cliente1_idx` (`idcliente`),
  CONSTRAINT `fk_credito_cliente1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_credito_venta1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






CREATE TABLE `currency` (
  `idcurrency` int(11) NOT NULL AUTO_INCREMENT,
  `CurrencyISO` varchar(3) DEFAULT NULL,
  `Language` varchar(3) DEFAULT NULL,
  `CurrencyName` varchar(35) DEFAULT NULL,
  `Money` varchar(30) DEFAULT NULL,
  `Symbol` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`idcurrency`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO currency VALUES("1","CRC","ES","Colon Costa Ricense","Colón","?");
INSERT INTO currency VALUES("2","HNL","ES","Lempira Hondureno","Lempira","L");
INSERT INTO currency VALUES("3","GTQ","ES","Quetzal","Quetzal","Q");
INSERT INTO currency VALUES("4","SVC","ES","Colon Salvadoreno","Colón","?");
INSERT INTO currency VALUES("5","NIC","ES","Cordoba Nicaraguense","Córdoba","C");
INSERT INTO currency VALUES("6","USD","EN","Dolar Estadounidense","US.Dolar","$");
INSERT INTO currency VALUES("7","PEN","ES","Sol Peruano","SOLES","S/");
INSERT INTO currency VALUES("8","CL","ES","Peso chileno","PESOS","$");





CREATE TABLE `detalleapartado` (
  `idapartado` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(8,2) NOT NULL,
  `precio_unitario` decimal(8,2) NOT NULL,
  `fecha_vence` date DEFAULT NULL,
  `exento` decimal(8,2) NOT NULL,
  `descuento` decimal(8,2) NOT NULL,
  `importe` decimal(8,2) NOT NULL,
  KEY `fk_detalleventa_producto1_idx` (`idproducto`),
  KEY `fk_detalleapartado_apartado1_idx` (`idapartado`),
  CONSTRAINT `fk_detalleapartado_apartado1` FOREIGN KEY (`idapartado`) REFERENCES `apartado` (`idapartado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detalleventa_producto0` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






CREATE TABLE `detallecompra` (
  `idcompra` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `fecha_vence` date DEFAULT NULL,
  `cantidad` decimal(8,2) NOT NULL,
  `precio_unitario` decimal(8,4) NOT NULL,
  `exento` decimal(8,2) NOT NULL,
  `importe` decimal(8,2) NOT NULL,
  KEY `fk_detallecompra_producto1_idx` (`idproducto`),
  KEY `fk_detallecompra_compra1_idx` (`idcompra`),
  CONSTRAINT `fk_detallecompra_compra` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_detallecompra_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO detallecompra VALUES("1","8","","200.00","1.0000","0.00","200.00");





CREATE TABLE `detallecotizacion` (
  `idcotizacion` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(8,2) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `precio_unitario` decimal(8,2) NOT NULL,
  `exento` decimal(8,2) NOT NULL,
  `descuento` decimal(8,2) NOT NULL,
  `importe` decimal(8,2) NOT NULL,
  KEY `fk_detallecotizacion_producto1_idx` (`idproducto`),
  KEY `fk_detallecotizacion_cotizacion1_idx` (`idcotizacion`),
  CONSTRAINT `fk_detallecotizacion_cotizacion1` FOREIGN KEY (`idcotizacion`) REFERENCES `cotizacion` (`idcotizacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detallecotizacion_producto1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO detallecotizacion VALUES("1","8","1.00","1","1.00","0.00","0.00","1.00");





CREATE TABLE `detalleventa` (
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(8,2) NOT NULL,
  `precio_unitario` decimal(8,2) NOT NULL,
  `fecha_vence` date DEFAULT NULL,
  `exento` decimal(8,2) NOT NULL,
  `descuento` decimal(8,2) NOT NULL,
  `importe` decimal(8,2) NOT NULL,
  KEY `fk_detalleventa_venta1_idx` (`idventa`),
  KEY `fk_detalleventa_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_detalleventa_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_detalleventa_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO detalleventa VALUES("97","6","1.00","25.00","","0.00","0.00","25.00");
INSERT INTO detalleventa VALUES("98","6","1.00","25.00","","0.00","0.00","25.00");
INSERT INTO detalleventa VALUES("99","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("100","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("101","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("102","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("103","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("104","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("105","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("106","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("107","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("108","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("109","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("110","7","2.00","30.00","","0.00","0.00","60.00");
INSERT INTO detalleventa VALUES("110","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("111","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("112","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("113","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("114","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("115","6","1.00","25.00","","0.00","0.00","25.00");
INSERT INTO detalleventa VALUES("115","7","1.00","30.00","","0.00","0.00","30.00");
INSERT INTO detalleventa VALUES("116","6","1.00","25.00","","0.00","0.00","25.00");
INSERT INTO detalleventa VALUES("116","7","1.00","30.00","","0.00","0.00","30.00");
INSERT INTO detalleventa VALUES("117","6","1.00","25.00","","0.00","0.00","25.00");
INSERT INTO detalleventa VALUES("117","7","1.00","30.00","","0.00","0.00","30.00");
INSERT INTO detalleventa VALUES("117","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("118","6","1.00","25.00","","0.00","0.00","25.00");
INSERT INTO detalleventa VALUES("118","7","1.00","30.00","","0.00","0.00","30.00");
INSERT INTO detalleventa VALUES("118","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("119","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("120","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("121","9","2.00","25.00","","50.00","0.00","50.00");
INSERT INTO detalleventa VALUES("121","7","1.00","30.00","","0.00","0.00","30.00");
INSERT INTO detalleventa VALUES("122","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("122","7","1.00","30.00","","0.00","0.00","30.00");
INSERT INTO detalleventa VALUES("122","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("123","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("123","7","1.00","30.00","","0.00","0.00","30.00");
INSERT INTO detalleventa VALUES("123","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("124","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("125","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("126","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("127","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("128","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("129","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("130","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("131","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("131","7","1.00","30.00","","0.00","0.00","30.00");
INSERT INTO detalleventa VALUES("131","8","1.00","1.00","","0.00","0.00","1.00");
INSERT INTO detalleventa VALUES("132","9","1.00","25.00","","25.00","0.00","25.00");
INSERT INTO detalleventa VALUES("133","11","1.00","22.00","","22.00","0.00","22.00");
INSERT INTO detalleventa VALUES("133","10","1.00","12.00","","0.00","0.00","12.00");
INSERT INTO detalleventa VALUES("134","11","1.00","22.00","","22.00","0.00","22.00");
INSERT INTO detalleventa VALUES("134","10","1.00","12.00","","0.00","0.00","12.00");
INSERT INTO detalleventa VALUES("135","10","1.00","12.00","","0.00","0.00","12.00");





CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_empleado` varchar(175) DEFAULT NULL,
  `nombre_empleado` varchar(90) NOT NULL,
  `apellido_empleado` varchar(90) NOT NULL,
  `telefono_empleado` varchar(8) NOT NULL,
  `email_empleado` varchar(80) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idempleado`),
  UNIQUE KEY `codigo_empleado_UNIQUE` (`codigo_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO empleado VALUES("1","EM00000001","DOUGLAS URIEL","XIA MOX","41315458","urielx2@gmail.com","1");





CREATE TABLE `entrada` (
  `identrada` int(11) NOT NULL AUTO_INCREMENT,
  `mes_inventario` varchar(7) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `descripcion_entrada` varchar(150) NOT NULL,
  `cantidad_entrada` decimal(8,2) NOT NULL,
  `precio_unitario_entrada` decimal(8,2) NOT NULL,
  `costo_total_entrada` decimal(8,2) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idcompra` int(11) DEFAULT NULL,
  `idapartado` int(11) DEFAULT NULL,
  PRIMARY KEY (`identrada`),
  KEY `fk_entrada_producto1_idx` (`idproducto`),
  KEY `fk_entrada_compra1_idx` (`idcompra`),
  KEY `fk_entrada_apartado1_idx` (`idapartado`),
  CONSTRAINT `fk_entrada_apartado1` FOREIGN KEY (`idapartado`) REFERENCES `apartado` (`idapartado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entrada_compra` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entrada_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO entrada VALUES("1","2022-11","2022-11-20","INVENTARIO INICIAL","100.00","1.00","100.00","8","","");
INSERT INTO entrada VALUES("2","2022-11","2022-11-20","POR COMPRA FACTURA # 1235","200.00","1.00","200.00","8","1","");
INSERT INTO entrada VALUES("3","2022-11","2022-11-24","INVENTARIO INICIAL","100.00","20.00","2000.00","9","","");
INSERT INTO entrada VALUES("4","2022-11","2022-11-25","INVENTARIO INICIAL","100.00","10.00","1000.00","10","","");
INSERT INTO entrada VALUES("5","2022-11","2022-11-25","INVENTARIO INICIAL","100.00","20.00","2000.00","11","","");





CREATE TABLE `facturacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fac_ele` int(11) NOT NULL DEFAULT '1',
  `certificado` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `entidad_cert` varchar(50) NOT NULL DEFAULT 'SEC_DATA',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO facturacion VALUES("1","1","1311218786001.p12","MINDIOLA8888","SEC_DATA");





CREATE TABLE `inventario` (
  `mes_inventario` varchar(7) DEFAULT NULL,
  `fecha_apertura` date NOT NULL,
  `fecha_cierre` date NOT NULL,
  `saldo_inicial` decimal(8,2) NOT NULL,
  `entradas` decimal(8,2) DEFAULT NULL,
  `salidas` decimal(8,2) DEFAULT NULL,
  `saldo_final` decimal(8,2) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `idproducto` int(11) NOT NULL,
  KEY `fk_inventario_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_inventario_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO inventario VALUES("2022-11","2022-11-01","2022-11-30","295.00","0.00","15.00","280.00","1","6");
INSERT INTO inventario VALUES("2022-11","2022-11-01","2022-11-30","298.00","0.00","10.00","288.00","1","7");
INSERT INTO inventario VALUES("2022-11","2022-11-01","2022-11-30","100.00","300.00","19.00","281.00","1","8");
INSERT INTO inventario VALUES("2022-11","2022-11-01","2022-11-30","100.00","100.00","17.00","83.00","1","9");
INSERT INTO inventario VALUES("2022-11","2022-11-01","2022-11-30","100.00","100.00","3.00","97.00","1","10");
INSERT INTO inventario VALUES("2022-11","2022-11-01","2022-11-30","100.00","100.00","2.00","98.00","1","11");





CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(120) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO marca VALUES("1","ACEROS AREQUIPA","1");





CREATE TABLE `ordentaller` (
  `idorden` int(11) NOT NULL AUTO_INCREMENT,
  `numero_orden` varchar(175) DEFAULT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `idcliente` int(11) NOT NULL,
  `aparato` varchar(125) NOT NULL,
  `modelo` varchar(125) DEFAULT NULL,
  `idmarca` int(11) NOT NULL,
  `serie` varchar(125) DEFAULT NULL,
  `idtecnico` int(11) NOT NULL,
  `averia` varchar(200) NOT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `deposito_revision` decimal(8,2) NOT NULL DEFAULT '0.00',
  `deposito_reparacion` decimal(8,2) DEFAULT '0.00',
  `diagnostico` varchar(200) NOT NULL,
  `estado_aparato` varchar(200) NOT NULL,
  `repuestos` decimal(8,2) NOT NULL DEFAULT '0.00',
  `mano_obra` decimal(8,2) DEFAULT '0.00',
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_retiro` datetime DEFAULT NULL,
  `ubicacion` varchar(150) DEFAULT NULL,
  `parcial_pagar` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`idorden`),
  KEY `fk_ordentaller_cliente1_idx` (`idcliente`),
  KEY `fk_ordentaller_marca1_idx` (`idmarca`),
  KEY `fk_ordentaller_tecnico1_idx` (`idtecnico`),
  CONSTRAINT `fk_ordentaller_cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_ordentaller_marca` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_ordentaller_tecnico` FOREIGN KEY (`idtecnico`) REFERENCES `tecnico` (`idtecnico`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






CREATE TABLE `parametro` (
  `idparametro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(150) NOT NULL,
  `propietario` varchar(150) NOT NULL,
  `numero_nit` varchar(14) NOT NULL,
  `porcentaje_iva` decimal(8,2) NOT NULL,
  `porcentaje_retencion` decimal(8,2) DEFAULT NULL,
  `monto_retencion` decimal(8,2) DEFAULT NULL,
  `direccion_empresa` varchar(200) NOT NULL,
  `logo_empresa` varchar(90) DEFAULT NULL,
  `idcurrency` int(11) NOT NULL,
  PRIMARY KEY (`idparametro`),
  KEY `fk_parametro_currency1_idx` (`idcurrency`),
  CONSTRAINT `fk_parametro_currency1` FOREIGN KEY (`idcurrency`) REFERENCES `currency` (`idcurrency`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO parametro VALUES("1","FERRETERIA","CLARA INES MINDIOLA ENDERICA","1311218786001","12.00","0.00","0.00","CALLE MOCACHE SN Y TWINZA","","6");





CREATE TABLE `perecedero` (
  `fecha_vencimiento` date NOT NULL,
  `cantidad_perecedero` decimal(8,2) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  KEY `fk_perecedero_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_perecedero_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






CREATE TABLE `presentacion` (
  `idpresentacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_presentacion` varchar(120) NOT NULL,
  `siglas` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO presentacion VALUES("1","UNIDAD","UND","1");





CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_interno` varchar(175) DEFAULT NULL,
  `codigo_barra` varchar(200) DEFAULT NULL,
  `nombre_producto` varchar(175) NOT NULL,
  `precio_compra` decimal(8,2) NOT NULL,
  `precio_venta` decimal(8,2) NOT NULL,
  `precio_venta_mayoreo` decimal(8,2) NOT NULL,
  `stock` decimal(8,2) NOT NULL DEFAULT '0.00',
  `stock_min` decimal(8,2) NOT NULL DEFAULT '1.00',
  `idcategoria` int(11) NOT NULL,
  `idmarca` int(11) DEFAULT NULL,
  `idpresentacion` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `exento` tinyint(1) NOT NULL DEFAULT '0',
  `inventariable` tinyint(1) NOT NULL DEFAULT '1',
  `perecedero` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idproducto`),
  UNIQUE KEY `codigo_interno_UNIQUE` (`codigo_interno`),
  KEY `fk_producto_categoria_idx` (`idcategoria`),
  KEY `fk_producto_presentacion1_idx` (`idpresentacion`),
  KEY `fk_producto_marca1_idx` (`idmarca`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_producto_marca` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_producto_presentacion` FOREIGN KEY (`idpresentacion`) REFERENCES `presentacion` (`idpresentacion`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

INSERT INTO producto VALUES("6","PR00000006","000000004","CEMENTO ANDINO","20.00","25.00","24.00","280.00","30.00","1","1","1","1","0","1","0");
INSERT INTO producto VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","25.00","30.00","29.00","288.00","10.00","1","1","1","1","0","1","0");
INSERT INTO producto VALUES("8","PR00000008","","PRODUCTO PRODUCCION","1.00","1.00","1.00","281.00","5.00","1","1","1","1","0","1","0");
INSERT INTO producto VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","20.00","25.00","25.00","83.00","2.00","1","1","1","1","1","1","0");
INSERT INTO producto VALUES("10","PR00000010","","PROCAN PRUEBA","10.00","12.00","11.00","97.00","5.00","1","1","1","1","0","1","0");
INSERT INTO producto VALUES("11","PR00000011","","COMPLEJO B","15.00","22.00","21.00","98.00","5.00","1","1","1","1","1","1","1");





CREATE TABLE `producto_proveedor` (
  `idproveedor` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  KEY `fk_producto_proveedor_proveedor1_idx` (`idproveedor`),
  KEY `fk_producto_proveedor_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_producto_proveedor_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_proveedor_proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_proveedor` varchar(175) DEFAULT NULL,
  `nombre_proveedor` varchar(175) NOT NULL,
  `numero_telefono` varchar(8) NOT NULL,
  `numero_nit` varchar(14) NOT NULL,
  `nombre_contacto` varchar(150) DEFAULT NULL,
  `telefono_contacto` varchar(150) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idproveedor`),
  UNIQUE KEY `nombre_proveedor_UNIQUE` (`nombre_proveedor`),
  UNIQUE KEY `codigo_proveedor_UNIQUE` (`codigo_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO proveedor VALUES("1","PROV00000001","LA ESTRELLA","12345678","80900909","PEDRO ALVAREZ","","1");





CREATE TABLE `proveedor_precio` (
  `idproveedor` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `fecha_precio` date NOT NULL,
  `precio_compra` decimal(8,4) NOT NULL,
  KEY `fk_proveedor_precio_proveedor1_idx` (`idproveedor`),
  KEY `fk_proveedor_precio_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_proveedor_precio_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_proveedor_precio_proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO proveedor_precio VALUES("1","8","2022-11-20","1.0000");





CREATE TABLE `salida` (
  `idsalida` int(11) NOT NULL AUTO_INCREMENT,
  `mes_inventario` varchar(7) NOT NULL,
  `fecha_salida` date NOT NULL,
  `descripcion_salida` varchar(150) NOT NULL,
  `cantidad_salida` decimal(8,2) NOT NULL,
  `precio_unitario_salida` decimal(8,2) NOT NULL,
  `costo_total_salida` decimal(8,2) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idventa` int(11) DEFAULT NULL,
  `idapartado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsalida`),
  KEY `fk_entrada_producto1_idx` (`idproducto`),
  KEY `fk_salida_venta1_idx` (`idventa`),
  KEY `fk_salida_apartado1_idx` (`idapartado`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4;

INSERT INTO salida VALUES("151","2022-11","2022-11-19","POR VENTA FACTURA # 8","1.00","20.00","20.00","6","88","");
INSERT INTO salida VALUES("152","2022-11","2022-11-19","POR VENTA FACTURA # 9","1.00","20.00","20.00","6","89","");
INSERT INTO salida VALUES("153","2022-11","2022-11-20","POR VENTA FACTURA # 10","1.00","20.00","20.00","6","90","");
INSERT INTO salida VALUES("154","2022-11","2022-11-20","POR VENTA FACTURA # 11","1.00","20.00","20.00","6","91","");
INSERT INTO salida VALUES("155","2022-11","2022-11-20","POR VENTA FACTURA # 12","1.00","20.00","20.00","6","92","");
INSERT INTO salida VALUES("156","2022-11","2022-11-20","POR VENTA FACTURA # 13","1.00","20.00","20.00","6","93","");
INSERT INTO salida VALUES("157","2022-11","2022-11-20","POR VENTA FACTURA # 14","1.00","20.00","20.00","6","94","");
INSERT INTO salida VALUES("158","2022-11","2022-11-20","POR VENTA FACTURA # 15","1.00","20.00","20.00","6","95","");
INSERT INTO salida VALUES("159","2022-11","2022-11-20","POR VENTA FACTURA # 16","1.00","20.00","20.00","6","96","");
INSERT INTO salida VALUES("160","2022-11","2022-11-20","POR VENTA FACTURA # 17","1.00","20.00","20.00","6","97","");
INSERT INTO salida VALUES("161","2022-11","2022-11-20","POR VENTA FACTURA # 18","1.00","20.00","20.00","6","98","");
INSERT INTO salida VALUES("162","2022-11","2022-11-20","POR VENTA FACTURA # 19","1.00","1.00","1.00","8","99","");
INSERT INTO salida VALUES("163","2022-11","2022-11-20","POR VENTA FACTURA # 20","1.00","1.00","1.00","8","100","");
INSERT INTO salida VALUES("164","2022-11","2022-11-20","POR VENTA FACTURA # 21","1.00","1.00","1.00","8","101","");
INSERT INTO salida VALUES("165","2022-11","2022-11-20","POR VENTA FACTURA # 22","1.00","1.00","1.00","8","102","");
INSERT INTO salida VALUES("166","2022-11","2022-11-20","POR VENTA FACTURA # 23","1.00","1.00","1.00","8","103","");
INSERT INTO salida VALUES("167","2022-11","2022-11-20","POR VENTA FACTURA # 24","1.00","1.00","1.00","8","104","");
INSERT INTO salida VALUES("168","2022-11","2022-11-20","POR VENTA FACTURA # 25","1.00","1.00","1.00","8","105","");
INSERT INTO salida VALUES("169","2022-11","2022-11-20","POR VENTA FACTURA # 26","1.00","1.00","1.00","8","106","");
INSERT INTO salida VALUES("170","2022-11","2022-11-20","POR VENTA FACTURA # 27","1.00","1.00","1.00","8","107","");
INSERT INTO salida VALUES("171","2022-11","2022-11-20","POR VENTA FACTURA # 28","1.00","1.00","1.00","8","108","");
INSERT INTO salida VALUES("172","2022-11","2022-11-21","POR VENTA TICKET # 77","1.00","1.00","1.00","8","109","");
INSERT INTO salida VALUES("173","2022-11","2022-11-21","POR VENTA TICKET # 78","2.00","25.00","50.00","7","110","");
INSERT INTO salida VALUES("174","2022-11","2022-11-21","POR VENTA TICKET # 78","1.00","1.00","1.00","8","110","");
INSERT INTO salida VALUES("175","2022-11","2022-11-22","POR VENTA FACTURA # 29","1.00","1.00","1.00","8","111","");
INSERT INTO salida VALUES("176","2022-11","2022-11-22","POR VENTA FACTURA # 30","1.00","1.00","1.00","8","112","");
INSERT INTO salida VALUES("177","2022-11","2022-11-22","POR VENTA FACTURA # 31","1.00","1.00","1.00","8","113","");
INSERT INTO salida VALUES("178","2022-11","2022-11-24","POR VENTA FACTURA # 32","1.00","1.00","1.00","8","114","");
INSERT INTO salida VALUES("179","2022-11","2022-11-24","POR VENTA FACTURA # 33","1.00","20.00","20.00","6","115","");
INSERT INTO salida VALUES("180","2022-11","2022-11-24","POR VENTA FACTURA # 33","1.00","25.00","25.00","7","115","");
INSERT INTO salida VALUES("181","2022-11","2022-11-24","POR VENTA FACTURA # 34","1.00","20.00","20.00","6","116","");
INSERT INTO salida VALUES("182","2022-11","2022-11-24","POR VENTA FACTURA # 34","1.00","25.00","25.00","7","116","");
INSERT INTO salida VALUES("183","2022-11","2022-11-24","POR VENTA FACTURA # 35","1.00","20.00","20.00","6","117","");
INSERT INTO salida VALUES("184","2022-11","2022-11-24","POR VENTA FACTURA # 35","1.00","25.00","25.00","7","117","");
INSERT INTO salida VALUES("185","2022-11","2022-11-24","POR VENTA FACTURA # 35","1.00","20.00","20.00","9","117","");
INSERT INTO salida VALUES("186","2022-11","2022-11-24","POR VENTA FACTURA # 36","1.00","20.00","20.00","6","118","");
INSERT INTO salida VALUES("187","2022-11","2022-11-24","POR VENTA FACTURA # 36","1.00","25.00","25.00","7","118","");
INSERT INTO salida VALUES("188","2022-11","2022-11-24","POR VENTA FACTURA # 36","1.00","20.00","20.00","9","118","");
INSERT INTO salida VALUES("189","2022-11","2022-11-24","POR VENTA FACTURA # 37","1.00","20.00","20.00","9","119","");
INSERT INTO salida VALUES("190","2022-11","2022-11-24","POR VENTA TICKET # 79","1.00","20.00","20.00","9","120","");
INSERT INTO salida VALUES("191","2022-11","2022-11-24","POR VENTA FACTURA # 38","2.00","20.00","40.00","9","121","");
INSERT INTO salida VALUES("192","2022-11","2022-11-24","POR VENTA FACTURA # 38","1.00","25.00","25.00","7","121","");
INSERT INTO salida VALUES("193","2022-11","2022-11-24","POR VENTA FACTURA # 39","1.00","20.00","20.00","9","122","");
INSERT INTO salida VALUES("194","2022-11","2022-11-24","POR VENTA FACTURA # 39","1.00","25.00","25.00","7","122","");
INSERT INTO salida VALUES("195","2022-11","2022-11-24","POR VENTA FACTURA # 39","1.00","1.00","1.00","8","122","");
INSERT INTO salida VALUES("196","2022-11","2022-11-24","POR VENTA FACTURA # 40","1.00","20.00","20.00","9","123","");
INSERT INTO salida VALUES("197","2022-11","2022-11-24","POR VENTA FACTURA # 40","1.00","25.00","25.00","7","123","");
INSERT INTO salida VALUES("198","2022-11","2022-11-24","POR VENTA FACTURA # 40","1.00","1.00","1.00","8","123","");
INSERT INTO salida VALUES("199","2022-11","2022-11-24","POR VENTA FACTURA # 41","1.00","20.00","20.00","9","124","");
INSERT INTO salida VALUES("200","2022-11","2022-11-24","POR VENTA FACTURA # 42","1.00","20.00","20.00","9","125","");
INSERT INTO salida VALUES("201","2022-11","2022-11-24","POR VENTA FACTURA # 43","1.00","20.00","20.00","9","126","");
INSERT INTO salida VALUES("202","2022-11","2022-11-24","POR VENTA FACTURA # 44","1.00","20.00","20.00","9","127","");
INSERT INTO salida VALUES("203","2022-11","2022-11-24","POR VENTA FACTURA # 45","1.00","20.00","20.00","9","128","");
INSERT INTO salida VALUES("204","2022-11","2022-11-24","POR VENTA FACTURA # 46","1.00","20.00","20.00","9","129","");
INSERT INTO salida VALUES("205","2022-11","2022-11-24","POR VENTA FACTURA # 47","1.00","20.00","20.00","9","130","");
INSERT INTO salida VALUES("206","2022-11","2022-11-24","POR VENTA FACTURA # 48","1.00","20.00","20.00","9","131","");
INSERT INTO salida VALUES("207","2022-11","2022-11-24","POR VENTA FACTURA # 48","1.00","25.00","25.00","7","131","");
INSERT INTO salida VALUES("208","2022-11","2022-11-24","POR VENTA FACTURA # 48","1.00","1.00","1.00","8","131","");
INSERT INTO salida VALUES("209","2022-11","2022-11-24","POR VENTA FACTURA # 49","1.00","20.00","20.00","9","132","");
INSERT INTO salida VALUES("210","2022-11","2022-11-25","POR VENTA FACTURA # 50","1.00","20.00","20.00","11","133","");
INSERT INTO salida VALUES("211","2022-11","2022-11-25","POR VENTA FACTURA # 50","1.00","10.00","10.00","10","133","");
INSERT INTO salida VALUES("212","2022-11","2022-11-25","POR VENTA FACTURA # 51","1.00","20.00","20.00","11","134","");
INSERT INTO salida VALUES("213","2022-11","2022-11-25","POR VENTA FACTURA # 51","1.00","10.00","10.00","10","134","");
INSERT INTO salida VALUES("214","2022-11","2022-11-25","POR VENTA FACTURA # 52","1.00","10.00","10.00","10","135","");





CREATE TABLE `tecnico` (
  `idtecnico` int(11) NOT NULL AUTO_INCREMENT,
  `tecnico` varchar(150) NOT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO tecnico VALUES("1","DOUGLAS XIA","52524849","1");





CREATE TABLE `tiraje_comprobante` (
  `idtiraje` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_resolucion` date NOT NULL,
  `numero_resolucion` varchar(100) DEFAULT NULL,
  `numero_resolucion_fact` varchar(100) DEFAULT NULL,
  `serie` varchar(175) NOT NULL,
  `desde` int(11) NOT NULL,
  `hasta` int(11) NOT NULL,
  `idcomprobante` int(11) NOT NULL,
  `disponibles` int(11) NOT NULL,
  PRIMARY KEY (`idtiraje`),
  KEY `fk_tiraje_comprobante_comprobante1_idx` (`idcomprobante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO tiraje_comprobante VALUES("1","2022-10-31","RES 008458148","2022-1-199999","A","1","5000","1","4921");
INSERT INTO tiraje_comprobante VALUES("2","2022-11-15","DOS","RYMPE","15UN000000001 1615UN0000001","100000","2000000","2","1999948");





CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(8) NOT NULL,
  `contrasena` varchar(12) NOT NULL,
  `tipo_usuario` tinyint(1) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `idempleado` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_empleado1_idx` (`idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO usuario VALUES("1","admin","admin","1","1","1");





CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `numero_venta` varchar(175) DEFAULT NULL,
  `fecha_venta` datetime NOT NULL,
  `tipo_pago` varchar(75) NOT NULL,
  `numero_comprobante` int(11) NOT NULL,
  `tipo_comprobante` tinyint(1) NOT NULL,
  `sumas` decimal(8,2) NOT NULL,
  `iva` decimal(8,2) NOT NULL,
  `exento` decimal(8,2) NOT NULL,
  `retenido` decimal(8,2) NOT NULL,
  `descuento` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `sonletras` varchar(150) NOT NULL,
  `pago_efectivo` decimal(8,2) NOT NULL DEFAULT '0.00',
  `pago_tarjeta` decimal(8,2) NOT NULL DEFAULT '0.00',
  `numero_tarjeta` varchar(16) DEFAULT NULL,
  `tarjeta_habiente` varchar(90) DEFAULT NULL,
  `cambio` decimal(8,2) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `idcliente` int(11) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `aceptado` varchar(50) NOT NULL DEFAULT 'NO ENVIADO',
  `claveacceso` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  UNIQUE KEY `numero_venta_UNIQUE` (`numero_venta`),
  KEY `fk_venta_cliente1_idx` (`idcliente`),
  KEY `fk_venta_usuario1_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4;

INSERT INTO venta VALUES("97","V00000001","2022-11-20 15:21:43","EFECTIVO","17","2","22.32","2.68","0.00","0.00","0.00","25.00","Veinticinco 00/100 USD","100.00","0.00","","","75.00","1","1","1","NO AUTORIZADO","2011202201131121878600110010010000000171234567814");
INSERT INTO venta VALUES("98","V00000098","2022-11-20 15:25:04","EFECTIVO","18","2","22.32","2.68","0.00","0.00","0.00","25.00","Veinticinco 00/100 USD","100.00","0.00","","","75.00","1","1","1","AUTORIZADO","2011202201131121878600110010010000000181234567811");
INSERT INTO venta VALUES("99","V00000099","2022-11-20 15:46:43","EFECTIVO","19","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","10.00","0.00","","","9.00","1","1","1","NO AUTORIZADO","2011202201131121878600120010010000000191234567813");
INSERT INTO venta VALUES("100","V000000100","2022-11-20 15:58:09","EFECTIVO","20","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","10.00","0.00","","","9.00","1","1","1","NO ENVIADO","");
INSERT INTO venta VALUES("101","V00000101","2022-11-20 16:01:46","EFECTIVO","21","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","10.00","0.00","","","9.00","1","1","1","AUTORIZADO","2011202201131121878600120010010000000211234567814");
INSERT INTO venta VALUES("102","V00000102","2022-11-20 16:16:18","EFECTIVO","22","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","10.00","0.00","","","9.00","1","1","1","NO ENVIADO","");
INSERT INTO venta VALUES("103","V00000103","2022-11-20 16:20:46","EFECTIVO","23","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","10.00","0.00","","","9.00","1","1","1","AUTORIZADO","2011202201131121878600120010010000000231234567815");
INSERT INTO venta VALUES("104","V00000104","2022-11-20 16:25:29","EFECTIVO","24","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1.00","0.00","","","0.00","1","2","1","NO AUTORIZADO","2011202201131121878600120010010000000241234567810");
INSERT INTO venta VALUES("105","V00000105","2022-11-20 16:30:13","EFECTIVO","25","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1.00","0.00","","","0.00","1","3","1","NO AUTORIZADO","2011202201131121878600120010010000000251234567816");
INSERT INTO venta VALUES("106","V00000106","2022-11-20 17:31:24","EFECTIVO","26","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","10.00","0.00","","","9.00","1","3","1","AUTORIZADO","2011202201131121878600120010010000000261234567811");
INSERT INTO venta VALUES("107","V00000107","2022-11-20 17:51:23","EFECTIVO","27","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","10.00","0.00","","","9.00","1","2","1","AUTORIZADO","2011202201131121878600120010010000000271234567817");
INSERT INTO venta VALUES("108","V00000108","2022-11-20 17:52:36","EFECTIVO","28","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","10.00","0.00","","","9.00","1","2","1","AUTORIZADO","2011202201131121878600120010010000000281234567812");
INSERT INTO venta VALUES("109","V00000109","2022-11-21 17:29:33","EFECTIVO","77","1","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1.00","1.00","","","0.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("110","V00000110","2022-11-21 17:31:43","EFECTIVO","78","1","54.46","6.54","0.00","0.00","0.00","61.00","Sesenta y uno 00/100 USD","62.00","0.00","","","1.00","1","1","1","NO ENVIADO","");
INSERT INTO venta VALUES("111","V00000111","2022-11-22 12:08:38","EFECTIVO","29","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","10.00","0.00","","","9.00","1","3","1","AUTORIZADO","2211202201131121878600110010010000000291234567819");
INSERT INTO venta VALUES("112","V00000112","2022-11-22 12:09:55","EFECTIVO","30","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","10.00","0.00","","","9.00","1","3","1","AUTORIZADO","2211202201131121878600110010010000000301234567814");
INSERT INTO venta VALUES("113","V00000113","2022-11-22 12:34:01","EFECTIVO","31","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","10.00","0.00","","","9.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("114","V00000114","2022-11-24 16:48:32","EFECTIVO","32","2","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1.00","0.00","","","0.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("115","V00000115","2022-11-24 17:30:43","EFECTIVO","33","2","49.11","5.89","0.00","0.00","0.00","55.00","Cincuenta y cinco 00/100 USD","100.00","0.00","","","45.00","1","1","1","NO ENVIADO","");
INSERT INTO venta VALUES("116","V00000116","2022-11-24 17:33:46","EFECTIVO","34","2","49.11","5.89","0.00","0.00","0.00","55.00","Cincuenta y cinco 00/100 USD","100.00","0.00","","","45.00","1","1","1","AUTORIZADO","2411202201131121878600110011000000000341234567813");
INSERT INTO venta VALUES("117","V00000117","2022-11-24 17:39:17","EFECTIVO","35","2","49.11","5.89","25.00","0.00","0.00","80.00","Ochenta 00/100 USD","100.00","0.00","","","20.00","1","1","1","NO ENVIADO","");
INSERT INTO venta VALUES("118","V00000118","2022-11-24 17:40:07","EFECTIVO","36","2","49.11","5.89","25.00","0.00","0.00","80.00","Ochenta 00/100 USD","100.00","0.00","","","20.00","1","1","1","AUTORIZADO","2411202201131121878600110011000000000361234567814");
INSERT INTO venta VALUES("119","V00000119","2022-11-24 19:25:15","EFECTIVO","37","2","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","25.00","0.00","","","0.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("120","V00000120","2022-11-24 19:28:04","EFECTIVO","79","1","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","30.00","0.00","","","5.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("121","V00000121","2022-11-24 19:30:02","EFECTIVO","38","2","26.79","3.21","50.00","0.00","0.00","80.00","Ochenta 00/100 USD","90.00","0.00","","","10.00","1","1","1","NO ENVIADO","");
INSERT INTO venta VALUES("122","V00000122","2022-11-24 19:32:06","EFECTIVO","39","2","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","60.00","0.00","","","4.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("123","V00000123","2022-11-24 19:33:08","EFECTIVO","40","2","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","60.00","0.00","","","4.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("124","V00000124","2022-11-24 19:39:44","EFECTIVO","41","2","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","30.00","0.00","","","5.00","1","1","1","NO ENVIADO","");
INSERT INTO venta VALUES("125","V00000125","2022-11-24 19:41:37","EFECTIVO","42","2","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","30.00","0.00","","","5.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("126","V00000126","2022-11-24 19:43:14","EFECTIVO","43","2","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","30.00","0.00","","","5.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("127","V00000127","2022-11-24 19:44:19","EFECTIVO","44","2","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","25.00","0.00","","","0.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("128","V00000128","2022-11-24 19:50:30","EFECTIVO","45","2","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","25.00","0.00","","","0.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("129","V00000129","2022-11-24 20:53:14","EFECTIVO","46","2","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","40.00","0.00","","","15.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("130","V00000130","2022-11-24 20:54:31","EFECTIVO","47","2","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","50.00","0.00","","","25.00","1","2","1","NO ENVIADO","");
INSERT INTO venta VALUES("131","V00000131","2022-11-24 20:56:43","EFECTIVO","48","2","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","60.00","0.00","","","4.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("132","V00000132","2022-11-24 21:31:43","EFECTIVO","49","2","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","30.00","0.00","","","5.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("133","V00000133","2022-11-25 10:14:14","EFECTIVO","50","2","10.71","1.29","22.00","0.00","0.00","34.00","Treinta y cuatro 00/100 USD","40.00","0.00","","","6.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("134","V00000134","2022-11-25 10:23:12","EFECTIVO","51","2","10.71","1.29","22.00","0.00","0.00","34.00","Treinta y cuatro 00/100 USD","35.00","0.00","","","1.00","1","3","1","NO ENVIADO","");
INSERT INTO venta VALUES("135","V00000135","2022-11-25 10:46:09","EFECTIVO","52","2","10.71","1.29","0.00","0.00","0.00","12.00","Doce 00/100 USD","12.00","0.00","","","0.00","1","3","1","NO ENVIADO","");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_abonos` AS select `view_creditos_venta`.`idcredito` AS `idcredito`,`view_creditos_venta`.`codigo_credito` AS `codigo_credito`,`view_creditos_venta`.`nombre_credito` AS `nombre_credito`,`abono`.`idabono` AS `idabono`,`abono`.`fecha_abono` AS `fecha_abono`,`abono`.`monto_abono` AS `monto_abono`,`abono`.`restante_credito` AS `restante_credito`,`abono`.`total_abonado` AS `total_abonado`,`abono`.`idusuario` AS `idusuario`,`view_usuarios`.`usuario` AS `usuario` from ((`abono` join `view_creditos_venta` on((`view_creditos_venta`.`idcredito` = `abono`.`idcredito`))) join `view_usuarios` on((`abono`.`idusuario` = `view_usuarios`.`idusuario`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_apartados` AS select `apartado`.`idapartado` AS `idapartado`,`apartado`.`numero_apartado` AS `numero_apartado`,`apartado`.`fecha_apartado` AS `fecha_apartado`,`apartado`.`fecha_limite_retiro` AS `fecha_limite_retiro`,`apartado`.`sumas` AS `sumas`,`apartado`.`iva` AS `iva`,`apartado`.`exento` AS `total_exento`,`apartado`.`retenido` AS `retenido`,`apartado`.`descuento` AS `total_descuento`,`apartado`.`total` AS `total`,`apartado`.`sonletras` AS `sonletras`,`apartado`.`estado` AS `estado_apartado`,`apartado`.`idcliente` AS `idcliente`,`cliente`.`nombre_cliente` AS `cliente`,`cliente`.`numero_nit` AS `numero_nit`,`cliente`.`direccion_cliente` AS `direccion_cliente`,`detalleapartado`.`idproducto` AS `idproducto`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`siglas` AS `siglas`,`view_productos`.`exento` AS `producto_exento`,`view_productos`.`perecedero` AS `perecedero`,`detalleapartado`.`fecha_vence` AS `fecha_vence`,`detalleapartado`.`cantidad` AS `cantidad`,`detalleapartado`.`precio_unitario` AS `precio_unitario`,`view_productos`.`precio_compra` AS `precio_compra`,`detalleapartado`.`exento` AS `exento`,`detalleapartado`.`descuento` AS `descuento`,`detalleapartado`.`importe` AS `importe`,concat(`view_usuarios`.`nombre_empleado`,' ',`view_usuarios`.`apellido_empleado`) AS `empleado`,`apartado`.`abonado_apartado` AS `abonado_apartado`,`apartado`.`restante_pagar` AS `restante_pagar` from ((((`apartado` join `detalleapartado` on((`detalleapartado`.`idapartado` = `apartado`.`idapartado`))) join `view_productos` on((`detalleapartado`.`idproducto` = `view_productos`.`idproducto`))) join `view_usuarios` on((`view_usuarios`.`idusuario` = `apartado`.`idusuario`))) left join `cliente` on((`apartado`.`idcliente` = `cliente`.`idcliente`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_caja` AS select `caja`.`idcaja` AS `idcaja`,`caja`.`fecha_apertura` AS `fecha_apertura`,`caja`.`monto_apertura` AS `monto_apertura`,`caja`.`monto_cierre` AS `monto_cierre`,`caja`.`fecha_cierre` AS `fecha_cierre`,`caja`.`estado` AS `estado`,`caja_movimiento`.`tipo_movimiento` AS `tipo_movimiento`,`caja_movimiento`.`monto_movimiento` AS `monto_movimiento`,`caja_movimiento`.`descripcion_movimiento` AS `descripcion_movimiento` from (`caja` join `caja_movimiento` on((`caja`.`idcaja` = `caja_movimiento`.`idcaja`)));

INSERT INTO view_caja VALUES("39","2022-11-19 21:59:08","100.00","0.00","","1","1","25.00","POR VENTA FACTURA # 8");
INSERT INTO view_caja VALUES("39","2022-11-19 21:59:08","100.00","0.00","","1","1","25.00","POR VENTA FACTURA # 9");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","25.00","POR VENTA FACTURA # 10");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","25.00","POR VENTA FACTURA # 11");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","25.00","POR VENTA FACTURA # 12");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","25.00","POR VENTA FACTURA # 13");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","25.00","POR VENTA FACTURA # 14");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","25.00","POR VENTA FACTURA # 15");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","25.00","POR VENTA FACTURA # 16");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","25.00","POR VENTA FACTURA # 17");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","25.00","POR VENTA FACTURA # 18");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 19");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 20");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 21");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 22");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 23");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 24");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 25");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 26");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 27");
INSERT INTO view_caja VALUES("40","2022-11-20 12:24:22","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 28");
INSERT INTO view_caja VALUES("41","2022-11-21 17:28:35","1.00","0.00","","1","1","1.00","POR VENTA TICKET # 77");
INSERT INTO view_caja VALUES("41","2022-11-21 17:28:35","1.00","0.00","","1","1","61.00","POR VENTA TICKET # 78");
INSERT INTO view_caja VALUES("42","2022-11-22 12:08:09","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 29");
INSERT INTO view_caja VALUES("42","2022-11-22 12:08:09","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 30");
INSERT INTO view_caja VALUES("42","2022-11-22 12:08:09","100.00","0.00","","1","1","1.00","POR VENTA FACTURA # 31");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","1.00","POR VENTA FACTURA # 32");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","55.00","POR VENTA FACTURA # 33");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","55.00","POR VENTA FACTURA # 34");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","80.00","POR VENTA FACTURA # 35");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","80.00","POR VENTA FACTURA # 36");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","25.00","POR VENTA FACTURA # 37");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","25.00","POR VENTA TICKET # 79");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","80.00","POR VENTA FACTURA # 38");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","56.00","POR VENTA FACTURA # 39");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","56.00","POR VENTA FACTURA # 40");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","25.00","POR VENTA FACTURA # 41");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","25.00","POR VENTA FACTURA # 42");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","25.00","POR VENTA FACTURA # 43");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","25.00","POR VENTA FACTURA # 44");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","25.00","POR VENTA FACTURA # 45");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","25.00","POR VENTA FACTURA # 46");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","25.00","POR VENTA FACTURA # 47");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","56.00","POR VENTA FACTURA # 48");
INSERT INTO view_caja VALUES("43","2022-11-24 13:58:12","1.00","0.00","","1","1","25.00","POR VENTA FACTURA # 49");
INSERT INTO view_caja VALUES("44","2022-11-25 10:10:00","1.00","0.00","","1","1","34.00","POR VENTA FACTURA # 50");
INSERT INTO view_caja VALUES("44","2022-11-25 10:10:00","1.00","0.00","","1","1","34.00","POR VENTA FACTURA # 51");
INSERT INTO view_caja VALUES("44","2022-11-25 10:10:00","1.00","0.00","","1","1","12.00","POR VENTA FACTURA # 52");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_compras` AS select `compra`.`idcompra` AS `idcompra`,`compra`.`fecha_compra` AS `fecha_compra`,`compra`.`idproveedor` AS `idproveedor`,`proveedor`.`nombre_proveedor` AS `nombre_proveedor`,`proveedor`.`numero_nit` AS `numero_nit`,`compra`.`tipo_pago` AS `tipo_pago`,`compra`.`tipo_comprobante` AS `tipo_comprobante`,`compra`.`numero_comprobante` AS `numero_comprobante`,`compra`.`fecha_comprobante` AS `fecha_comprobante`,`detallecompra`.`idproducto` AS `idproducto`,`detallecompra`.`fecha_vence` AS `fecha_vence`,`producto`.`codigo_barra` AS `codigo_barra`,`producto`.`codigo_interno` AS `codigo_interno`,`producto`.`nombre_producto` AS `nombre_producto`,`marca`.`nombre_marca` AS `nombre_marca`,`presentacion`.`siglas` AS `siglas`,`detallecompra`.`cantidad` AS `cantidad`,`detallecompra`.`precio_unitario` AS `precio_unitario`,`detallecompra`.`exento` AS `exento`,`detallecompra`.`importe` AS `importe`,`compra`.`sumas` AS `sumas`,`compra`.`iva` AS `iva`,`compra`.`exento` AS `total_exento`,`compra`.`retenido` AS `retenido`,`compra`.`total` AS `total`,`compra`.`sonletras` AS `sonletras`,`compra`.`estado` AS `estado_compra` from (((((`compra` join `detallecompra` on((`compra`.`idcompra` = `detallecompra`.`idcompra`))) join `proveedor` on((`proveedor`.`idproveedor` = `compra`.`idproveedor`))) join `producto` on((`detallecompra`.`idproducto` = `producto`.`idproducto`))) join `presentacion` on((`producto`.`idpresentacion` = `presentacion`.`idpresentacion`))) left join `marca` on((`producto`.`idmarca` = `marca`.`idmarca`)));

INSERT INTO view_compras VALUES("1","2022-11-20 18:18:28","1","LA ESTRELLA","80900909","1","2","1235","2022-11-20","8","","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","200.00","1.0000","0.00","200.00","200.00","24.00","0.00","0.00","224.00","DOSCIENTOS VEINTICUATRO 00/100 USD","1");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_comprobantes` AS select `comprobante`.`idcomprobante` AS `idcomprobante`,`comprobante`.`nombre_comprobante` AS `nombre_comprobante`,`comprobante`.`estado` AS `estado`,`tiraje_comprobante`.`idtiraje` AS `idtiraje`,`tiraje_comprobante`.`fecha_resolucion` AS `fecha_resolucion`,`tiraje_comprobante`.`serie` AS `serie`,`tiraje_comprobante`.`numero_resolucion` AS `numero_resolucion`,`tiraje_comprobante`.`numero_resolucion_fact` AS `numero_resolucion_fact`,`tiraje_comprobante`.`desde` AS `desde`,`tiraje_comprobante`.`hasta` AS `hasta`,`tiraje_comprobante`.`disponibles` AS `disponibles`,(`tiraje_comprobante`.`hasta` - `tiraje_comprobante`.`disponibles`) AS `usados` from (`comprobante` join `tiraje_comprobante` on((`comprobante`.`idcomprobante` = `tiraje_comprobante`.`idcomprobante`)));

INSERT INTO view_comprobantes VALUES("1","TICKET","1","1","2022-10-31","A","RES 008458148","2022-1-199999","1","5000","4921","79");
INSERT INTO view_comprobantes VALUES("2","FACTURA","1","2","2022-11-15","15UN000000001 1615UN0000001","DOS","RYMPE","100000","2000000","1999948","52");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cotizaciones` AS select `cotizacion`.`idcotizacion` AS `idcotizacion`,`cotizacion`.`numero_cotizacion` AS `numero_cotizacion`,`cotizacion`.`fecha_cotizacion` AS `fecha_cotizacion`,`cotizacion`.`a_nombre` AS `a_nombre`,`cliente`.`nombre_cliente` AS `nombre_cliente`,`cliente`.`numero_nit` AS `numero_nit`,`cliente`.`direccion_cliente` AS `direccion_cliente`,`cliente`.`numero_telefono` AS `numero_telefono`,`cliente`.`email` AS `email`,`cotizacion`.`tipo_pago` AS `tipo_pago`,`cotizacion`.`entrega` AS `entrega`,`detallecotizacion`.`idproducto` AS `idproducto`,`producto`.`codigo_barra` AS `codigo_barra`,`producto`.`codigo_interno` AS `codigo_interno`,`producto`.`nombre_producto` AS `nombre_producto`,`marca`.`nombre_marca` AS `nombre_marca`,`presentacion`.`siglas` AS `siglas`,`producto`.`stock` AS `stock`,`detallecotizacion`.`cantidad` AS `cantidad`,`detallecotizacion`.`disponible` AS `disponible`,`detallecotizacion`.`precio_unitario` AS `precio_unitario`,`detallecotizacion`.`exento` AS `exento`,`detallecotizacion`.`descuento` AS `descuento`,`detallecotizacion`.`importe` AS `importe`,`cotizacion`.`sumas` AS `sumas`,`cotizacion`.`iva` AS `iva`,`cotizacion`.`exento` AS `total_exento`,`cotizacion`.`retenido` AS `retenido`,`cotizacion`.`descuento` AS `total_descuento`,`cotizacion`.`total` AS `total`,`cotizacion`.`sonletras` AS `sonletras`,concat(`view_usuarios`.`nombre_empleado`,' ',`view_usuarios`.`apellido_empleado`) AS `empleado` from ((((((`cotizacion` join `detallecotizacion` on((`cotizacion`.`idcotizacion` = `detallecotizacion`.`idcotizacion`))) join `producto` on((`detallecotizacion`.`idproducto` = `producto`.`idproducto`))) join `presentacion` on((`producto`.`idpresentacion` = `presentacion`.`idpresentacion`))) left join `marca` on((`producto`.`idmarca` = `marca`.`idmarca`))) join `view_usuarios` on((`cotizacion`.`idusuario` = `view_usuarios`.`idusuario`))) join `cliente` on((`cotizacion`.`idcliente` = `cliente`.`idcliente`)));

INSERT INTO view_cotizaciones VALUES("1","COTI00000001","2022-11-20 18:16:29","CONSUMIDOR FINAL","CONSUMIDOR FINAL","9999999999999","","0000","","AL CONTADO","POR PEDIDO","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","281.00","1.00","1","1.00","0.00","0.00","1.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","DOUGLAS URIEL XIA MOX");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_creditos_venta` AS select `credito`.`idcredito` AS `idcredito`,`credito`.`codigo_credito` AS `codigo_credito`,`credito`.`idventa` AS `idventa`,`venta`.`numero_venta` AS `numero_venta`,`credito`.`nombre_credito` AS `nombre_credito`,`credito`.`fecha_credito` AS `fecha_credito`,`credito`.`monto_credito` AS `monto_credito`,`credito`.`monto_abonado` AS `monto_abonado`,`credito`.`monto_restante` AS `monto_restante`,`credito`.`estado` AS `estado_credito`,`cliente`.`codigo_cliente` AS `codigo_cliente`,`cliente`.`nombre_cliente` AS `cliente`,`cliente`.`limite_credito` AS `limite_credito` from ((`credito` join `venta` on((`credito`.`idventa` = `venta`.`idventa`))) join `cliente` on((`credito`.`idcliente` = `cliente`.`idcliente`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_full_entradas` AS select `entrada`.`idproducto` AS `idproducto`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`siglas` AS `siglas`,`entrada`.`fecha_entrada` AS `fecha_entrada`,`entrada`.`descripcion_entrada` AS `descripcion_entrada`,`entrada`.`cantidad_entrada` AS `cantidad_entrada`,`entrada`.`precio_unitario_entrada` AS `precio_unitario_entrada`,`entrada`.`costo_total_entrada` AS `costo_total_entrada` from (`entrada` join `view_productos` on((`entrada`.`idproducto` = `view_productos`.`idproducto`)));

INSERT INTO view_full_entradas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","INVENTARIO INICIAL","100.00","1.00","100.00");
INSERT INTO view_full_entradas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","POR COMPRA FACTURA # 1235","200.00","1.00","200.00");
INSERT INTO view_full_entradas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","INVENTARIO INICIAL","100.00","20.00","2000.00");
INSERT INTO view_full_entradas VALUES("10","PR00000010","","PROCAN PRUEBA","ACEROS AREQUIPA","UND","2022-11-25","INVENTARIO INICIAL","100.00","10.00","1000.00");
INSERT INTO view_full_entradas VALUES("11","PR00000011","","COMPLEJO B","ACEROS AREQUIPA","UND","2022-11-25","INVENTARIO INICIAL","100.00","20.00","2000.00");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_full_salidas` AS select `salida`.`idproducto` AS `idproducto`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`siglas` AS `siglas`,`salida`.`fecha_salida` AS `fecha_salida`,`salida`.`descripcion_salida` AS `descripcion_salida`,`salida`.`cantidad_salida` AS `cantidad_salida`,`salida`.`precio_unitario_salida` AS `precio_unitario_salida`,`salida`.`costo_total_salida` AS `costo_total_salida` from (`salida` join `view_productos` on((`salida`.`idproducto` = `view_productos`.`idproducto`)));

INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-19","POR VENTA FACTURA # 8","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-19","POR VENTA FACTURA # 9","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 10","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 11","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 12","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 13","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 14","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 15","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 16","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 17","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 18","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 33","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 34","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 35","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("6","PR00000006","000000004","CEMENTO ANDINO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 36","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","2022-11-21","POR VENTA TICKET # 78","2.00","25.00","50.00");
INSERT INTO view_full_salidas VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 33","1.00","25.00","25.00");
INSERT INTO view_full_salidas VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 34","1.00","25.00","25.00");
INSERT INTO view_full_salidas VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 35","1.00","25.00","25.00");
INSERT INTO view_full_salidas VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 36","1.00","25.00","25.00");
INSERT INTO view_full_salidas VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 38","1.00","25.00","25.00");
INSERT INTO view_full_salidas VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 39","1.00","25.00","25.00");
INSERT INTO view_full_salidas VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 40","1.00","25.00","25.00");
INSERT INTO view_full_salidas VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 48","1.00","25.00","25.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 19","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 20","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 21","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 22","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 23","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 24","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 25","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 26","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 27","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-20","POR VENTA FACTURA # 28","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-21","POR VENTA TICKET # 77","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-21","POR VENTA TICKET # 78","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-22","POR VENTA FACTURA # 29","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-22","POR VENTA FACTURA # 30","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-22","POR VENTA FACTURA # 31","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 32","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 39","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 40","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 48","1.00","1.00","1.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 35","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 36","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 37","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA TICKET # 79","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 38","2.00","20.00","40.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 39","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 40","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 41","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 42","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 43","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 44","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 45","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 46","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 47","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 48","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","2022-11-24","POR VENTA FACTURA # 49","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("10","PR00000010","","PROCAN PRUEBA","ACEROS AREQUIPA","UND","2022-11-25","POR VENTA FACTURA # 50","1.00","10.00","10.00");
INSERT INTO view_full_salidas VALUES("10","PR00000010","","PROCAN PRUEBA","ACEROS AREQUIPA","UND","2022-11-25","POR VENTA FACTURA # 51","1.00","10.00","10.00");
INSERT INTO view_full_salidas VALUES("10","PR00000010","","PROCAN PRUEBA","ACEROS AREQUIPA","UND","2022-11-25","POR VENTA FACTURA # 52","1.00","10.00","10.00");
INSERT INTO view_full_salidas VALUES("11","PR00000011","","COMPLEJO B","ACEROS AREQUIPA","UND","2022-11-25","POR VENTA FACTURA # 50","1.00","20.00","20.00");
INSERT INTO view_full_salidas VALUES("11","PR00000011","","COMPLEJO B","ACEROS AREQUIPA","UND","2022-11-25","POR VENTA FACTURA # 51","1.00","20.00","20.00");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_historico_precios` AS select `proveedor_precio`.`idproducto` AS `idproducto`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`siglas` AS `siglas`,`proveedor_precio`.`idproveedor` AS `idproveedor`,`proveedor`.`nombre_proveedor` AS `nombre_proveedor`,`proveedor_precio`.`fecha_precio` AS `fecha_precio`,`proveedor_precio`.`precio_compra` AS `precio_comprado` from ((`proveedor_precio` join `view_productos` on((`proveedor_precio`.`idproducto` = `view_productos`.`idproducto`))) join `proveedor` on((`proveedor_precio`.`idproveedor` = `proveedor`.`idproveedor`)));

INSERT INTO view_historico_precios VALUES("8","PR00000008","","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","1","LA ESTRELLA","2022-11-20","1.0000");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kardex` AS select `inventario`.`idproducto` AS `idproducto`,concat(`view_productos`.`nombre_producto`,'  ',`view_productos`.`siglas`) AS `producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`inventario`.`saldo_inicial` AS `saldo_inicial`,if(isnull(`inventario`.`entradas`),0.00,`inventario`.`entradas`) AS `entradas`,if(isnull(`inventario`.`salidas`),0.00,`inventario`.`salidas`) AS `salidas`,`inventario`.`saldo_final` AS `saldo_final`,`inventario`.`mes_inventario` AS `mes_inventario` from (`inventario` join `view_productos` on((`inventario`.`idproducto` = `view_productos`.`idproducto`))) group by `inventario`.`idproducto`,`inventario`.`mes_inventario`;

INSERT INTO view_kardex VALUES("6","CEMENTO ANDINO  UND","ACEROS AREQUIPA","295.00","0.00","15.00","280.00","2022-11");
INSERT INTO view_kardex VALUES("7","TUBO PVC 4 PULGADAS  UND","ACEROS AREQUIPA","298.00","0.00","10.00","288.00","2022-11");
INSERT INTO view_kardex VALUES("8","PRODUCTO PRODUCCION  UND","ACEROS AREQUIPA","100.00","300.00","19.00","281.00","2022-11");
INSERT INTO view_kardex VALUES("9","PEGAMENTO EXENTO  UND","ACEROS AREQUIPA","100.00","100.00","17.00","83.00","2022-11");
INSERT INTO view_kardex VALUES("10","PROCAN PRUEBA  UND","ACEROS AREQUIPA","100.00","100.00","3.00","97.00","2022-11");
INSERT INTO view_kardex VALUES("11","COMPLEJO B  UND","ACEROS AREQUIPA","100.00","100.00","2.00","98.00","2022-11");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_perecederos` AS select `perecedero`.`idproducto` AS `idproducto`,`producto`.`codigo_interno` AS `codigo_interno`,`producto`.`codigo_barra` AS `codigo_barra`,`producto`.`nombre_producto` AS `nombre_producto`,`marca`.`nombre_marca` AS `nombre_marca`,`presentacion`.`siglas` AS `siglas`,`perecedero`.`fecha_vencimiento` AS `fecha_vencimiento`,`perecedero`.`cantidad_perecedero` AS `cantidad_perecedero`,`perecedero`.`estado` AS `estado_perecedero`,if((curdate() < `perecedero`.`fecha_vencimiento`),'NO','SI') AS `vencido` from (((`perecedero` join `producto` on((`perecedero`.`idproducto` = `producto`.`idproducto`))) join `presentacion` on((`producto`.`idpresentacion` = `presentacion`.`idpresentacion`))) left join `marca` on((`producto`.`idmarca` = `marca`.`idmarca`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_productos` AS select `producto`.`idproducto` AS `idproducto`,`producto`.`codigo_interno` AS `codigo_interno`,`producto`.`codigo_barra` AS `codigo_barra`,`producto`.`nombre_producto` AS `nombre_producto`,`producto`.`precio_compra` AS `precio_compra`,`producto`.`precio_venta` AS `precio_venta`,`producto`.`precio_venta_mayoreo` AS `precio_venta_mayoreo`,`producto`.`stock` AS `stock`,`producto`.`stock_min` AS `stock_min`,`producto`.`idcategoria` AS `idcategoria`,`categoria`.`nombre_categoria` AS `nombre_categoria`,`producto`.`idmarca` AS `idmarca`,`marca`.`nombre_marca` AS `nombre_marca`,`producto`.`idpresentacion` AS `idpresentacion`,`presentacion`.`nombre_presentacion` AS `nombre_presentacion`,`presentacion`.`siglas` AS `siglas`,`producto`.`estado` AS `estado`,`producto`.`exento` AS `exento`,`producto`.`inventariable` AS `inventariable`,`producto`.`perecedero` AS `perecedero` from (((`producto` join `categoria` on((`producto`.`idcategoria` = `categoria`.`idcategoria`))) join `presentacion` on((`producto`.`idpresentacion` = `presentacion`.`idpresentacion`))) left join `marca` on((`producto`.`idmarca` = `marca`.`idmarca`))) group by `producto`.`idproducto`;

INSERT INTO view_productos VALUES("6","PR00000006","000000004","CEMENTO ANDINO","20.00","25.00","24.00","280.00","30.00","1","FERRETERIA","1","ACEROS AREQUIPA","1","UNIDAD","UND","1","0","1","0");
INSERT INTO view_productos VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","25.00","30.00","29.00","288.00","10.00","1","FERRETERIA","1","ACEROS AREQUIPA","1","UNIDAD","UND","1","0","1","0");
INSERT INTO view_productos VALUES("8","PR00000008","","PRODUCTO PRODUCCION","1.00","1.00","1.00","281.00","5.00","1","FERRETERIA","1","ACEROS AREQUIPA","1","UNIDAD","UND","1","0","1","0");
INSERT INTO view_productos VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","20.00","25.00","25.00","83.00","2.00","1","FERRETERIA","1","ACEROS AREQUIPA","1","UNIDAD","UND","1","1","1","0");
INSERT INTO view_productos VALUES("10","PR00000010","","PROCAN PRUEBA","10.00","12.00","11.00","97.00","5.00","1","FERRETERIA","1","ACEROS AREQUIPA","1","UNIDAD","UND","1","0","1","0");
INSERT INTO view_productos VALUES("11","PR00000011","","COMPLEJO B","15.00","22.00","21.00","98.00","5.00","1","FERRETERIA","1","ACEROS AREQUIPA","1","UNIDAD","UND","1","1","1","1");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_productos_apartado` AS select `view_productos`.`idproducto` AS `idproducto`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`siglas` AS `siglas`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`precio_venta` AS `precio_venta`,`view_productos`.`precio_venta_mayoreo` AS `precio_venta_mayoreo`,`view_productos`.`stock` AS `stock`,`view_productos`.`exento` AS `exento`,`view_productos`.`perecedero` AS `perecedero` from `view_productos` where ((`view_productos`.`stock` > 0.00) and (`view_productos`.`precio_venta` > 0.00) and (`view_productos`.`estado` = 1) and (`view_productos`.`perecedero` = 0) and (`view_productos`.`inventariable` = 1)) group by `view_productos`.`idproducto`;

INSERT INTO view_productos_apartado VALUES("6","PR00000006","000000004","CEMENTO ANDINO","UND","ACEROS AREQUIPA","25.00","24.00","280.00","0","0");
INSERT INTO view_productos_apartado VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","UND","ACEROS AREQUIPA","30.00","29.00","288.00","0","0");
INSERT INTO view_productos_apartado VALUES("8","PR00000008","","PRODUCTO PRODUCCION","UND","ACEROS AREQUIPA","1.00","1.00","281.00","0","0");
INSERT INTO view_productos_apartado VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","UND","ACEROS AREQUIPA","25.00","25.00","83.00","1","0");
INSERT INTO view_productos_apartado VALUES("10","PR00000010","","PROCAN PRUEBA","UND","ACEROS AREQUIPA","12.00","11.00","97.00","0","0");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_productos_venta` AS select `view_productos`.`idproducto` AS `idproducto`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`siglas` AS `siglas`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`precio_venta` AS `precio_venta`,`view_productos`.`precio_venta_mayoreo` AS `precio_venta_mayoreo`,`view_productos`.`stock` AS `stock`,`view_productos`.`exento` AS `exento`,`view_productos`.`perecedero` AS `perecedero`,`view_productos`.`inventariable` AS `inventariable` from `view_productos` where ((`view_productos`.`stock` > 0.00) and (`view_productos`.`precio_venta` > 0.00) and (`view_productos`.`estado` = 1)) group by `view_productos`.`idproducto`;

INSERT INTO view_productos_venta VALUES("6","PR00000006","000000004","CEMENTO ANDINO","UND","ACEROS AREQUIPA","25.00","24.00","280.00","0","0","1");
INSERT INTO view_productos_venta VALUES("7","PR00000007","0000000033","TUBO PVC 4 PULGADAS","UND","ACEROS AREQUIPA","30.00","29.00","288.00","0","0","1");
INSERT INTO view_productos_venta VALUES("8","PR00000008","","PRODUCTO PRODUCCION","UND","ACEROS AREQUIPA","1.00","1.00","281.00","0","0","1");
INSERT INTO view_productos_venta VALUES("9","PR00000009","00001","PEGAMENTO EXENTO","UND","ACEROS AREQUIPA","25.00","25.00","83.00","1","0","1");
INSERT INTO view_productos_venta VALUES("10","PR00000010","","PROCAN PRUEBA","UND","ACEROS AREQUIPA","12.00","11.00","97.00","0","0","1");
INSERT INTO view_productos_venta VALUES("11","PR00000011","","COMPLEJO B","UND","ACEROS AREQUIPA","22.00","21.00","98.00","1","1","1");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_taller` AS select `ordentaller`.`idorden` AS `idorden`,`ordentaller`.`numero_orden` AS `numero_orden`,`ordentaller`.`fecha_ingreso` AS `fecha_ingreso`,`ordentaller`.`aparato` AS `aparato`,`ordentaller`.`modelo` AS `modelo`,`ordentaller`.`serie` AS `serie`,`ordentaller`.`averia` AS `averia`,`ordentaller`.`observaciones` AS `observaciones`,`ordentaller`.`deposito_revision` AS `deposito_revision`,`ordentaller`.`deposito_reparacion` AS `deposito_reparacion`,`ordentaller`.`diagnostico` AS `diagnostico`,`ordentaller`.`estado_aparato` AS `estado_aparato`,`ordentaller`.`repuestos` AS `repuestos`,`ordentaller`.`mano_obra` AS `mano_obra`,`ordentaller`.`fecha_alta` AS `fecha_alta`,`ordentaller`.`fecha_retiro` AS `fecha_retiro`,`ordentaller`.`ubicacion` AS `ubicacion`,`ordentaller`.`parcial_pagar` AS `parcial_pagar`,`ordentaller`.`idcliente` AS `idcliente`,`cliente`.`nombre_cliente` AS `nombre_cliente`,`cliente`.`numero_nit` AS `numero_nit`,`cliente`.`numero_telefono` AS `numero_telefono`,`ordentaller`.`idtecnico` AS `idtecnico`,`tecnico`.`tecnico` AS `tecnico`,`ordentaller`.`idmarca` AS `idmarca`,`marca`.`nombre_marca` AS `nombre_marca` from (((`ordentaller` join `cliente` on((`ordentaller`.`idcliente` = `cliente`.`idcliente`))) join `marca` on((`ordentaller`.`idmarca` = `marca`.`idmarca`))) join `tecnico` on((`ordentaller`.`idtecnico` = `tecnico`.`idtecnico`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_usuarios` AS select `usuario`.`idusuario` AS `idusuario`,`usuario`.`usuario` AS `usuario`,`usuario`.`contrasena` AS `contrasena`,`usuario`.`tipo_usuario` AS `tipo_usuario`,`usuario`.`estado` AS `estado`,`usuario`.`idempleado` AS `idempleado`,`empleado`.`nombre_empleado` AS `nombre_empleado`,`empleado`.`apellido_empleado` AS `apellido_empleado` from (`usuario` join `empleado` on((`usuario`.`idempleado` = `empleado`.`idempleado`)));

INSERT INTO view_usuarios VALUES("1","admin","admin","1","1","1","DOUGLAS URIEL","XIA MOX");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_ventas` AS select `venta`.`idventa` AS `idventa`,`venta`.`numero_venta` AS `numero_venta`,`venta`.`fecha_venta` AS `fecha_venta`,`venta`.`tipo_pago` AS `tipo_pago`,`venta`.`numero_comprobante` AS `numero_comprobante`,`venta`.`tipo_comprobante` AS `tipo_comprobante`,`venta`.`pago_efectivo` AS `pago_efectivo`,`venta`.`pago_tarjeta` AS `pago_tarjeta`,`venta`.`numero_tarjeta` AS `numero_tarjeta`,`venta`.`tarjeta_habiente` AS `tarjeta_habiente`,`venta`.`cambio` AS `cambio`,`venta`.`sumas` AS `sumas`,`venta`.`iva` AS `iva`,`venta`.`exento` AS `total_exento`,`venta`.`retenido` AS `retenido`,`venta`.`descuento` AS `total_descuento`,`venta`.`total` AS `total`,`venta`.`sonletras` AS `sonletras`,`venta`.`estado` AS `estado_venta`,`venta`.`idcliente` AS `idcliente`,`cliente`.`nombre_cliente` AS `cliente`,`cliente`.`numero_nit` AS `numero_nit`,`cliente`.`direccion_cliente` AS `direccion_cliente`,`detalleventa`.`idproducto` AS `idproducto`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`siglas` AS `siglas`,`view_productos`.`exento` AS `producto_exento`,`view_productos`.`perecedero` AS `perecedero`,`detalleventa`.`fecha_vence` AS `fecha_vence`,`detalleventa`.`cantidad` AS `cantidad`,`detalleventa`.`precio_unitario` AS `precio_unitario`,`view_productos`.`precio_compra` AS `precio_compra`,`detalleventa`.`exento` AS `exento`,`detalleventa`.`descuento` AS `descuento`,`detalleventa`.`importe` AS `importe`,concat(`view_usuarios`.`nombre_empleado`,' ',`view_usuarios`.`apellido_empleado`) AS `empleado` from ((((`venta` join `detalleventa` on((`detalleventa`.`idventa` = `venta`.`idventa`))) join `view_productos` on((`detalleventa`.`idproducto` = `view_productos`.`idproducto`))) join `view_usuarios` on((`view_usuarios`.`idusuario` = `venta`.`idusuario`))) left join `cliente` on((`venta`.`idcliente` = `cliente`.`idcliente`)));

INSERT INTO view_ventas VALUES("97","V00000001","2022-11-20 15:21:43","EFECTIVO","17","2","100.00","0.00","","","75.00","22.32","2.68","0.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","6","000000004","PR00000006","CEMENTO ANDINO","ACEROS AREQUIPA","UND","0","0","","1.00","25.00","20.00","0.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("98","V00000098","2022-11-20 15:25:04","EFECTIVO","18","2","100.00","0.00","","","75.00","22.32","2.68","0.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","6","000000004","PR00000006","CEMENTO ANDINO","ACEROS AREQUIPA","UND","0","0","","1.00","25.00","20.00","0.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("115","V00000115","2022-11-24 17:30:43","EFECTIVO","33","2","100.00","0.00","","","45.00","49.11","5.89","0.00","0.00","0.00","55.00","Cincuenta y cinco 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","6","000000004","PR00000006","CEMENTO ANDINO","ACEROS AREQUIPA","UND","0","0","","1.00","25.00","20.00","0.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("116","V00000116","2022-11-24 17:33:46","EFECTIVO","34","2","100.00","0.00","","","45.00","49.11","5.89","0.00","0.00","0.00","55.00","Cincuenta y cinco 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","6","000000004","PR00000006","CEMENTO ANDINO","ACEROS AREQUIPA","UND","0","0","","1.00","25.00","20.00","0.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("117","V00000117","2022-11-24 17:39:17","EFECTIVO","35","2","100.00","0.00","","","20.00","49.11","5.89","25.00","0.00","0.00","80.00","Ochenta 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","6","000000004","PR00000006","CEMENTO ANDINO","ACEROS AREQUIPA","UND","0","0","","1.00","25.00","20.00","0.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("118","V00000118","2022-11-24 17:40:07","EFECTIVO","36","2","100.00","0.00","","","20.00","49.11","5.89","25.00","0.00","0.00","80.00","Ochenta 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","6","000000004","PR00000006","CEMENTO ANDINO","ACEROS AREQUIPA","UND","0","0","","1.00","25.00","20.00","0.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("110","V00000110","2022-11-21 17:31:43","EFECTIVO","78","1","62.00","0.00","","","1.00","54.46","6.54","0.00","0.00","0.00","61.00","Sesenta y uno 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","7","0000000033","PR00000007","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","0","0","","2.00","30.00","25.00","0.00","0.00","60.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("115","V00000115","2022-11-24 17:30:43","EFECTIVO","33","2","100.00","0.00","","","45.00","49.11","5.89","0.00","0.00","0.00","55.00","Cincuenta y cinco 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","7","0000000033","PR00000007","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","0","0","","1.00","30.00","25.00","0.00","0.00","30.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("116","V00000116","2022-11-24 17:33:46","EFECTIVO","34","2","100.00","0.00","","","45.00","49.11","5.89","0.00","0.00","0.00","55.00","Cincuenta y cinco 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","7","0000000033","PR00000007","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","0","0","","1.00","30.00","25.00","0.00","0.00","30.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("117","V00000117","2022-11-24 17:39:17","EFECTIVO","35","2","100.00","0.00","","","20.00","49.11","5.89","25.00","0.00","0.00","80.00","Ochenta 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","7","0000000033","PR00000007","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","0","0","","1.00","30.00","25.00","0.00","0.00","30.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("118","V00000118","2022-11-24 17:40:07","EFECTIVO","36","2","100.00","0.00","","","20.00","49.11","5.89","25.00","0.00","0.00","80.00","Ochenta 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","7","0000000033","PR00000007","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","0","0","","1.00","30.00","25.00","0.00","0.00","30.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("121","V00000121","2022-11-24 19:30:02","EFECTIVO","38","2","90.00","0.00","","","10.00","26.79","3.21","50.00","0.00","0.00","80.00","Ochenta 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","7","0000000033","PR00000007","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","0","0","","1.00","30.00","25.00","0.00","0.00","30.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("122","V00000122","2022-11-24 19:32:06","EFECTIVO","39","2","60.00","0.00","","","4.00","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","7","0000000033","PR00000007","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","0","0","","1.00","30.00","25.00","0.00","0.00","30.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("123","V00000123","2022-11-24 19:33:08","EFECTIVO","40","2","60.00","0.00","","","4.00","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","7","0000000033","PR00000007","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","0","0","","1.00","30.00","25.00","0.00","0.00","30.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("131","V00000131","2022-11-24 20:56:43","EFECTIVO","48","2","60.00","0.00","","","4.00","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","7","0000000033","PR00000007","TUBO PVC 4 PULGADAS","ACEROS AREQUIPA","UND","0","0","","1.00","30.00","25.00","0.00","0.00","30.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("99","V00000099","2022-11-20 15:46:43","EFECTIVO","19","2","10.00","0.00","","","9.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("100","V000000100","2022-11-20 15:58:09","EFECTIVO","20","2","10.00","0.00","","","9.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("101","V00000101","2022-11-20 16:01:46","EFECTIVO","21","2","10.00","0.00","","","9.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("102","V00000102","2022-11-20 16:16:18","EFECTIVO","22","2","10.00","0.00","","","9.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("103","V00000103","2022-11-20 16:20:46","EFECTIVO","23","2","10.00","0.00","","","9.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("104","V00000104","2022-11-20 16:25:29","EFECTIVO","24","2","1.00","0.00","","","0.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","2","GINA ALEXANDRA ALVAREZ MEZA","1205546664","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("105","V00000105","2022-11-20 16:30:13","EFECTIVO","25","2","1.00","0.00","","","0.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("106","V00000106","2022-11-20 17:31:24","EFECTIVO","26","2","10.00","0.00","","","9.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("107","V00000107","2022-11-20 17:51:23","EFECTIVO","27","2","10.00","0.00","","","9.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","2","GINA ALEXANDRA ALVAREZ MEZA","1205546664","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("108","V00000108","2022-11-20 17:52:36","EFECTIVO","28","2","10.00","0.00","","","9.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","2","GINA ALEXANDRA ALVAREZ MEZA","1205546664","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("109","V00000109","2022-11-21 17:29:33","EFECTIVO","77","1","1.00","1.00","","","0.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("110","V00000110","2022-11-21 17:31:43","EFECTIVO","78","1","62.00","0.00","","","1.00","54.46","6.54","0.00","0.00","0.00","61.00","Sesenta y uno 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("111","V00000111","2022-11-22 12:08:38","EFECTIVO","29","2","10.00","0.00","","","9.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("112","V00000112","2022-11-22 12:09:55","EFECTIVO","30","2","10.00","0.00","","","9.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("113","V00000113","2022-11-22 12:34:01","EFECTIVO","31","2","10.00","0.00","","","9.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("114","V00000114","2022-11-24 16:48:32","EFECTIVO","32","2","1.00","0.00","","","0.00","0.89","0.11","0.00","0.00","0.00","1.00","Uno 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("122","V00000122","2022-11-24 19:32:06","EFECTIVO","39","2","60.00","0.00","","","4.00","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("123","V00000123","2022-11-24 19:33:08","EFECTIVO","40","2","60.00","0.00","","","4.00","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("131","V00000131","2022-11-24 20:56:43","EFECTIVO","48","2","60.00","0.00","","","4.00","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","8","","PR00000008","PRODUCTO PRODUCCION","ACEROS AREQUIPA","UND","0","0","","1.00","1.00","1.00","0.00","0.00","1.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("117","V00000117","2022-11-24 17:39:17","EFECTIVO","35","2","100.00","0.00","","","20.00","49.11","5.89","25.00","0.00","0.00","80.00","Ochenta 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("118","V00000118","2022-11-24 17:40:07","EFECTIVO","36","2","100.00","0.00","","","20.00","49.11","5.89","25.00","0.00","0.00","80.00","Ochenta 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("119","V00000119","2022-11-24 19:25:15","EFECTIVO","37","2","25.00","0.00","","","0.00","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("120","V00000120","2022-11-24 19:28:04","EFECTIVO","79","1","30.00","0.00","","","5.00","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("121","V00000121","2022-11-24 19:30:02","EFECTIVO","38","2","90.00","0.00","","","10.00","26.79","3.21","50.00","0.00","0.00","80.00","Ochenta 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","2.00","25.00","20.00","50.00","0.00","50.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("122","V00000122","2022-11-24 19:32:06","EFECTIVO","39","2","60.00","0.00","","","4.00","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("123","V00000123","2022-11-24 19:33:08","EFECTIVO","40","2","60.00","0.00","","","4.00","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("124","V00000124","2022-11-24 19:39:44","EFECTIVO","41","2","30.00","0.00","","","5.00","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("125","V00000125","2022-11-24 19:41:37","EFECTIVO","42","2","30.00","0.00","","","5.00","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("126","V00000126","2022-11-24 19:43:14","EFECTIVO","43","2","30.00","0.00","","","5.00","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("127","V00000127","2022-11-24 19:44:19","EFECTIVO","44","2","25.00","0.00","","","0.00","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("128","V00000128","2022-11-24 19:50:30","EFECTIVO","45","2","25.00","0.00","","","0.00","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("129","V00000129","2022-11-24 20:53:14","EFECTIVO","46","2","40.00","0.00","","","15.00","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("130","V00000130","2022-11-24 20:54:31","EFECTIVO","47","2","50.00","0.00","","","25.00","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","2","GINA ALEXANDRA ALVAREZ MEZA","1205546664","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("131","V00000131","2022-11-24 20:56:43","EFECTIVO","48","2","60.00","0.00","","","4.00","27.68","3.32","25.00","0.00","0.00","56.00","Cincuenta y seis 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("132","V00000132","2022-11-24 21:31:43","EFECTIVO","49","2","30.00","0.00","","","5.00","0.00","0.00","25.00","0.00","0.00","25.00","Veinticinco 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","9","00001","PR00000009","PEGAMENTO EXENTO","ACEROS AREQUIPA","UND","1","0","","1.00","25.00","20.00","25.00","0.00","25.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("133","V00000133","2022-11-25 10:14:14","EFECTIVO","50","2","40.00","0.00","","","6.00","10.71","1.29","22.00","0.00","0.00","34.00","Treinta y cuatro 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","10","","PR00000010","PROCAN PRUEBA","ACEROS AREQUIPA","UND","0","0","","1.00","12.00","10.00","0.00","0.00","12.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("134","V00000134","2022-11-25 10:23:12","EFECTIVO","51","2","35.00","0.00","","","1.00","10.71","1.29","22.00","0.00","0.00","34.00","Treinta y cuatro 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","10","","PR00000010","PROCAN PRUEBA","ACEROS AREQUIPA","UND","0","0","","1.00","12.00","10.00","0.00","0.00","12.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("135","V00000135","2022-11-25 10:46:09","EFECTIVO","52","2","12.00","0.00","","","0.00","10.71","1.29","0.00","0.00","0.00","12.00","Doce 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","10","","PR00000010","PROCAN PRUEBA","ACEROS AREQUIPA","UND","0","0","","1.00","12.00","10.00","0.00","0.00","12.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("133","V00000133","2022-11-25 10:14:14","EFECTIVO","50","2","40.00","0.00","","","6.00","10.71","1.29","22.00","0.00","0.00","34.00","Treinta y cuatro 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","11","","PR00000011","COMPLEJO B","ACEROS AREQUIPA","UND","1","1","","1.00","22.00","15.00","22.00","0.00","22.00","DOUGLAS URIEL XIA MOX");
INSERT INTO view_ventas VALUES("134","V00000134","2022-11-25 10:23:12","EFECTIVO","51","2","35.00","0.00","","","1.00","10.71","1.29","22.00","0.00","0.00","34.00","Treinta y cuatro 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","11","","PR00000011","COMPLEJO B","ACEROS AREQUIPA","UND","1","1","","1.00","22.00","15.00","22.00","0.00","22.00","DOUGLAS URIEL XIA MOX");



