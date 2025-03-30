<?php
class ClienteData {
	public static $tablename = "cliente";


	public function ClienteData(){
		
	} 

	
	public static function delById($idcliente){
		$sql = "delete from ".self::$tablename." where idcliente=$idcliente";
		Executor::doit($sql);
	}
	
// partiendo de que ya tenemos creado un objecto ClienteData previamente utilizamos el contexto
	
	public static function getById($idcliente){
		$sql = "select * from ".self::$tablename." where idcliente=$idcliente";
		$query = Executor::doit($sql);
		return Model::one($query[0],new ClienteData());
	}


	public static function getAll(){
		$sql = "select * from ".self::$tablename;
		$query = Executor::doit($sql);
		return Model::many($query[0],new ClienteData());
	}

	


}

?>