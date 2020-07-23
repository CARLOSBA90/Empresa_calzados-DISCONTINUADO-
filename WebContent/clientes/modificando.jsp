<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import ="java.util.*, com.cliente.*" %>
<!doctype html>
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
<div class="TituloOpciones"><a href="../ControladorInicio?instruccion=noticia">INICIO</a></div>
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
   String parametro= request.getParameter("listaCliente");
   int c=0;
   if(parametro!=null&&parametro!=""){
   for(int i=0; i<parametro.length();i++){
	   
	   if(parametro.charAt(i)!='/') {
		   
		   if(datos[c]==null) datos[c]="";
		   datos[c]+=parametro.charAt(i);} else c++;
	   
   }}

%>
<h2>MODIFICACION DEL REGISTRO ACTUAL: </h2>
<form name="Modificacion" method="get" action="ControladorCliente">
<input type="hidden" name="instruccion" value="actualizar">
<table width="60%" border="2" cellspacing="0" cellpadding="1">
  <tbody>
      <tr>
      <td width="25%">Codigo Cliente</td>
      <td width="90%"><input type="text" name="codigoCliente" id="codigoCliente"" value="<%=datos[0]%>"readonly></td>
    </tr>
  
    <tr>
      <td width="25%">Nombre</td>
      <td width="90%"><input type="text" name="nombre" id="nombre" value="<%=datos[1]%>" required></td></tr>
    <tr>
      <td>Apellido</td>
      <td><input type="text" name="apellido" id="apellido" value="<%=datos[2]%>" required></td>
    </tr>
    <tr>
      <td>DNI</td>
      <td><input type="text" name="dni" id="dni" value="<%=datos[3]%>" required></td>
    </tr>
    <tr>
      <td>Telefono</td>
      <td><input type="text" name="telefono" id="telefono" value="<%=datos[4]%>" required></td>
    </tr>
    <tr>
      <td>Direccion</td>
      <td><input type="text" name="direccion" id="direccion" value="<%=datos[5]%>"  class="textoLargo" required></td>
    </tr>
    <tr>
      <td>Correo</td>
      <td><input type="text" name="correo" id="correo" value="<%=datos[6]%>" class="textoLargo" required></td>
    </tr>
    <tr><td><a href="ControladorCliente?instruccion=eliminar&Codigo=<%=datos[0]%>" ><input type="button" name="Eliminar" id="Eliminar" value="Eliminar"></a></td>
      <td><input type="submit" name="submit" id="submit" value="actualizar"></td>
    </tr>
  </tbody>
</table></form>

</div>

</body>
</html>