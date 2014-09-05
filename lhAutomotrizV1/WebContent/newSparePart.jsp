<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Arrays"	%>
<%@page import="java.util.List"		%>

<%@page import="com.lhweb.load.model.*"%>





<%@page	language="java" 
				contentType="text/html; charset=UTF-8"
    		pageEncoding="UTF-8"
    		%>


<%

	String sparePartString = request.getParameter("sparePart").toString();	
	Stock auxStock = new Stock();
	List<String> aux = auxStock.stringFormattedToStringList(sparePartString);
	
	
	String compatibility = request.getParameter("compatibility");
	//List<String> auxCompatibility = auxStock.stringFormattedToStringList(compatibility);

	List<String> compati = null;
	
	try{
		compati = Arrays.asList(compatibility.split(","));
	}catch(Exception e){
		
	}

	HashMap<String,String> keyValue = new HashMap<String,String>();
    
  for(String s : aux){	 
	  
	  List<String> a;
	  a = Arrays.asList(s.split(":"));
	  
	  if(a.size() == 1 ){
		  keyValue.put(a.get(0), "");
	  }
	  else if (a.size() == 2 ){
		  keyValue.put(a.get(0),a.get(1));
	  }
	  	    
  }
    
  	SparePart sparePart = new SparePart();
	sparePart.setBarCode(keyValue.get("barCode"));
	sparePart.setSparePartName(keyValue.get("sparePart"));
	sparePart.setBriefDescription(keyValue.get("briefDescription"));
	sparePart.setBrand(keyValue.get("brand"));
	sparePart.setPartNumber(keyValue.get("partNumber"));
	sparePart.setBrandNumber(keyValue.get("brandNumber"));
	//sparePart.setSystems(keyValue.get("briefDescription"));//arreglo
	//sparePart.setCompatibility(models);
	/**********************************************************************************/
	
	try{
		for(int i=0; i<compati.size(); i++){
			System.out.println(compati.get(i)+" -- "+compati.get(i+1)+" -- "+compati.get(i+2)+" -- "+compati.get(i+3));
			sparePart.addCarToCompatibility(compati.get(i)+"-"+compati.get(i+1));
			sparePart.addEditionToCar("",compati.get(i)+"-"+compati.get(i+1));
			int desde = Integer.parseInt(compati.get(i+2));
			int hasta = Integer.parseInt(compati.get(i+3));
			for(int d =desde; d<= hasta; d++){			
				sparePart.addModelToEdition(d,"",compati.get(i)+"-"+compati.get(i+1));
			}
			//sparePart.addModelToEdition(Integer.parseInt(compati.get(i+2)),compati.get(i+1),compati.get(i));
			i = i+3;
		}	
	}catch(Exception e){
		
	}	
	
/*******************************************************************************/
	
	
	//sparePart.setCompatibility(keyValue.get("compatibility"));//json
	//sparePart.setProviders(keyValue.get("briefDescription"));//arreglo
	
	sparePart.setStockMin(Integer.parseInt(keyValue.get("stockMin").toString()));
	sparePart.setSalePrice(Double.parseDouble(keyValue.get("salePrice").toString()));
	//sparePart.setSpecialOfferPrice(Double.parseDouble(keyValue.get("salePrice")));
	
	
	//System.out.println(sparePart.getCompatibility());
	
	int responseValue = sparePart.storeSparePart();
	if(responseValue<0){
		//System.out.println("Se Registro El Articulo");
		out.println("Se Registro El Articulo");
	}else{
		//System.out.println("El Articulo Ya Existe");
		out.println("El Articulo Ya Existe");
	}
%>
