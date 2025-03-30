<?php

	class Conexion {

		public static $db;
		public static $con;
		function Conexion(){
			$this->user="venticx";$this->pass="Gabriela*1";$this->host="localhost";$this->ddbb="ecuadorventa";
		} 


		function connect(){
			$con = new mysqli($this->host,$this->user,$this->pass,$this->ddbb);
			$con->query("set sql_mode=''");
			return $con;
		} 

		public static function getCon(){
			if(self::$con==null && self::$db==null){
				self::$db = new Conexion();
				self::$con = self::$db->connect();
			}
			return self::$con;
		}

		public function Conectar(){

			//Local
			/*$driver = 'mysql'; //mysql no cambiar
			$host = 'localhost'; //localhost
			$dbname = 'easypos'; //bdd
			$username ='root'; //usuario
			$passwd = ''; //contra*/


			//Produccion
			$driver = 'mysql'; //mysql no cambiar
			$host = 'localhost'; //localhost
			$dbname = 'ecuadorventa'; //bdd
			$username ='root'; //usuario
			$passwd = ''; //contra*/




			$server=$driver.':host='.$host.';dbname='.$dbname;

			try {

				$conexion = new PDO($server,$username,$passwd);
				//$conexion = exec("SET CHARACTER SET utf8");
				$conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

			} catch (Exception $e) {

				$conexion = null;
            	echo '<span class="label label-danger label-block">ERROR AL CONECTARSE A LA BASE DE DATOS, PRESIONE F5</span>';
            	exit();
			}


			return $conexion;

		}

	}
