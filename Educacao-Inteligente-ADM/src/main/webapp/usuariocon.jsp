<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usuarios Cadastrados</title>
</head>
<body>
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
				<th>Nome</th>
				<th>Senha</th>
				<th>Tipo</th>
			</tr>
		</thead>
		<tbody>
		<% for(Usuario U:ListadeUsuarios){ %>
			<tr>
			  <td><%= U.getNome() %></td>
			  <td><%= U.getSenha() %></td>
			  <td><%= U.getTipo() %></td>
			  <td><a href="usuarioedit.jsp?UsuarioID=<%=U.getIdusuario()%>">Editar</a>
			      <a href="<%= request.getContextPath() %>/ControllerUsuario?action=del&UsuarioID=<%=U.getIdusuario()%>">Excluir</a>
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