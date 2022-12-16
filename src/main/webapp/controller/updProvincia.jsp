<%@page import="dao.ProvinciaDAO2"%>
<%
	try {
		Integer idProv = Integer.valueOf(request.getParameter("idProv"));
		String nombre = request.getParameter("nombre");
		
		ProvinciaDAO2 dao = new ProvinciaDAO2();
		
		Boolean insertOk = dao.updProvincia(idProv, nombre);
		
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