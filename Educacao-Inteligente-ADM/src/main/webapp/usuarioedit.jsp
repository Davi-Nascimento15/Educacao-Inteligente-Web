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
<% 
   Usuario user = (Usuario)session.getAttribute("usuario");
   if(user==null){
	   response.sendRedirect("Login.jsp");
   }
%>

<% int UsuarioID = Integer.parseInt(request.getParameter("UsuarioID"));
   UsuarioDao usuarioDao =new UsuarioDao();
   Usuario usuario = usuarioDao.get(UsuarioID);
 %>
<form action="ControllerUsuario" method="post">
  <input type="hidden" name="UsuarioID" value=<%=UsuarioID %>>
 <label>Matricula</label>
 <input type="text" name= matricula value=<%=usuario.getIdmatricula()%>>
 <label>Usuario</label>
 <input type="text" name= nome value=<%=usuario.getNome()%>>
 </br>
 <label>Nome</label>
 <input type="password" name= senha value=<%=usuario.getSenha() %>>
 </br>
 <select name="Tipo" id="tipo">
  <option value="<%=TipoUsuario.Admin.name()%>">Admin</option>
  <option value="<%=TipoUsuario.User.name()%>">User</option>
  <option value="<%=TipoUsuario.Prof.name()%>">Professor</option>
</select>
 </br>
 <input type="submit" value="Salvar">
 </form>
</body>
</html>