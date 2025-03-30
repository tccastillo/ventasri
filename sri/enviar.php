<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

if($_GET['venta']>0){
    $idid_venta=$_GET['venta'];
}else{
    $idid_venta =  base64_decode($_GET['venta']);
}
$ventaaa=VentaData::getById($idid_venta);
$clienteee=ClienteData::getById($ventaaa->idcliente);

if($clienteee->email!='' and $ventaaa->tipo_comprobante=='2' ){
        $secuencialnro = str_pad($ventaaa->numero_comprobante, 9, "0", STR_PAD_LEFT);
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
        $mail->Username   = 'ventasferreteriaclaraines@gmail.com';                     //SMTP username
        $mail->Password   = 'xzxsixyunkezrlyq';                               //SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
        $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

        //Recipients
        $mail->setFrom('ventasferreteriaclaraines@gmail.com', 'Ferreteria');
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
?>
<script>
            var link = '?View=Documentos';
            window.location.href = link;    
  
</script>