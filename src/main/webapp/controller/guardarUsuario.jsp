<%@page import="dao.UsuarioDAO2"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
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
	String usuario = request.getParameter("user");
	String contrasenia = request.getParameter("pass");
	
	Usuario usu = new Usuario(usuario, contrasenia);
	
	UsuarioDAO2 usuarioDAO = new UsuarioDAO2();
	
	Boolean okGuardado = usuarioDAO.guardarUsuario(usu);
	
	   if (okGuardado) {
			response.sendRedirect("../view/mensajeOk.jsp");
		}else {
			response.sendRedirect("../view/mensajeError.jsp");
		}
	%>

</body>
</html>