<?php 
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once('../model/Conexion.php');

include "core/autoload.php";
include "core/app/model/CreditoData.php";
include "core/app/model/ClienteData.php";



$creditos=CreditoData::getAllCliente($_GET['cliente']);
if(@count($creditos)>2){
    $contar = 0;
}else{ $contar=1; }

 
echo json_encode($contar);
?>