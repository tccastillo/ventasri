<?php
require_once('model/Conexion.php');

include "sri/core/autoload.php";
include "sri/core/app/model/VentaData.php";
include "sri/core/app/model/ClienteData.php";
include "sri/core/app/model/FacturacionData.php";
include "sri/core/app/model/ParametroData.php";
include "sri/core/app/model/ProcesoVentaData.php";
include "sri/core/app/model/ProductoData.php";

if(isset($_POST['txtF1']) and $_POST['txtF2']!=""){
	$procesos = VentaData::getIngresoRangoFechas($_POST['txtF1'],$_POST['txtF2']);
}else{
	$procesos = VentaData::getAll();
} ?>
<style type="text/css">
	.btn-group-xs>.btn, .btn-xs {
    padding: 1px 5px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
}
</style>
<!-- Labels -->
<div class="row">
<div class="col-lg-12">
<div class="panel panel-flat">
	<div class="breadcrumb-line">
		<ul class="breadcrumb">
			<li><a href="?View=Inicio"><i class="icon-home2 position-left"></i> Inicio</a></li>
			<li><a href="javascript:;">Documentos electrónicos</a></li>
			<li class="active">Documentos electrónicos</li>
		</ul>
	</div>
	<div class="panel-heading">
		<h6 class="panel-title">Facturas por Fechas</h6>

		<div class="heading-elements">
				<form class="heading-form" action="#">
					<div class="form-group">
						<div class="checkbox checkbox-switchery switchery-sm">
							<label>
							<input type="checkbox" id="chkEstado" name="chkEstado"
							 class="switchery" checked="checked" readonly="" >
							 <span id="lblchk">REPORTES DETALLADOS</span>
							 </label>
						</div>
					</div>
				</form>
			</div>



		 <div class="row">
			 <div class="col-sm-6 col-md-5">
			 	<form role="form" autocomplete="off" class="form-validate-jquery" >
			 		<input type="hidden" name="View" value="Documentos">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-5">
								<div class="input-group">
								<span class="input-group-addon"><i class="icon-calendar3"></i></span>
								<input type="text" id="txtF1" name="txtF1" placeholder=""
								 class="form-control input-sm" style="text-transform:uppercase;">
		                		</div>
							</div>
							<div class="col-sm-5">
								<div class="input-group">
								<span class="input-group-addon"><i class="icon-calendar3"></i></span>
								<input type="text" id="txtF2" name="txtF2" placeholder=""
								 class="form-control input-sm" style="text-transform:uppercase;">
		                		</div>
							</div>
							<div class="col-sm-2">
								<button style="margin-top: 0px;" id="btnGuardar"
								type="submit" class="btn btn-primary btn-sm">
								<i class="icon-search4"></i> Consultar</button>
							</div>
						</div>
					</div>
				  </form>
		   	  </div>
		  </div>

	</div>

