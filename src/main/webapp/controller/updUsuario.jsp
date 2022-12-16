<%@page import="dao.UsuarioDAO2"%>
<%
	try {
		Integer idusuario = Integer.valueOf(request.getParameter("idusuario"));
		String usuario = request.getParameter("usuario");
		String clave = request.getParameter("clave");
		
		UsuarioDAO2 dao = new UsuarioDAO2();
		
		Boolean insertOk = dao.updUsuario(idusuario, usuario, clave);
		
		if(insertOk) {
			response.sendRedirect("../view/mensajeOk.jsp");
		}else {
			response.sendRedirect("../view/mensajeError.jsp");
		}

	} catch (Exception e) {
		response.sendRedirect("../view/mensajeError.jsp");
		e.printStackTrace();	
	}

%>