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

if($_GET['venta']>0){
	$idid_venta=$_GET['venta'];
}else{
	$idid_venta =  base64_decode($_GET['venta']);
}
$ventaaa=VentaData::getById($idid_venta);
$clienteee=ClienteData::getById($ventaaa->idcliente);

session_start();
$usuario = $_SESSION['user_name'];
	require('ClassTicket.php');
	$idventa =  $idid_venta;
	try
	{
  
	function __autoload($className){
            $model = "../model/". $className ."_model.php";
            $controller = "../controller/". $className ."_controller.php";

           require_once($model);
           require_once($controller);
    }
 
  
    $objVenta = new Venta();
 
    
    	$detalle = $objVenta->Imprimir_Ticket_DetalleVenta($idid_venta);
    	$datos = $objVenta->Imprimir_Ticket_Venta($idid_venta);
    

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
 

	$pdf = new TICKET('P','mm',array(76,297));
	$pdf->AddPage();


	if($tipo_comprobante == '1')
	{
		$pdf->SetFont('Arial', '', 12);
		$pdf->SetAutoPageBreak(true,1);

		include('../includes/ticketheader.inc.php');

		$pdf->SetFont('Arial', '', 9.2); 
		$pdf->Text(2, $get_YH + 2, '------------------------------------------------------------------');
		$pdf->SetFont('Arial', 'B', 8.5);
		$pdf->Text(3.8, $get_YH  + 5, 'TICKET '.$serie);
		$pdf->Text(45, $get_YH  + 5, 'NO. '.$numero_comprobante);
		$pdf->SetFont('Arial', '', 8.5);
		$pdf->Text(3.8, $get_YH  + 10, 'FECHA EMISION : '.$fecha_venta);
		$pdf->Text(3.8, $get_YH + 15, 'COMPUTADORA No.: 1');
		$pdf->Text(40, $get_YH + 15, 'CAJERO : '.$usuario);
		$pdf->Text(3.8, $get_YH + 20, 'TRANSACCION.: '.$numero_venta);
		$pdf->SetXY(3.8,$get_YH + 22);
		$pdf->SetFont('Arial', '', 7.8);
		$pdf->MultiCell(68, 4.2, 'Nombre: '.$cliente, 0,'L',0 ,1);
		$pdf->SetXY(3.8,$get_YH + 26);
		$pdf->MultiCell(68, 4.2, 'Documento: '.$cliente_nit, 0,'L',0 ,1);
		$pdf->SetXY(3.8,$get_YH + 30);
		$pdf->MultiCell(68, 4.2, 'Direccion: '.$direccion_cliente, 0,'L',0 ,1);
		$pdf->SetFont('Arial', '', 9.2);
		$pdf->Text(2, $get_YH + 40.5, '------------------------------------------------------------------');



 		$get_YH2 = $pdf->GetY();
 		
		$pdf->SetXY(2,$get_YH2 + 8);
		$pdf->SetFillColor(255,255,255);
		$pdf->SetFont('Arial','B',8.5);
		$pdf->Cell(13,4,'Cantid',0,0,'L',1);
		$pdf->Cell(28,4,'Descripcion',0,0,'L',1);
		$pdf->Cell(16,4,'Precio',0,0,'L',1);
		$pdf->Cell(16,4,'Precio',0,0,'L',1);
		$pdf->Cell(12,4,'Descuento',0,0,'L',1);
		$pdf->SetFont('Arial','',8.5);
		$pdf->Text(2, $get_YH2 + 14, '-----------------------------------------------------------------------');
		$pdf->Ln(6);
		$item = 0;
		while($row = $detalle->fetch(PDO::FETCH_ASSOC)) {
		 $item = $item + 1;
			$pdf->setX(1.1);
			$pdf->Cell(13,4,$row['cantidad'],0,0,'L');
			$pdf->Cell(28,4,$row['descripcion'],0,0,'L',1);
			$pdf->Cell(16,4,$row['precio_unitario'],0,0,'L',1);
			$pdf->Cell(16,4,$row['descuento'],0,0,'L',1);
			$pdf->Cell(12,4,$row['importe'],0,0,'L',1);
			$pdf->Ln(4.5);
			$get_Y = $pdf->GetY();
		}
		$pdf->Text(2, $get_Y+1, '-----------------------------------------------------------------------');
		$pdf->SetFont('Arial','B',8.5);
		$pdf->Text(4,$get_Y + 5,'G = GRAVADO');
		$pdf->Text(30,$get_Y + 5,'E = EXENTO');

		$pdf->Text(4,$get_Y + 10,'SUBTOTAL 12%:');
		$pdf->Text(57,$get_Y + 10,number_format($ventaaa->sumas,2,'.',','));
		$pdf->Text(4,$get_Y + 15,'SUBTOTAL 0% :');
		$pdf->Text(57,$get_Y + 15,$exento);
		$pdf->Text(4,$get_Y + 20,'TOTAL SIN IMPUESTOS :');
		$pdf->Text(57,$get_Y + 20,number_format(($ventaaa->total+$descuento)-$ventaaa->iva,2,'.',','));
		$pdf->Text(4,$get_Y + 25,'DESCUENTO :');
		$pdf->Text(56,$get_Y + 25,'-'.$descuento);
		$pdf->Text(4,$get_Y + 30,'IVA 12% :');
		$pdf->SetFont('Arial','B',8.5);
		$pdf->Text(57,$get_Y + 30,number_format($ventaaa->iva,2,'.',','));

		$pdf->Text(4,$get_Y + 35,'TOTAL A PAGAR :');
		$pdf->SetFont('Arial','B',8.5);
		$pdf->Text(57,$get_Y + 35,number_format($ventaaa->total,2,'.',','));

		$pdf->Text(2, $get_Y+38, '-----------------------------------------------------------------------');
		$pdf->Text(4,$get_Y + 41,'Numero de Productos :');
		$pdf->Text(57,$get_Y + 41,$numero_productos);

		if($tipo_pago == 'EFECTIVO'){

		$pdf->Text(24,$get_Y + 45,'Efectivo :');
		$pdf->Text(57,$get_Y + 45,$efectivo);
		$pdf->Text(24,$get_Y + 49,'Cambio :');
		$pdf->Text(57,$get_Y + 49,$cambio);


		$pdf->Text(2, $get_Y+52, '-----------------------------------------------------------------------');
		$pdf->SetFont('Arial','BI',8.5);
		$pdf->Text(3, $get_Y+57, 'Precios en : '.$moneda);
		if($estado == '2'):
			$pdf->Text(3, $get_Y+60, 'Esta venta ha sido al credito');
			$pdf->SetFont('Arial','B',8.5);
		endif;
		$pdf->SetFont('Arial','B',8.5);
		$pdf->Text(19, $get_Y+67, 'GRACIAS POR SU COMPRA');
		$pdf->SetFillColor(0,0,0);
		$pdf->Code39(9,$get_Y+69,$numero_venta,1,5);
		$pdf->Text(28, $get_Y+79, '*'.$numero_venta.'*');

		

		

	} else if ($tipo_pago == 'TARJETA'){

		$pdf->Text(20,$get_Y + 45,'No. Tarjeta :');
			$pdf->Text(40,$get_Y + 45,$numero_tarjeta);
			$pdf->Text(23,$get_Y + 50,'Debitado :');
			$pdf->Text(57,$get_Y + 50,$total);

			$pdf->Text(2, $get_Y+52, '-----------------------------------------------------------------------');
			$pdf->SetFont('Arial','BI',8.5);
			$pdf->Text(3, $get_Y+57, 'Precios en : '.$moneda);
			$pdf->SetFont('Arial','B',8.5);
			if($estado == '2'):
				$pdf->Text(3, $get_Y+60, 'Esta venta ha sido al credito');
				$pdf->SetFont('Arial','B',8.5);
			endif;
			$pdf->Text(19, $get_Y+67, 'GRACIAS POR SU COMPRA');
			$pdf->SetFillColor(0,0,0);
			$pdf->Code39(9,$get_Y+69,$numero_venta,1,5);
			$pdf->Text(28, $get_Y+79, '*'.$numero_venta.'*');

			

	} else if ($tipo_pago == 'EFECTIVO Y TARJETA'){

		$pdf->Text(24,$get_Y + 45,'Efectivo :');
			$pdf->Text(57,$get_Y + 45,$efectivo);

			$pdf->Text(20,$get_Y + 50,'No. Tarjeta :');
			$pdf->Text(40,$get_Y + 50,$numero_tarjeta);
			$pdf->Text(23,$get_Y + 56,'Debitado :');
			$pdf->Text(57,$get_Y + 56,$pago_tarjeta);

			$pdf->Text(2, $get_Y+58, '-----------------------------------------------------------------------');
			$pdf->SetFont('Arial','BI',8.5);
			$pdf->Text(3, $get_Y+63, 'Precios en : '.$moneda);
			$pdf->SetFont('Arial','',8.5);
			$pdf->Text(3, $get_Y+68, 'Venta realizada con dos metodos de pago');
			$pdf->SetFont('Arial','B',8.5);
			if($estado == '2'):
				$pdf->Text(3, $get_Y+70, 'Esta venta ha sido al credito');
				$pdf->SetFont('Arial','B',8.5);
			endif;
			$pdf->Text(19, $get_Y+77, 'GRACIAS POR SU COMPRA');
			$pdf->SetFillColor(0,0,0);
			$pdf->Code39(9,$get_Y+79,$numero_venta,1,5);
			$pdf->Text(28, $get_Y+90, '*'.$numero_venta.'*');



	};

		//$pdf->IncludeJS("print('true');");

	}else if($tipo_comprobante == '2'){
		$pdf->SetFont('Arial', '', 12);
		$pdf->SetAutoPageBreak(true,1);

		include('../includes/ticketheader.inc.php');

		$pdf->SetFont('Arial', '', 9.2); 
		$pdf->Text(2, $get_YH + 2, '------------------------------------------------------------------');
		$pdf->SetFont('Arial', 'B', 9);
		$secuencial = str_pad($numero_comprobante, 9, "0", STR_PAD_LEFT);

		$pdf->Text(3, $get_YH  + 5, 'FACTURA ELECTRONICA 001-100-'.$secuencial, 0,'C',0 ,1);
		$pdf->SetFont('Arial', '', 8.5);
		$pdf->Text(3.8, $get_YH  + 10, 'FECHA EMISION : '.$fecha_venta);
		$pdf->Text(3.8, $get_YH + 15, 'COMPUTADORA No.: 1');
		$pdf->Text(40, $get_YH + 15, 'CAJERO : '.$usuario);
		$pdf->Text(3.8, $get_YH + 20, 'TRANSACCION.: '.$numero_venta);
		$pdf->SetXY(3.8,$get_YH + 22);
		$pdf->SetFont('Arial', '', 7.8);
		$pdf->MultiCell(68, 4.2, 'Nombre: '.$cliente, 0,'L',0 ,1);
		$pdf->SetXY(3.8,$get_YH + 26);
		$pdf->MultiCell(68, 4.2, 'Documento: '.$cliente_nit, 0,'L',0 ,1);
		$pdf->SetXY(3.8,$get_YH + 30);
		$pdf->MultiCell(68, 4.2, 'Direccion: '.$direccion_cliente, 0,'L',0 ,1);
		$pdf->SetFont('Arial', '', 9.2);
		$pdf->Text(2, $get_YH + 40.5, '------------------------------------------------------------------');



 		$get_YH2 = $pdf->GetY();
 		
		$pdf->SetXY(2,$get_YH2 + 8);
		$pdf->SetFillColor(255,255,255);
		$pdf->SetFont('Arial','B',8.5);
		$pdf->Cell(13,4,'Cantid',0,0,'L',1);
		$pdf->Cell(28,4,'Descripcion',0,0,'L',1);
		$pdf->Cell(16,4,'Precio',0,0,'L',1);
		$pdf->Cell(12,4,'Total',0,0,'L',1);
		$pdf->SetFont('Arial','',8.5);
		$pdf->Text(2, $get_YH2 + 14, '-----------------------------------------------------------------------');
		$pdf->Ln(6);
		$item = 0;
		while($row = $detalle->fetch(PDO::FETCH_ASSOC)) {
		 $item = $item + 1;
			$pdf->setX(1.1);
			$pdf->Cell(13,4,$row['cantidad'],0,0,'L');
			$pdf->Cell(28,4,$row['descripcion'],0,0,'L',1);
			$pdf->Cell(16,4,$row['precio_unitario'],0,0,'L',1);
			$pdf->Cell(12,4,$row['importe'],0,0,'L',1);
			$pdf->Ln(4.5);
			$get_Y = $pdf->GetY();
		}
		$pdf->Text(2, $get_Y+1, '-----------------------------------------------------------------------');
		$pdf->SetFont('Arial','B',8.5);
		$pdf->Text(4,$get_Y + 5,'G = GRAVADO');
		$pdf->Text(30,$get_Y + 5,'E = EXENTO');

		$pdf->Text(4,$get_Y + 10,'SUBTOTAL 12%:');
		$pdf->Text(57,$get_Y + 10,number_format($ventaaa->sumas,2,'.',','));
		$pdf->Text(4,$get_Y + 15,'SUBTOTAL 0% :');
		$pdf->Text(57,$get_Y + 15,$exento);
		$pdf->Text(4,$get_Y + 20,'TOTAL SIN IMPUESTOS :');
		$pdf->Text(57,$get_Y + 20,number_format(($ventaaa->total+$descuento)-$ventaaa->iva,2,'.',','));
		$pdf->Text(4,$get_Y + 25,'DESCUENTO :');
		$pdf->Text(56,$get_Y + 25,'-'.$descuento);
		$pdf->Text(4,$get_Y + 30,'IVA 12% :');
		$pdf->SetFont('Arial','B',8.5);
		$pdf->Text(57,$get_Y + 30,number_format($ventaaa->iva,2,'.',','));

		$pdf->Text(4,$get_Y + 35,'TOTAL A PAGAR :');
		$pdf->SetFont('Arial','B',8.5);
		$pdf->Text(57,$get_Y + 35,number_format($ventaaa->total,2,'.',','));

		$pdf->Text(2, $get_Y+38, '-----------------------------------------------------------------------');
		$pdf->Text(4,$get_Y + 41,'Numero de Productos :');
		$pdf->Text(57,$get_Y + 41,$numero_productos);

		if($tipo_pago == 'EFECTIVO'){

		$pdf->Text(24,$get_Y + 45,'Efectivo :');
		$pdf->Text(57,$get_Y + 45,$efectivo);
		$pdf->Text(24,$get_Y + 49,'Cambio :');
		$pdf->Text(57,$get_Y + 49,$cambio);


		$pdf->Text(2, $get_Y+52, '-----------------------------------------------------------------------');
		$pdf->SetFont('Arial','BI',8.5);
		$pdf->Text(3, $get_Y+57, 'Precios en : '.$moneda);
		if($estado == '2'):
			$pdf->Text(3, $get_Y+60, 'Esta venta ha sido al credito');
			$pdf->SetFont('Arial','B',8.5);
		endif;
		$pdf->SetFont('Arial','B',8.5);
		$pdf->Text(19, $get_Y+67, 'GRACIAS POR SU COMPRA');
		$pdf->SetFillColor(0,0,0);
		$pdf->Code39(9,$get_Y+69,$numero_venta,1,5);
		$pdf->Text(28, $get_Y+79, '*'.$numero_venta.'*');

		$pdf->Text(2, $get_Y+91, 'CLAVE DE ACCESO / AUTORIZACION: ');
		$pdf->setXY(2,$get_Y+94);
		$pdf->MultiCell(65, 4, $ventaaa->claveacceso,2);

		} else if ($tipo_pago == 'TARJETA'){

			$pdf->Text(20,$get_Y + 45,'No. Tarjeta :');
			$pdf->Text(40,$get_Y + 45,$numero_tarjeta);
			$pdf->Text(23,$get_Y + 50,'Debitado :');
			$pdf->Text(57,$get_Y + 50,$total);

			$pdf->Text(2, $get_Y+52, '-----------------------------------------------------------------------');
			$pdf->SetFont('Arial','BI',8.5);
			$pdf->Text(3, $get_Y+57, 'Precios en : '.$moneda);
			$pdf->SetFont('Arial','B',8.5);
			if($estado == '2'):
				$pdf->Text(3, $get_Y+60, 'Esta venta ha sido al credito');
				$pdf->SetFont('Arial','B',8.5);
			endif;
			$pdf->Text(19, $get_Y+67, 'GRACIAS POR SU COMPRA');
			$pdf->SetFillColor(0,0,0);
			$pdf->Code39(9,$get_Y+69,$numero_venta,1,5);
			$pdf->Text(28, $get_Y+79, '*'.$numero_venta.'*');

			$pdf->Text(2, $get_Y+91, 'CLAVE DE ACCESO / AUTORIZACION: ');
			$pdf->setXY(2,$get_Y+94);
			$pdf->MultiCell(65, 4, $ventaaa->claveacceso,2);

		} else if ($tipo_pago == 'EFECTIVO Y TARJETA'){

			$pdf->Text(24,$get_Y + 45,'Efectivo :');
			$pdf->Text(57,$get_Y + 45,$efectivo);

			$pdf->Text(20,$get_Y + 50,'No. Tarjeta :');
			$pdf->Text(40,$get_Y + 50,$numero_tarjeta);
			$pdf->Text(23,$get_Y + 56,'Debitado :');
			$pdf->Text(57,$get_Y + 56,$pago_tarjeta);

			$pdf->Text(2, $get_Y+58, '-----------------------------------------------------------------------');
			$pdf->SetFont('Arial','BI',8.5);
			$pdf->Text(3, $get_Y+63, 'Precios en : '.$moneda);
			$pdf->SetFont('Arial','',8.5);
			$pdf->Text(3, $get_Y+68, 'Venta realizada con dos metodos de pago');
			$pdf->SetFont('Arial','B',8.5);
			if($estado == '2'):
				$pdf->Text(3, $get_Y+70, 'Esta venta ha sido al credito');
				$pdf->SetFont('Arial','B',8.5);
			endif;
			$pdf->Text(19, $get_Y+77, 'GRACIAS POR SU COMPRA');
			$pdf->SetFillColor(0,0,0);
			$pdf->Code39(9,$get_Y+79,$numero_venta,1,5);
			$pdf->Text(28, $get_Y+90, '*'.$numero_venta.'*');


			$pdf->Text(2, $get_Y+100, 'CLAVE DE ACCESO / AUTORIZACION: ');
			$pdf->setXY(2,$get_Y+103);
			$pdf->MultiCell(65, 4, $ventaaa->claveacceso,2);



		}

			//$pdf->IncludeJS("print('true');");

		} else {

			$pdf->SetFont('Arial', '', 10);
			$pdf->Text(7, 58, '* EL COMPROBANTE DE VENTA*');
			$pdf->Text(20, 65, '* NO ES TICKET*');;
		}


	if($clienteee->email!='' and $tipo_comprobante=='2' ){
		$secuencialnro = str_pad($numero_comprobante, 9, "0", STR_PAD_LEFT);
		//Create an instance; passing `true` enables exceptions
		$mail = new PHPMailer(true);

		$mail->SMTPOptions = array (
			'ssl' => array (
				'verify_peer' => false,
				'verify_peer_name' => false,
				'allow_self_signed' => true
			)
		);
	    //Server settings
	    //$mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
	    $mail->isSMTP();                                            //Send using SMTP
	    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
	    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
	    $mail->Username   = 'nelson01221@gmail.com';                     //SMTP username
	    $mail->Password   = 'mgrqfzchzaipkbvr';                               //SMTP password
	    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
	    $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

	    //Recipients
	    $mail->setFrom('nelson01221@gmail.com', 'Ferreteria');
	    $mail->addAddress($clienteee->email, $cliente);     //Add a recipient

	    $mail->addAttachment('../sri/facturas/Factura_001-100-'.$secuencialnro.'.pdf');         //Add attachments
	    $mail->addAttachment('../sri/autorizados/'.$ventaaa->claveacceso.'.xml');
	    //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

	    //Content
	    $mail->isHTML(true);                                  //Set email format to HTML
	    $mail->Subject = 'FACTURA ELECTRONICA 001-100-'.$secuencialnro;
	    $mail->Body    = 'ENVIO AUTOMATICO - COMPROBANTE ELECTRONICO ';
	    $mail->AltBody = 'Factura electronica';

	    if($ventaaa->aceptado=='AUTORIZADO'){
	    	$mail->send();
	    }
	    
	}
	
	$pdf->Output('','Ticket_'.$numero_comprobante.'.pdf',true);


	} catch (Exception $e) {

		
		$pdf->Output('I','Ticket_ERROR.pdf',true);

	}








 ?>
