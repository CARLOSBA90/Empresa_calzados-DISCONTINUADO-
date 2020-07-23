package com.producto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cliente.Cliente;

public class ModeloProducto {
	
	private Connection miConexion;
	
	
	
	public void conexion() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		//	miConexion = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_calzado","root",""); 
	     miConexion = (Connection) DriverManager.getConnection("jdbc:mysql://node51735-empresacz.jelastic.saveincloud.net:3306/empresa_calzado","usuario","PvW3GqfSb7JsQW4F"); 	 
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();}
		
	}



	public List<Producto> getProductos() throws Exception {
		// TODO Auto-generated method stub
		List<Producto> productos = new ArrayList<>();
		
		Statement miStatement = null;
		
		ResultSet miResulset=null;
		
		try {
	     
	     conexion();
		 
	     String sql = "SELECT * FROM producto_calzado";
	     
	     miStatement= miConexion.createStatement();
	     
	     miResulset= miStatement.executeQuery(sql);
	     
	     while(miResulset.next()) {
	    	 
	    	 int codigo=miResulset.getInt(1);
	    	 String tipo=miResulset.getString(2);
	    	 String nombre=miResulset.getString(3);
	    	 double precio=miResulset.getDouble(4);
	    	 String fabricante=miResulset.getString(5);
	    	 int talla=miResulset.getInt(6);
	    	 int stock=miResulset.getInt(7);
	    	 
	    	 Producto temp = new Producto(codigo,tipo,nombre,precio,fabricante,talla,stock);
	    	
	    	 productos.add(temp);
	    
	     }
		
		
		}finally {
    	miStatement.close();
		miConexion.close();
    }
		
		return productos;
	}



	public void insertar(Producto temp) {
		// TODO Auto-generated method stub
		
		PreparedStatement miStatement=null;
		
		try {
			conexion();
			
			String sql="INSERT INTO producto_calzado(tipo,nombre,precio,fabricante,talla,stock) values(?,?,?,?,?,?)";
			
			miStatement= miConexion.prepareStatement(sql);
			
			miStatement.setString(1,temp.getTipo());
			miStatement.setString(2,temp.getNombre());
			miStatement.setDouble(3,temp.getPrecio());
			miStatement.setString(4,temp.getFabricante());
			miStatement.setInt(5,temp.getTalla());
			miStatement.setInt(6,temp.getStock());
			
			miStatement.execute();
			
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
	    	try {
				miStatement.close();
				miConexion.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	    }
		
		
		
	}



	public void eliminar(int codigo) {
		// TODO Auto-generated method stub
		
		PreparedStatement miStatement=null;
		
		try{
			conexion();
			
			String sql="DELETE FROM producto_calzado WHERE cod_calzado=?";
			
			miStatement= miConexion.prepareStatement(sql);
			
			miStatement.setInt(1,codigo);
			
			miStatement.execute();
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
	    	try {
				miStatement.close();
				miConexion.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	    }
		
		
		
	}



	public void actualizar(Producto temp) {
		// TODO Auto-generated method stub
		
		PreparedStatement miStatement=null;
		
		try {
			
			conexion();
			
			String sql = "UPDATE producto_calzado set tipo=?, nombre=?, precio=?, fabricante=?, talla=?, stock=? WHERE cod_calzado=?";
			
			miStatement = miConexion.prepareStatement(sql);
			
			miStatement.setInt(7,temp.getCod_calzado());
			miStatement.setString(1,temp.getTipo());
			miStatement.setString(2,temp.getNombre());
			miStatement.setDouble(3,temp.getPrecio());
			miStatement.setString(4,temp.getFabricante());
			miStatement.setInt(5,temp.getTalla());
			miStatement.setInt(6,temp.getStock());
			
			miStatement.execute();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
	    	try {
				miStatement.close();
				miConexion.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	    }
		
	}

}
