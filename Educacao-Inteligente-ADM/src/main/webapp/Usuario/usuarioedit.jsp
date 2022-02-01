<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.Enum.TipoUsuario"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int UsuarioID = Integer.parseInt(request.getParameter("UsuarioID"));
   UsuarioDao usuarioDao =new UsuarioDao();
   Usuario usuario = usuarioDao.get(UsuarioID);
 %>
<form action="ControllerUsuario" method="post">
  <input type="hidden" name="UsuarioID" value=<%=UsuarioID %>>
 <label>Usuario</label>
 <input type="text" name= nome value=<%=usuario.getNome()%>>
 </br>
 <label>Nome</label>
 <input type="password" name= senha value=<%=usuario.getSenha() %>>
 </br>
 <select name="Tipo" id="tipo">
  <option value="<%=TipoUsuario.Admin.name()%>">Admin</option>
  <option value="<%=TipoUsuario.User.name()%>">User</option>
</select>
 </br>
 <input type="submit" value="Salvar">
 </form>
</body>
</html>