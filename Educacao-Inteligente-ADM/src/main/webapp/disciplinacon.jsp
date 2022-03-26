<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
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

<title>Disciplina Cadastrados</title>
</head>
<body>

<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<div class="card cabecario">
  <div class="card-header">
      <h1 class="cabecario">Disciplinas</h1>
   </div>
</div>
     <%
	  DisciplinaDao daoDisciplina = new DisciplinaDao();
      List<Disciplina>ListadeDisciplina = daoDisciplina.getAll();
	%>
	
	<%
	if(!ListadeDisciplina.isEmpty()){
	%>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Nome</th>
				<th scope="col">Descrição</th>
				
				<!-- bug NÃO MEXA -->
				<th scope="col">  </th>
				
			</tr>
		</thead>
		<tbody>
		<% for(Disciplina D:ListadeDisciplina){ %>
			<tr>
			  <td ><%= D.getNome() %></td>
			  <td><%= D.getDescricao() %></td>
			  <td><a class="btn btn-secondary" href="disciplinaedit.jsp?DisciplinaID=<%=D.getIddisciplina()%>">Editar</a>
			      <a class="btn btn-danger" href="<%= request.getContextPath() %>/ControllerDisciplina?action=del&DisciplinaID=<%=D.getIddisciplina()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	
	<%}else{%>
	<p>Não há disciplinas cadastradas</p>
	<%}%>
	<div class="col-lg-12" style="text-align: left;">
	  <a class="btn btn-secondary" style="width: 5%" href="home.jsp">Home</a>
	  <a class="btn btn-primary" style="width: 10%" href="disciplinaadd.jsp">Novo</a>
	</div>
</body>
</html>