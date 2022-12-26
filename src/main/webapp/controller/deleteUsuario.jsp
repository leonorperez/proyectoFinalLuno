<%@page import="dao.UsuarioDAO2"%>
<%@page import="dao.ProvinciaDAO2"%>
<%
	try {
		String idUsuario = request.getParameter("idUsuario");
		
		UsuarioDAO2 dao = new UsuarioDAO2();
		
		Boolean deleteOk = dao.deleteUsuario(Integer.valueOf(idUsuario));
		
		if(deleteOk) {
			response.sendRedirect("../view/mensajeOk.jsp");
		}else {
			response.sendRedirect("../view/mensajeError.jsp");
		}

	} catch (Exception e) {
		response.sendRedirect("../view/mensajeError.jsp");
		e.printStackTrace();	
	}
%>