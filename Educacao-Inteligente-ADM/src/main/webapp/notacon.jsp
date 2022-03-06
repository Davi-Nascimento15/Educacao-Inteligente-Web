<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.educacaointeligente.model.Aluno"%>
<%@page import="com.educacaointeligente.model.Nota"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@page import="com.educacaointeligente.dao.AlunoDao"%>
<%@page import="com.educacaointeligente.dao.NotaDao"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adicionar Nova Nota</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

<%
	NotaDao daoNota = new NotaDao();
	List<Nota> ListaNotas = daoNota.getAll();
%>

	<a href="notaadd.jsp">Novo Nota</a>
	
	<%
	if(!ListaNotas.isEmpty()){
	%>
	<table>
		<thead>
			<tr>
				<th>Aluno</th>
				<th>Disciplina</th>
				<th>Bimestre</th>
				<th>Nota</th>
				<th>Turma</th>
				<th>Ano</th>
			</tr>
		</thead>
		<tbody>
		<% for(Nota N:ListaNotas){ %>
			<tr>
			<td><%= N.getAluno().getNome()%></td>
			<td><%= N.getDisciplina().getNome()%></td>
			<td><%= N.getBimestre()%></td>
			<td><%= N.getNota()%></td>
			<td><%= N.getAluno().getTurma().getNome()%></td>
			<td><%= N.getAnoLetivo()%></td>
			  <td><a href="notaedit.jsp?NotaID=<%=N.getIdNota()%>">Editar</a>
			      <a href="<%= request.getContextPath() %>/ControllerNota?action=del&NotaID=<%=N.getIdNota()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%}else{%>
	<p>Não há alunos cadastrados</p>
	<%}%>
</body>
</html>