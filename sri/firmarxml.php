<?php
exec("java -Dfile.encoding=UTF-8 -jar libreria/QuijoteLuiFirmador/dist/QuijoteLuiFirmador-2.4.jar C:\\xampp\\htdocs\\ECUADOR\\ventas\\ventas\\sri\\generados\\0712202201120423722400110011000000000011234567811.xml C:\\xampp\\htdocs\\ECUADOR\\ventas\\ventas\\sri\\firmados C:\\xampp\\htdocs\\ECUADOR\\ventas\\ventas\\sri\\certificados\\beta\\clarainesactivo.p12 MINDIOLA8888 SEC_DATA", $val);
print_r($val);

?>