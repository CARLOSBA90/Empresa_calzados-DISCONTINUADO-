<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
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
<div id="Visualizacion">
<h2>LISTADO DE CLIENTES</h2>
<table border="2" cellspacing="0" cellpadding="1">
<tbody> 
<tr> 
     <td class="filas">CODIGO CLIENTE</td>
     <td class="filas">NOMBRE</td>
     <td class="filas">APELLIDO</td>
     <td class="filas">DNI</td>
     <td class="filas">TELEFONO</td>
     <td class="filas">DIRECCION</td>
     <td class="filas">CORREO</td>


</tr>

<c:forEach var="tempCliente" items="${LISTACLIENTES}">

<tr>
     <td class="filas"> ${tempCliente.cod_cliente} </td>
     <td class="filas"> ${tempCliente.nombre} </td>
     <td class="filas"> ${tempCliente.apellido} </td>
     <td class="filas"> ${tempCliente.dni} </td>
     <td class="filas"> ${tempCliente.telefono} </td>
     <td class="filas"> ${tempCliente.direccion} </td>
     <td class="filas"> ${tempCliente.correo} </td>


</tr>

</c:forEach> 
 

</tbody>
</table>


</div>
</body>
</html>