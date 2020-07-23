<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    

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
<h2>AGREGAR NUEVO PRODUCTO</h2>
<form name="NuevoProducto" method="get" action="../ControladorProducto">
<input type="hidden" name="instruccion" value="insertarBBDD">
<table width="60%" border="2" cellspacing="0" cellpadding="1">
  <tbody>
    <tr>
      <td width="25%">Tipo</td>
      <td width="90%"><input type="text" name="tipo" id="tipo" required></td>
    </tr>
    <tr>
      <td>Nombre</td>
      <td><input type="text" name="nombre" id="nombre" required></td>
    </tr>
    <tr>
      <td>Precio</td>
      <td><input type="text" name="precio" id="precio" required></td>
    </tr>
    <tr>
      <td>Fabricante</td>
      <td><input type="text" name="fabricante" id="fabricante" required></td>
    </tr>
    <tr>
      <td>Talla</td>
      <td><input type="text" name="talla" id="talla" required></td>
    </tr>
    <tr>
      <td>Stock</td>
      <td><input type="text" name="stock" id="stock" required></td>
    </tr>
    <tr>
      <td><input type="reset" name="reset" id="reset" value="Restablecer" ></td>
      <td><input type="submit" name="submit" id="submit" value="Enviar"></td>
    </tr>
  </tbody>
</table></form>


</div>
</body>
</html>