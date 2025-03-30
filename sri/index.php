<?php
session_start();
require_once('../model/Conexion.php');

include "core/autoload.php";
include "core/app/model/VentaData.php";
include "core/app/model/ClienteData.php";
include "core/app/model/FacturacionData.php";
include "core/app/model/ParametroData.php";
include "core/app/model/ProcesoVentaData.php";
include "core/app/model/ProductoData.php";
header('Content-Type: text/html; charset=UTF-8');


class EnviarSunatModel {
    
    private $conexionn;
    
    public function __CONSTRUCT()
    {
        try
        {
            $this->conexionn = Database::Conectar();
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
    
    public function obtenerDatosVentaPorIdVenta($id_venta){
        try
        {
            $stm = $this->conexionn->prepare("SELECT * FROM tm_venta where id_venta = ?");
            $stm->execute(array($id_venta));
            $c = $stm->fetchAll(PDO::FETCH_OBJ);
            $stm->closeCursor();
            return $c;
            $this->conexionn=null;
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
    
    public function listarDetalleVenta($cod_vent)
    {
        try
        {
            $cod = $cod_vent;
            $stm = $this->conexionn->prepare("SELECT * FROM tm_detalle_venta WHERE id_venta = ? ");
            $stm->execute(array($cod));
            $c = $stm->fetchAll(PDO::FETCH_OBJ);
            foreach($c as $k => $d)
            {
                $c[$k]->{'Producto'} = $this->conexionn->query("SELECT nombre_prod,pres_prod FROM v_productos WHERE id_pres = ".$d->id_prod)
                ->fetch(PDO::FETCH_OBJ);
            }
            return $c;
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
    
    public function obtenerDatosClientePorIdCliente($id_cliente){
        try
        {
            $stm = $this->conexionn->prepare("SELECT * FROM tm_cliente where id_cliente = ?");
            $stm->execute(array($id_cliente));
            $c = $stm->fetchAll(PDO::FETCH_OBJ);
            $stm->closeCursor();
            return $c;
            $this->conexionn=null;
        }
        catch(Exception $e)
        {
            die($e->getMessage());
        }
    }
}

$venta = VentaData::getByIdUltimo();
if(@count($venta)>0){
    $id_venta= $venta->idventa;
}

$id_cliente = $_GET['id_cliente'];

$datosVenta = VentaData::getById($id_venta);
$igv = 0;
if(@count($datosVenta)>0){
    $numero_factura1 = $datosVenta->numero_venta;
    $numero_factura = $datosVenta->numero_comprobante;
    $serie = '001';
    $serie_clave = '001';
    $fecha = $datosVenta->fecha_venta;
    $fecha_vvv = $datosVenta->fecha_venta;
    $tipo = $datosVenta->tipo_comprobante;
    $m_bolsa = 0;
    $igv = '0.12';
    $total_sin_impuesto = $datosVenta->sumas;
}
$fecha1 = substr($fecha, 0, -9);
$fecha = date("d/m/Y", strtotime($fecha));


$nro_doc = "1";// tip0 de documento
$motivo = "1"; //codigo tipo motivo
$igv_1_18 = 1 + 0.12; // valor del 1.18 para calcular base del total
//0=IGV, 1=EXONERADO
if ($igv == 0){
    $tip = 1;
} else {
    $tip = 0;
}



$direcionn = "";
$datosCliente = ClienteData::getById($id_cliente);
if(@count($datosCliente)>0){
    $ruc = $datosCliente->numero_nit;
    $dni = $datosCliente->numero_nit;
    $razon_social = $datosCliente->nombre_cliente;
    $nombres = $datosCliente->nombre_cliente;
    $direcionn = $datosCliente->direccion_cliente;
}

$contar=strlen($dni);

if ($dni=='9999999999999'){
    $documento_usuario = $ruc;
    $tipo_documento_usuario = "07";
    $razon_social_usuario = $razon_social;
    $direccionnnn="NO";
} else if($contar<11){
    $documento_usuario = $dni;
    $tipo_documento_usuario = "05";
    $razon_social_usuario = $nombres;;
    $direccionnnn="NO";
}else  {
    $documento_usuario = $dni;
    $tipo_documento_usuario = "04";
    $razon_social_usuario = $nombres;;
    $direccionnnn=$direcionn;
}



$datosEmpresa=FacturacionData::getAllUltimo();
$datosParametro=ParametroData::getAllUltimo();

if(@count($datosEmpresa)>0){
    $fac_ele = $datosEmpresa->fac_ele;
    $clave = $datosEmpresa->clave;
    $usuariosol = $datosEmpresa->entidad_cert;
    $nombre_empresa = $datosParametro->nombre_empresa;
    $departamento = "Lima";
    $provincia = "Lima";
    $distrito = "Lima";
    $ruc1 = $datosParametro->numero_nit;
    $direccion = $datosParametro->direccion_empresa;
    $entidad_cert = 'SEC_DATA';
}


$tipodeenvio=1;
if ($fac_ele == 1) {
    $tipodeenvio=1; //BETA
}
if ($fac_ele == 2) {
    $tipodeenvio=2; //PRODUCCION
}

$cantidad1 = array();
$und_pro = array();
$precio_unitario = array();
$producto = array();
$codigo = array();

$sumador_total = 0;
$nums = 1;
$suma = 0;

$listaDetalleVenta = ProcesoVentaData::getVentaa($id_venta);
if(@count($listaDetalleVenta)>0){
    foreach($listaDetalleVenta as $d){

        if($d->cantidad > 0){
            $id_producto = $d->idproducto;
            $cantidad = $d->cantidad;
            $nombre_producto = $d->getProducto()->nombre_producto;
            $pres_prod = $d->getProducto()->nombre_producto;       
            $precio_venta = $d->precio_unitario;
            $precio_venta_f = number_format($precio_venta, 2); // Formateo variables
            $precio_venta_r = str_replace(",", "", $precio_venta_f); // Reemplazo las comas
            $precio_total = $precio_venta_r * $cantidad;
            $precio_total_f = number_format($precio_total, 2); // Precio total formateado
            $precio_total_r = str_replace(",", "", $precio_total_f); // Reemplazo las comas
            $sumador_total += $precio_total_r; // Sumador
            $suma = $suma + 1;
            $d = 0;
            $und_pro1 = "UND";
            $cantidad1[$nums] = $cantidad;
            $und_pro[$nums] = $und_pro1;
            $precio_unitario[$nums] = $precio_venta;
            $producto[$nums] = $pres_prod;
            $nombre_producto_array[$nums] = $nombre_producto;
            $codigo[$nums] = "P001"; //$codigo_producto
            $nums ++;
        }

    }
}

//TIPO 1 DE BD = TICKET
//TIPO 2 DE BD = FACTURA
//TIPO 3 DE BD = BOLETA
$sumador_total = $sumador_total;

if ($tipo == 2 or $tipo == 5 or $tipo == 6) {
    if ($tipo == 3) {
        $tipo_documento = "03"; // BOLETA
        $serie = "B".$serie;
    } 
    if ($tipo == 2) {
        $tipo_documento = "01"; // FACTURA
        $serie = "F".$serie;
    }
    if ($tipo == 1) {
        $tipo_documento = "02"; // TICKET
        $serie = "T".$serie;
    }
    if ($tipo == 5) {
        $tipo_documento = "05"; // NOTA DE DEBITO
    }
    if ($tipo == 6) {
        $tipo_documento = "04"; // NOTA DE CREDITO
    }
    
    $cabecera = array();
    // DATOS PARA LOS XML FACTURA/BOLETA/NOTA DE CREDITO/ NOTA DE DEBITO
    // EMISOR
    $cabecera["NRO_DOCUMENTO_EMPRESA"] = $ruc1;

    $f_dia = date("d", strtotime($fecha_vvv));
    $f_mes = date("m", strtotime($fecha_vvv));
    $f_anio = date("Y", strtotime($fecha_vvv));

    $secuencial = str_pad($numero_factura, 9, "0", STR_PAD_LEFT);

    $serie="001002";
    $codigo="12345678";
    
    $numero_factura1 = str_pad($numero_factura, 23, "0", STR_PAD_LEFT);

    
    $cadena=$f_dia.$f_mes.$f_anio.$tipo_documento.$ruc1.$tipodeenvio.$serie.$secuencial.$codigo.'1';



    $arrayCadena=str_split($cadena);
    $longitudCadena=strlen($cadena);
    $multiplo=2;

    $suma=0;
    for ($i=$longitudCadena; $i > 0; $i--) { 
        $suma += $arrayCadena[$i-1]*$multiplo;
        $multiplo++;
        if($multiplo>7){
            $multiplo=2;
        }

    }

    $modulo=$suma%11;
    $resultado=11-$modulo;

    if($resultado==11){
        $resultado=0;
    }
    if ($resultado==10) {
        $resultado=1;
    }
    
     $claveacceso= $cadena.$resultado;
    
    $cabecera["NRO_COMPROBANTE"] = $serie . "-" . $numero_factura1;
    $cabecera["SECUENCIA"] = $secuencial;
    $tipo_doc = $tipo_documento;
    $cabecera["FECHA_DOCUMENTO"] = $fecha;
    $cabecera["CLAVE_ACCESO"] = $claveacceso;
    $cabecera["FECHA_VTO"] = $fecha;
    $cabecera["COD_TIPO_DOCUMENTO"] = $tipo_documento;
    $cabecera["TOTAL_LETRAS"] = "";
    $cabecera["NRO_OTR_COMPROBANTE"] = "";
    $cabecera["NRO_GUIA_REMISION"] = "";
    $cabecera["TIPO_DOCUMENTO_EMPRESA"] = 6;
    $moneda = "DOLAR";
    $cabecera["RAZON_SOCIAL_EMPRESA"] = $nombre_empresa;
    $cabecera["NOMBRE_COMERCIAL_EMPRESA"] = $nombre_empresa;
    $cabecera["DEPARTAMENTO_EMPRESA"] = $departamento;
    $cabecera["PROVINCIA_EMPRESA"] = $provincia;
    $cabecera["DISTRITO_EMPRESA"] = $distrito;
    $cabecera["DIRECCION_EMPRESA"] = $direccion;
    $cabecera["CONTACTO_EMPRESA"] = "";
    $cabecera["COD_PAIS_CLIENTE"] = "EC";
    $cabecera["TIPODEENVIO"] = $tipodeenvio;
    $doc_emisor = 6;
    // Solo para NOTA DE CREDITO Y NOTA DE DEBITO
    $cabecera["NRO_DOCUMENTO_MODIFICA"] = $nro_doc;
    $cabecera["COD_TIPO_MOTIVO"] = $motivo;

    
    $r = "";
    if ($tipo == 6) {
        if ($motivo == "01") {
            $r = "ANULACION DE LA OPERACION";
        }
        if ($motivo == "02") {
            $r = "ANULACION POR ERROR EN EL RUC";
        }
        if ($motivo == "03") {
            $r = "CORRECION POR ERROR EN LA DESCRIPCION";
        }
        if ($motivo == "04") {
            $r = "DESCUENTO GLOBAL";
        }
        if ($motivo == "05") {
            $r = "DESCUENTO POR ITEM";
        }
        if ($motivo == "06") {
            $r = "DEVOLUCION TOTAL";
        }
        if ($motivo == "07") {
            $r = "DEVOLUCION POR ITEM";
        }
        if ($motivo == "08") {
            $r = "BONIFICACION";
        }
        if ($motivo == "09") {
            $r = "DISMINUCION EN EL VALOR";
        }
    }
    if ($tipo == 5) {
        if ($motivo == "01") {
            $r = "INTERES POR MORA";
        }
        if ($motivo == "02") {
            $r = "AUMENTO EN EL VALOR";
        }
        if ($motivo == "03") {
            $r = "PENALIDADES";
        }
    }
    $cabecera["DESCRIPCION_MOTIVO"] = $r;
    
    // DATOS DEL CLIENTE
    $cabecera["NRO_DOCUMENTO_CLIENTE"] = $documento_usuario;
    $cabecera["RAZON_SOCIAL_CLIENTE"] = $razon_social_usuario;
    $cabecera["COD_UBIGEO_CLIENTE"] = "";
    $cabecera["TIPO_DOCUMENTO_CLIENTE"] = $tipo_documento_usuario;
    $cabecera["DEPARTAMENTO_CLIENTE"] = "";
    $cabecera["PROVINCIA_CLIENTE"] = "";
    $cabecera["DISTRITO_CLIENTE"] = "";
    $cabecera["DIRECCION_CLIENTE"] = $direccionnnn;
    $cabecera["COD_PAIS_CLIENTE"] = "EC";
    $cabecera["COD_MONEDA"] = "DOLAR";
    $cabecera["TOTAL_ISC"] = 0;
    $cabecera["TOTAL_EXPORTACION"] = 0;
    $cabecera["TOTAL_GRATUITAS"] = 0;
    $cabecera["COD_TIPO_OPERACION"]=10;
    $cabecera["TOTAL_EXONERADAS"] = 0;
    $cabecera["TOTAL_INAFECTA"] = 0;
    $cabecera["TOTAL_OTR_IMP"] = 0;
    $total = round($sumador_total, 2);
    
    if ($tip == 0) {
        $cabecera["TOTAL_GRAVADAS"] = round($sumador_total / $igv_1_18, 2);
        $cabecera["TOTAL_IGV"] = round(($sumador_total / $igv_1_18) * $igv, 2);
        $cabecera["SUB_TOTAL"] = round($sumador_total / $igv_1_18, 2);
        $cabecera["TOTAL"] = round($sumador_total, 2);
        $cabecera["TOTAL_DESCUENTO"] = 0;
        $mto_igv = round(($sumador_total / $igv_1_18) * $igv, 2);
    }
    if ($tip == 1) {
        $cabecera["TOTAL_GRAVADAS"] = round($sumador_total / $igv_1_18, 2);
        $cabecera["TOTAL_IGV"] = "0.00";
        $cabecera["SUB_TOTAL"] = round($sumador_total, 2);
        $cabecera["TOTAL"] = round($sumador_total, 2);
        $cabecera["TOTAL_DESCUENTO"] = 0;
        $cabecera["TOTAL_EXONERADAS"] = round($sumador_total, 2);
        $mto_igv = 0;
    }
    
    // CODIGO QR
    
    /**
     * *** FACTURA: DATOS OBLIGATORIOS PARA EL CÓDIGO QR ****
     */
    /* RUC | TIPO DE DOCUMENTO | SERIE | NUMERO | MTO TOTAL IGV | MTO TOTAL DEL COMPROBANTE | FECHA DE EMISION |TIPO DE DOCUMENTO ADQUIRENTE | NUMERO DE DOCUMENTO ADQUIRENTE | */
    
  
    // CREACION DE XML DE DOCUMENTO FACTURA, BOLETA
    $doc = new DOMDocument();
    $doc->formatOutput = FALSE;
    $doc->preserveWhiteSpace = TRUE;
    $doc->encoding = 'utf-8';
    $nums1 = $nums - 1;
    if ($tipo == 2) {
        $xmlCPE = '<factura id="comprobante" version="1.0.0">
    <infoTributaria>
        <ambiente>' . $cabecera["TIPODEENVIO"] . '</ambiente>
        <tipoEmision>1</tipoEmision>
        <razonSocial>' . $cabecera["RAZON_SOCIAL_EMPRESA"] . '</razonSocial>
        <nombreComercial>' . $cabecera["NOMBRE_COMERCIAL_EMPRESA"] . '</nombreComercial>
        <ruc>' . $cabecera["NRO_DOCUMENTO_EMPRESA"] . '</ruc>
        <claveAcceso>' . $cabecera["CLAVE_ACCESO"] . '</claveAcceso>
        <codDoc>' . $cabecera["COD_TIPO_DOCUMENTO"] . '</codDoc>
        <estab>001</estab>
        <ptoEmi>002</ptoEmi>
        <secuencial>' . $cabecera["SECUENCIA"] . '</secuencial>
        <dirMatriz>' . $cabecera["DIRECCION_EMPRESA"] . '</dirMatriz>
    </infoTributaria>
    <infoFactura>
        <fechaEmision>' . $cabecera["FECHA_DOCUMENTO"] . '</fechaEmision>
        <dirEstablecimiento>' . $cabecera["DIRECCION_CLIENTE"] . '</dirEstablecimiento>
        <obligadoContabilidad>NO</obligadoContabilidad>
        <tipoIdentificacionComprador>' . $cabecera["TIPO_DOCUMENTO_CLIENTE"] . '</tipoIdentificacionComprador>
        <razonSocialComprador>' . $cabecera["RAZON_SOCIAL_CLIENTE"] . '</razonSocialComprador>
        <identificacionComprador>' . $cabecera["NRO_DOCUMENTO_CLIENTE"] . '</identificacionComprador>
        <totalSinImpuestos>' . $cabecera["SUB_TOTAL"] . '</totalSinImpuestos>
        <totalDescuento>' . $cabecera["TOTAL_DESCUENTO"] . '</totalDescuento>
        <totalConImpuestos>
            <totalImpuesto>
                <codigo>2</codigo>
                <codigoPorcentaje>2</codigoPorcentaje>
                <baseImponible>' . $cabecera["SUB_TOTAL"] . '</baseImponible>
                <valor>' . $cabecera["TOTAL_IGV"] . '</valor>
            </totalImpuesto>
        </totalConImpuestos>
        <propina>0.00</propina>
        <importeTotal>' . $cabecera["TOTAL"] . '</importeTotal>
        <moneda>' . $cabecera["COD_MONEDA"] . '</moneda>
    </infoFactura>
    <detalles>';
    
            //===========================================================
            // LISTA DE PRODUCTOS
            //===========================================================
            //nums = cantidad de productos
            for ($i = 1; $i <= $nums - 1; $i ++) {
                $cabecera["CANTIDAD_DET"] = number_format($cantidad1[$i], 2);
                $cabecera["UNIDAD_MEDIDA"] = $und_pro[$i];
                $cabecera["PRECIO_TIPO_CODIGO"] = "01";
                $cabecera["COD_TIPO_OPERACION"] = 10;
                $cabecera["POR_IGV"] = $igv;
                $cabecera["DESCRIPCION_DET"] = $producto[$i];
                $cabecera["NOMBRE_PRODUCTO_ARRAY"] = $nombre_producto_array[$i];
                
                $cabecera["CODIGO_DET"] = $codigo[$i];
                $cabecera["PRECIO_DET"] = round($precio_unitario[$i], 2);
                
                if ($tip == 0) {
                    $cabecera["IMPORTE_DET"] = round(($cantidad1[$i] * $precio_unitario[$i]) / $igv_1_18, 2);
                    $cabecera["IGV"] = round(($igv * $cantidad1[$i] * $precio_unitario[$i]) / $igv_1_18, 2);
                    $cabecera["PRECIO_SIN_IGV_DET"] = round($precio_unitario[$i] / $igv_1_18, 2);
                } 
                if ($tip == 1) { 
                    $cabecera["IMPORTE_DET"] = round(($cantidad1[$i] * $precio_unitario[$i]), 2);
                    $cabecera["IGV"] = "0.00";
                    $cabecera["PRECIO_SIN_IGV_DET"] = round($precio_unitario[$i], 2);
                }
                $xmlCPE = $xmlCPE . 
                '<detalle>
            <codigoPrincipal>' . $cabecera["CODIGO_DET"] . '</codigoPrincipal>
            <descripcion>' . $cabecera["DESCRIPCION_DET"] . '</descripcion>
            <cantidad>' . $cabecera["CANTIDAD_DET"] . '</cantidad>
            <precioUnitario>' . $cabecera["PRECIO_SIN_IGV_DET"] . '</precioUnitario>
            <descuento>0.00</descuento>
            <precioTotalSinImpuesto>' . $cabecera["IMPORTE_DET"] . '</precioTotalSinImpuesto>
            <impuestos>
                <impuesto>
                    <codigo>2</codigo>
                    <codigoPorcentaje>2</codigoPorcentaje> 
                    <tarifa>12</tarifa>
                    <baseImponible>' . $cabecera["IMPORTE_DET"] . '</baseImponible>
                    <valor>' . $cabecera["IGV"] . '</valor>
                </impuesto>
            </impuestos>
        </detalle>';
            }
            $xmlCPE = $xmlCPE . 
        '</detalles>
    <infoAdicional>
        <campoAdicional nombre="OBSERVACION">CONSUMO</campoAdicional>
    </infoAdicional>
</factura>';
}
if ($tipo == 6) { // XML Nota de Credito
        
}

if ($tipo == 5) { // XML Nota de Débito
       
}




 if ($tipo!=3){


        $doc->loadXML($xmlCPE);
        
        // GUARDAR DOCUMENTO XML EN facturas-sin-firmar
        $doc->save("generados/$claveacceso.XML");
        chmod("generados/$claveacceso.XML", 0777);
        // FIRMA

        $nivel = VentaData::getById($id_venta);
         $nivel->claveacceso = $claveacceso;
         $nivel->updateclaveacceso();

         
        if ($fac_ele == 2) {
            $nombre_certificado = $ruc1.'.p12';
            $clave_certificado = $clave;
            $entidad_certificado = $entidad_cert;
        }
        if ($fac_ele == 1) {
            $nombre_certificado = $ruc1.'.p12';
            $clave_certificado = $clave;
            $entidad_certificado = $entidad_cert;
            // $rutas['pass_firma'] = $clave;
        }


        exec("java -Dfile.encoding=UTF-8 -jar libreria/QuijoteLuiFirmador/dist/QuijoteLuiFirmador-2.4.jar C:\\xampp\\htdocs\\ECUADOR\\ventas\\ventas\\sri\\generados\\".$claveacceso.".xml C:\\xampp\\htdocs\\ECUADOR\\ventas\\ventas\\sri\\firmados C:\\xampp\\htdocs\\ECUADOR\\ventas\\ventas\\sri\\certificados\\beta\\clarainesactivo.p12 MINDIOLA8888 SEC_DATA", $val);

    
    }
}


?>


<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Enviando a SRI</title>
</head>
<body>
    <?php 
    if ($tipo== 2){
    ?>
    <img src="core/img/sunat.png"  width="100" height="100">
    <?php } ?>
    
    <img src="core/img/loading.gif"  width="100" height="100">
    
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
    <script>
        $(document).ready(function(){
            load(1);        
        });
      
        function load(id){
            <?php 
            if ($tipo== 2){
            ?>
            var fac = '<?php echo $claveacceso;?>' + '.xml';
            var claveacceso = '<?php echo $claveacceso;?>';
            var id_venta = '<?php echo $id_venta;?>';
            $.ajax({
                type: "GET",
                url: "enviar_sri.php",
                data: "archivo=" + fac + "&clave="+ claveacceso+ "&id_venta="+ id_venta,
                success: function(datos){
                    alert('Datos enviados a SRI Satisfactoriamente'+datos);
                },
                error: function(jqXHR, textStatus, errorThrown){
                    console.log(errorThrown + ' ' + textStatus);
                    alert('Error ' + errorThrown + ' ' + textStatus);
                } 
            }); 

            var link = '../reportes/Factura.php?venta='+<?php echo $id_venta;?>+'&claveacceso='+claveacceso;
            window.location.href = link; 
            <?php  }else{ ?>
            var link = '../reportes/TicketV.php?venta='+<?php echo $id_venta;?>;
            window.location.href = link;  
            <?php  };?>
        }  
   </script>
  
</body>
</html>