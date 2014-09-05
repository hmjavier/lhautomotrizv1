<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">

	<!-- <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
	<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script src="js/validator.js"></script>
	<script type='text/javascript' src="js/allJs.js"></script>-->
	
	<title>LH Automotriz v1.0</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="css/plugins/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

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
                    <h1 class="page-header">Carga de Articulo</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div id="formContainer" style="margin-top: 5%; margin-left:5%; width: 90%;">
			<!-- <form class="form-horizontal" action="#" data-toggle="validator">-->
			<form class="form-horizontal" action="#">
			  	<fieldset>				    
				    <div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">C&oacute;digo de Barras:</label>	  
					  	<div class="col-xs-8">
					    	<input id="barCode" type="text" class="form-control" placeholder="C&oacute;digo de Barras" data-error="Por Favor, Ingresa un Co&oacute;digo de Barras" required>
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">Nombre de Art&iacute;culo:</label>	  
					  	<div class="col-xs-8">
					    	<input id="sparePart" type="text" class="form-control" placeholder="Nombre de Art&iacute;culo" data-error="Por Favor, Ingresa un Nombre de Art&iacute;culo" required>
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">Descripci&oacute;n:</label>	  
					  	<div class="col-xs-8">
					    	<input id="briefDescription" type="text" class="form-control" placeholder="Descripci&oacute;n" data-error="Por Favor, Ingresa una Descripci&oacute;n" required>
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">Marca:</label>	  
					  	<div class="col-xs-8">
					    	<input id="brand" type="text" class="form-control" placeholder="Marca" list="brands" data-error="Por Favor, Ingresa una Descripci&oacute;n" required/>
				            <datalist id="brands">              
				              <option value="NGK"></option>
				              <option value="Bogue"></option>
				              <option value="KYB"></option>                           
				            </datalist>
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
				   		<label for="inputEmail3" class="col-sm-2 control-label">N&uacute;mero de Referencia:</label>	  
					  	<div class="col-xs-8">
					    	<input id="partNumber" type="text" class="form-control" placeholder="N&uacute;mero de Referencia (opcional)">
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">Compatibilidad:</label>
				   		<div class="row">
				   			<div class="col-xs-2">
						    	<input id="cAuto" type="text" class="form-control" placeholder="Auto">
						    	<div class="help-block with-errors"></div>
						  	</div>
						  	<div class="col-xs-2">
						    	<input id="cEdicion" type="text" class="form-control" placeholder="Edicion">
						    	<div class="help-block with-errors"></div>
						  	</div>
					  		<div class="col-xs-1">
						    	<input id="cModelo1" type="text" class="form-control" placeholder="Desde" size="4" maxlength="4">
						    	<div class="help-block with-errors"></div>
						  	</div>
						  	<div class="col-xs-1">
						    	<input id="cModelo2" type="text" class="form-control" placeholder="Hasta" size="4" maxlength="4">
						    	<div class="help-block with-errors"></div>
						  	</div>
						  	<div class="col-xs-1">
						        <button type="button" id="addCompa" class="btn btn-primary">Agregar</button>
						     </div>
				   		</div>
				   		<div class="row" style="margin-left: 20%;">
				   			<div class="col-xs-9">
				   				<div class="panel panel-default">
								  <!-- Default panel contents -->
								  <div class="panel-heading">Compatibilidad</div>
								
								  <!-- Table -->
								  <table class="table" id="tableCompatibilidad"></table>
								</div>
				   			</div>				   			
				   		</div>  					  	
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">Sistema:</label>	  
					  	<div class="col-xs-8">
					    	<input id="systems" type="text" class="form-control" placeholder="Sistemas" list="systems" data-error="Por Favor, Ingresa un Sistema" required/>
				            <datalist id="systems">              
				              <option value="Afinacion"></option>
				              <option value="Suspension"></option>                                         
				            </datalist>
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">Proveedor:</label>	  
					  	<div class="col-xs-8">
					    	<input id="providers" type="text" class="form-control" placeholder="Proveedores" list="providersList" data-error="Por Favor, Ingresa un Proveedor" required/>
				            <datalist id="providersList">              
				              <option value="Sagaji"></option>
				              <option value="Rolecar"></option>
				              <option value="Cordero"></option>
				              <option value="Egarama"></option>
				              <option value="SYD"></option>                                         
				            </datalist>
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">M&iacute;nimo en Almac&eacute;n:</label>	  
					  	<div class="col-xs-8">
					    	<input id="stockMin" type="number" min="0" class="form-control" placeholder="M&iacute;nimo en Almac&eacute;n" data-error="Por Favor, Ingresa un M&iacute;nimo en Almac&eacute;n" required>
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">Precio de venta:</label>	  
					  	<div class="col-xs-8">
					    	<input id="salePrice" type="number" min="0" class="form-control" placeholder="Precio Venta" data-error="Por Favor, Ingresa un Precio de Venta" required>
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				   		<label for="inputEmail3" class="col-sm-2 control-label">Precio Especial / Promoci&oacute;n:</label>	  
					  	<div class="col-xs-8">
					    	<input id="specialOfferPrice" type="number" min="0" class="form-control" placeholder="Precio Especial / Promoci&oacute;n ">
					    	<div class="help-block with-errors"></div>
					  	</div>
					</div>
					<div class="form-group">
				      <div class="col-lg-10 col-lg-offset-2">
				        <!-- <button type="submit" id="registrar" class="btn btn-primary" disabled="disabled">Registrar</button>-->
				        <button type="submit" id="registrar" class="btn btn-primary">Registrar</button>
				      </div>
					</div>
				</fieldset>
			 </form>					
	  		</div>
		</div>
		<!-- /#page-wrapper -->
			  		  
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
		
		$("#addCompa").on("click", function() {
			$("#tableCompatibilidad").append("<tr><td>"+$('#cAuto').val()+"</td><td>"+$('#cEdicion').val()+"</td><td>"+$('#cModelo1').val()+"</td><td>"+$('#cModelo2').val()+"</td></tr>");
		});
		
	    $("#registrar").on("click", function() {
	    	
	    	var mydata ="";
	        //gets table
			var compatibilityAll = new Array();
	        $("#tableCompatibilidad tr").each(function (row, tr) {
	            var compatibility = new Array();
	        	compatibility.push($(tr).find('td:eq(0)').text());
	        	compatibility.push($(tr).find('td:eq(1)').text());
	        	compatibility.push($(tr).find('td:eq(2)').text());
	        	compatibility.push($(tr).find('td:eq(3)').text());
	        	compatibilityAll.push(compatibility);
	        });
	        //console.log(compatibilityAll);
	    	
	    	
			systems = [];
			systems.push($("#systems").val());
			
			providers = [];
			providers.push($("#providers").val());
			
			
			
			var sparePart = {						
							"barCode" : $("#barCode").val(),
							"sparePart" : $("#sparePart").val(),
							"briefDescription" : $("#briefDescription").val(),
							"brand" : $("#brand").val(),
							"brandNumber" : $("#brandNumber").val(),
							"partNumber" : $("#partNumber").val(),
							"systems" : systems,
							"providers" : providers,
							"stockMin" : $("#stockMin").val(),
							"salePrice" : $("#salePrice").val()											
							};	
			$(".form-control").val('');
			//ajaxSend("newSparePart.jsp", sparePart);
			
				
				$.ajax({	
							type:"POST",
							url: "newSparePart.jsp",
				       		data: "sparePart="+JSON.stringify(sparePart)+"&compatibility="+compatibilityAll,
				       		success: function(msg)    {
				       			if(msg.indexOf("Error Entrada") >= 0){
				       				mensajes(msg);			       				
				       			}else if(msg.indexOf("Error Venta") >= 0){
				       				mensajes(msg);
				       			}else{
				       				mensajes(msg);
				       			}
				       		},
				       		error:   function(xml,msg){
				       			mensajes(msg);
				       			//alert("Error:Favor de Revisar los Valores"); 
				       		}
				 });
			
	    });
	});
	</script>
	
</body>
</html>