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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"><link rel="stylesheet" href="Style.css" type="text/css">

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

<div class="card cabecario">
  <div class="card-header">
      <h1 class="cabecario">Notas</h1>
   </div>
</div>
	
	<%
	if(!ListaNotas.isEmpty()){
	%>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Aluno</th>
				<th scope="col">Disciplina</th>
				<th scope="col">Bimestre</th>
				<th scope="col">Nota</th>
				<th scope="col">Turma</th>
				<th scope="col">Ano</th>
				
				<!-- bug N�O MEXA -->
				<th scope="col">  </th>
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
	<p>N�o h� notas cadastradas!</p>
	<%}%>
	<div class="col-lg-12" style="text-align: left;">
	  <a class="btn btn-secondary" style="width: 5%" href="home.jsp">Home</a>
	  <a class="btn btn-primary" style="width: 10%" href="notaadd.jsp">Novo</a>
	</div>
</body>
</html>