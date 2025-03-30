<?php
class ProcesoVentaData {
	public static $tablename = "detalleventa";


	public function ProcesoVentaData(){ 
		
	}  

	public function getProducto(){ return ProductoData::getById($this->idproducto);}
	
// partiendo de que ya tenemos creado un objecto PersonaData previamente utilizamos el contexto
	
	

	public static function getVentaa($id_venta){
		$sql = "select * from ".self::$tablename." where idventa=$id_venta";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProcesoVentaData());

	} 

 

}

?>