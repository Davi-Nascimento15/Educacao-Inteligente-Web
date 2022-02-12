<%@page import="com.educacaointeligente.model.*"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Turmas Cadastradas</title>
</head>
<body>
     <%
	  TurmaDao daoTurma = new TurmaDao();
      List<Turma> ListadeTurmas = daoTurma.getAll();
	%>
	<a href="turmaadd.jsp">Nova turma</a>
	
	<%
	if(!ListadeTurmas.isEmpty()){
	%>
	<table>
		<thead>
			<tr>
			    <th>Nome</th>
				<th>Ano</th>
			</tr>
		</thead>
		<tbody>
		<% for(Turma T:ListadeTurmas){ %>
			<tr>
			  <td><%= T.getNome() %></td>
			  <td><%= T.getAno() %></td>
			  <td><a href="turmaedit.jsp?TurmaID=<%=T.getIdTurma()%>">Editar</a>
			      <a href="<%= request.getContextPath() %>/ControllerTurma?action=del&TurmaID=<%=T.getIdTurma()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%}else{%>
	<p>Não há Turmas cadastradas!</p>
	<%}%>
</body>
</html>