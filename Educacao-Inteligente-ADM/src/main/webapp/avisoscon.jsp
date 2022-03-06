<%@page import="com.educacaointeligente.model.Avisos"%>
<%@page import="com.educacaointeligente.dao.AvisosDao"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Aluno"%>
<%@page import="com.educacaointeligente.dao.AlunoDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Avisos Cadastrados</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

     <%
	  AvisosDao daoAvisos = new AvisosDao();
      List<Avisos> ListadeAvisos = daoAvisos.getAll();
	%>
	<a href="avisosadd.jsp">Novo Aviso</a>
	
	<%
	if(!ListadeAvisos.isEmpty()){
	%>
	<table>
		<thead>
			<tr>
			    <th>Descrição</th>
				<th>Data Geração</th>
				<th>Data Entrega</th>
				<th>Professor</th>
				<th>Disciplina</th>
				<th>Turma</th>
			</tr>
		</thead>
		<tbody>
		<% for(Avisos A:ListadeAvisos){ %>
			<tr>
			  <td><%= A.getDescricao() %></td>
			  <td><%= A.getDataGeracao() %></td>
			  <td><%= A.getDataEntrega() %></td>
			  <td><%= A.getProfessor().getNome() %></td>
			  <td><%= A.getDisciplina().getNome() %></td>
			  <td><%= A.getTurma().getNome() %></td>
			  <td><a href="avisosedit.jsp?AvisoID=<%=A.getIdAvisos()%>">Editar</a>
			      <a href="<%= request.getContextPath() %>/ControllerAvisos?action=del&AvisoID=<%=A.getIdAvisos()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%}else{%>
	<p>Não há avisos cadastrados</p>
	<%}%>
</body>
</html>