<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="utf-8">
        <title>Empresa de Calzados</title>
        <link rel="stylesheet" href="./css/bootstrap.min.css" />
        <link rel="stylesheet" href="./css/estilo.css" />
      </head>
      <body>
        <header>
          <div>Empresa de Calzados</div>
        </header>
        <aside>
          <div class=""><a href="ControladorInicio?instruccion=noticia">INICIO</a></div>
          <div class=""><a href="ControladorInicio?instruccion=tablero">TABLERO</a></div>
          <div class="">CLIENTES</div>
          <ul>
            <li><a href="ControladorCliente?instruccion=listar">VER CLIENTES</a></li>
            <li><a href="clientes/agregar.jsp">NUEVO CLIENTE</a></li>
            <li><a href="ControladorCliente?instruccion=modificar">MODIFICAR</a></li>
          </ul>
          <div class="">PEDIDOS</div>
          <ul>
            <li><a href="ControladorPedido?instruccion=nuevo">NUEVO PEDIDO</a></li>
            <li><a href="ControladorPedido?instruccion=listar">VER PEDIDOS</a></li>
          </ul>
          <div class="">PRODUCTOS</div>
          <ul>
            <li><a href="productos/agregarProducto.jsp">NUEVO PRODUCTO</a></li>
            <li><a href="ControladorProducto?instruccion=listar">VER PRODUCTOS</a></li>
            <li><a href="ControladorProducto?instruccion=modificar">MODIFICAR PRODUCTO</a></li>
          </ul>
        </aside>
        <div id="Visualizacion">
          <h2>TABLERO</h2>
          <table border="1" cellspacing="0" cellpadding="1">
            <tbody>
              <c:forEach var="Tablero" items="${TABLERO}">

                <tr>
                  <td class="filas"> ${Tablero.titulo} - ${Tablero.fecha}</td>

                </tr>

                <tr><td class="filas">${Tablero.texto}</td> </tr>


                <tr><td><br></td></tr>
                <tr><td></td></tr>


              </c:forEach>


            </tbody>
          </table>

          <form name="form1" method="get" action="ControladorInicio">
            <input type="hidden" name="instruccion" value="nuevaNota">
              <table width="60%" border="2" cellspacing="0" cellpadding="1">
                <tr>
                  <td width="10%">Titulo</td>
                  <td width="90%"><input type="text" name="titulo" id="titulo" required width="100%" ></td>

                </tr>
                <tr >
                  <td></td>
                  <td height="100px"><textarea rows ="5" cols="60" name="texto" id="texto" style="resize: none;" onfocus="this.value=''" required >Escribir nota aqui..</textarea></td>
                </tr>

                <tr>
                  <td><input type="reset" name="reset" id="reset" value="Borrar" ></td>
                  <td><input type="submit" name="submit" id="submit" value="Enviar" onclick="resetear()"></td>
                </tr>


              </table>

            </form>

          </div>

          <script>

          function resetear(){

            var form = document.getElementById("form1");
            form.reset();

          }

          </script>
          <script src="js/jquery-3.5.1.min.js"></script>
          <script src="js/popper.min.js"></script>
          <script src="js/bootstrap.min.js"></script>
        </body>
      </html>
