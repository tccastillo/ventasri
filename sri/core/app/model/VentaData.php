<?php
class VentaData {
	public static $tablename = "venta";


	public function VentaData(){
		
	} 

	public function getCliente(){ return ClienteData::getById($this->idcliente);}

	public function del(){
		$sql = "delete from ".self::$tablename." where idventa=$this->idventa";
		Executor::doit($sql);
	}

// partiendo de que ya tenemos creado un objecto PersonaData previamente utilizamos el contexto
	public function update(){
		$sql = "update ".self::$tablename." set numero_venta=\"$this->numero_venta\" where idventa=$this->idventa";
		Executor::doit($sql);
	}

	public function updatefactura(){
		$sql = "update ".self::$tablename." set aceptado=\"$this->aceptado\",claveacceso=\"$this->claveacceso\" where idventa=$this->idventa";
		Executor::doit($sql);
	}

	public function updateclaveacceso(){
		$sql = "update ".self::$tablename." set claveacceso=\"$this->claveacceso\" where idventa=$this->idventa";
		Executor::doit($sql);
	}
 
	public static function getById($idventa){
		$sql = "select * from ".self::$tablename." where idventa=$idventa";
		$query = Executor::doit($sql);
		return Model::one($query[0],new VentaData());

	}

	public static function getByIdUltimo(){
		$sql = "select * from ".self::$tablename."  order by idventa desc  limit 1 ";
		$query = Executor::doit($sql);
		return Model::one($query[0],new VentaData());

	}



	public static function getAll(){
		$sql = "select * from ".self::$tablename." where tipo_comprobante=2  order by idventa desc limit 100";
		$query = Executor::doit($sql);
		return Model::many($query[0],new VentaData());
	}

	public static function getIngresoRangoFechas($start,$end){
		$sql = "select * from ".self::$tablename." where  date(fecha_venta) >= \"$start\" and date(fecha_venta) <= \"$end\" and tipo_comprobante=2 order by idventa desc  ";
		$query = Executor::doit($sql);
		return Model::many($query[0],new VentaData());
	}

	public static function getIngresoRangoFechasCategoria($start,$end,$categoria){
		$sql= "SELECT venta.fecha_venta,venta.tipo_comprobante,producto.nombre_producto,venta.tipo_pago,venta.numero_venta,venta.total,venta.estado,detalleventa.idproducto,producto.idcategoria, count(detalleventa.idproducto) c FROM venta INNER JOIN detalleventa ON venta.idventa=detalleventa.idventa INNER JOIN producto on producto.idproducto=detalleventa.idproducto WHERE date(venta.fecha_venta) >= \"$start\" and date(venta.fecha_venta) <= \"$end\" and producto.idcategoria=$categoria group by detalleventa.idproducto having c >0 order by venta.idventa desc ";
		$query = Executor::doit($sql);
		return Model::many($query[0],new VentaData());
	}

	public static function getIngresoRangoFechasMasvendido($start,$end){
		$sql= "SELECT venta.fecha_venta,venta.tipo_comprobante,venta.tipo_pago,venta.numero_venta,venta.total,venta.estado,detalleventa.idproducto,producto.nombre_producto,producto.stock,producto.precio_venta, producto.idcategoria, count(detalleventa.idproducto) c, SUM(detalleventa.cantidad) contar FROM venta INNER JOIN detalleventa ON venta.idventa=detalleventa.idventa INNER JOIN producto on producto.idproducto=detalleventa.idproducto WHERE date(venta.fecha_venta) >= \"$start\" and date(venta.fecha_venta) <= \"$end\" group by detalleventa.idproducto having contar >1 order by contar desc";
		$query = Executor::doit($sql);
		return Model::many($query[0],new VentaData());
	}

	public static function getIngresoRangoFechasCliente($start,$end){
		$sql= "SELECT venta.fecha_venta,cliente.nombre_cliente,cliente.numero_nit, count(venta.idcliente) c, SUM(venta.total) contar FROM venta INNER JOIN cliente on cliente.idcliente=venta.idcliente WHERE date(venta.fecha_venta) >= \"$start\" and date(venta.fecha_venta) <= \"$end\" group by venta.idcliente having c >0 order by contar desc";
		$query = Executor::doit($sql);
		return Model::many($query[0],new VentaData());
	}

	public static function getIngresoRangoFiltro($start,$end){
		$sql= "SELECT venta.fecha_venta,venta.tipo_comprobante,venta.tipo_pago,venta.numero_venta,venta.total,venta.estado,detalleventa.idproducto,producto.idcategoria FROM venta INNER JOIN detalleventa ON venta.idventa=detalleventa.idventa INNER JOIN producto on producto.idproducto=detalleventa.idproducto WHERE date(venta.fecha_venta) >= \"$start\" and date(venta.fecha_venta) <= \"$end\"  order by venta.idventa desc ";
		$query = Executor::doit($sql);
		return Model::many($query[0],new VentaData());
	}

	


} 

?>