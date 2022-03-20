<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="Style.css" type="text/css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Usuarios Cadastrados</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

     <%
	  UsuarioDao daoUsuario = new UsuarioDao();
      List<Usuario> ListadeUsuarios = daoUsuario.getAll();
	%>
	<a href="usuarioadd.jsp">Novo Usuario</a>
	
	<%
	if(!ListadeUsuarios.isEmpty()){
	%>
	<table>
		<thead>
			<tr>
				<th>Matricula</th>
				<th>Nome</th>
				<th>Senha</th>
				<th>Tipo</th>
			</tr>
		</thead>
		<tbody>
		<% for(Usuario U:ListadeUsuarios){ %>
			<tr>
			  <td><%=U.getIdmatricula()%>
			  <td><%= U.getNome() %></td>
			  <td><%= U.getSenha() %></td>
			  <td><%= U.getTipo() %></td>
			  <td><a href="usuarioedit.jsp?UsuarioID=<%=U.getIdmatricula()%>">Editar</a>
			      <a href="<%= request.getContextPath() %>/ControllerUsuario?action=del&UsuarioID=<%=U.getIdmatricula()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%}else{%>
	<p>Não há usuarios cadastrados</p>
	<%}%>
</body>
</html>