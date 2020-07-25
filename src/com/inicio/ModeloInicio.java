package com.inicio;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class ModeloInicio {
	
	private Connection miConexion;
	
   public void conexion() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			miConexion = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_calzado","root",""); 
	   //  miConexion = (Connection) DriverManager.getConnection("jdbc:mysql://node51735-empresacz.jelastic.saveincloud.net:3306/empresa_calzado","usuario","PvW3GqfSb7JsQW4F"); 	 
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();}
		
	}
	

	public List<Noticia> getNoticias() throws Exception{
		// TODO Auto-generated method stub
		
		List<Noticia> noticias = new ArrayList<>();
		
		Statement miStatement = null;
		
		ResultSet miResulset = null;
		
		
		try {
			
			conexion();
			
			String sql = "SELECT * FROM inicio";
			
			miStatement = miConexion.createStatement();
			
			miResulset = miStatement.executeQuery(sql);
			
			while(miResulset.next()) {
				
				int codigo=miResulset.getInt(1);
				String titulo=miResulset.getString(2);
				String texto=miResulset.getString(3);
				Date fecha=miResulset.getDate(4);
				
				Noticia temp = new Noticia(fecha,titulo,texto,codigo);
				
				noticias.add(temp);
				
			}
			
			
		}finally {
	    	miStatement.close();
			miConexion.close();
	    }
		
		
		
		return noticias;
	}


	
	
	public List<Noticia> getTablero() throws Exception{
		// TODO Auto-generated method stub
		
        List<Noticia> tablero = new ArrayList<>();
		
		Statement miStatement = null;
		
		ResultSet miResulset = null;
		
		
		try {
			
			conexion();
			
			String sql = "SELECT * FROM tablero";
			
			miStatement = miConexion.createStatement();
			
			miResulset = miStatement.executeQuery(sql);
			
			while(miResulset.next()) {
				
				int codigo=miResulset.getInt(1);
				String titulo=miResulset.getString(2);
				String texto=miResulset.getString(3);
				Date fecha=miResulset.getDate(4);
				
				Noticia temp = new Noticia(fecha,titulo,texto,codigo);
				
				tablero.add(temp);
				
			}
			
			
		}finally {
	    	miStatement.close();
			miConexion.close();
	    }
		
		
		
		return tablero;
		
		
	}


	public void agregarNuevaNota(Noticia temp) throws SQLException {
		// TODO Auto-generated method stub
		
		PreparedStatement miStatement=null;
		
		try {
			
			
			conexion();
			
			String sql="INSERT INTO tablero(titulo,texto,fecha) VALUES(?,?,?)";
			
			miStatement=miConexion.prepareStatement(sql);
			
			miStatement.setString(1,temp.getTitulo());
			
			miStatement.setString(2,temp.getTexto());
			
			miStatement.setDate(3,new Date(Calendar.getInstance().getTime().getTime()));
			
			
			miStatement.execute();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
		}
        	miStatement.close();
			miConexion.close();
        }
		
	

}
