<!doctype html>
<%@page import="model.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="dao.PedidoDAO"%>
<html lang="en">

<head>
  <title>Title</title>
  <!-- Required meta tags -->
  <link rel="shortcut icon" href="images/loguito.png"/>
  <link rel="shortcut icon" href="images/loguito.png"/>
  <meta charset="ISO-8859-1">
  <meta http-equiv=”Content-Type” content=”text/html; charset=ISO-8859-1″ />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body class="text-center bg-light">

  <div class="container">
    <div class="py-4 text-center">
      <img class="d-block mx-auto mb-4" src="images/LogoLuno.jpg" alt="Logo caba" width="72" height="72">
      <h2>Pedidos</h2>
      <p class="lead">Lisatdo de Pedidos pendientes</p>
    </div>
    
    		<div>
				<a href="inicio.html"><button id="volver"class="btn btn-success" type="button">Volver</a></button>
			</div>

    <table class="table table-hover table-sm">
      <thead class="thead-dark">
        <tr>
          <th scope="col">#ID</th>
          <th scope="col">Nombre</th>
          <th scope="col">Apellido</th>
          <th scope="col">Usuario</th>
          <th scope="col">e-mail</th>
          <th scope="col">Direcciï¿½n</th>
          <th scope="col">Localidad</th>
          <th scope="col">Provincia</th>
          <th scope="col">Código Postal</th>
        </tr>
      </thead>
      <tbody>

        <% 
        PedidoDAO pedidoDAO = new PedidoDAO();
        List<Pedido> listPedidos =   pedidoDAO.listarPedidos();
        	
		for (int i=0;i<listPedidos.size();i++)
		{
			out.println("<tr>");
			out.println("<td>" + listPedidos.get(i).getIdPedido() + "</td>");
			out.println("<td>" + listPedidos.get(i).getNombre() + "</td>");
			out.println("<td>" + listPedidos.get(i).getUsuario() + "</td>");
			out.println("<td>" + listPedidos.get(i).getMail() + "</td>");
			out.println("<td>" + listPedidos.get(i).getLugarEntrega() + "</td>");
			out.println("<td>" + listPedidos.get(i).getLocalidad() + "</td>");

			out.println("<td>" + listPedidos.get(i).getCodPostal()+ "</td>");
			out.println("</tr>");
		}				
        	
        %>
        
      </tbody>
    </table>


  </div>
  
  	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; Leonor Perez</p>
	</footer>


  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>