<div id="resultados"></div>
<div id="reload-div">
	<div class="panel-body">
		<div class="tabbable">

			<ul class="nav nav-tabs nav-tabs-highlight">
				<li class="active"><a href="#label-tab1" data-toggle="tab">DOCUMENTOS ELECTRÓNICOS POR EL SRI <span id="span-ing" class="label
				label-success position-right"><?php echo @count($procesos); ?></span></a></li>
				
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="label-tab1">
					<!-- Basic initialization -->
					<div class="panel panel-flat">
						<div class="panel-heading">
							<h5 class="panel-title">FACTURAS ENVIADAS A SRI</h5>
							<div class="heading-elements">
								<?php if (isset($_GET['txtF1']) and isset($_GET['txtF2'])) {?>
									<a href="reportes/Ventas_Vigentes_Fechas.php?fecha1=<?php echo $_GET['txtF1']; ?>&fecha2=<?php echo $_GET['txtF2']; ?>" target="_blanck" 
								class="btn bg-danger-400 heading-btn"  value="vigentes">
								<i class="icon-printer2"></i> Imprimir Reporte</a>
								<?php }else{ ?>
								<a href="javascript:alert('SELECCIONA FECHAS');" class="btn bg-danger-400 heading-btn"  value="vigentes">
								<i class="icon-printer2"></i> Imprimir Reporte </a>
								<?php }; ?>
								
							</div>
						</div>
							<div class="panel-body">
								

					              <?php 
					                if(@count($procesos)>0){ ?>
								<table class="table datatable-basic table-xs table-hover">
									<thead>
										<tr>
											<th>No. Venta</th>
											<th>Comprobante</th>
											<th>Cliente</th>
											<th>Fecha y Hora Venta</th>
											
											<th>Total</th>
											<th>Desc XML</th>
											<th>Enviar</th>
											<th>Estado</th>
											<th>Opciones</th>
										</tr>
									</thead>

									<tbody>

									<?php $numero=0;?>
				                   <?php $total=0;?>
				                   <?php foreach($procesos as $reportediario):?>
				                   <?php $numero=$numero+1;?>

				       <tr>
                        <td><?php  echo $reportediario->numero_venta; ?></td>
                        <td><?php $tipo_comprobante = $reportediario->tipo_comprobante;
								if($tipo_comprobante == '1'){$tipo_comprobante = 'TICKET';} else if ($tipo_comprobante == '2'){$tipo_comprobante = 'FACTURA';} else if ($tipo_comprobante == '3'){$tipo_comprobante = 'CREDITO FISCAL';} echo $tipo_comprobante; ?>			
						</td>
                        <td><?php echo $reportediario->getCliente()->nombre_cliente; ?></td>
                        <td><?php $fecha_venta = $reportediario->fecha_venta;
							if(is_null($fecha_venta)){  $c_fecha_venta = '';} 
							else { $c_fecha_venta = DateTime::createFromFormat('Y-m-d H:i:s',$fecha_venta)->format('d/m/Y H:i:s');}; 
								echo $c_fecha_venta; ?>
						</td>
						<td><?php echo $reportediario->total; ?></td>
						<?php $doc1=$reportediario->claveacceso.".xml";
							  $aceptado1=$reportediario->aceptado;
							  $doc2=$reportediario->claveacceso;
						 ?>
						<td class="text-right">
                            <?php
                            if($aceptado1=="NO AUTORIZADO"){
                            ?>
                            <a href="#" class='btn btn-primary btn-xs' title='Descargar xml' onclick="imprimir_factura('<?php echo $doc1;?>');"><i class="glyphicon glyphicon-download"></i></a> 
                            <?php
                            }
                            if($aceptado1<>"NO AUTORIZADO"){
                                ?>
                            <a href="#" class='btn btn-primary btn-xs' title='Descargar xml' onclick="imprimir_factura2('<?php echo $doc1;?>');"><i class="glyphicon glyphicon-download"></i></a> 
                                    <?php
                            }
                            ?>
                        </td>
                        <td >
                            <?php if($aceptado1<> "AUTORIZADO"){ ?>
                            <a href="#" class='btn btn-warning btn-xs text-bold' title='Enviar SRI' onclick="enviar('<?php echo $doc2;?>','<?php echo $reportediario->idventa;?>');"><i class="glyphicon glyphicon-download"> </i> Enviar</a> 
    
                            <?php }else{ ?>
                            <a class='btn btn-success btn-xs'><i class="glyphicon glyphicon-download">Enviado</i></a> 
    
                            <?php }; ?>
                        </td>
                        


						<td>

							<?php if($reportediario->aceptado == 'AUTORIZADO'){ ?>
                            <a href="#" class='btn btn-success btn-xs text-bold' title='Descargar xml' onclick="imprimir_facturaautorizado('<?php echo $doc1;?>');"> AUTORIZADO </a> 
    
                            <?php }else{ ?>
                            <a href="#" class='btn btn-danger btn-xs text-bold' title='Descargar xml' onclick="imprimir_factura100('<?php echo $doc1;?>');"> NO AUTORIZADO </a> 
    
                            <?php }; ?> 

						</td>
						<td class="text-center">
														<ul class="icons-list">
															<li class="dropdown">
																<a href="#" class="dropdown-toggle" data-toggle="dropdown">
																	<i class="icon-menu9"></i>
																</a>
																<ul class="dropdown-menu dropdown-menu-right">
																   

															       <li><a id="print_receip"
																					   data-id="<?php print($reportediario->idventa); ?>"
																						href="javascript:void(0)">
																					   <i class="icon-typewriter">
																				       </i> Comprobante</a></li>

																</ul>
															</li>
														</ul>
													</td>

                        


                       
                      </tr> 
                     
                            
                    <?php endforeach; ?>

									  
										</tbody>
								</table>

								<?php }else{  echo"<h4 class='alert alert-success'>NO HAY REGISTRO</h4>";};?>
							</div>
						</div>
				</div>

				


			</div>
		</div>
	</div>
</div>

</div>
</div>
</div>
<!-- /labels -->


