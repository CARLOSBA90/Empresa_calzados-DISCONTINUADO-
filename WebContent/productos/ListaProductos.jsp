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
<h2>LISTADO DE PRODUCTOS</h2>
<table border="2" cellspacing="0" cellpadding="1">
<tbody> 
<tr> 
     <td class="filas">CODIGO PRODUCTO</td>
     <td class="filas">TIPO</td>
     <td class="filas">NOMBRE</td>
     <td class="filas">PRECIO</td>
     <td class="filas">FABRICANTE</td>
     <td class="filas">TALLA</td>
     <td class="filas">STOCK</td>


</tr>

<c:forEach var="tempProducto" items="${LISTAPRODUCTOS}">

<tr>
     <td class="filas"> ${tempProducto.cod_calzado} </td>
     <td class="filas"> ${tempProducto.tipo} </td>
     <td class="filas"> ${tempProducto.nombre} </td>
     <td class="filas"> ${tempProducto.precio} </td>
     <td class="filas"> ${tempProducto.fabricante} </td>
     <td class="filas"> ${tempProducto.talla} </td>
     <td class="filas"> ${tempProducto.stock} </td>


</tr>

</c:forEach> 
 

</tbody>
</table>
</div>
</body>
</html>