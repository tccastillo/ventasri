<?php 

$webautoriza='https://celcer.sri.gob.ec/comprobantes-electronicos-ws/AutorizacionComprobantesOffline?wsdl';

$parametrosautoriza= array("claveAccesoComprobante" => "0712202201120423722400110010020000000031234567812");


try {

	$webserviceautorizacion = new SoapClient($webautoriza);
	$result= $webserviceautorizacion->autorizacionComprobante($parametrosautoriza);
	print_r($result);
	
} catch (Soapfault $e) {
	echo $e->getMessage();
}
?>