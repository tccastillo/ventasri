<?php 
exec("java -Dfile.encoding=UTF-8 -jar libreria/QuijoteLuiFirmador/dist/QuijoteLuiFirmador-2.4.jar C:\\xampp\\htdocs\\ventas\\sri\\generados\\1911202201120520629300110000000000000000000000917.xml C:\\xampp\\htdocs\\ventas\\sri\\firmados C:\\xampp\\htdocs\\ventas\\sri\\certificados\\beta\\munoz.p12 MUNOZ8888 SEC_DATA", $val);

print_r($val);

?>