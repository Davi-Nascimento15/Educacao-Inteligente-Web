<%@page import="com.educacaointeligente.model.Presenca"%>
<%@page import="com.educacaointeligente.dao.PresencaDao"%>
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

<title>Faltas Cadastrados</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp"); 
   }
%>
     <%
	  PresencaDao daoPresenca = new PresencaDao();
      List<Presenca> ListadePresenca = daoPresenca.getAll();
	%>
<div class="card cabecario">
  <div class="card-header">
      <h1 class="cabecario">Faltas</h1>
   </div>
</div>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="home.jsp"> Home </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Faltas </li>
  </ol>
</nav>
	
<div class="col-lg-12 mb-3">
	 <a class="btn btn-primary ml-2" style="width: 10%" href="presencaadd.jsp">Nova</a>
</div>
	<%
	if(!ListadePresenca.isEmpty()){
	%>

<div class="mx-4">
	<table class="table">
		<thead class="thead-dark">
			<tr>
			    <th scope="col">Falta</th>
				<th scope="col">Data</th>
				<th scope="col">Aluno</th>
				
				<!-- bug NÃO MEXA -->
				<th scope="col">  </th>
			</tr>
		</thead>
		<tbody>
		<% for(Presenca P:ListadePresenca){ %>
			<tr>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= P.isFalta()%></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= P.getData()%></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= P.getAluno().getNome()%></td>
			  <td>
			      <a class="btn btn-danger" href="<%= request.getContextPath() %>/ControllerPresenca?action=del&PresencaID=<%=P.getIdPresenca()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>

	<%}else{%>
	<p>Não há faltas cadastradas</p>
	<%}%>
</body>
</html>