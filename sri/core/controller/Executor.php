<?php

class Executor {

	public static function doit($sql){
		$con = Conexion::getCon();
		if(Core::$debug_sql){
			print "<pre>".$sql."</pre>";
		}
		return array($con->query($sql),$con->insert_id);
	}
}
?>