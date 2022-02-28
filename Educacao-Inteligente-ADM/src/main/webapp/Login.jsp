<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<form action="Login.jsp" method="post">
<label>Matricula</label>
</br>
<input type="number" name=Matricula>
<label>Senha</label>
</br>
<input type= "password" name="Senha">
</br>
<input type="submit" value ="Entrar"/>
</form>
<%
int auxMatricula=0;

if(request.getParameter("Matricula")!=null){
auxMatricula = Integer.parseInt(request.getParameter("Matricula"));
}
String auxSenha = request.getParameter("Senha");

UsuarioDao usuarioDao = new UsuarioDao();
Usuario usuario = usuarioDao.get(auxMatricula);
	if(auxMatricula!=0 && auxSenha!=null && usuario!=null && usuario.getSenha().equals(auxSenha))
	{
		session.setAttribute("usuario", usuario);
		response.sendRedirect("home.jsp");
	}	
%>
</body>
</html>
