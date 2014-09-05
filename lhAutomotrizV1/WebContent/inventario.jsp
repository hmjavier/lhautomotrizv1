<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
		<!-- <title>LH ..... </title>
        
		<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
		<script src="js/validator.js"></script>
		<script type='text/javascript' src="js/allJs.js"></script>
		
		<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.js"></script>
		<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">   
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.10.4.custom.css">       -->      

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
	<div id="dialog-confirm" title="Borrar Articulo" style="display: none;">
		<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Esta Seguro?</p>
	</div>
        <!-- Wrap all page content here -->
	<div id="wrapper">
		<!-- MENU  -->		
		<%@ include file="menu.jsp" %>
		<div id="page-wrapper">
			<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Inventario</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
            	 <div class="col-lg-12">
            	 	<div id="containerTable" style="width: 100%; border: 1px;"></div>
            	 </div>
            	 <div id="containerTableI" class="container col-md-12" style="display: none;">			   
				   <div id="formContainer" style="margin-top: 5%; margin-left:5%; width: 90%;">
				   		<div id="cerrarEdi" style="font-size: 20px; text-align: right;">
				   			<span> << Regresar</span>
				   		</div>
						<form class="form-horizontal" action="#" data-toggle="validator" accept-charset="UTF-8">
						  	<fieldset>
							    <legend>Editar Articulo LH</legend>				    
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
								    	<input id="partNumber" type="text" class="form-control" placeholder="">
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
								    	<input id="systems" type="text" class="form-control" placeholder="" list="systems" />
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
								    	<input id="providers" type="text" class="form-control" placeholder="" list="providersList"/>
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
							        <button type="submit" id="registrar" class="btn btn-primary" disabled="disabled">Guardar</button>
							        <button id ="removeSpare" class="btn btn-danger">Borrar</button>
							      </div>
								</div>
							</fieldset>
						 </form>					
		  			</div>			
				</div>
            </div>
		</div>
	</div> 
	 <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.10.4.custom.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>
	
	<!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>
	
	
    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
    
    <!-- LH AUTOMOTRIZ -->
	<script src="js/validator.js"></script>
	<script type='text/javascript' src="js/allJs.js"></script>
	
	<script type="text/javascript">

	$(document).ready(function(){
		
		function closeEditPanel(){
			$( "#containerTableI" ).hide( "blind", { to: { width: 200, height: 60 } }, 1000 );
			$( "#containerTable" ).show( "blind", { to: { width: 200, height: 60 } }, 1000 );
		}
		
		$("#addCompa").on("click", function() {
			$("#tableCompatibilidad").append("<tr><td>"+$('#cAuto').val()+"</td><td>"+$('#cEdicion').val()+"</td><td>"+$('#cModelo1').val()+"</td><td>"+$('#cModelo2').val()+"</td></tr>");
		});
		
		$("#registrar").on("click", function() {	
			
			systems = [];
			systems.push($("#systems").val());
			
			providers = [];
			providers.push($("#providers").val());
			
			var compatibilityAll = new Array();
	        $("#tableCompatibilidad tr").each(function (row, tr) {
	            var compatibility = new Array();
	        	compatibility.push($(tr).find('td:eq(0)').text());
	        	compatibility.push($(tr).find('td:eq(1)').text());
	        	compatibility.push($(tr).find('td:eq(2)').text());
	        	compatibility.push($(tr).find('td:eq(3)').text());
	        	compatibilityAll.push(compatibility);
	        });
			
			
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
			//$(".form-control").val('');
			//ajaxSend("newSparePart.jsp", sparePart);
			
			
			$.ajax({	
				type:"POST",
				url: "newSparePart.jsp",
	       		data: "sparePart="+JSON.stringify(sparePart)+"&compatibility="+compatibilityAll,
	       		success: function(msg)    {
	       			alert("Actualizado");
	       			onloadTable();
					closeEditPanel();
	       			/*alert(msg.trim());
	       			$("span#msg").empty();
	       			$("span#msg").append(msg);*/
	       		},
	       		error:   function(xml,msg){
	       			console.log(xml);
	       			console.log(msg);       			
	       			alert("Error:Favor de Revisar los Valores"); 
	       		}
	 		});
			
	    });
		
		$("#cerrarEdi").click(function(env){
			closeEditPanel();
		});
		
		$("#removeSpare").click(function(){
			$( "#dialog-confirm" ).dialog({
				 resizable: false,
				 height:140,
				 modal: true,			 
				 buttons: {
					 	Ok: function() {
					 		$.ajax({
						        type: 'POST',
						        url: 'deleteSpare',
						        data: "brandNumber="+$("#brandNumber").val(),					        
						        success: function(response){
						        	//alert("response: "+response);
									$( "#dialog-confirm" ).dialog("close");								
									onloadTable();
									closeEditPanel();
						        },error: function (jqXHR, textStatus, errorThrown) {
									$( this ).dialog("close");								
									onloadTable();
									closeEditPanel();
						        } 
						    });
					 },
					 	Cancel: function() {
					 		$( this ).dialog( "close" );
					 	}
				 	}
				 });
		});
		
		function getData(brandNumber){
			$.ajax({
				type:"POST",
				url: "getSpare",
				data: "brandNumber="+brandNumber,
		   		success: function(data)    {
		   			$("#tableCompatibilidad").empty();
		   			var dataSpare = data.split(","); 
		   			$("#barCode").val(dataSpare[0]);
		   			$("#sparePart").val(dataSpare[1]);
		   			$("#briefDescription").val(dataSpare[2]);
		   			$("#brand").val(dataSpare[3]);
		   			$("#brandNumber").val(dataSpare[4]);
		   			$("#partNumber").val(dataSpare[5]);
		   			//$("#systems").val(dataSpare[0]);
		   			//$("#providers").val(dataSpare[0]);
		   			$("#stockMin").val(dataSpare[6]);
		   			$("#salePrice").val(dataSpare[7]);
		   			$("#specialOfferPrice").val(dataSpare[8]);
	
		   			var tmp = dataSpare[9].replace("|",",");
		   			for(var i=0; i<50; i++){
		   				tmp = tmp.replace("|",",");
		   			}	   			
		   			var jso = jQuery.parseJSON(tmp);
		   				   				   			
		   			$.each( jso, function( key, val ) {
		   			 	$.each( val, function( key, val ) {
			   			    var carro = "";
			   			    var version ="";
			   			    var modelos ="";
		   			 		carro = key.split("-");
			   			 	$.each( val, function( key, val ) {
			   			 		version = key;
			   			 		modelos = val;
			   			 	});
			   			 $("#tableCompatibilidad").append("<tr><td>"+carro[0]+"</td><td>"+carro[1]+"</td><td>"+modelos[0]+"</td><td>"+modelos[(modelos.length)-1]+"</td></tr>");
		   			 	});
		   			  });
		   		}
			});
		}
		
		function onloadTable(){
			$.ajax({	
				type:"POST",
				url: "getInventory",
		   		success: function(data)    {
		   			/*GENERA ARRAY DE DATOS A GRAFICAR*/
		   			var rowsData = new Array();
		   			
		   			/*GENERA ARRAY DE ENCABEZADOS DE GRAFICA*/
		   			try {
		   				var rowsHeaders = [ {
		   					"sTitle" : "Articulo"
		   				}, {
		   					"sTitle" : "Marca"
		   				}, {
		   					"sTitle" : "Numero de Parte"
		   				}, {
		   					"sTitle" : "Numero de Referencia"
		   				}, {
		   					"sTitle" : "Stock Minimo"
		   				}, {
		   					"sTitle" : "Existencia"
		   				}, {
		   					"sTitle" : "Compatibilidad"
		   				}];
		   			} catch (err) {
		   			};
		   			
		   			jQuery("#containerTable").empty();	
		   			var tableData = '<table class="table table-striped table-bordered" id="inventarioTable">'+data+'</table>';
	
		   			jQuery("#containerTable").append(tableData);
		   			
		   			var oTable = jQuery("#inventarioTable").dataTable({
		   				"aoColumns" : rowsHeaders
		   			});
					
		   			$("#inventarioTable").delegate("tbody tr", "click", function () {
		   				/*var aPos   = oTable.fnGetPosition(this);
		   	            var aData = oTable.fnGetData(aPos[0]); 
		   	            alert(aData);*/
		   	            
			   	         // get the position of the current data from the node
			   	         var aPos = oTable.fnGetPosition( this );
			
			   	         // get the data array
			   	         var aData = oTable.fnGetData( aPos[0] );
			
			   	         // get departmentID for the row
			   	         var brandNumber = aData[aPos][2];
			   	         console.log(brandNumber);
	
			   	      	 
			   	      	 
		   				$( "#containerTable" ).hide( "blind", { to: { width: 200, height: 60 } }, 1000 );
		   				$( "#containerTableI" ).show( "blind", { to: { width: 200, height: 60 } }, 1000 ,function(){
		   					getData(brandNumber);
		   				});				
		   			});
		   			
		   		},
		   		error:   function(xml,msg){ $("span#msg").append(" Error"); }
			});	
		}
		
		onloadTable();
		
	});
	</script>
	
	
</body>
</html>