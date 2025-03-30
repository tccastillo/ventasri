<?php 

$fecha = "2021-12-08 21:55:51";
$f_dia = date("d", strtotime($fecha));
echo  $f_dia.'<br>';

$cadena="111120220112052062930011000000000000000000000281";
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
echo $resultado." Clave completa: ".$cadena.$resultado.'<br>';
echo strlen($cadena.$resultado);

?>