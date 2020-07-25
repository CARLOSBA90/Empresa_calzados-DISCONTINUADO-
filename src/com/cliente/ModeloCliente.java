package com.cliente;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class ModeloCliente {
	
	//private DataSource origenDatos;
	  private Connection miConexion=null;
	  
	
	public ModeloCliente() {
		
	}
	
	public List<Cliente> getClientes() throws Exception{
		
		List<Cliente> clientes = new ArrayList<>();
		
		Statement miStatement=null;
		
		ResultSet miResulset=null;
		
		
		try {
		// ESTABLECER CONEXION Y USAR SENTENCIA SQL
			
		Conexion();
		
		String instruccion="SELECT * FROM cliente";
		
		miStatement=miConexion.createStatement();
		
		 /// EJECUTAR SQL
		
		miResulset=miStatement.executeQuery(instruccion);
		
		
		/// RECORRER EL RESULSET
		
		while(miResulset.next()) {
			
			int    codigo=miResulset.getInt(1);
			String nombre=miResulset.getString(2);
			String apellido=miResulset.getString(3);
			int    dni=miResulset.getInt(4);
			int    telefono=miResulset.getInt(5);
			String direccion=miResulset.getString(6);
			String correo=miResulset.getString(7);
			
			Cliente clienteTemp= new Cliente(codigo,nombre,apellido,dni,telefono,direccion,correo);
			
			clientes.add(clienteTemp);
			
		}}catch(SQLException e) {
			
			e.printStackTrace();
    	      }finally {
        	miStatement.close();
			miConexion.close();
        }
		
		return clientes;
	}

	private void Conexion() {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			miConexion= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_calzado","root",""); 
			//  miConexion= (Connection) DriverManager.getConnection("jdbc:mysql://node51735-empresacz.jelastic.saveincloud.net:3306/empresa_calzado","usuario","PvW3GqfSb7JsQW4F"); 	 
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();}
	
	
	}

	public void agregarNuevoCliente(Cliente nuevoCliente) throws SQLException {
		// TODO Auto-generated method stub
		
		PreparedStatement miStatement=null;
		
		try{
			Conexion();
			
			String sql="INSERT INTO cliente(nombre,apellido,dni,telefono,direccion,correo) "
					+ "VALUES(?,?,?,?,?,?)";
			
			
			miStatement=miConexion.prepareStatement(sql);
			
			///Establecer clientes
			
			miStatement.setString(1,nuevoCliente.getNombre());
			
			miStatement.setString(2,nuevoCliente.getApellido());
			
			miStatement.setInt(3,nuevoCliente.getDni());
			
			miStatement.setInt(4,nuevoCliente.getTelefono());
			
			miStatement.setString(5,nuevoCliente.getDireccion());
			
			miStatement.setString(6,nuevoCliente.getCorreo());
			
			///EJECUTAR SQL
			
			miStatement.execute();
			
			
			
		}catch(SQLException e) {
			
			e.printStackTrace();
    	      }finally {
        	miStatement.close();
			miConexion.close();
        }
		
		
	}

	public void eliminar(int codigo) {
		// TODO Auto-generated method stub
			
		PreparedStatement miStatement=null;
		
		try {
			
			Conexion();
			
			String sql="DELETE FROM cliente WHERE cod_cliente=?";
			
			miStatement=miConexion.prepareStatement(sql);
			
			miStatement.setInt(1,codigo);
			
			miStatement.execute();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public void actualizar(Cliente temp) throws SQLException {
		// TODO Auto-generated method stub
			
		 PreparedStatement miStatement=null;
		 
		 try {
		
			Conexion();
				
			String sql="UPDATE cliente SET nombre=?, apellido=?, dni=?, telefono=?, direccion=?, correo=? WHERE cod_cliente=?";	
			
			miStatement = miConexion.prepareStatement(sql);
			
			
			miStatement.setString(1,temp.getNombre());
			
			miStatement.setString(2,temp.getApellido());
			
			miStatement.setInt(3, temp.getDni());
			
			miStatement.setInt(4, temp.getTelefono());
			
			miStatement.setString(5,temp.getDireccion());
			
			miStatement.setString(6,temp.getCorreo());
			
			miStatement.setInt(7, temp.getCod_cliente());
			
			miStatement.execute();
			 
		 }catch(SQLException e) {
				
				e.printStackTrace();
	    	      }finally {
	        	miStatement.close();
				miConexion.close();
	        }
		
	}
	
	

}
