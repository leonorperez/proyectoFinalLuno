<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="images/loguito.png"/>
<meta charset="ISO-8859-1">
<title>Alta de Provincias</title>

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

	<link href="css/estilo.css" rel="stylesheet" type="text/css">
</head>

<body class="bg-light">
    <header>
        <nav>
            <div id="header">
                <ul class="nav">
 					<div>
				<a href="inicio.html"><button id="volver"class="btn btn-success" type="button">Volver</a></button>
			</div>
                </ul>
            </div>
        </nav>
    </header>

	<div class="py-4 text-center">
		<img class="d-block mx-auto mb-4" src="./images/LogoLuno.PNG"
			alt="Logo caba" width="72" height="72">
		<h2>Alta Provincia</h2>
	</div>

	<div class="container">
	<div class="col-md-12 text-center">
		<form action="../controller/addProvincia.jsp" method="POST">
			<div class="row">
				<div class="col-md-12 mb-3">
					<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre de la provincia" required>
				</div>
			</div>

			<hr class="mb-4">

			<div class="row">
				<div class="d-flex justify-content-around">
					<button class="btn btn-primary btn-lg btn-block" type="submit">
						Enviar
					</button>
				</div>
			</div>
		</form>
	</div>
	</div>
		<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; Leonor Perez</p>
	</footer>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>