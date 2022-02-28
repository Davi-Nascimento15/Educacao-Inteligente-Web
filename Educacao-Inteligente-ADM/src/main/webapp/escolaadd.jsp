<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adicionar Nova Escola</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

  <form action="ControllerEscola" method="post">
 <label>CNPJ:</label>
 <input type="text" name= cnpj>
 </br>
 <label>Nome:</label>
 <input type="text" name= nome>
 </br>
 <label>Endereço:</label>
 <input type="text" name= endereco>
 </br>
  <label>Telefone:</label>
 <input type="text" name= telefone>
 </br>
  <label>E-mail:</label>
 <input type="email" name= email>
 </br>
 <input type="submit" value="Salvar">
 </form>
</body>
</html>