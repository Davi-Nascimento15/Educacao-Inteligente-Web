<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Professor"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.ProfessorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Professores Cadastrados</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

     <%
	  ProfessorDao daoProfessor = new ProfessorDao();
      List<Professor> ListadeProfessores = daoProfessor.getAll();
	%>
	<a href="professoradd.jsp">Novo Professor</a>
	
	<%
	if(!ListadeProfessores.isEmpty()){
	%>
	<table>
		<thead>
			<tr>
				<th>Nome</th>
				<th>Endereço</th>
				<th>Telefone</th>
				<th>Email</th>
				<th>Formação</th>
			</tr>
		</thead>
		<tbody>
		<% for(Professor P:ListadeProfessores){ %>
			<tr>
			  <td><%= P.getNome() %></td>
			  <td><%= P.getEndereco() %></td>
			  <td><%= P.getTelefone() %></td>
			  <td><%= P.getEmail() %></td>
			  <td><%= P.getFormacao() %></td>
			  <td><a href="professoredit.jsp?ProfessorID=<%=P.getIdprofessor()%>">Editar</a>
			      <a href="<%= request.getContextPath() %>/ControllerProfessor?action=del&ProfessorID=<%=P.getIdprofessor()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%}else{%>
	<p>Não há professores cadastrados</p>
	<%}%>
</body>
</html>