<%@page import="dao.ProvinciaDAO2"%>
<%
	try {
		String idProvincia = request.getParameter("idProvincia");
		
		ProvinciaDAO2 dao = new ProvinciaDAO2();
		
		Boolean deleteOk = dao.deleteProvincia(Integer.valueOf(idProvincia));
		
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