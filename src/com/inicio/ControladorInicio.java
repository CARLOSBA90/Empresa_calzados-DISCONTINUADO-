package com.inicio;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControladorInicio
 */
@WebServlet("/ControladorInicio")
public class ControladorInicio extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ModeloInicio modelo;
	
	public ControladorInicio() {
		
		modelo = new ModeloInicio();
		
	}
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String comando = request.getParameter("instruccion");
		
		if(comando==null) comando="noticia";
		
		switch(comando) {
		
		case "noticia": 
			obtenerNoticias(request,response);
			
		default:

		}
		
		
		
		
	}



	private void obtenerNoticias(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		List<Noticia> noticias;
		
		try {
			noticias=modelo.getNoticias();
			
			request.setAttribute("NOTICIAS",noticias);
			
			RequestDispatcher miDispatcher=request.getRequestDispatcher("inicio/inicio.jsp");
			
			miDispatcher.forward(request,response);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
