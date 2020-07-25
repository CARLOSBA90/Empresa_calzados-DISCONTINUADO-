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
<div class="OpcionSuperior"><a href="ControladorInicio?instruccion=noticia">INICIO</a></div>
<div class="OpcionSuperior"><a href="ControladorInicio?instruccion=tablero">TABLERO</a></div>
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
<h2>LISTADO DE PEDIDOS</h2>
<table border="2" cellspacing="0" cellpadding="1">
<tbody> 
<tr> 
     <td class="filas">CODIGO PEDIDO</td>
     <td class="filas">CLIENTE</td>
     <td class="filas">FORMA PAGO</td>
     <td class="filas">ENVIADO</td>
     <td class="filas">FECHA</td>
     <td class="filas">CANTIDAD</td>
     <td class="filas">TOTAL</td>
     <td class="filas">DETALLE</td>


</tr>

<c:forEach var="tempP" items="${LISTAPEDIDOS}">

<tr>
     <td class="filas"> ${tempP.cod_pedido} </td>
     <td class="filas"> (${tempP.cod_producto})${tempP.nombreApellido} </td>
     <td class="filas"> ${tempP.forma_pago} </td>
     <td class="filas"> 
     <c:set value="${tempP.enviado}" var="enviado"/>
     <c:out value="${enviado eq true ? 'SI': 'NO'}"/>
      </td>
     <td class="filas"> ${tempP.fecha} </td>
     <td class="filas"> ${tempP.cantidadCalzados} </td>
     <td class="filas"> ${tempP.total} </td>
     <td class="filas"> ${tempP.cantidad} </td>


</tr>

</c:forEach> 
 

</tbody>
</table>
</div>
</body>
</html>