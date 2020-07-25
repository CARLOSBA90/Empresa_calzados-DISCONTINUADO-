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
<h2>REALIZAR PEDIDO</h2>

<table border="2" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<td class="filas">
<form id="form1" method="get" action="ControladorPedido">
<input type="hidden" name="instruccion" value="insertarBBDD">
<label for="select">CLIENTE</label>
<select name="cliente" id="cliente" style="width:175px;">
<option>-SELECCIONE CLIENTE-</option>
 <c:forEach var="tempC" items="${LISTACLIENTES}">
      <option value="${tempC.cod_cliente}" name="${tempC.cod_cliente}">${tempC.nombre} ${tempC.apellido}</option>
   </c:forEach>
</select>&nbsp; &nbsp;
  <label for="select">FORMA DE PAGO</label>
  <select name="forma" id="forma">
      <option value="contado">CONTADO</option>
     <option value="credito">CREDITO</option>
  </select> &nbsp;  &nbsp; &nbsp; 
  <input type="hidden" id="SALIDA" name="salida" value="">     
  <input type="submit" name="submit" value="Realizar Pedido">
       
           
</form>
</td>
</tr>
<tr>
<td class="filas">
<label for="select">PRODUCTO</label>
  <select name="prod" id="prod" value="" onchange="insertarStock();">
    <option>-SELECCIONE PRODUCTO-</option>
  <c:forEach var="tempP" items="${LISTAPRODUCTOS}">
      <option value="${tempP.cod_calzado},${tempP.stock},${tempP.tipo},${tempP.nombre}" id="${tempP.tipo}${tempP.nombre}">${tempP.tipo}: ${tempP.nombre}</option>
   </c:forEach> 
  </select>&nbsp; &nbsp;

<label for="select">CANTIDAD</label>
  <select name="cantidad" id="cantidad">
  <option>--</option>
      </select>   &nbsp; &nbsp;
    <button onclick="Agregar()">Agregar</button> 
&nbsp; &nbsp; <button onclick="location.href='ControladorPedido?instruccion=nuevo'">Borrar Todo</button> 
</td>
</tr></tbody></table>

<table id="tabla" cellspacing="0" cellpadding="2"><tbody>
<tr>
<td class="filas">CODIGO ARTICULO</td>
<td class="filas">TIPO</td>
<td class="filas">NOMBRE</td>
<td class="filas">CANTIDAD</td>
</tr>


</tbody></table>

</div>


<script>

var codigo="";
var stockP="";

 var fila=1;
      
      function insertarStock() {
    	  
    	  document.getElementById("cantidad").innerHTML = "";
       
    	  var x = document.getElementById("prod").value;
    	  
    	  var field =x.split(/,/);
    	  
    	  var stock = field[1];
    	  
    	  if(stock!=null){
 
        
        var forma =document.getElementById('cantidad');
        
     
          for(var i=1; i<=stock;i++){	
          var opcion = document.createElement('option'); 
        	  opcion.value=i;
        	  opcion.text=i;
        	  forma.add(opcion);
        	  
    	  }
    	  }
    	  
    	  
      }
      
      function Agregar(){
    	  
          var x = document.getElementById("prod").value;
    	  
    	  var field = x.split(/,/);
    	  
    	  var cant = document.getElementById("cantidad").value;
    	  
    	  var stockRestante = field[1]-cant;
    	  
    	  var nuevoField = field[0]+","+stockRestante+","+field[2]+","+field[3];
    	  
    	  document.getElementById(field[2]+field[3]).value = nuevoField;
    	 
   /* 	  
        document.getElementById("tabla").innerHTML = "<td>"+field[0]+"</td><td>"+field[2]+"</td><td>"+field[3]+"</td><td>"+cant+"</td>";
     */
     
        var nuevaFila=document.getElementById("tabla");
     
        var fila = nuevaFila.insertRow(fila);
     
        var celdaCOD=fila.insertCell(0);
        
        celdaCOD.className += (celdaCOD.className ? " " : "")+"filas";
        
        var celdaTIPO=fila.insertCell(1);
        
        celdaTIPO.className += (celdaTIPO.className ? " " : "")+"filas";
        
        var celdaNOM=fila.insertCell(2);
        
        celdaNOM.className += (celdaNOM.className ? " " : "")+"filas";
        
        var celdaSTOCK=fila.insertCell(3);
        
        celdaSTOCK.className += (celdaSTOCK.className ? " " : "")+"filas";
        
        fila++;
    
        celdaCOD.innerHTML=""+field[0];
        
        celdaTIPO.innerHTML=""+field[2];
        
        celdaNOM.innerHTML=""+field[3];
        
        celdaSTOCK.innerHTML=""+cant;
        
        codigo+=","+field[0];
        stockP+=","+cant;
        
        document.getElementById("SALIDA").value =codigo+stockP;
        
     
        document.getElementById("prod").selectedIndex = 0;
      
      
      
      }
    </script>

</body>
</html>
