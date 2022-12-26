<!doctype html>
<%@page import="model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO2"%>
<html lang="en">

<head>
<title>Listar Usuarios</title>
<!-- Required meta tags -->
<link rel="shortcut icon" href="images/loguito.png" />
<meta charset="ISO-8859-1">
<meta http-equiv=”Content-Type” content=”text/html; charset=ISO-8859-1″ />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="css/estilo.css" rel="stylesheet" type="text/css">
</head>

<body class="text-center bg-light">
	<header>
		<!-- place navbar here -->
	</header>
	<main>
		<div class="container">
			<div class="py-4">
				<img src="images/LogoLuno.PNG" alt="Logo" width="72" height="72">
				<p class="lead py-2">Listado de Usuarios</p>
			</div>
			<div>
				<button id="volver" class="btn btn-success" type="button"><a href="inicio.html">Volver</a></button>
			</div>
						
			<table class="table table-hover table-sm">
				<thead class="table-success">
					<tr>
						<th scope="col">#ID</th>
						<th scope="col">Usuario</th>
						<th scope="col">Clave</th>
						<th scope="col">Operaciones</th>
					</tr>
				</thead>
				<tbody>
					<%
					UsuarioDAO2 dao = new UsuarioDAO2();
					List<Usuario> listUsu = dao.listarUsuarios();

					for (Usuario usu : listUsu) {
						out.println("<tr>");

						out.println("<td>");
						out.println(usu.getIdUsuario());
						out.println("</td>");

						out.println("<td>");
						out.println(usu.getUsuario());
						out.println("</td>");

						out.println("<td>");
						out.println(usu.getClave());
						out.println("</td>");

						out.println("<td>");
						out.println("<a href='editUsuario.jsp?idusuario=" + usu.getIdUsuario() + "&usuario=" + usu.getUsuario() + "&clave="
						+ usu.getClave() + "'>");
						out.println("<i class='bi bi-pencil-fill'></i>");
						out.println("</a>");
						
						out.println("<a href='#' data-bs-toggle='modal'	data-bs-target='#exampleModal' data-bs-whatever='" + usu.getIdUsuario() + "'>");
						out.println("<i class='bi bi-trash-fill'></i>");
						out.println("</a>");
						
						out.println("</td>");
						out.println("</tr>");
					}
					%>

				</tbody>
			</table>
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar
								Usuario</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						
						<form action="../controller/deleteUsuario.jsp" method="post">
							<div class="modal-body">

								<div class="mb-3">
									<div>Deseas eliminar este usuario?</div>
									<input type="hidden" class="form-control" id="idUsuario" name="idUsuario">
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancelar</button>
								<button type="submit" class="btn btn-primary">Eliminar</button>
							</div>					
					</form>
					</div>
				</div>

			</div>
	</main>
		<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; Leonor Perez</p>
	</footer>
	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous">
		
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
		integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
		crossorigin="anonymous">
		
	</script>
	</script>
	<script src="js/script.js"></script>
</body>

</html>