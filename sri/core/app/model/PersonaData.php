<?php
class PersonaData {
	public static $tablename = "persona";


	public function PersonaData(){
		$this->documento = ""; 
		$this->nombre = "";
		$this->fecha_nac = "";
		$this->razon_social = ""; 
		$this->direccion = "";
		$this->fecha_creada = "NOW()";
	} 

	public function getTipoDocumento(){ return TipoDocumentoData::getById($this->tipo_documento);}

	public function addCliente(){
		$sql = "insert into persona (tipo_documento,documento,nombre,razon_social,fecha_nac,direccion,tipo,fecha_creada) ";
		$sql .= "value ($this->tipo_documento,\"$this->documento\",\"$this->nombre\",\"$this->razon_social\",\"$this->fecha_nac\",\"$this->direccion\",1,$this->fecha_creada)";
		return Executor::doit($sql);

	}
	 

	 public function addClientenuevo(){
		$sql = "insert into persona (tipo_documento,documento,nombre,motivo,fecha_nac,giro,direccion,tipo,estado_civil,fecha_creada,medio_transporte) ";
		$sql .= "value ($this->tipo_documento,\"$this->documento\",\"$this->nombre\",\"$this->motivo\",\"$this->fecha_nac\",\"$this->giro\",\"$this->direccion\",1,\"$this->estado_civil\",$this->fecha_creada,\"$this->medio_transporte\")";
		return Executor::doit($sql);
	}

	public function addClienteResidente(){
		$sql = "insert into persona (tipo_documento,documento,nombre,motivo,fecha_nac,giro,direccion,tipo,estado_civil,fecha_creada,medio_transporte,razon_social,nacionalidad,ocupacion,destino,telefono,celular,alergia) ";
		$sql .= "value ($this->tipo_documento,\"$this->documento\",\"$this->nombre\",\"$this->motivo\",\"$this->fecha_nac\",\"$this->giro\",\"$this->direccion\",5,\"$this->estado_civil\",$this->fecha_creada,\"$this->medio_transporte\",\"$this->razon_social\",\"$this->nacionalidad\",\"$this->ocupacion\",\"$this->destino\",\"$this->telefono\",\"$this->celular\",\"$this->alergia\")";
		return Executor::doit($sql);
	}

       

	public function add(){
		$sql = "insert into persona (tipo_documento,documento,nombre,giro,direccion,tipo,fecha_creada,nacionalidad,estado_civil,ocupacion,medio_transporte,destino,motivo) ";
		$sql .= "value ($this->tipo_documento,\"$this->documento\",\"$this->nombre\",\"$this->giro\",\"$this->direccion\",1,$this->fecha_creada,\"$this->nacionalidad\",\"$this->estado_civil\",\"$this->ocupacion\",\"$this->medio_transporte\",\"$this->destino\",\"$this->motivo\")";
		return Executor::doit($sql);
	}

	public function add001(){
		$sql = "insert into persona (tipo_documento,documento,nombre,direccion,tipo,fecha_creada,estado_civil) ";
		$sql .= "value ($this->tipo_documento,\"$this->documento\",\"$this->nombre\",\"$this->direccion\",1,$this->fecha_creada,\"$this->estado_civil\")";
		return Executor::doit($sql);
	}

	public function addClienteVenta(){
		$sql = "insert into persona (nombre,tipo,fecha_creada) ";
		$sql .= "value (\"$this->nombre\",3,$this->fecha_creada)";
		return Executor::doit($sql);
	}

	public function addClienteVentaV2(){
		$sql = "insert into persona (documento,nombre,direccion,tipo,fecha_creada) ";
		$sql .= "value (\"$this->documento\",\"$this->nombre\",\"$this->direccion\",3,$this->fecha_creada)";
		return Executor::doit($sql);
	}

	public function addProveedor(){
		$sql = "insert into persona (tipo_documento,documento,nombre,razon_social,direccion,tipo,fecha_creada) ";
		$sql .= "value ($this->tipo_documento,\"$this->documento\",\"$this->nombre\",\"$this->razon_social\",\"$this->direccion\",2,$this->fecha_creada)";
		return Executor::doit($sql); 
	}

	public function addTrabajador(){
		$sql = "insert into persona (tipo_documento,documento,nombre,giro,direccion,tipo,fecha_creada) ";
		$sql .= "value ($this->tipo_documento,\"$this->documento\",\"$this->nombre\",\"$this->giro\",\"$this->direccion\",4,$this->fecha_creada)";
		return Executor::doit($sql); 
	}

	public static function delById($id){ 
		$sql = "delete from ".self::$tablename." where id=$id";
		Executor::doit($sql);
	}
	public function del(){
		$sql = "delete from ".self::$tablename." where id=$this->id";
		Executor::doit($sql);
	}

// partiendo de que ya tenemos creado un objecto PersonaData previamente utilizamos el contexto
	public function update(){
		$sql = "update ".self::$tablename." set nombre=\"$this->nombre\",descripcion=\"$this->descripcion\",id_categoria=$this->id_categoria where id=$this->id";
		Executor::doit($sql); 
	}

	public function updateVip(){
		$sql = "update ".self::$tablename." set vip=$this->vip,limite=$this->limite where id=$this->id";
		Executor::doit($sql); 
	}

