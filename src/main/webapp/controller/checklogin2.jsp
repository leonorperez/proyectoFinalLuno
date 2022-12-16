<%@page import="dao.UsuarioDAO2"%>
<%@page import="dataBase.ConexionDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    /**
    Recibe ls parámetros desde index.jsp
    Se conecta a la db y verifica q el user y el password existan
    si existe entro al sistema, sino me da mje de error
    */
    
    //recibe los parámetros
    	String user=request.getParameter("user");
    	String pass=request.getParameter("pass");
    	
    //conectarnos a la bbdd y verificar si existen
    //ConexionDB conexion = new ConexionDB();
    //conexion.crearStatement();	
    UsuarioDAO2  dao = new UsuarioDAO2();
    Boolean usuYPassValido = dao.validarUsuYPass(user, pass);
    
    if(usuYPassValido){
    	response.sendRedirect("../view/inicio.html");
    }else{
    	response.sendRedirect("../view/loginError.html");
    }

    %>