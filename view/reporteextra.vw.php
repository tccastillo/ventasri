<?php

//require_once('../model/Conexion.php');

include "sri/core/autoload.php";
include "sri/core/app/model/VentaData.php";
include "sri/core/app/model/ClienteData.php";
include "sri/core/app/model/ParametroData.php";
include "sri/core/app/model/ProcesoVentaData.php";
include "sri/core/app/model/ProductoData.php";

	$objCategoria =  new Categoria();
	$objVenta =  new Venta();
	$count_ventas = $objVenta->Count_Ventas('FECHAS','','');

	foreach ($count_ventas as $row => $column) {

		$ventas_anuladas = $column["ventas_anuladas"];
		$ventas_vigentes = $column["ventas_vigentes"];
		$ventas_contado = $column["ventas_contado"];
		$ventas_credito = $column["ventas_credito"];

	}

 ?>

			<!-- Labels -->
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

							<div class="heading-elements">
									
								</div>



							 <div class="row">
								 <div class="col-sm-12 col-md-12">
								 	<form role="form" autocomplete="off" class="form-validate-jquery" id="frmSearch">
								 		<input type="hidden" name="View" value="Reporteextra">
										<div class="form-group">
											<div class="row">
												<div class="col-sm-2">
													<div class="input-group">
													<span class="input-group-addon"><i class="icon-calendar3"></i></span>
													<input type="date" id="txtF1" name="txtF1" placeholder=""
													 class="form-control input-sm" value="<?php if(isset($_GET['txtF1']) and $_GET['txtF1']!=''){ echo $_GET['txtF1']; } ?>" >
							                		</div>
												</div>
												<div class="col-sm-2">
													<div class="input-group">
													<span class="input-group-addon"><i class="icon-calendar3"></i></span>
													<input type="date" id="txtF2" name="txtF2" placeholder=""
													 class="form-control input-sm" value="<?php if(isset($_GET['txtF2']) and $_GET['txtF1']!=''){ echo $_GET['txtF2']; } ?>" >
							                		</div>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
													<span class="input-group-addon"><i class="icon-calendar3"></i></span>
													<select class="form-control" name="filtro1" id="filtro1" >
														<option value="">--- Selecciona ---</option>
														<option value="1" <?php if(isset($_GET['filtro1']) and $_GET['filtro1']=='1'){ echo "selected"; } ?> >Productos mas vendidos</option>
														<option  value="2"  <?php if(isset($_GET['filtro1']) and $_GET['filtro1']=='2'){ echo "selected"; } ?>  >Cliente que más compra</option>
													</select>
							                		</div>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
													<span class="input-group-addon"><i class="icon-calendar3"></i></span>
													<select   id="idcategoria" name="idcategoria"
														class="form-control" >
					                            			<option value="" <?php if(isset($_GET['idcategoria']) and $_GET['idcategoria']==''){ echo "selected"; } ?> >--- Selecciona categoria ---</option>
					                            			 <?php
																$filas = $objCategoria->Listar_Categorias();
																if (is_array($filas) || is_object($filas))
																{
																foreach ($filas as $row => $column)
																{
																?>
																	<option <?php if(isset($_GET['idcategoria']) and $_GET['idcategoria']==$column["idcategoria"]){ echo "selected"; } ?>  value="<?php print ($column["idcategoria"])?>">
																	<?php print ($column["nombre_categoria"])?></option>
																<?php
																	}
																}
																 ?>
													</select>
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

					<div id="reload-div">
						<div class="panel-body">
							<div class="tabbable">
								<ul class="nav nav-tabs nav-tabs-highlight">
									<li class="active"><a href="#label-tab1" data-toggle="tab">REPORTE <span id="span-ing" class="label
									label-success position-right"></span></a></li>
									
								</ul>

								<div class="tab-content">
									<div class="tab-pane active" id="label-tab1">
										<!-- Basic initialization -->
										<div class="panel panel-flat">
											<div class="panel-heading">
												<h5 class="panel-title"><?php 
												if(isset($_GET['filtro1']) and $_GET['filtro1']=='1' ){
													echo "Productos mas vendidos"; ?>
													<div class="heading-elements">
														<a type="button" href="?View=Reporte_grafica&txtF1=<?php echo $_GET['txtF1']; ?>&txtF2=<?php echo $_GET['txtF2']; ?>&filtro1=1" 
														class="btn bg-danger-400 heading-btn" id="btnPrint" value="vigentes">
														<i class="icon-printer2"></i> Generar reporte estadístico</a>
													</div>

												<?php }else if(isset($_GET['filtro1']) and $_GET['filtro1']=='2'){
													echo "Clientes que más compra";
													?>
													<div class="heading-elements">
														<a type="button" href="?View=Reporte_grafica&txtF1=<?php echo $_GET['txtF1']; ?>&txtF2=<?php echo $_GET['txtF2']; ?>&filtro1=2" 
														class="btn bg-danger-400 heading-btn" id="btnPrint" value="vigentes">
														<i class="icon-printer2"></i> Generar reporte estadístico</a>
													</div>
												<?php }else if(isset($_GET['idcategoria']) and $_GET['idcategoria']!=''){
													echo "Filtro por categoría";?>
													<div class="heading-elements">
														<a type="button" href="?View=Reporte_grafica&txtF1=<?php echo $_GET['txtF1']; ?>&txtF2=<?php echo $_GET['txtF2']; ?>&idcategoria=<?php echo $_GET['idcategoria']; ?>" 
														class="btn bg-danger-400 heading-btn" id="btnPrint" value="vigentes">
														<i class="icon-printer2"></i> Generar reporte estadístico</a>
													</div>
												<?php
												}else{
													echo "Filtro por fecha";
												}
												?>	
 </h5>
												
											</div>
												<div class="panel-body">

												<?php 
												if(isset($_GET['filtro1']) and $_GET['filtro1']=='1' ){

													$ventas = VentaData::getIngresoRangoFechasMasvendido($_GET['txtF1'],$_GET['txtF2']);

													
									                if(@count($ventas)>0){?>
													<table class="table datatable-basic table-xs table-hover">
														<thead>
															<tr>
																<th>Producto</th>
																<th>Stock</th>
																<th>Cantidad ventas</th>
																<th>Cant productos vendidos</th>
																<th>Precio uni</th>
																<th>Total</th>
																
															</tr>
														</thead>

														<tbody>
															<?php foreach($ventas as $venta):?>

														  
																	<tr>
																		<td><?php echo $venta->nombre_producto; ?></td>
																		<td><?php print($venta->stock); ?></td>
																		<td><?php print($venta->c); ?></td>
													                	<td><?php print($venta->contar); ?></td>
													                	<td><?php print($venta->precio_venta); ?></td>
													                	<td><?php echo number_format($venta->precio_venta*$venta->contar,2,'.',','); ?></td>
													                	
													                	
																		
													                </tr>
																
																<?php endforeach; ?>
															</tbody>
													</table>
													<?php }else{  echo"";};
               


												}else if(isset($_GET['filtro1']) and $_GET['filtro1']=='2'){

													$ventas = VentaData::getIngresoRangoFechasCliente($_GET['txtF1'],$_GET['txtF2']);

													
									                if(@count($ventas)>0){?>
													<table class="table datatable-basic table-xs table-hover">
														<thead>
															<tr>
																<th>Cliente</th>
																<th>Documento</th>
																<th>Cantidad ventas</th>
																<th>Total</th>
																
															</tr>
														</thead>

														<tbody>
															<?php foreach($ventas as $venta):?>

														  
																	<tr>
																		<td><?php echo $venta->nombre_cliente; ?></td>
																		<td><?php print($venta->numero_nit); ?></td>
																		<td><?php print($venta->c); ?></td>
													                	<td><?php print($venta->contar); ?></td>
													                	
													                	
																		
													                </tr>
																
																<?php endforeach; ?>
															</tbody>
													</table>
													<?php }else{  echo"";};
													

												}else if(isset($_GET['idcategoria']) and $_GET['idcategoria']!=''){
													$ventas1 = VentaData::getIngresoRangoFechasCategoria($_GET['txtF1'],$_GET['txtF2'],$_GET['idcategoria']);
												}else {
													
												}

												
									                if(@count($ventas1)>0){
									                  // si hay usuarios
									                  ?>
													<table class="table datatable-basic table-xs table-hover">
														<thead>
															<tr>
																<th>Fecha Venta</th>
															
																<th>Producto</th>
																<th>Cantidad vendidos</th>
																<th>Tipo Pago</th>
																<th>Total</th>
																<th>Estado</th>
																<th>Opciones</th>
															</tr>
														</thead>

														<tbody>
															<?php foreach($ventas1 as $venta):?>

														  <?php
																

															$c_fecha_venta = DateTime::createFromFormat('Y-m-d H:i:s',$venta->fecha_venta)->format('d/m/Y H:i:s');
																

															$tipo_comprobante = $venta->tipo_comprobante;
																if($tipo_comprobante == '1')
																{
																	$tipo_comprobante = 'TICKET';

																} else if ($tipo_comprobante == '2'){

																	$tipo_comprobante = 'FACTURA';

																} else if ($tipo_comprobante == '3'){

																	$tipo_comprobante = 'CREDITO FISCAL';
																}


																$tipo_pago = $venta->tipo_pago;
																if($tipo_pago == '1')
																{
																	$tipo_pago = 'CONTADO';

																} else if ($tipo_pago == '2'){

																	$tipo_pago = 'CREDITO';

																}

																?>
																	<tr>

																		<td><?php echo $c_fecha_venta; ?></td>
																
													                	<td><?php print($venta->nombre_producto); ?></td>
													                	<td><?php print($venta->c); ?></td>
													                	<td><?php print($tipo_pago); ?></td>
													                	<td><?php print($venta->total); ?></td>
													                	<td><?php if($venta->estado == '1')
													                		echo '<span class="label label-success label-rounded"><span
													                		class="text-bold">VIGENTE</span></span>';
													                		else
													                		echo '<span class="label label-default label-rounded">
													                	<span
													                	    class="text-bold">ANULADA</span></span>'
														                ?></td>
																		<td class="text-center">
																			<ul class="icons-list">
																				<li class="dropdown">
																					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
																						<i class="icon-menu9"></i>
																					</a>
																					<ul class="dropdown-menu dropdown-menu-right">
																					   <li><a id="delete_product"
																					   data-id="<?php print($column['idventa']); ?>"
																						href="javascript:void(0)">
																					   <i class="icon-cancel-circle2">
																				       </i> Anular</a></li>

																					   <li><a id="detail_pay"  data-toggle="modal" data-target="#modal_detalle"
																					   data-id="<?php print($column['idventa']); ?>"
																						href="javascript:void(0)">
																					   <i class="icon-file-spreadsheet">
																				       </i> Ver Detalle</a></li>

																				       <li><a id="print_receip"
																					   data-id="<?php print($column['idventa']); ?>"
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
													<?php }else{}; ?>

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


<script type="text/javascript" src="web/custom-js/filtroreporte.js"></script>
