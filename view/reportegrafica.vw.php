<?php
include "sri/core/autoload.php";
include "sri/core/app/model/VentaData.php";
include "sri/core/app/model/ClienteData.php";
include "sri/core/app/model/ParametroData.php";
include "sri/core/app/model/ProcesoVentaData.php";
include "sri/core/app/model/ProductoData.php";

	$objDashboard =  new Dashboard();

	$filas = $objDashboard->Datos_Paneles();

	$parametros = $objDashboard->Ver_Moneda_Reporte();
	if (is_array($parametros) || is_object($parametros))
	{ 
		foreach ($parametros as $row => $column) {

				$moneda = $column['Symbol'];

		}
	} else {
		$moneda = '';
	}

	$compras = $objDashboard->Compras_Anuales();
	$ventas = $objDashboard->Ventas_Anuales();

	if (is_array($filas) || is_object($filas))
	{
		foreach ($filas as $row => $column)
		{
			$compras_mes = $column["compras_mes"];
			$ventas_dia = $column["ventas_dia"];
			$inversion_stock = $column["inversion_stock"];
			$proveedores = $column["proveedores"];
			$marcas = $column["marcas"];
			$presentaciones = $column["presentaciones"];
			$productos = $column["productos"];
			$dinero_caja  = $column["dinero_caja"];
			$perecederos  = $column["perecederos"];
			$a_vencer  = $column["a_vencer"];
			$clientes  = $column["clientes"];
			$creditos  = $column["creditos"];
		}
	}



?>


<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-flat">
						<div class="breadcrumb-line">
							<ul class="breadcrumb">
								<li><a href="?View=Inicio"><i class="icon-home2 position-left"></i> Inicio</a></li>
								<li><a href="javascript:;">Reporte estadístico</a></li>
								<li class="active">Reporte por Fechas</li>
							</ul>
						</div>
						<div class="panel-heading">
							<h6 class="panel-title">Reporte por Fechas</h6>
						</div>

						<div class="panel-body">


					<!-- Main charts -->
					<div class="row">
						<div class="col-lg-12">

							<!-- Traffic sources -->
							<div class="panel panel-flat">
								<div class="panel-heading">
									<h6 class="panel-title text-center text-uppercase text-black">
										<?php 
											if(isset($_GET['filtro1']) and $_GET['filtro1']=='1' ){

												echo "PRODUCTOS MAS VENDIDOS ENTRE: ".$_GET['txtF1']." - ".$_GET['txtF2'];
											               
											}else if(isset($_GET['filtro1']) and $_GET['filtro1']=='2'){

												echo "CLIENTES CON MAS VENTAS ENTRE: ".$_GET['txtF1']." - ".$_GET['txtF2'];
																								
											}else if(isset($_GET['idcategoria']) and $_GET['idcategoria']!=''){
												echo "PRODUCTOS MAS VENDIDOS POR CATEGORIA ".$_GET['txtF1']." - ".$_GET['txtF2'];
												
											}else{
													
											};
										?>
									</h6>
								</div>

								<div class="container-fluid">
								  <div class="chart-container text-center">
									 <div class="display-inline-block" id="chart-ventas"></div>
								  </div>
								 </div>
							</div>
							<!-- /traffic sources -->

						</div>

						
					</div>
					<!-- /main charts -->

</div>
</div>
</div>
</div>

					<?php include('./includes/footer.inc.php'); ?>

				


<script>

// Line chart
 // ------------------------------

 // Generate chart



    var pie_chart = c3.generate({
        bindto: '#chart-ventas',
        size: { width: 1200 },
        color: {
            pattern: ['#3F51B5', '#FF9800', '#4CAF50', '#00BCD4', '#F44336']
        },
        x: 'x',
        data: {
        	columns: [
        	<?php 
				if(isset($_GET['filtro1']) and $_GET['filtro1']=='1' ){

					$ventas = VentaData::getIngresoRangoFechasMasvendido($_GET['txtF1'],$_GET['txtF2']);
					if(@count($ventas)>0){
						foreach($ventas as $venta):?>
							["<?php echo $venta->nombre_producto; ?>", <?php echo $venta->precio_venta; ?>],
						<?php endforeach; 										
					}else{  };
				               
				}else if(isset($_GET['filtro1']) and $_GET['filtro1']=='2'){

					$ventas = VentaData::getIngresoRangoFechasCliente($_GET['txtF1'],$_GET['txtF2']);
					if(@count($ventas)>0){
						foreach($ventas as $venta):?>
							["<?php echo $venta->nombre_cliente; ?>", <?php echo $venta->c; ?>],
						<?php endforeach;
					}else{  echo"";};
																	
				}else if(isset($_GET['idcategoria']) and $_GET['idcategoria']!=''){
						$ventas1 = VentaData::getIngresoRangoFechasCategoria($_GET['txtF1'],$_GET['txtF2'],$_GET['idcategoria']);
						if(@count($ventas1)>0){
						foreach($ventas1 as $venta):?>
							["<?php echo $venta->nombre_producto; ?>", <?php echo $venta->c; ?>],
						<?php endforeach;
					}else{  echo"";};
				}else{
						
				}
			?>

                
            ],
            type : 'bar',
	    },
	    axis : {
	    	x:{
	    		type: 'category',
	    	},
	         y : {
	            tick: {
	                format: d3.format("")
	               //format: function (d) { return "$" + d; }
	            }
	        }
	    }
    });



</script>
