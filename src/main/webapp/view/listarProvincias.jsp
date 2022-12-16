<!doctype html>
<%@page import="model.Provincia"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProvinciaDAO2"%>


<html lang="en">

<head>
<title>Listar Provincias</title>
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
				<p class="lead py-2">Listado de Provincias</p>
			</div>
			<div>
				<a href="inicio.html"><button id="volver"class="btn btn-success" type="button">Volver</button></a>
			</div>
			

			<table class="table table-hover table-sm">
				<thead class="table-success">
					<tr>
						<th scope="col">#ID</th>
						<th scope="col">Nombre</th>
						<th scope="col">Operaciones</th>
					</tr>
				</thead>
				<tbody>
					<%
					ProvinciaDAO2 dao = new ProvinciaDAO2();
					List<Provincia> listProv = dao.listarProvincias();

					for (Provincia prov : listProv) {
						out.println("<tr>");

						out.println("<td>");
						out.println(prov.getIdProvincia());
						out.println("</td>");

						out.println("<td>");
						out.println(prov.getNombre());
						out.println("</td>");

						out.println("<td>");
						out.println("<a href='editProvincia.jsp?idProv=" + prov.getIdProvincia() + "&nombre=" + prov.getNombre() + "'>");
						out.println("<i class='bi bi-pencil-fill'></i>");
						out.println("</a>");
						
						out.println("<a href='#' data-bs-toggle='modal' data-bs-target='#exampleModal'>");
						out.println("<i class='bi bi-trash-fill'></i>");
						out.println("</a>");
																
						out.println("</td>");
						out.println("</tr>");
					}
					%>

				</tbody>
			</table>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar Provincia</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">Desea eliminar la provincia?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancelar</button>
							<button type="button" class="btn btn-primary">Eliminar</button>
						</div>
					</div>
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
</body>

</html>