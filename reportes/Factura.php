<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

  require 'PHPMailer/src/Exception.php';
  require 'PHPMailer/src/PHPMailer.php';
  require 'PHPMailer/src/SMTP.php';

require_once('../model/Conexion.php');
include "../sri/core/autoload.php";
include "../sri/core/app/model/VentaData.php";
include "../sri/core/app/model/ClienteData.php";
include "../sri/core/app/model/FacturacionData.php";

$ventaaa=VentaData::getById($_GET['venta']);
$clienteee=ClienteData::getById($ventaaa->idcliente);
$faturacionn=FacturacionData::getAllUltimo();

if($_GET['claveacceso']!=''){
    $claveacces=$_GET['claveacceso'];
}else{
    $claveacces='';
}
session_start();
$usuario = $_SESSION['user_name'];
  require('fpdf/fpdf.php');
  $idventa =  base64_decode(isset($_GET['venta']) ? $_GET['venta'] : '');
  try
  {
  
  function __autoload($className){
            $model = "../model/". $className ."_model.php";
            $controller = "../controller/". $className ."_controller.php";

           require_once($model);
           require_once($controller);
    }
 
  
    $objVenta = new Venta();
 
    if($idventa == ""){
      $detalle = $objVenta->Imprimir_Ticket_DetalleVenta('0');
      $datos = $objVenta->Imprimir_Ticket_Venta('0');
    } else {
      $detalle = $objVenta->Imprimir_Ticket_DetalleVenta($idventa);
      $datos = $objVenta->Imprimir_Ticket_Venta($idventa);
    }

    foreach ($datos as $row => $column) {

      $tipo_comprobante = $column["p_tipo_comprobante"];
      $empresa = $column["p_empresa"];
      $propietario = $column["p_propietario"];
      $direccion = $column["p_direccion"];
      $nit = $column["p_numero_nit"];
      $fecha_resolucion = $column["p_fecha_resolucion"];
      $numero_resolucion_fact = $column["p_numero_resolucion_fact"];
      $numero_resolucion = $column["p_numero_resolucion"];
      $serie = $column["p_serie"];
      $numero_comprobante = $column["p_numero_comprobante"];
      $empleado = $column["p_empleado"];
      $numero_venta = $column["p_numero_venta"];
      $fecha_venta = $column["p_fecha_venta"];
      $subtotal = $column["p_subtotal"];
      $exento = $column["p_exento"];
      $descuento = $column["p_descuento"];
      $total = $column["p_total"];
      $numero_productos = $column["p_numero_productos"];
    $tipo_pago = $column["p_tipo_pago"];
    $efectivo = $column["p_pago_efectivo"];
    $pago_tarjeta = $column["p_pago_tarjeta"];
    $numero_tarjeta = $column["p_numero_tarjeta"];
    $tarjeta_habiente = $column["p_tarjeta_habiente"];
    $cambio = $column["p_cambio"];
    $moneda = $column["p_moneda"];
    $estado = $column["p_estado"];
    $cliente= $column["p_cliente"];
    $cliente_nit = $column["p_numero_nit_C"];
    $direccion_cliente = $column["p_direccion_cliente"];
    $desde = $column["p_desde"];
    $hasta = $column["p_hasta"];
    }

    $nit =  $nit;
    $cliente_nit =  $cliente_nit;
  $numero_tarjeta = substr($numero_tarjeta,0,4).'-XXXX-XXXX-'.substr($numero_tarjeta,12,16);

  if($cliente == ""):
    $cliente = 'CONSUMIDOR FINAL';
  endif;

  if($cliente_nit == ""):
    $cliente_nit = '';
  endif;

  if($direccion_cliente == ""):
    $direccion_cliente = '';
  endif;

  $numero_cotizacion='0000000000000000000';

    $pdf = new FPDF('P','mm','Letter');
    $pdf->AddPage();
    $pdf->AliasNbPages();
    $pdf->SetFont('Arial','B',16);

    $pdf->setXY(8,45);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(85,53,'',1,0,'C',1);

    $pdf->setXY(100,6);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(110,92,'',1,0,'C',1);

//LOGO

    $pdf->Image('img/logo2.png', 15, 2, 36, 42,'PNG');

//IZQUIERDA
    $pdf->setXY(10,48);
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(70,8,$empresa);

    $pdf->setXY(10,60);
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(20,8,'Dir. matriz: ');
    $pdf->SetFont('Arial','',8);
    $pdf->Cell(37,8,$direccion);

    $pdf->setXY(10,70);
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(20,8,'Dir. Sucursal: ');
    $pdf->SetFont('Arial','',8);
    $pdf->Cell(37,8,$direccion);

    $pdf->setXY(10,80);
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(40,8,'Contribuyente Especial: ');
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(37,8,'NO');

    $pdf->setXY(10,88);
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(59,8,'OBLIGADO A LLEVAR CONTABILIDAD: ');
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(37,8,'NO');

//DERECHA
    $pdf->setXY(103,8);
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(12,8,'RUC : ');
    $pdf->SetFont('Arial','B',9);
    $pdf->Cell(37,8,$nit);

    $pdf->setXY(103,14);
    $pdf->SetFont('Arial','B',11);
    $pdf->Cell(12,8,'FACTURA');

    $numero_facturaa = str_pad($numero_comprobante, 9, "0", STR_PAD_LEFT);
    $pdf->setXY(103,20);
    $pdf->SetFont('Arial','B',9);
    $pdf->Cell(12,8,'No. ');
    $pdf->SetFont('Arial','B',10);
    $pdf->Cell(37,8,'001-100-'.$numero_facturaa);

    $pdf->setXY(103,32);
    $pdf->SetFont('Arial','',10);
    $pdf->Cell(12,8,'NUMERO DE AUTORIZACION');

    $pdf->setXY(103,38);
    $pdf->SetFont('Arial','',10);
    $pdf->Cell(12,8,$claveacces);

    $pdf->setXY(103,50);
    $pdf->SetFont('Arial','B',9);
    $pdf->Cell(70,8,'FECHA Y HORA DE AUTORIZACION: ');
    $pdf->SetFont('Arial','',10);
    $pdf->Cell(37,8,$ventaaa->fecha_venta);

    if($faturacionn->fac_ele==1){ $factuecho='PRUEBAS';}else{ $factuecho='PRODUCCION';}
    $pdf->setXY(103,62);
    $pdf->SetFont('Arial','B',9);
    $pdf->Cell(30,8,'AMBIENTE ');
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(37,8,$factuecho);

    $pdf->setXY(103,68);
    $pdf->SetFont('Arial','B',9);
    $pdf->Cell(30,8,'EMISION ');
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(37,8,'NORMAL');

    $pdf->setXY(103,80);
    $pdf->SetFont('Arial','B',12);
    $pdf->Cell(90,8,'CLAVE DE ACCESO ');

    $pdf->setXY(103,86);
    $pdf->SetFont('Arial','',10);
    $pdf->Cell(90,8,$claveacces);


//CLIENTE DATOS

    $pdf->setXY(8,102);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(202,26,'',1,0,'C',1);

    $pdf->setXY(10,103);
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(65,8,'Razon Social / Nombres y Apellidos: ');
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(75,8,$cliente);
    $pdf->Cell(20,8,'RUC / CI: ');
    $pdf->Cell(50,8,$cliente_nit);

    $pdf->setXY(10,110);
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(30,8,'Fecha Emision: ');
    $pdf->Cell(75,8,$ventaaa->fecha_venta);

    $pdf->setXY(10,117);
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(30,8,'Direccion: ');
    $pdf->Cell(95,8,$direccion_cliente);
    $pdf->Cell(20,8,'Guia: ');
    $pdf->Cell(50,8,'');
    
//PRODUCTOS


    $pdf->Ln(15);
    $pdf->setX(8);
    $pdf->SetFillColor(172,172,172);
    $pdf->Cell(23,5,'Cod. principal',1,0,'L',1);
    $pdf->Cell(15,5,'Cant',1,0,'L',1);
    $pdf->Cell(65,5,'Descripcion',1,0,'L',1);
    $pdf->Cell(30,5,'Detalle adicional',1,0,'C',1);
    $pdf->Cell(23,5,'Precio unitario',1,0,'C',1);
    $pdf->Cell(23,5,'Descuento',1,0,'C',1);
    $pdf->Cell(23,5,'Total',1,0,'C',1);
    $pdf->SetFillColor(255,255,255);
    $pdf->Ln(5);

    $item = 0;
    while($row = $detalle->fetch(PDO::FETCH_ASSOC)) {
     $item = $item + 1;
      $pdf->setX(8);
        $pdf->Cell(23,5,$row["cantidad"],1,0,'L',1);
        $pdf->Cell(15,5,$row["cantidad"],1,0,'L',1);
        $pdf->Cell(65,5,$row["descripcion"],1,0,'L',1);
        $pdf->Cell(30,5,'',1,0,'C',1);
        $pdf->Cell(23,5,$row["precio_unitario"],1,0,'C',1);
        $pdf->Cell(23,5,$descuento,1,0,'C',1);
        $pdf->Cell(23,5,$row["importe"],1,0,'C',1);
        $pdf->Ln(5);
        $get_Y = $pdf->GetY();
    }


//SUBTOTAL

    $pdf->setXY(8,$get_Y+1);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(120,26,'',1,0,'C',1);

    

//IZQUIERDA

    $pdf->setXY(8,$get_Y+1);
    $pdf->SetFont('Arial','',9);
    $pdf->Cell(120,8,'INFORMACION ADICIONAL ',1,0,'C',1);

//DERECHA

    $pdf->setXY(134,$get_Y+1);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(46,5,'SUBTOTAL 12%',1,0,'',1);
    $pdf->Cell(30,5,$ventaaa->sumas,1,0,'R',1);

    $pdf->setXY(134,$get_Y+6);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(46,5,'SUBTOTAL 0%',1,0,'',1);
    $pdf->Cell(30,5,$exento,1,0,'R',1);

    $pdf->setXY(134,$get_Y+11);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(46,5,'SUBTOTAL No sujeto de IVA',1,0,'',1);
    $pdf->Cell(30,5,'0.00',1,0,'R',1);

    $pdf->setXY(134,$get_Y+16);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(46,5,'SUBTOTAL Excento de IVA',1,0,'',1);
    $pdf->Cell(30,5,'0.00',1,0,'R',1);

    $pdf->setXY(134,$get_Y+21);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(46,5,'SUBTOTAL SIN IMPUESTOS',1,0,'',1);
    $pdf->Cell(30,5,$ventaaa->total-$ventaaa->iva,1,0,'R',1);

    $pdf->setXY(134,$get_Y+26);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(46,5,'TOTAL Descuento',1,0,'',1);
    $pdf->Cell(30,5,$descuento,1,0,'R',1);

    $pdf->setXY(134,$get_Y+31);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(46,5,'ICE',1,0,'',1);
    $pdf->Cell(30,5,'0.00',1,0,'R',1);

    $pdf->setXY(134,$get_Y+36);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(46,5,'IVA 12%',1,0,'',1);
    $pdf->Cell(30,5,number_format($ventaaa->iva,2,'.',','),1,0,'R',1);

    $pdf->setXY(134,$get_Y+41);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(46,5,'IRBPNR',1,0,'',1);
    $pdf->Cell(30,5,'0.00',1,0,'R',1);

    $pdf->setXY(134,$get_Y+46);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(46,5,'Valor Total',1,0,'',1);
    $pdf->Cell(30,5,number_format($ventaaa->total,2,'.',','),1,0,'R',1);


// FORMA DE PAGO

    

    $pdf->setXY(8,$get_Y+52);
    $pdf->SetFont('Arial','B',9);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(40,5,'Forma Pago',1,0,'C',1);
    $pdf->Cell(30,5,'Valor',1,0,'C',1);
    $pdf->Cell(30,5,'Plazo',1,0,'C',1);
    $pdf->Cell(20,5,'Tiempo',1,0,'C',1);

    $pdf->setXY(8,$get_Y+57);
    $pdf->SetFont('Arial','',8);
    $pdf->SetFillColor(255,255,255);
    $pdf->Cell(40,8,'SIN UTILIZACION DEL ',1,0,'',1);
    $pdf->Cell(30,8,number_format($ventaaa->total,2,'.',','),1,0,'C',1);
    $pdf->Cell(30,8,'',1,0,'C',1);
    $pdf->Cell(20,8,'',1,0,'C',1);

    $pdf->setXY(8,$get_Y+63);
    $pdf->SetFont('Arial','',8);
    $pdf->Cell(40,2,'SISTEMA FINACIERO');


    $pdf->setXY(8,$get_Y+78);
    $pdf->SetFont('Arial','B',7);
    $pdf->Cell(120,2,'Hasta el 29 de Noviembre Incorporate a la Facturacion Electronica certificate en www.sri.gob.ec. Para mayor informacion llama al 1700 774 774 (1700 SRI SRI).');
    $pdf->setXY(8,$get_Y+82);
    $pdf->Cell(120,2,'Recuerde estar al dia en sus Obligaciones Tributarias.');



      $pdf->Output('F', '../sri/facturas/Factura_001-100-'.$numero_facturaa.'.pdf');


  } catch (Exception $e) { ?>

    <script>
            var link = 'TicketV.php?venta='+<?php echo $_GET['venta'];?>;
            window.location.href = link;    
  
</script>

  <?php } ?>
<script>
            var link = 'TicketV.php?venta='+<?php echo $_GET['venta'];?>;
            window.location.href = link;    
  
</script>