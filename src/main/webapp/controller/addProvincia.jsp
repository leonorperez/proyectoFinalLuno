<%@page import="dao.ProvinciaDAO2"%>
<%
	try {
		String nombre = request.getParameter("nombre");
		
		//TODO: validar parametros, not null, email, pass
		ProvinciaDAO2 dao = new ProvinciaDAO2();
		
		Boolean insertOk = dao.addProvincia(nombre);
		
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