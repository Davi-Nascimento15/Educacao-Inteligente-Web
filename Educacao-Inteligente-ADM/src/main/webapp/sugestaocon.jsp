<%@page import="com.educacaointeligente.model.*"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.*"%>
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

<title>Sugestões Cadastradas</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

     <%
	  SugestaoDao daoSugestao = new SugestaoDao();
      List<Sugestao> ListadeSugestoes = daoSugestao.getAll();
	%>
	
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Sugestões</h1> 		
            </ul>
          </div>
        </div>  
      </div>
      
        <form class="d-flex pl-5">
        	<a href="logout.jsp"> <img src="Sair.png" width="45" height="45"> </a>   
      	</form>
</nav>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="home.jsp"> Home </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Sugestões </li>
  </ol>
</nav>

	<%
	if(!ListadeSugestoes.isEmpty()){
	%>
	<div class="mx-4">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Nome</th>
				<th scope="col">Titulo</th>
				<th scope="col">Descrição</th>
				<th scope="col">Like</th>
				
				<!-- bug NÃO MEXA -->
				<th scope="col">  </th>
			</tr>
		</thead>
		<tbody>
		<% for(Sugestao S:ListadeSugestoes){ %>
			<tr>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= S.getUsuario().getNome() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= S.getTitulo() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= S.getDescricao() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= S.getCurtidas() %></td>
			<td>
			      <a class="btn btn-danger btn-sm" href="<%= request.getContextPath() %>/ControllerSugestao?action=del&SugestaoID=<%=S.getIdSugestao()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>

	<%}else{%>
	<p>Não há sugestões cadastradas!</p>
	<%}%>

</body>
</html>