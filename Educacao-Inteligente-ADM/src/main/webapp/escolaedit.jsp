<%@page import="com.educacaointeligente.model.*"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@page import="com.educacaointeligente.dao.*"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Escola</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<% int EscolaID = Integer.parseInt(request.getParameter("EscolaID"));
   EscolaDao escolaDao = new EscolaDao();
   Escola escola = escolaDao.get(EscolaID);
 %>
<form action="ControllerEscola" method="post">
  <input type="hidden" name="EscolaID" value=<%=EscolaID %>>
 <label>CNPJ:</label>
 <input type="text" name= cnpj value=<%=escola.getCnpj()%>>
 </br>
 
 <label>Nome:</label>
 <input type="text" name= nome value=<%=escola.getNome()%>>
 </br>

 <label>Endereço:</label>
 <input type="text" name= endereco value=<%=escola.getEndereco()%>>
 </br>
 
 <label>Telefone:</label>
 <input type="text" name= telefone value=<%=escola.getTelefone()%>>
 </br>
 
  <label>E-mail:</label>
 <input type="text" name= email value=<%=escola.getEmail()%>>
 </br>
 <input type="submit" value="Salvar">
</form>
</body>
</html>