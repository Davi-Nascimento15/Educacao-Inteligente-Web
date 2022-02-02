<%@page import="com.educacaointeligente.model.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.AlunoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alunos Cadastrados</title>
</head>
<body>
     <%
	  AlunoDao daoAluno = new AlunoDao();
      List<Aluno> ListadeAlunos = daoAluno.getAll();
	%>
	<a href="alunoadd.jsp">Novo Aluno</a>
	
	<%
	if(!ListadeAlunos.isEmpty()){
	%>
	<table>
		<thead>
			<tr>
			    <th>Matricula</th>
				<th>Nome</th>
				<th>Nome da Mãe</th>
				<th>Telefone</th>
				<th>Endereço</th>
				<th>Turma</th>
				<th>Turno</th>
				<th>Ano</th>
			</tr>
		</thead>
		<tbody>
		<% for(Aluno A:ListadeAlunos){ %>
			<tr>
			  <td><%= A.getMatricula() %></td>
			  <td><%= A.getNome() %></td>
			  <td><%= A.getNomeMae() %></td>
			  <td><%= A.getTelefone() %></td>
			  <td><%= A.getEndereco() %></td>
			  <td><%= A.getTurma() %></td>
			  <td><%= A.getTurno() %></td>
			  <td><%= A.getAno() %></td>
			  <td><a href="alunoedit.jsp?AlunoID=<%=A.getIdaluno()%>">Editar</a>
			      <a href="<%= request.getContextPath() %>/ControllerAluno?action=del&AlunoID=<%=A.getIdaluno()%>">Excluir</a>
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