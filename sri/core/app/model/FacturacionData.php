<?php
class FacturacionData {
	public static $tablename = "facturacion";



	public function FacturacionData(){
		
	}

	public function add(){
		$sql = "insert into facturacion (fac_ele,certificado) ";
		$sql .= "value (\"$this->fac_ele\",\"$this->certificado\")";
		Executor::doit($sql);
	}

	public function add_whit_image(){
		$sql = "insert into facturacion (fac_ele,certificado) ";
		$sql .= "value (\"$this->fac_ele\",\"$this->certificado\")";
		Executor::doit($sql);
	} 

	public static function delById($id){
		$sql = "delete from ".self::$tablename." where id=$id";
		Executor::doit($sql);
	}
	public function del(){
		$sql = "delete from ".self::$tablename." where id=$this->id";
		Executor::doit($sql);
	}

// partiendo de que ya tenemos creado un objecto CategoriaData previamente utilizamos el contexto
	public function update(){
		$sql = "update ".self::$tablename." set fac_ele=\"$this->fac_ele\",clave=\"$this->clave\",entidad_cert=\"$this->entidad_cert\" where id=$this->id";
		Executor::doit($sql);
	}


	public function update_image(){
		$sql = "update ".self::$tablename." set certificado=\"$this->certificado\" where id=$this->id";
		Executor::doit($sql);
	}

	public static function getById($id){
		$sql = "select * from ".self::$tablename." where id=$id";
		$query = Executor::doit($sql);
		return Model::one($query[0],new FacturacionData());

	}

	public static function getAllUltimo(){
		$sql = "select * from ".self::$tablename." order by id desc limit 1  ";
		$query = Executor::doit($sql);
		return Model::one($query[0],new FacturacionData());
	}




}

?>