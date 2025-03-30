
<?php 
header('Content-Type: text/html; charset=UTF-8');

require_once('../model/Conexion.php');

include "core/autoload.php";
include "core/app/model/VentaData.php";
include "core/app/model/ClienteData.php";
include "core/app/model/FacturacionData.php";
include "core/app/model/ParametroData.php";
include "core/app/model/ProcesoVentaData.php";
include "core/app/model/ProductoData.php";

$datosEmpresa=FacturacionData::getAllUltimo();
if(@count($datosEmpresa)>0){
    $fac_ele = $datosEmpresa->fac_ele;
}

if ($fac_ele == 1) {
	$webautoriza='https://celcer.sri.gob.ec/comprobantes-electronicos-ws/AutorizacionComprobantesOffline?wsdl';
    //BETA
}else if ($fac_ele == 2) {
	$webautoriza='https://cel.sri.gob.ec/comprobantes-electronicos-ws/AutorizacionComprobantesOffline?wsdl';
	     //PRODUCCION
};

$parametrosautoriza= array("claveAccesoComprobante" => $_GET['fac']);
$imprime=array();


try {

	$webserviceautorizacion = new SoapClient($webautoriza);
	$autoriza= $webserviceautorizacion->autorizacionComprobante($parametrosautoriza);
	$respuesta=$autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->estado;
	$imprime[0]=1;

	if ($respuesta==='AUTORIZADO') {
		$imprime[1]=$respuesta;
		$claveaut= $autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->numeroAutorizacion;

		$xml = new DOMDocument("1.0", "UTF-8");
		$xml->formatOutput=true;

		$etqautoriza=$xml->createElement("autorizacion");
		$xml->appendChild($etqautoriza);

			$etqestado=$xml->createElement("estado", $autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->estado);
			$etqautoriza->appendChild($etqestado);
			$etqnumero=$xml->createElement("numeroAutorizacion", $claveaut);
			$etqautoriza->appendChild($etqnumero);
			$etqfecha=$xml->createElement("fechaAutorizacion", $autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->fechaAutorizacion);
			$etqautoriza->appendChild($etqfecha);
			$etqfecha=$xml->createElement("ambiente", $autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->ambiente);
			$etqautoriza->appendChild($etqfecha);
			$etqfecha=$xml->createElement("comprobante", $autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->comprobante);
			$etqautoriza->appendChild($etqfecha);

			$xml->save("autorizados/".$claveaut.".xml");

	}else{
		
		$imprime[1]='RECHAZADO';
		$imprime[2]= $autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->mensajes->mensaje->mensaje;
		
		$claveaut=$autoriza->RespuestaAutorizacionComprobante->claveAccesoConsultada;
		$estadoo=$autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->estado;

		$xml = new DOMDocument("1.0", "UTF-8");
		
		$xml->preserveWhiteSpace = false;

		$etqautoriza=$xml->createElement("autorizacion");
		$xml->appendChild($etqautoriza);
 
		$etqestado=$xml->createElement("estado", $autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->estado);
			$etqautoriza->appendChild($etqestado);
			$etqnumero=$xml->createElement("numeroAutorizacion", $claveaut);
			$etqautoriza->appendChild($etqnumero);
			$etqfecha=$xml->createElement("fechaAutorizacion", $autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->fechaAutorizacion);
			$etqautoriza->appendChild($etqfecha);
			$etqfecha=$xml->createElement("ambiente", $autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->ambiente);
			$etqautoriza->appendChild($etqfecha);
			$etqfecha=$xml->createElement("comprobante", $autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->comprobante);
			$etqautoriza->appendChild($etqfecha);

			$etqmensajes=$xml->createElement("mensajes");
			$etqautoriza->appendChild($etqmensajes);

			$etqmensaje=$xml->createElement("mensaje" ,$autoriza->RespuestaAutorizacionComprobante->autorizaciones->autorizacion->mensajes->mensaje->mensaje);
			$etqmensajes->appendChild($etqmensaje);



			$xml->formatOutput=true;
			$xml->save("noautorizados/".$claveaut.".xml");

	}
	echo json_encode($imprime);
	
} catch (Soapfault $e) {
	$imprime[0]='ERROR DE ENVIO';
	echo json_encode($imprime);
};
?>