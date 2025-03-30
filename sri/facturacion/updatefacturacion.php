<?php
require_once('../../model/Conexion.php');

include "../core/autoload.php";
include "../core/app/model/FacturacionData.php";

if(@count($_POST)>0){
	
	$nivel = FacturacionData::getById($_POST["id_factura"]);
	$nivel->fac_ele = $_POST["fac_ele"];
	$nivel->clave = $_POST["clave"];
	$nivel->entidad_cert = $_POST["entidad_cert"];
	$nivel->update();

	
$fac_ele = $_POST['fac_ele'];
$ruc = $_POST['ruc'];
if ($fac_ele == 2 or $fac_ele == 1) {
    if (is_uploaded_file($_FILES['files']['tmp_name'])) {
        $ruta_destino = "../certificados/beta/";
        $namefinal = $ruc . ".p12"; // linea nueva devuelve la cadena sin espacios al principio o al final
        $uploadfile = $ruta_destino . $namefinal;
        if (move_uploaded_file($_FILES['files']['tmp_name'], $uploadfile)) {

        	$nivel->certificado=$namefinal;
        	$nivel->update_image();

        }
    } else {

        
    }
}


print "<script>alert('Datos actualizados');</script>";
print "<script>window.location='../.././?View=Facturacion';</script>";


}


?>