<?php
class CreditoData {
	public static $tablename = "credito";


	public function CreditoData(){
		
	} 

	
	
	public function getCliente(){ return ClienteData::getById($this->idcliente);}
// partiendo de que ya tenemos creado un objecto ClienteData previamente utilizamos el contexto
	
	public static function getById($idcredito){
		$sql = "select * from ".self::$tablename." where idcredito=$idcredito";
		$query = Executor::doit($sql);
		return Model::one($query[0],new CreditoData());
	}


	public static function getAll(){
		$sql = "select * from ".self::$tablename;
		$query = Executor::doit($sql);
		return Model::many($query[0],new CreditoData());
	}

	public static function getAllCliente($id_cliente){
		$sql = "select * from ".self::$tablename." where idcliente=$id_cliente and estado=0 ";
		$query = Executor::doit($sql);
		return Model::many($query[0],new CreditoData());
	}

	


}

?>