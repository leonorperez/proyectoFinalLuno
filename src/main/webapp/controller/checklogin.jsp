<%@page import="dao.UsuarioDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
	<%
	try {
		String usuario = request.getParameter("inputEmail"); //obtiene el par�metro enviado desde la p�gina login.html, llamado inputEmail
		String contrasenia = request.getParameter("inputPassword");

		out.println(usuario);
		out.println(contrasenia);

		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Boolean usuValido = usuarioDAO.validarUsuarioYPass(usuario, contrasenia);

		if (usuValido.booleanValue()) {
			response.sendRedirect("../view/pedido.jsp");
		} else {
			response.sendRedirect("../view/loginError.html");
			out.println("<p style='color:red'>Usuario o password incorrectos</p>");
		}
	} catch (Exception e) {
		response.sendRedirect("../view/mensajeError.jsp");
		e.printStackTrace();
	}
	%>

</body>
</html>