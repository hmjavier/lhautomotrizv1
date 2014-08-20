package com.lhweb.inventory;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lhweb.load.model.SparePart;

/**
 * Servlet implementation class deleteSpare
 */
@WebServlet("/deleteSpare")
public class deleteSpare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteSpare() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String brandNumber = request.getParameter("brandNumber").toString();		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String result = "7";
		try{
			SparePart sparePart = new SparePart();
			sparePart.loadSparePartByBrandNumber(brandNumber);
			sparePart.removeSparePart();
			result = "0";
			System.out.println("Lo elimine");
		}catch(Exception e){
			e.printStackTrace();
			result = "1";
		}
		
		System.out.println(result);
		out.print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
