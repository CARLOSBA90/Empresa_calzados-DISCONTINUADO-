<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Empresa de Calzados</title>
 <link rel="stylesheet" href="../css/estilo.css" />
</head>
<body>
<header id="Cabecera">
  <div id="TituloCabecera">Empresa de Calzados</div>
</header>
<aside id="Opciones">
<div class="OpcionSuperior"><a href="../ControladorInicio?instruccion=noticia">INICIO</a></div>
<div class="OpcionSuperior"><a href="../ControladorInicio?instruccion=tablero">TABLERO</a></div>
<div class="TituloOpciones">CLIENTES</div> 
<ul>
<li><a href="../ControladorCliente?instruccion=listar">VER CLIENTES</a></li> 
<li><a href="../clientes/agregar.jsp">NUEVO CLIENTE</a></li>
<li><a href="../ControladorCliente?instruccion=modificar">MODIFICAR</a></li>
</ul>
<div class="TituloOpciones">PEDIDOS</div>
<ul>
<li><a href="../ControladorPedido?instruccion=nuevo">NUEVO PEDIDO</a></li>
<li><a href="../ControladorPedido?instruccion=listar">VER PEDIDOS</a></li>
</ul>
<div class="TituloOpciones">PRODUCTOS</div>
<ul>
<li><a href="../productos/agregarProducto.jsp">NUEVO PRODUCTO</a></li>
<li><a href="../ControladorProducto?instruccion=listar">VER PRODUCTOS</a></li>
<li><a href="../ControladorProducto?instruccion=modificar">MODIFICAR PRODUCTO</a></li>
</ul> 
</aside>
<div id="Visualizacion">
<% String[] datos = new String[7];
   String parametro= request.getParameter("listaProducto");
   int c=0;
   if(parametro!=null&&parametro!=""){
   for(int i=0; i<parametro.length();i++){
	   
	   if(parametro.charAt(i)!='/') {
		   
		   if(datos[c]==null) datos[c]="";
		   datos[c]+=parametro.charAt(i);} else c++;
	   
   }}

%>
 <h2>ACTUALIZAR PRODUCTO</h2>
<form name="Actualizacion" method="get" action="../ControladorProducto">
<input type="hidden" name="instruccion" value="actualizar">
<table width="60%" border="2" cellspacing="0" cellpadding="1">
  <tbody>
      <tr>
      <td width="25%">Codigo Producto</td>
      <td width="90%"><input type="text" name="codigoProducto" id="codigoProducto"" value="<%=datos[0]%>" readonly></td>
    </tr>
    <tr>
      <td width="25%">Tipo</td>
      <td width="90%"><input type="text" name="tipo" id="tipo" value="<%=datos[1]%>"  required></td>
    </tr>
    <tr>
      <td>Nombre</td>
      <td><input type="text" name="nombre" id="nombre" value="<%=datos[2]%>"  required></td>
    </tr>
    <tr>
      <td>Precio</td>
      <td><input type="text" name="precio" id="precio" value="<%=datos[3]%>"  required></td>
    </tr>
    <tr>
      <td>Fabricante</td>
      <td><input type="text" name="fabricante" id="fabricante" value="<%=datos[4]%>"  required></td>
    </tr>
    <tr>
      <td>Talla</td>
      <td><input type="text" name="talla" id="talla" value="<%=datos[5]%>"  required></td>
    </tr>
    <tr>
      <td>Stock</td>
      <td><input type="text" name="stock" id="stock" value="<%=datos[6]%>"  required></td>
    </tr>
    <tr>
      <td><a href="../ControladorProducto?instruccion=eliminar&Codigo=<%=datos[0]%>" ><input type="button" name="Eliminar" id="Eliminar" value="Eliminar"></a></td>
      <td><input type="submit" name="submit" id="submit" value="Actualizar"></td>
    </tr>
  </tbody>
</table></form>


</div>
</body>
</html>