<!-- Iconified modal -->
	<div id="modal_detalle" class="modal fade">
		<div class="modal-dialog modal-full">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title"></i> &nbsp; <span class="title-form text-uppercase">Detalle de Venta</span></h5>
				</div>

		        <form role="form" autocomplete="off" class="form-validate-jquery" id="frmModal">
					<div class="modal-body" id="modal-container">

					<div id="reload-detalle">
							<!-- Collapsible with right control button -->
							<div class="panel-group panel-group-control panel-group-control-right content-group-lg">
								<div class="panel">
									<div class="panel-heading bg-info">
										<h6 class="panel-title">
											<a class="collapsed" data-toggle="collapse" href="#collapsible-control-right-group2">Clic para ver Información de la Venta</a>
										</h6>
									</div>
									<div id="collapsible-control-right-group2" class="panel-collapse collapse">
										<div class="panel-body">
											<div class="table-responsive">
												<table class="table table-xxs table-bordered">
												 <tbody class="border-solid">
												 <tr>
												 	<td width="5%" class="text-bold text-left">NO. VENTA</td>
													<td width="35%"></td>
													<td width="2%" class="text-bold text-left">FORMA PAGO</td>
													<td width="30%"></td>
												 </tr>
												<tr>
													<td width="5%" class="text-bold text-left">CLIENTE</td>
													<td width="30%"></td>
													<td width="2%" class="text-bold text-left">FECHA VENTA</td>
													<td width="30%"></td>
												</tr>
												<tr>
													<td width="20%" class="text-bold text-left">NO. COMPROBANTE</td>
													<td width="5%"></td>
													<td width="10%" class="text-bold text-left"></td>
													<td width="5%"></td>
												</tr>
												</tbody>
											</table>
										 </div>
										</div>
									</div>
								</div>
							</div>
							<!-- /collapsible with right control button -->

							<div class="panel-group panel-group-control panel-group-control-right content-group-lg">
								<div class="table-responsive">
									<table id="tbldetalle" class="table table-borderless table-striped table-xxs">
										<thead>
											<tr class="bg-blue">
												<th>Producto</th>
												<th>Cant.</th>
												<th>Precio</th>
												<th>Exento</th>
												<th>Descuento</th>
												<th>Importe</th>
												<th>Vence</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
										<tfoot>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td width="10%">SUMAS</td>
												<td id="sumas"></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td width="10%">IVA %</td>
												<td id="iva"></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td width="10%">SUBTOTAL</td>
												<td id="subtotal"></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td width="10%">RET. (-)</td>
												<td id="ivaretenido"></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td width="10%">T. EXENTO</td>
												<td id="exentas"></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td width="10%">DESCUENTO</td>
												<td id="descuentos"></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td width="10%">TOTAL</td>
												<td id="total"></td>
												<td></td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>

						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- /iconified modal -->




<script>
       
    function VentanaCentrada(theURL,winName,features, myWidth, myHeight, isCenter) { //v3.0
		  if(window.screen)if(isCenter)if(isCenter=="true"){
		    var myLeft = (screen.width-myWidth)/2;
		    var myTop = (screen.height-myHeight)/2;
		    features+=(features!='')?',':'';
		    features+=',left='+myLeft+',top='+myTop;
		  }
		  window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);
		}


        function enviar (claveacceso,id_venta){
        	var fac = claveacceso+'.xml';
            var claveacceso = claveacceso;
            var id_venta = id_venta; 
            $.ajax({
                type: "GET",
                url: "sri/enviar_sri.php",
                data: "archivo=" + fac + "&clave="+ claveacceso + "&id_venta="+ id_venta,
                beforeSend: function(objeto){
                	$("#resultados").html("Mensaje: Cargando...");
                },
                success: function(datos){
                	$("#resultados").html(datos);
                	load(1);
                }
            });		
        }  

         
        function imprimir_factura(id_factura){
          	VentanaCentrada('sri/generados/'+id_factura,'Factura','','1024','768','true');
        }

        function imprimir_factura1(id_factura, id_venta){
            var url = 'sri/autorizados/'+id_factura;
        	$.get(url)
            .done(function() { 
            	VentanaCentrada('sri/autorizados/'+id_factura,'Factura','','1024','768','true'); 
            }).fail(function() { 
            	VentanaCentrada('sri/autorizados/presentar_xml.php?id_factura='+id_factura+'&id_venta='+id_venta,'Factura','','1024','768','true');
            })  
          	
        }
                   
        function imprimir_factura2(id_factura){
         	VentanaCentrada('sri/firmados/'+id_factura,'Factura','','1024','768','true');
        }

        function imprimir_factura100(id_factura){
          VentanaCentrada('sri/noautorizados/'+id_factura,'Factura','','1024','768','true');
        }

        function imprimir_facturaautorizado(id_factura){
          VentanaCentrada('sri/autorizados/'+id_factura,'Factura','','1024','768','true');
        }

        

      </script>








<script type="text/javascript" src="web/custom-js/ventafechas.js"></script>
