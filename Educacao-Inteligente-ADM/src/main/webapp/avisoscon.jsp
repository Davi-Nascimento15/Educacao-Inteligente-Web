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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"><link rel="stylesheet" href="Style.css" type="text/css">

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
<div class="card cabecario">
  <div class="card-header">
      <h1 class="cabecario">Avisos</h1>
   </div>
</div>
	
	<%
	if(!ListadeAvisos.isEmpty()){
	%>
	<table class="table">
		<thead>
			<tr>
			    <th scope="col">Descrição</th>
				<th scope="col">Data Geração</th>
				<th scope="col">Data Entrega</th>
				<th scope="col">Professor</th>
				<th scope="col">Disciplina</th>
				<th scope="col">Turma</th>
				
				<!-- bug NÃO MEXA -->
				<th scope="col">  </th>
				
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
			  <td><a class="btn btn-secondary"  href="avisosedit.jsp?AvisoID=<%=A.getIdAvisos()%>">Editar</a>
			      <a class="btn btn-danger"  href="<%= request.getContextPath() %>/ControllerAvisos?action=del&AvisoID=<%=A.getIdAvisos()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%}else{%>
	<p>Não há avisos cadastrados</p>
	<%}%>
	<div class="col-lg-12" style="text-align: left;">
	  <a class="btn btn-secondary" style="width: 5%" href="home.jsp">Home</a>
	  <a class="btn btn-primary" style="width: 10%" href="avisosadd.jsp">Novo</a>
	</div>
</body>
</html>