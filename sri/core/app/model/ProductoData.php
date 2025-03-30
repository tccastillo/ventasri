<?php
class ProductoData {
	public static $tablename = "producto";


	public function ProductoData(){
		
	} 

	

	public static function getById($id){
		$sql = "select * from ".self::$tablename." where idproducto=$id";
		$query = Executor::doit($sql);
		return Model::one($query[0],new ProductoData());

	}




}

?>