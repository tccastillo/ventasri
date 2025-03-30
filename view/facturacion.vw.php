<?php

  if($tipo_usuario==1){

  	$objTaller= new Taller();
    $objVenta = new Venta();
    $objProducto = new Producto();

  	$count_ordenes = $objTaller->Count_Ordenes('','');

  	foreach ($count_ordenes as $row => $column) {
  		$total_ordenes = $column["total_ordenes"];
  	}


 ?>

 <?php
include "sri/core/autoload.php";
include "sri/core/app/model/FacturacionData.php";
include "sri/core/app/model/ParametroData.php";



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
    $ruc = $datosParametro->numero_nit;
    $direccion = $datosParametro->direccion_empresa;
}

?>




 
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

  	<script type="text/javascript" src="web/custom-js/taller.js"></script>
			<!-- Labels -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-flat">
						<div class="breadcrumb-line">
							<ul class="breadcrumb">
								<li><a href="?View=Inicio"><i class="icon-home2 position-left"></i> Inicio</a></li>
								<li><a href="javascript:;"> Facturacion </a></li>
								<li class="active">Configuraci&oacute;n de Acceso y Certificados</li>
							</ul>
						</div>
						<div class="panel-heading">
							<div class="row">
								<div class="col-sm-6 col-md-5">
								 
								</div>
							 </div>

						</div>

					<div id="reload-div">
						<div class="panel-body">
							<div class="tabbable">
								<ul class="nav nav-tabs nav-tabs-highlight">
									<li class="active"><a href="#label-tab1" data-toggle="tab">FACTURACIÓN ELECTRÓNICA </a></li>
								</ul>

								<div class="tab-content">

									<div class="tab-pane active" id="label-tab1">

                    <div class="wrapper wrapper-content animated fadeIn">
                      <div id="resultados"></div>
                      <div class="ibox">
                        <form class="form-horizontal form-label-left" enctype="multipart/form-data" action="sri/facturacion/updatefacturacion.php" method="POST">
                          <div class="ibox-title">
                            <h5>
                              <strong><i class="fa fa-list-ul"></i> Tipo de Fase:</strong>
                            </h5>
                          </div> 
                          <div class="ibox-content">
                            <div class="form-group">
                              <label for="linkedin_emp"
                                class="control-label col-md-3 col-sm-3 col-xs-12">Facturaci&oacute;n
                                Electr&oacute;nica</label>
                              <div class="col-md-9 col-sm-9 col-xs-12">
                                <select class="textfield10" class='form-control'
                                  id="fac_ele" name="fac_ele" required>
                                            <?php
                                            if ($fac_ele == 1) {
                                                ?>
                                            <option value="1" selected>Beta</option>
                                  <option value="2">Produccion</option>
                                                 <?php
                                            }
                                            if ($fac_ele == 2) {
                                                ?>
                                            <option value="2" selected>Produccion</option>
                                  <option value="1">Beta</option>
                                                <?php
                                            }
                                            ?>
                                </select>
                              </div>
                            </div>
                          </div>
                          <div class="ibox-title">
                            <h5>
                              <strong><i class="fa fa-list-ul"></i> Datos para producci&oacute;n:</strong>
                            </h5>
                          </div>
                          <div class="ibox-content">
                            <div class="form-group">
                              <label for="youtube_emp"
                                class="control-label col-md-3 col-sm-3 col-xs-12">Entidad certificado</label>
                              <div class="col-md-9 col-sm-9 col-xs-12">
                                <select  name="entidad_cert" id="entidad_cert" required>
                                  <option value="BCE" <?php if($usuariosol=='BCE'){ echo "selected";} ?> > BANCO CENTRAL DE ECUADOR</option>
                                  <option value="SEC_DATA" <?php if($usuariosol=='SEC_DATA'){ echo "selected";} ?>> SECURITY DATA</option>
                                  <option value="CONS_JUD" <?php if($usuariosol=='CONS_JUD'){ echo "selected";} ?>> CONSULTORIO JURÍDICO</option>
                                </select>
                                
                              </div>
                            </div>

                            

                            <input type="hidden" id="ruc" class="form-control" name="ruc"
                              value="<?php echo $ruc;?>" required>
                            <div class="form-group">


                              <label for="nombre" class="col-sm-3 control-label">Ingresar
                                certificado digital (.pfx ó .p12):</label>
                              <div class="col-md-9 col-sm-9 col-xs-12">
                                <input class="textfield10" required accept="image/jpeg" type="file"
                                  id="files" name="files" class="form-control" />

                              </div>
                            </div>
                            <div class="form-group">
                              <label for="linkedin_emp"
                                class="control-label col-md-3 col-sm-3 col-xs-12">Password
                                Certificado Digital</label>
                              <div class="col-md-9 col-sm-9 col-xs-12">
                                <input class="textfield10" required type="text" id="valor1"
                                  class="form-control" id="clave" name="clave"
                                  placeholder="Password Certificado Digital"
                                  value="<?php echo $clave;?>">
                              </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <input type="hidden" name="id_factura" value="<?php echo $datosEmpresa->id; ?>" >
                            <button type="submit" class="btn btn-primary" id="guardar_datos">Guardar
                              datos</button>
                          </div>
                        </form>
                      </div>
                    </div>




										<!-- Basic initialization -->
										
									</div>


								</div>
							</div>
						</div>
					</div>

         



  <?php } else { ?>

  	<div class="panel-body">
  		<div class="row">
  			<div class="col-md-12">

  				<!-- Widget with rounded icon -->
  				<div class="panel">
  					<div class="panel-body text-center">
  						<div class="icon-object border-danger-400 text-primary-400"><i class="icon-lock5 icon-3x text-danger-400"></i>
  						</div>
  						<h2 class="no-margin text-semibold"> SU USUARIO NO POSEE PERMISOS SUFICIENTES </h2>
  						<span class="text-uppercase text-size-mini text-muted">Su usuario no posee los permisos respectivos
  						para poder accesar a este modulo. Lo invitamos a dar click </span> <a href="./?View=Inicio">AQUI</a> <br><br>

  					</div>
  				</div>
  				<!-- /widget with rounded icon -->
  			</div>
  		</div>

  <?php } ?>
