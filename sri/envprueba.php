<?php 

$webrecepcion='https://celcer.sri.gob.ec/comprobantes-electronicos-ws/RecepcionComprobantesOffline?wsdl';

$contenido=file_get_contents('firmados/0712202201120423722400110011000000000021234567817.xml');


$parametros = array("xml" => $contenido);
try {

	$webservicerecepcion = new SoapClient($webrecepcion);
	$result= $webservicerecepcion->validarComprobante($parametros);
	print_r($result);
	
} catch (Soapfault $e) {
	echo $e->getMessage();
}
?>