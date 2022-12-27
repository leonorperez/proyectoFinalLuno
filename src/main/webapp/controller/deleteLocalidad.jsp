<%@page import="dao.LocalidadDAO2"%>
<%
	try {
		String idLoc = request.getParameter("idLocalidad");
		
		LocalidadDAO2 dao = new LocalidadDAO2();
		
		Boolean deleteOk = dao.deleteLocalidad(Integer.valueOf(idLoc));
		
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