<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.Enum.TipoUsuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adicionar Novo Usuario</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

  <form action="ControllerUsuario" method="post">
 <label>Matricula</label>
 <input type="text" name= matricula>
 </br>
 <label>Nome</label>
 <input type="text" name= nome>
 </br>
  <label>Senha </label>
 <input type="password" name= senha>
 </br>
<select name="Tipo" id="tipo">
  <option value="<%=TipoUsuario.Admin.name()%>">Administrador</option>
  <option value="<%=TipoUsuario.User.name()%>">Usuario</option>
  <option value="<%=TipoUsuario.Prof.name()%>">Professor</option>
</select>
 </br>
 <input type="submit" value="Salvar">
 </form>
</body>
</html>