<%@page import="dao.LocalidadDAO2"%>

<%
try {
	String nombre = request.getParameter("nombre");
	String idProv = request.getParameter("idProv");
	
	LocalidadDAO2 dao = new LocalidadDAO2();	
	Boolean insertOk = dao.addLocalidad(nombre, Integer.valueOf(idProv));
	
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