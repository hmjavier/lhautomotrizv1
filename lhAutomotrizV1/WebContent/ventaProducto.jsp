<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
	<!-- <title>LH Web ....</title>
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet">	
	<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script src="js/validator.js"></script>
	<script type='text/javascript' src="js/allJs.js"></script>-->
	
	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrapW.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="css/plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
</head>
<body>
	<div id="wrapper">
	<!-- MENU  -->		
		<%@ include file="menu.jsp" %>
		<div id="page-wrapper">
			<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Venta de Articulo</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- SE GENERA CONTENEDOR DE FORMULARIO -->
			<div id="formContainer" style="margin-top: 5%; margin-left:5%; width: 90%;">
			<form class="form-horizontal" data-toggle="validator">
			  	<fieldset>		    
				    <div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">C&oacute;digo de Barras:</label>	  
					  	<div class="col-xs-8">
					    	<input id="barCode" type="text" class="form-control" placeholder="C&oacute;digo de Barras" data-error="Por Favor, Ingresa un Co&oacute;digo de Barras" required>
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">Cantidad:</label>	  
					  	<div class="col-xs-8">
					    	<input id="howMany" type="text" class="form-control" placeholder="Cantidad" data-error="Por Favor, Ingresa una Cantidad" required>
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">N&uacute;mero de Parte:</label>	  
					  	<div class="col-xs-8">
					    	<input id="brandNumber" type="text" class="form-control" placeholder="N&uacute;mero de Parte" list="brands" data-error="Por Favor, Ingresa un N&uacute;mero de Parte" required/>
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">Total de Venta:</label>	  
					  	<div class="col-xs-8">
					    	<input id="total" type="text" class="form-control" placeholder="Total de Venta" data-error="Por Favor, Ingresa el Total de la Venta" required>
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				      <div class="col-lg-10 col-lg-offset-2">
				        <button type="submit" id="registrar" class="btn btn-primary" disabled="disabled">Registrar</button>
				      </div>
					</div>
				</fieldset>
			</form>					
	  		</div>
		</div>	  	  		 
	</div>
	<!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
    
    <!-- LH AUTOMOTRIZ -->
	<script src="js/validator.js"></script>
	<script type='text/javascript' src="js/allJs.js"></script>
	<script type="text/javascript">
	$(document).ready( function() {
		$("#registrar").click(function(env){
			var sparePart = {
					"barCode" : $("#barCode").val(),
					"cantidad" : $("#howMany").val(),
					"numSerie" : $("#brandNumber").val(),
					"total" : $("#total").val()
					};
			$(".form-control").val('');
			ajaxSend("outcomingStock.jsp", sparePart);
		});
	});
	</script>
	
</body>
</html>