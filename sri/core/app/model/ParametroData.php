<?php
class ParametroData {
	public static $tablename = "parametro";



	public function ParametroData(){
		
	}


	public static function getById($idparametro){
		$sql = "select * from ".self::$tablename." where idparametro=$idparametro";
		$query = Executor::doit($sql);
		return Model::one($query[0],new ParametroData());

	}

	public static function getAllUltimo(){
		$sql = "select * from ".self::$tablename." order by idparametro desc limit 1  ";
		$query = Executor::doit($sql);
		return Model::one($query[0],new ParametroData());
	}




}

?>