<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Disciplina Cadastrados</title>
</head>
<body>
     <%
	  DisciplinaDao daoDisciplina = new DisciplinaDao();
      List<Disciplina> ListadeDisciplina = daoDisciplina.getAll();
	%>
	<a href="disciplinaadd.jsp">Nova Disciplina</a>
	
	<%
	if(!ListadeDisciplina.isEmpty()){
	%>
	<table>
		<thead>
			<tr>
				<th>Nome</th>
				<th>Descrição</th>
			</tr>
		</thead>
		<tbody>
		<% for(Disciplina D:ListadeDisciplina){ %>
			<tr>
			  <td><%= D.getNome() %></td>
			  <td><%= D.getDescricao() %></td>
			  <td><a href="disciplinaedit.jsp?DisciplinaID=<%=D.getIddisciplina()%>">Editar</a>
			      <a href="<%= request.getContextPath() %>/ControllerDisciplina?action=del&DisciplinaID=<%=D.getIddisciplina()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%}else{%>
	<p>Não há disciplinas cadastradas</p>
	<%}%>
</body>
</html>