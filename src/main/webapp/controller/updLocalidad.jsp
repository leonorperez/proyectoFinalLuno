<%@page import="dao.LocalidadDAO2"%>

<%
	try {
		Integer idLoc = Integer.valueOf(request.getParameter("idLoc"));
		String nombre = request.getParameter("nombre");
		
		LocalidadDAO2 dao = new LocalidadDAO2();
		
		Boolean insertOk = dao.updLocalidad(idLoc, nombre);
		
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