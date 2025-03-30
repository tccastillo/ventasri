

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO caja VALUES("1","2024-12-27 21:57:27","100.00","0.00","","1");





CREATE TABLE `caja_movimiento` (
  `idcaja` int(11) NOT NULL,
  `tipo_movimiento` tinyint(1) NOT NULL DEFAULT '0',
  `monto_movimiento` decimal(8,2) NOT NULL,
  `descripcion_movimiento` varchar(80) DEFAULT NULL,
  `fecha_movimiento` date NOT NULL,
  KEY `fk_caja_movimiento_caja1_idx` (`idcaja`),
  CONSTRAINT `fk_caja_movimiento_caja` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`idcaja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO caja_movimiento VALUES("1","1","20.00","POR VENTA TICKET # 8","2024-12-27");
INSERT INTO caja_movimiento VALUES("1","1","8.00","POR VENTA FACTURA # 18","2024-12-27");
INSERT INTO caja_movimiento VALUES("1","1","7.00","POR VENTA TICKET # 9","2024-12-27");
INSERT INTO caja_movimiento VALUES("1","1","6.00","POR VENTA FACTURA # 19","2024-12-27");





CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(120) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO categoria VALUES("1","FERRETERIA","1");
INSERT INTO categoria VALUES("2","TUBOS","1");
INSERT INTO categoria VALUES("3","TECNOLOGIA","1");





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

INSERT INTO cliente VALUES("1","CL00000001","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","54620710","nfychpas@gmail.com","","400.00","1");
INSERT INTO cliente VALUES("2","CL00000002","GINA ALEXANDRA ALVAREZ MEZA","1205546664","","09374839","gaam_ginaeacha87@hotmail.com","","0.00","1");
INSERT INTO cliente VALUES("3","CL00000003","CONSUMIDOR FINAL","9999999999999","","0000","nfychpas@gmail.com","","1400.00","1");





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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






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

INSERT INTO cotizacion VALUES("1","COTI00000001","2024-12-27 22:07:33","GINA ALEXANDRA ALVAREZ MEZA","AL CONTADO","INMEDIATA","130.00","15.60","0.00","0.00","0.00","145.60","Ciento cuarenta y cinco 60/100 USD","1","2");





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

INSERT INTO detallecotizacion VALUES("1","1","1.00","1","130.00","0.00","0.00","130.00");





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

INSERT INTO detalleventa VALUES("1","1","2.00","10.00","","0.00","0.00","20.00");
INSERT INTO detalleventa VALUES("2","1","1.00","8.00","","0.00","0.00","8.00");
INSERT INTO detalleventa VALUES("3","1","1.00","7.00","","0.00","0.00","7.00");
INSERT INTO detalleventa VALUES("4","1","1.00","6.00","","0.00","0.00","6.00");





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

INSERT INTO empleado VALUES("1","EM00000001","Tarquino ","Castillo 593 998680592","593 9986","tarquino1111@gmail.com","1");





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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO entrada VALUES("1","2024-12","2024-12-27","INVENTARIO INICIAL","10.00","120.00","1200.00","1","","");





CREATE TABLE `facturacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fac_ele` int(11) NOT NULL DEFAULT '1',
  `certificado` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `entidad_cert` varchar(50) NOT NULL DEFAULT 'SEC_DATA',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO facturacion VALUES("1","2","1311218786001.p12","Gabriela11","SEC_DATA");





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

INSERT INTO inventario VALUES("2024-12","2024-12-01","2024-12-31","10.00","10.00","5.00","5.00","1","1");





CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(120) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO marca VALUES("1","ACEROS AREQUIPA","1");
INSERT INTO marca VALUES("2","LG","1");
INSERT INTO marca VALUES("3","AOC","1");
INSERT INTO marca VALUES("4","SAMSUMG","1");





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

INSERT INTO parametro VALUES("1","MEGAXNET","ING. CASTILLO","1715233597001","15.00","0.00","0.00","PRINCIPAL S/N Y OLMEDO","","6");





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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO producto VALUES("1","PR00000001","","MONITOR","120.00","130.00","125.00","5.00","5.00","3","2","1","1","0","1","0");





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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO salida VALUES("1","2024-12","2024-12-27","POR VENTA TICKET # 8","2.00","120.00","240.00","1","1","");
INSERT INTO salida VALUES("2","2024-12","2024-12-27","POR VENTA FACTURA # 18","1.00","120.00","120.00","1","2","");
INSERT INTO salida VALUES("3","2024-12","2024-12-27","POR VENTA TICKET # 9","1.00","120.00","120.00","1","3","");
INSERT INTO salida VALUES("4","2024-12","2024-12-27","POR VENTA FACTURA # 19","1.00","120.00","120.00","1","4","");





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

INSERT INTO tiraje_comprobante VALUES("1","2022-10-31","RES 008458148","2022-1-199999","A","1","5000","1","4991");
INSERT INTO tiraje_comprobante VALUES("2","2022-11-15","DOS","RYMPE","15UN000000001 1615UN0000001","100000","2000000","2","1999981");





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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO venta VALUES("1","V00000001","2024-12-27 22:09:40","EFECTIVO","8","1","17.86","2.14","0.00","0.00","0.00","20.00","Veinte 00/100 USD","160.00","0.00","","","140.00","1","1","1","NO ENVIADO","");
INSERT INTO venta VALUES("2","V00000002","2024-12-27 22:12:18","EFECTIVO","18","2","7.14","0.86","0.00","0.00","0.00","8.00","Ocho 00/100 USD","200.00","0.00","","","192.00","1","3","1","NO ENVIADO","2712202401131121878600120010020000000181234567813");
INSERT INTO venta VALUES("3","V00000003","2024-12-27 22:20:03","EFECTIVO","9","1","6.25","0.75","0.00","0.00","0.00","7.00","Siete 00/100 USD","150.00","0.00","","","143.00","1","2","1","NO ENVIADO","");
INSERT INTO venta VALUES("4","V00000004","2024-12-27 22:20:40","EFECTIVO","19","2","5.36","0.64","0.00","0.00","0.00","6.00","Seis 00/100 USD","10.00","0.00","","","4.00","1","","1","NO ENVIADO","2712202401171523359700120010020000000191234567818");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_abonos` AS select `view_creditos_venta`.`idcredito` AS `idcredito`,`view_creditos_venta`.`codigo_credito` AS `codigo_credito`,`view_creditos_venta`.`nombre_credito` AS `nombre_credito`,`abono`.`idabono` AS `idabono`,`abono`.`fecha_abono` AS `fecha_abono`,`abono`.`monto_abono` AS `monto_abono`,`abono`.`restante_credito` AS `restante_credito`,`abono`.`total_abonado` AS `total_abonado`,`abono`.`idusuario` AS `idusuario`,`view_usuarios`.`usuario` AS `usuario` from ((`abono` join `view_creditos_venta` on((`view_creditos_venta`.`idcredito` = `abono`.`idcredito`))) join `view_usuarios` on((`abono`.`idusuario` = `view_usuarios`.`idusuario`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_apartados` AS select `apartado`.`idapartado` AS `idapartado`,`apartado`.`numero_apartado` AS `numero_apartado`,`apartado`.`fecha_apartado` AS `fecha_apartado`,`apartado`.`fecha_limite_retiro` AS `fecha_limite_retiro`,`apartado`.`sumas` AS `sumas`,`apartado`.`iva` AS `iva`,`apartado`.`exento` AS `total_exento`,`apartado`.`retenido` AS `retenido`,`apartado`.`descuento` AS `total_descuento`,`apartado`.`total` AS `total`,`apartado`.`sonletras` AS `sonletras`,`apartado`.`estado` AS `estado_apartado`,`apartado`.`idcliente` AS `idcliente`,`cliente`.`nombre_cliente` AS `cliente`,`cliente`.`numero_nit` AS `numero_nit`,`cliente`.`direccion_cliente` AS `direccion_cliente`,`detalleapartado`.`idproducto` AS `idproducto`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`siglas` AS `siglas`,`view_productos`.`exento` AS `producto_exento`,`view_productos`.`perecedero` AS `perecedero`,`detalleapartado`.`fecha_vence` AS `fecha_vence`,`detalleapartado`.`cantidad` AS `cantidad`,`detalleapartado`.`precio_unitario` AS `precio_unitario`,`view_productos`.`precio_compra` AS `precio_compra`,`detalleapartado`.`exento` AS `exento`,`detalleapartado`.`descuento` AS `descuento`,`detalleapartado`.`importe` AS `importe`,concat(`view_usuarios`.`nombre_empleado`,' ',`view_usuarios`.`apellido_empleado`) AS `empleado`,`apartado`.`abonado_apartado` AS `abonado_apartado`,`apartado`.`restante_pagar` AS `restante_pagar` from ((((`apartado` join `detalleapartado` on((`detalleapartado`.`idapartado` = `apartado`.`idapartado`))) join `view_productos` on((`detalleapartado`.`idproducto` = `view_productos`.`idproducto`))) join `view_usuarios` on((`view_usuarios`.`idusuario` = `apartado`.`idusuario`))) left join `cliente` on((`apartado`.`idcliente` = `cliente`.`idcliente`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_caja` AS select `caja`.`idcaja` AS `idcaja`,`caja`.`fecha_apertura` AS `fecha_apertura`,`caja`.`monto_apertura` AS `monto_apertura`,`caja`.`monto_cierre` AS `monto_cierre`,`caja`.`fecha_cierre` AS `fecha_cierre`,`caja`.`estado` AS `estado`,`caja_movimiento`.`tipo_movimiento` AS `tipo_movimiento`,`caja_movimiento`.`monto_movimiento` AS `monto_movimiento`,`caja_movimiento`.`descripcion_movimiento` AS `descripcion_movimiento` from (`caja` join `caja_movimiento` on((`caja`.`idcaja` = `caja_movimiento`.`idcaja`)));

INSERT INTO view_caja VALUES("1","2024-12-27 21:57:27","100.00","0.00","","1","1","20.00","POR VENTA TICKET # 8");
INSERT INTO view_caja VALUES("1","2024-12-27 21:57:27","100.00","0.00","","1","1","8.00","POR VENTA FACTURA # 18");
INSERT INTO view_caja VALUES("1","2024-12-27 21:57:27","100.00","0.00","","1","1","7.00","POR VENTA TICKET # 9");
INSERT INTO view_caja VALUES("1","2024-12-27 21:57:27","100.00","0.00","","1","1","6.00","POR VENTA FACTURA # 19");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_compras` AS select `compra`.`idcompra` AS `idcompra`,`compra`.`fecha_compra` AS `fecha_compra`,`compra`.`idproveedor` AS `idproveedor`,`proveedor`.`nombre_proveedor` AS `nombre_proveedor`,`proveedor`.`numero_nit` AS `numero_nit`,`compra`.`tipo_pago` AS `tipo_pago`,`compra`.`tipo_comprobante` AS `tipo_comprobante`,`compra`.`numero_comprobante` AS `numero_comprobante`,`compra`.`fecha_comprobante` AS `fecha_comprobante`,`detallecompra`.`idproducto` AS `idproducto`,`detallecompra`.`fecha_vence` AS `fecha_vence`,`producto`.`codigo_barra` AS `codigo_barra`,`producto`.`codigo_interno` AS `codigo_interno`,`producto`.`nombre_producto` AS `nombre_producto`,`marca`.`nombre_marca` AS `nombre_marca`,`presentacion`.`siglas` AS `siglas`,`detallecompra`.`cantidad` AS `cantidad`,`detallecompra`.`precio_unitario` AS `precio_unitario`,`detallecompra`.`exento` AS `exento`,`detallecompra`.`importe` AS `importe`,`compra`.`sumas` AS `sumas`,`compra`.`iva` AS `iva`,`compra`.`exento` AS `total_exento`,`compra`.`retenido` AS `retenido`,`compra`.`total` AS `total`,`compra`.`sonletras` AS `sonletras`,`compra`.`estado` AS `estado_compra` from (((((`compra` join `detallecompra` on((`compra`.`idcompra` = `detallecompra`.`idcompra`))) join `proveedor` on((`proveedor`.`idproveedor` = `compra`.`idproveedor`))) join `producto` on((`detallecompra`.`idproducto` = `producto`.`idproducto`))) join `presentacion` on((`producto`.`idpresentacion` = `presentacion`.`idpresentacion`))) left join `marca` on((`producto`.`idmarca` = `marca`.`idmarca`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_comprobantes` AS select `comprobante`.`idcomprobante` AS `idcomprobante`,`comprobante`.`nombre_comprobante` AS `nombre_comprobante`,`comprobante`.`estado` AS `estado`,`tiraje_comprobante`.`idtiraje` AS `idtiraje`,`tiraje_comprobante`.`fecha_resolucion` AS `fecha_resolucion`,`tiraje_comprobante`.`serie` AS `serie`,`tiraje_comprobante`.`numero_resolucion` AS `numero_resolucion`,`tiraje_comprobante`.`numero_resolucion_fact` AS `numero_resolucion_fact`,`tiraje_comprobante`.`desde` AS `desde`,`tiraje_comprobante`.`hasta` AS `hasta`,`tiraje_comprobante`.`disponibles` AS `disponibles`,(`tiraje_comprobante`.`hasta` - `tiraje_comprobante`.`disponibles`) AS `usados` from (`comprobante` join `tiraje_comprobante` on((`comprobante`.`idcomprobante` = `tiraje_comprobante`.`idcomprobante`)));

INSERT INTO view_comprobantes VALUES("1","TICKET","1","1","2022-10-31","A","RES 008458148","2022-1-199999","1","5000","4991","9");
INSERT INTO view_comprobantes VALUES("2","FACTURA","1","2","2022-11-15","15UN000000001 1615UN0000001","DOS","RYMPE","100000","2000000","1999981","19");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cotizaciones` AS select `cotizacion`.`idcotizacion` AS `idcotizacion`,`cotizacion`.`numero_cotizacion` AS `numero_cotizacion`,`cotizacion`.`fecha_cotizacion` AS `fecha_cotizacion`,`cotizacion`.`a_nombre` AS `a_nombre`,`cliente`.`nombre_cliente` AS `nombre_cliente`,`cliente`.`numero_nit` AS `numero_nit`,`cliente`.`direccion_cliente` AS `direccion_cliente`,`cliente`.`numero_telefono` AS `numero_telefono`,`cliente`.`email` AS `email`,`cotizacion`.`tipo_pago` AS `tipo_pago`,`cotizacion`.`entrega` AS `entrega`,`detallecotizacion`.`idproducto` AS `idproducto`,`producto`.`codigo_barra` AS `codigo_barra`,`producto`.`codigo_interno` AS `codigo_interno`,`producto`.`nombre_producto` AS `nombre_producto`,`marca`.`nombre_marca` AS `nombre_marca`,`presentacion`.`siglas` AS `siglas`,`producto`.`stock` AS `stock`,`detallecotizacion`.`cantidad` AS `cantidad`,`detallecotizacion`.`disponible` AS `disponible`,`detallecotizacion`.`precio_unitario` AS `precio_unitario`,`detallecotizacion`.`exento` AS `exento`,`detallecotizacion`.`descuento` AS `descuento`,`detallecotizacion`.`importe` AS `importe`,`cotizacion`.`sumas` AS `sumas`,`cotizacion`.`iva` AS `iva`,`cotizacion`.`exento` AS `total_exento`,`cotizacion`.`retenido` AS `retenido`,`cotizacion`.`descuento` AS `total_descuento`,`cotizacion`.`total` AS `total`,`cotizacion`.`sonletras` AS `sonletras`,concat(`view_usuarios`.`nombre_empleado`,' ',`view_usuarios`.`apellido_empleado`) AS `empleado` from ((((((`cotizacion` join `detallecotizacion` on((`cotizacion`.`idcotizacion` = `detallecotizacion`.`idcotizacion`))) join `producto` on((`detallecotizacion`.`idproducto` = `producto`.`idproducto`))) join `presentacion` on((`producto`.`idpresentacion` = `presentacion`.`idpresentacion`))) left join `marca` on((`producto`.`idmarca` = `marca`.`idmarca`))) join `view_usuarios` on((`cotizacion`.`idusuario` = `view_usuarios`.`idusuario`))) join `cliente` on((`cotizacion`.`idcliente` = `cliente`.`idcliente`)));

INSERT INTO view_cotizaciones VALUES("1","COTI00000001","2024-12-27 22:07:33","GINA ALEXANDRA ALVAREZ MEZA","GINA ALEXANDRA ALVAREZ MEZA","1205546664","","09374839","gaam_ginaeacha87@hotmail.com","AL CONTADO","INMEDIATA","1","","PR00000001","MONITOR","LG","UND","5.00","1.00","1","130.00","0.00","0.00","130.00","130.00","15.60","0.00","0.00","0.00","145.60","Ciento cuarenta y cinco 60/100 USD","Tarquino  Castillo 593 998680592");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_creditos_venta` AS select `credito`.`idcredito` AS `idcredito`,`credito`.`codigo_credito` AS `codigo_credito`,`credito`.`idventa` AS `idventa`,`venta`.`numero_venta` AS `numero_venta`,`credito`.`nombre_credito` AS `nombre_credito`,`credito`.`fecha_credito` AS `fecha_credito`,`credito`.`monto_credito` AS `monto_credito`,`credito`.`monto_abonado` AS `monto_abonado`,`credito`.`monto_restante` AS `monto_restante`,`credito`.`estado` AS `estado_credito`,`cliente`.`codigo_cliente` AS `codigo_cliente`,`cliente`.`nombre_cliente` AS `cliente`,`cliente`.`limite_credito` AS `limite_credito` from ((`credito` join `venta` on((`credito`.`idventa` = `venta`.`idventa`))) join `cliente` on((`credito`.`idcliente` = `cliente`.`idcliente`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_full_entradas` AS select `entrada`.`idproducto` AS `idproducto`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`siglas` AS `siglas`,`entrada`.`fecha_entrada` AS `fecha_entrada`,`entrada`.`descripcion_entrada` AS `descripcion_entrada`,`entrada`.`cantidad_entrada` AS `cantidad_entrada`,`entrada`.`precio_unitario_entrada` AS `precio_unitario_entrada`,`entrada`.`costo_total_entrada` AS `costo_total_entrada` from (`entrada` join `view_productos` on((`entrada`.`idproducto` = `view_productos`.`idproducto`)));

INSERT INTO view_full_entradas VALUES("1","PR00000001","","MONITOR","LG","UND","2024-12-27","INVENTARIO INICIAL","10.00","120.00","1200.00");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_full_salidas` AS select `salida`.`idproducto` AS `idproducto`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`siglas` AS `siglas`,`salida`.`fecha_salida` AS `fecha_salida`,`salida`.`descripcion_salida` AS `descripcion_salida`,`salida`.`cantidad_salida` AS `cantidad_salida`,`salida`.`precio_unitario_salida` AS `precio_unitario_salida`,`salida`.`costo_total_salida` AS `costo_total_salida` from (`salida` join `view_productos` on((`salida`.`idproducto` = `view_productos`.`idproducto`)));

INSERT INTO view_full_salidas VALUES("1","PR00000001","","MONITOR","LG","UND","2024-12-27","POR VENTA TICKET # 8","2.00","120.00","240.00");
INSERT INTO view_full_salidas VALUES("1","PR00000001","","MONITOR","LG","UND","2024-12-27","POR VENTA FACTURA # 18","1.00","120.00","120.00");
INSERT INTO view_full_salidas VALUES("1","PR00000001","","MONITOR","LG","UND","2024-12-27","POR VENTA TICKET # 9","1.00","120.00","120.00");
INSERT INTO view_full_salidas VALUES("1","PR00000001","","MONITOR","LG","UND","2024-12-27","POR VENTA FACTURA # 19","1.00","120.00","120.00");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_historico_precios` AS select `proveedor_precio`.`idproducto` AS `idproducto`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`siglas` AS `siglas`,`proveedor_precio`.`idproveedor` AS `idproveedor`,`proveedor`.`nombre_proveedor` AS `nombre_proveedor`,`proveedor_precio`.`fecha_precio` AS `fecha_precio`,`proveedor_precio`.`precio_compra` AS `precio_comprado` from ((`proveedor_precio` join `view_productos` on((`proveedor_precio`.`idproducto` = `view_productos`.`idproducto`))) join `proveedor` on((`proveedor_precio`.`idproveedor` = `proveedor`.`idproveedor`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kardex` AS select `inventario`.`idproducto` AS `idproducto`,concat(`view_productos`.`nombre_producto`,'  ',`view_productos`.`siglas`) AS `producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`inventario`.`saldo_inicial` AS `saldo_inicial`,if(isnull(`inventario`.`entradas`),0.00,`inventario`.`entradas`) AS `entradas`,if(isnull(`inventario`.`salidas`),0.00,`inventario`.`salidas`) AS `salidas`,`inventario`.`saldo_final` AS `saldo_final`,`inventario`.`mes_inventario` AS `mes_inventario` from (`inventario` join `view_productos` on((`inventario`.`idproducto` = `view_productos`.`idproducto`))) group by `inventario`.`idproducto`,`inventario`.`mes_inventario`;

INSERT INTO view_kardex VALUES("1","MONITOR  UND","LG","10.00","10.00","5.00","5.00","2024-12");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_perecederos` AS select `perecedero`.`idproducto` AS `idproducto`,`producto`.`codigo_interno` AS `codigo_interno`,`producto`.`codigo_barra` AS `codigo_barra`,`producto`.`nombre_producto` AS `nombre_producto`,`marca`.`nombre_marca` AS `nombre_marca`,`presentacion`.`siglas` AS `siglas`,`perecedero`.`fecha_vencimiento` AS `fecha_vencimiento`,`perecedero`.`cantidad_perecedero` AS `cantidad_perecedero`,`perecedero`.`estado` AS `estado_perecedero`,if((curdate() < `perecedero`.`fecha_vencimiento`),'NO','SI') AS `vencido` from (((`perecedero` join `producto` on((`perecedero`.`idproducto` = `producto`.`idproducto`))) join `presentacion` on((`producto`.`idpresentacion` = `presentacion`.`idpresentacion`))) left join `marca` on((`producto`.`idmarca` = `marca`.`idmarca`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_productos` AS select `producto`.`idproducto` AS `idproducto`,`producto`.`codigo_interno` AS `codigo_interno`,`producto`.`codigo_barra` AS `codigo_barra`,`producto`.`nombre_producto` AS `nombre_producto`,`producto`.`precio_compra` AS `precio_compra`,`producto`.`precio_venta` AS `precio_venta`,`producto`.`precio_venta_mayoreo` AS `precio_venta_mayoreo`,`producto`.`stock` AS `stock`,`producto`.`stock_min` AS `stock_min`,`producto`.`idcategoria` AS `idcategoria`,`categoria`.`nombre_categoria` AS `nombre_categoria`,`producto`.`idmarca` AS `idmarca`,`marca`.`nombre_marca` AS `nombre_marca`,`producto`.`idpresentacion` AS `idpresentacion`,`presentacion`.`nombre_presentacion` AS `nombre_presentacion`,`presentacion`.`siglas` AS `siglas`,`producto`.`estado` AS `estado`,`producto`.`exento` AS `exento`,`producto`.`inventariable` AS `inventariable`,`producto`.`perecedero` AS `perecedero` from (((`producto` join `categoria` on((`producto`.`idcategoria` = `categoria`.`idcategoria`))) join `presentacion` on((`producto`.`idpresentacion` = `presentacion`.`idpresentacion`))) left join `marca` on((`producto`.`idmarca` = `marca`.`idmarca`))) group by `producto`.`idproducto`;

INSERT INTO view_productos VALUES("1","PR00000001","","MONITOR","120.00","130.00","125.00","5.00","5.00","3","TECNOLOGIA","2","LG","1","UNIDAD","UND","1","0","1","0");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_productos_apartado` AS select `view_productos`.`idproducto` AS `idproducto`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`siglas` AS `siglas`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`precio_venta` AS `precio_venta`,`view_productos`.`precio_venta_mayoreo` AS `precio_venta_mayoreo`,`view_productos`.`stock` AS `stock`,`view_productos`.`exento` AS `exento`,`view_productos`.`perecedero` AS `perecedero` from `view_productos` where ((`view_productos`.`stock` > 0.00) and (`view_productos`.`precio_venta` > 0.00) and (`view_productos`.`estado` = 1) and (`view_productos`.`perecedero` = 0) and (`view_productos`.`inventariable` = 1)) group by `view_productos`.`idproducto`;

INSERT INTO view_productos_apartado VALUES("1","PR00000001","","MONITOR","UND","LG","130.00","125.00","5.00","0","0");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_productos_venta` AS select `view_productos`.`idproducto` AS `idproducto`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`siglas` AS `siglas`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`precio_venta` AS `precio_venta`,`view_productos`.`precio_venta_mayoreo` AS `precio_venta_mayoreo`,`view_productos`.`stock` AS `stock`,`view_productos`.`exento` AS `exento`,`view_productos`.`perecedero` AS `perecedero`,`view_productos`.`inventariable` AS `inventariable` from `view_productos` where ((`view_productos`.`stock` > 0.00) and (`view_productos`.`precio_venta` > 0.00) and (`view_productos`.`estado` = 1)) group by `view_productos`.`idproducto`;

INSERT INTO view_productos_venta VALUES("1","PR00000001","","MONITOR","UND","LG","130.00","125.00","5.00","0","0","1");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_taller` AS select `ordentaller`.`idorden` AS `idorden`,`ordentaller`.`numero_orden` AS `numero_orden`,`ordentaller`.`fecha_ingreso` AS `fecha_ingreso`,`ordentaller`.`aparato` AS `aparato`,`ordentaller`.`modelo` AS `modelo`,`ordentaller`.`serie` AS `serie`,`ordentaller`.`averia` AS `averia`,`ordentaller`.`observaciones` AS `observaciones`,`ordentaller`.`deposito_revision` AS `deposito_revision`,`ordentaller`.`deposito_reparacion` AS `deposito_reparacion`,`ordentaller`.`diagnostico` AS `diagnostico`,`ordentaller`.`estado_aparato` AS `estado_aparato`,`ordentaller`.`repuestos` AS `repuestos`,`ordentaller`.`mano_obra` AS `mano_obra`,`ordentaller`.`fecha_alta` AS `fecha_alta`,`ordentaller`.`fecha_retiro` AS `fecha_retiro`,`ordentaller`.`ubicacion` AS `ubicacion`,`ordentaller`.`parcial_pagar` AS `parcial_pagar`,`ordentaller`.`idcliente` AS `idcliente`,`cliente`.`nombre_cliente` AS `nombre_cliente`,`cliente`.`numero_nit` AS `numero_nit`,`cliente`.`numero_telefono` AS `numero_telefono`,`ordentaller`.`idtecnico` AS `idtecnico`,`tecnico`.`tecnico` AS `tecnico`,`ordentaller`.`idmarca` AS `idmarca`,`marca`.`nombre_marca` AS `nombre_marca` from (((`ordentaller` join `cliente` on((`ordentaller`.`idcliente` = `cliente`.`idcliente`))) join `marca` on((`ordentaller`.`idmarca` = `marca`.`idmarca`))) join `tecnico` on((`ordentaller`.`idtecnico` = `tecnico`.`idtecnico`)));






CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_usuarios` AS select `usuario`.`idusuario` AS `idusuario`,`usuario`.`usuario` AS `usuario`,`usuario`.`contrasena` AS `contrasena`,`usuario`.`tipo_usuario` AS `tipo_usuario`,`usuario`.`estado` AS `estado`,`usuario`.`idempleado` AS `idempleado`,`empleado`.`nombre_empleado` AS `nombre_empleado`,`empleado`.`apellido_empleado` AS `apellido_empleado` from (`usuario` join `empleado` on((`usuario`.`idempleado` = `empleado`.`idempleado`)));

INSERT INTO view_usuarios VALUES("1","admin","admin","1","1","1","Tarquino ","Castillo 593 998680592");





CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_ventas` AS select `venta`.`idventa` AS `idventa`,`venta`.`numero_venta` AS `numero_venta`,`venta`.`fecha_venta` AS `fecha_venta`,`venta`.`tipo_pago` AS `tipo_pago`,`venta`.`numero_comprobante` AS `numero_comprobante`,`venta`.`tipo_comprobante` AS `tipo_comprobante`,`venta`.`pago_efectivo` AS `pago_efectivo`,`venta`.`pago_tarjeta` AS `pago_tarjeta`,`venta`.`numero_tarjeta` AS `numero_tarjeta`,`venta`.`tarjeta_habiente` AS `tarjeta_habiente`,`venta`.`cambio` AS `cambio`,`venta`.`sumas` AS `sumas`,`venta`.`iva` AS `iva`,`venta`.`exento` AS `total_exento`,`venta`.`retenido` AS `retenido`,`venta`.`descuento` AS `total_descuento`,`venta`.`total` AS `total`,`venta`.`sonletras` AS `sonletras`,`venta`.`estado` AS `estado_venta`,`venta`.`idcliente` AS `idcliente`,`cliente`.`nombre_cliente` AS `cliente`,`cliente`.`numero_nit` AS `numero_nit`,`cliente`.`direccion_cliente` AS `direccion_cliente`,`detalleventa`.`idproducto` AS `idproducto`,`view_productos`.`codigo_barra` AS `codigo_barra`,`view_productos`.`codigo_interno` AS `codigo_interno`,`view_productos`.`nombre_producto` AS `nombre_producto`,`view_productos`.`nombre_marca` AS `nombre_marca`,`view_productos`.`siglas` AS `siglas`,`view_productos`.`exento` AS `producto_exento`,`view_productos`.`perecedero` AS `perecedero`,`detalleventa`.`fecha_vence` AS `fecha_vence`,`detalleventa`.`cantidad` AS `cantidad`,`detalleventa`.`precio_unitario` AS `precio_unitario`,`view_productos`.`precio_compra` AS `precio_compra`,`detalleventa`.`exento` AS `exento`,`detalleventa`.`descuento` AS `descuento`,`detalleventa`.`importe` AS `importe`,concat(`view_usuarios`.`nombre_empleado`,' ',`view_usuarios`.`apellido_empleado`) AS `empleado` from ((((`venta` join `detalleventa` on((`detalleventa`.`idventa` = `venta`.`idventa`))) join `view_productos` on((`detalleventa`.`idproducto` = `view_productos`.`idproducto`))) join `view_usuarios` on((`view_usuarios`.`idusuario` = `venta`.`idusuario`))) left join `cliente` on((`venta`.`idcliente` = `cliente`.`idcliente`)));

INSERT INTO view_ventas VALUES("1","V00000001","2024-12-27 22:09:40","EFECTIVO","8","1","160.00","0.00","","","140.00","17.86","2.14","0.00","0.00","0.00","20.00","Veinte 00/100 USD","1","1","WESTERN PHARMACEUTICAL S.A.","1791248678001","CIUDAD","1","","PR00000001","MONITOR","LG","UND","0","0","","2.00","10.00","120.00","0.00","0.00","20.00","Tarquino  Castillo 593 998680592");
INSERT INTO view_ventas VALUES("2","V00000002","2024-12-27 22:12:18","EFECTIVO","18","2","200.00","0.00","","","192.00","7.14","0.86","0.00","0.00","0.00","8.00","Ocho 00/100 USD","1","3","CONSUMIDOR FINAL","9999999999999","","1","","PR00000001","MONITOR","LG","UND","0","0","","1.00","8.00","120.00","0.00","0.00","8.00","Tarquino  Castillo 593 998680592");
INSERT INTO view_ventas VALUES("3","V00000003","2024-12-27 22:20:03","EFECTIVO","9","1","150.00","0.00","","","143.00","6.25","0.75","0.00","0.00","0.00","7.00","Siete 00/100 USD","1","2","GINA ALEXANDRA ALVAREZ MEZA","1205546664","","1","","PR00000001","MONITOR","LG","UND","0","0","","1.00","7.00","120.00","0.00","0.00","7.00","Tarquino  Castillo 593 998680592");
INSERT INTO view_ventas VALUES("4","V00000004","2024-12-27 22:20:40","EFECTIVO","19","2","10.00","0.00","","","4.00","5.36","0.64","0.00","0.00","0.00","6.00","Seis 00/100 USD","1","","","","","1","","PR00000001","MONITOR","LG","UND","0","0","","1.00","6.00","120.00","0.00","0.00","6.00","Tarquino  Castillo 593 998680592");



