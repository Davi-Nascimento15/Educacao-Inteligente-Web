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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"><link rel="stylesheet" href="Style.css" type="text/css">

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
	
<div class="card cabecario">
  <div class="card-header">
      <h1 class="cabecario">Professores</h1>
   </div>
</div>

	<%
	if(!ListadeProfessores.isEmpty()){
	%>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Nome</th>
				<th scope="col">Endere�o</th>
				<th scope="col">Telefone</th>
				<th scope="col">Email</th>
				<th scope="col">Forma��o</th>
				
				<!-- bug N�O MEXA -->
				<th scope="col">  </th>
				
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
			  <td><a class="btn btn-secondary" href="professoredit.jsp?ProfessorID=<%=P.getIdprofessor()%>">Editar</a>
			      <a class="btn btn-danger" href="<%= request.getContextPath() %>/ControllerProfessor?action=del&ProfessorID=<%=P.getIdprofessor()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	
	<%}else{%>
	<p>N�o h� professores cadastrados</p>
	<%}%>
	
	<div class="col-lg-12" style="text-align: left;">
	  <a class="btn btn-secondary" style="width: 5%" href="home.jsp">Home</a>
	  <a class="btn btn-primary" style="width: 10%" href="professoradd.jsp">Novo</a>
	</div>
</body>
</html>