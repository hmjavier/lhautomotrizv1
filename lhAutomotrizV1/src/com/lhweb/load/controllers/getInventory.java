package com.lhweb.load.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//import net.sf.json.JSONArray;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.lhweb.load.model.SparePart;
import com.lhweb.load.model.Stock;

/**
 * Servlet implementation class getInventory
 */
@WebServlet("/getInventory")
public class getInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getInventory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		SparePart report = new SparePart();
		List<HashMap<String,Object>> a = report.getExistenceReport();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String data = "";
		
		
		
		for(int i=0; i<a.size(); i++){
			String trClass = "success";

			SparePart sparePart = new SparePart();
			sparePart.loadSparePartByBrandNumber(a.get(i).get("brandNumber").toString());
			
			if((sparePart.getStockMin()) >= (sparePart.getExistence())){
				trClass = "danger";
			}
			
			data += "<tr class='"+trClass+"'><td>"+sparePart.getSparePartName()+"</td>";
			data += "<td>"+sparePart.getBrand()+"</td>";
			data += "<td>"+sparePart.getBrandNumber()+"</td>";
			data += "<td>"+sparePart.getPartNumber()+"</td>";
			data += "<td>"+sparePart.getStockMin()+"</td>";
			data += "<td>"+sparePart.getExistence()+"</td>";
			data += "<td>"+sparePart.getCompatibility().values().toString().replace("\"", "").replace("{", "").replace("[", "").replace("}", "").replace("]", "")+"</td></tr>";
			//data += "<td>Algo</td></tr>";
			
			  
		}
		
		/*
		for(int i=0; i<a.size(); i++){
			String trClass = "success";
			if((Integer.parseInt(a.get(i).get("stockMin").toString())) >= ((Integer.parseInt(a.get(i).get("existence").toString())))){
				trClass = "danger";
			}
			data += "<tr class='"+trClass+"'><td>"+a.get(i).get("sparePart")+"</td>";			
			data += "<td>"+a.get(i).get("brand")+"</td>";
			data += "<td>"+a.get(i).get("brandNumber")+"</td>";
			data += "<td>"+a.get(i).get("partNumber")+"</td>";
			data += "<td>"+a.get(i).get("stockMin")+"</td>";
			data += "<td>"+a.get(i).get("existence")+"</td>";
			data += "<td>"+a.get(i).get("compatibility")+"</td></tr>";
			
		}*/
		System.out.println(data);
		out.write(data);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
