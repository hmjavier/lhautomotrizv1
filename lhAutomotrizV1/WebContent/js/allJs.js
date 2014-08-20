$("#altaSP").click(function(env){
	var sparePart = {
			"barCode" : $("#barCode").val(),
			"howMany" : $("#howMany").val(),
			"partNumber" : $("#numeroSerie").val(),
			"provider" : $("#proveedor").val(),
			"purchasePrice" : $("#precio").val()
			};
	$(".form-control").val('');
	ajaxSend("incomingStock.jsp", sparePart);
});

$("#ventaSP").click(function(env){
	var sparePart = {
			"barCode" : $("#barCode").val(),
			"cantidad" : $("#cantidad").val(),
			"numSerie" : $("#numeroSerie").val(),
			"total" : $("#total").val()
			};
	$(".form-control").val('');
	ajaxSend("outcomingStock.jsp", sparePart);
});

function mensajes(msg){
	alert(msg.trim());
}

function ajaxSend(invoke, data){
	
	$.ajax({	
				type:"POST",
				url: invoke,
	       		data: "sparePart="+JSON.stringify(data),
	       		success: function(msg)    {
	       			if(msg.indexOf("Error Entrada") >= 0){
	       				//console.log("Error en entrada");
	       				mensajes(msg);
	       				//$("#contentLH").attr("src" , $(this).attr("data-url"));
	       				//$("#contentLH").attr("src", "cargaArticulo.jsp");
	       				//$("#contentLH").load("http://www.google.com");
	       		    	//$(".menuLH").removeClass("active");
	       		    	//$(this).addClass("active");
	       				
	       			}else if(msg.indexOf("Error Venta") >= 0){
	       				//console.log("Error en venta");
	       				mensajes(msg);
	       				//$("#contentLH").attr("src", "cargaArticulo.jsp");
	       				//$("#contentLH").load("http://www.google.com");
	       			}else{
	       				mensajes(msg);
	       			}
	       			//mensajes(msg);
	       			/*alert(msg.trim());
	       			$("span#msg").empty();
	       			$("span#msg").append(msg);*/
	       		},
	       		error:   function(xml,msg){
	       			mensajes(msg);
	       			//alert("Error:Favor de Revisar los Valores"); 
	       		}
	 });
}