	public function updateContador(){
		$sql = "update ".self::$tablename." set contador=$this->contador where id=$this->id";
		Executor::doit($sql); 
	}

	public function updateclienteProceso(){
		$sql = "update ".self::$tablename." set tipo_documento=$this->tipo_documento,documento=\"$this->documento\",giro=\"$this->giro\",nombre=\"$this->nombre\",direccion=\"$this->direccion\",nacionalidad=\"$this->nacionalidad\",estado_civil=\"$this->estado_civil\",ocupacion=\"$this->ocupacion\",medio_transporte=\"$this->medio_transporte\",destino=\"$this->destino\",motivo=\"$this->motivo\" where id=$this->id";
		Executor::doit($sql);
	}

	public function updateclienteResidente(){
		$sql = "update ".self::$tablename." set tipo_documento=$this->tipo_documento,documento=\"$this->documento\",giro=\"$this->giro\",nombre=\"$this->nombre\",direccion=\"$this->direccion\",nacionalidad=\"$this->nacionalidad\",estado_civil=\"$this->estado_civil\",ocupacion=\"$this->ocupacion\",medio_transporte=\"$this->medio_transporte\",destino=\"$this->destino\",motivo=\"$this->motivo\",razon_social=\"$this->razon_social\",nacionalidad=\"$this->nacionalidad\",ocupacion=\"$this->ocupacion\",destino=\"$this->destino\",telefono=\"$this->telefono\",celular=\"$this->celular\",alergia=\"$this->alergia\" where id=$this->id";
		Executor::doit($sql);
	}

	public function updatecliente(){
		$sql = "update ".self::$tablename." set tipo_documento=$this->tipo_documento,documento=\"$this->documento\",giro=\"$this->giro\",nombre=\"$this->nombre\",razon_social=\"$this->razon_social\",fecha_nac=\"$this->fecha_nac\",direccion=\"$this->direccion\" where id=$this->id";
		Executor::doit($sql);
	}

	public function updateclientenuevo(){
		$sql = "update ".self::$tablename." set tipo_documento=$this->tipo_documento,documento=\"$this->documento\",nombre=\"$this->nombre\",estado_civil=\"$this->estado_civil\",giro=\"$this->giro\",direccion=\"$this->direccion\",fecha_nac=\"$this->fecha_nac\",motivo=\"$this->motivo\" where id=$this->id";
		Executor::doit($sql);
	}

	public function updateProveedor(){
		$sql = "update ".self::$tablename." set tipo_documento=$this->tipo_documento,documento=\"$this->documento\",nombre=\"$this->nombre\",razon_social=\"$this->razon_social\",fecha_nac=\"$this->fecha_nac\",direccion=\"$this->direccion\" where id=$this->id";
		Executor::doit($sql);
	}

	public function updateTrabajador(){
		$sql = "update ".self::$tablename." set tipo_documento=$this->tipo_documento,documento=\"$this->documento\",nombre=\"$this->nombre\",giro=\"$this->giro\",fecha_nac=\"$this->fecha_nac\",direccion=\"$this->direccion\" where id=$this->id";
		Executor::doit($sql);
	}

	public function update_pago(){
		$sql = "update ".self::$tablename." set pago=1 where id=$this->id";
		Executor::doit($sql);
	}
	
	public function update_estado(){
		$sql = "update ".self::$tablename." set estado=0 where id=$this->id";
		Executor::doit($sql);
	}

	public function update_del(){
		$sql = "update ".self::$tablename." set pago=0 where id=$this->id";
		Executor::doit($sql);
	}

	

	public static function getById($id){
		$sql = "select * from ".self::$tablename." where id=$id";
		$query = Executor::doit($sql);
		return Model::one($query[0],new PersonaData());

	}


	public static function getAll(){
		$sql = "select * from ".self::$tablename." where tipo=1 and estado=1  group by documento limit 200";
		$query = Executor::doit($sql);
		return Model::many($query[0],new PersonaData());
	}

	public static function getAllPago(){
		$sql = "select * from ".self::$tablename." where pago=0 and tipo=4 group by documento";
		$query = Executor::doit($sql);
		return Model::many($query[0],new UserData());
	}
 
	public static function getProveedor(){
		$sql = "select * from ".self::$tablename." where tipo=2 group by documento";
		$query = Executor::doit($sql);
		return Model::many($query[0],new PersonaData());
	}

	public static function getTrabajador(){
		$sql = "select * from ".self::$tablename." where tipo=4 group by documento";
		$query = Executor::doit($sql);
		return Model::many($query[0],new PersonaData());
	}

	public static function getResidente(){
		$sql = "select * from ".self::$tablename." where tipo=5 group by documento";
		$query = Executor::doit($sql);
		return Model::many($query[0],new PersonaData());
	}
 

	public static function getLike($q){
		$sql = "select * from ".self::$tablename." where nombre like '%$q%' or documento like '%$q%'";
		$query = Executor::doit($sql);
		return Model::one($query[0],new PersonaData());

	}

	public static function getLikeDni($documento){
		$sql = "select * from ".self::$tablename." where documento=\"$documento\" ";
		$query = Executor::doit($sql);
		return Model::one($query[0],new PersonaData());

	}

}


?>