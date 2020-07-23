<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Empresa de Calzados</title>
 <link rel="stylesheet" href="./css/estilo.css" />
</head>

<body>
<header id="Cabecera">
  <div id="TituloCabecera">Empresa de Calzados</div>
</header>
<aside id="Opciones">
<div class="TituloOpciones"><a href="ControladorInicio?instruccion=noticia">INICIO</a></div>
<div class="TituloOpciones">CLIENTES</div> 
<ul>
<li><a href="ControladorCliente?instruccion=listar">VER CLIENTES</a></li> 
<li><a href="clientes/agregar.jsp">NUEVO CLIENTE</a></li>
<li><a href="ControladorCliente?instruccion=modificar">MODIFICAR</a></li>
</ul>
<div class="TituloOpciones">PEDIDOS</div>
<ul>
<li><a href="ControladorPedido?instruccion=nuevo">NUEVO PEDIDO</a></li>
<li><a href="ControladorPedido?instruccion=listar">VER PEDIDOS</a></li>
</ul>
<div class="TituloOpciones">PRODUCTOS</div>
<ul>
<li><a href="productos/agregarProducto.jsp">NUEVO PRODUCTO</a></li>
<li><a href="ControladorProducto?instruccion=listar">VER PRODUCTOS</a></li>
<li><a href="ControladorProducto?instruccion=modificar">MODIFICAR PRODUCTO</a></li>
</ul> 
</aside>
<div id="Visualizacion"> <h2>LISTA DE CLIENTES:</h2><form name="modificacion" method="get" action="clientes/modificando.jsp"><select name="listaCliente" id="listaCliente">
<option selected="selected" disabled selected value>-SELECCIONE CLIENTE-</option>
<c:forEach var="tempCliente" items="${LISTACLIENTES}">
<option value="${tempCliente.cod_cliente}/${tempCliente.nombre}/${tempCliente.apellido}/${tempCliente.dni}/${tempCliente.telefono}/${tempCliente.direccion}/${tempCliente.correo}">${tempCliente.nombre} ${tempCliente.apellido} </option>
</c:forEach>
</select> <input type="submit" name="submit" id="submit" value="Modificar"></td></form> 
<form name="form1" method="get" action="ControladorCliente">
<input type="hidden" name="instruccion" value="modificarCliente">
<table width="60%" border="2" cellspacing="0" cellpadding="1">
  <tbody>
      <tr>
      <td width="25%">Codigo Cliente</td>
      <td width="90%"><input type="text" name="codigoCliente" id="codigoCliente"" readonly></td>
    </tr>
  
    <tr>
      <td width="25%">Nombre</td>
      <td width="90%"><input type="text" name="nombre" id="nombre" required></td></tr>
    <tr>
      <td>Apellido</td>
      <td><input type="text" name="apellido" id="apellido" required></td>
    </tr>
    <tr>
      <td>DNI</td>
      <td><input type="text" name="dni" id="dni" required></td>
    </tr>
    <tr>
      <td>Telefono</td>
      <td><input type="text" name="telefono" id="telefono" required></td>
    </tr>
    <tr>
      <td>Direccion</td>
      <td><input type="text" name="direccion" id="direccion" class="textoLargo" required></td>
    </tr>
    <tr>
      <td>Correo</td>
      <td><input type="text" name="correo" id="correo" class="textoLargo" required></td>
    </tr>
  </tbody>
</table></form>

</div>

</body>
</html>