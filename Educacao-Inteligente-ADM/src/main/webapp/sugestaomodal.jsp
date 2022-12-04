<%@page import="com.educacaointeligente.model.*"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@page import="com.educacaointeligente.dao.*"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="Style.css" type="text/css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Modal -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<title></title>
</head>
<body>

<% 
Usuario usuario = (Usuario)session.getAttribute("usuario");
if(usuario==null){
	   response.sendRedirect("Login.jsp");
}else{

   String SugestaoID = (request.getParameter("SugestaoID"));
   SugestaoDao sugestaoDao = new SugestaoDao();
   Sugestao sugestao = sugestaoDao.getString(SugestaoID);
%>

<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Detalhes </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="sugestaocon.jsp"> Sugestões </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Detalhes </li>
  </ol>
</nav>

  <div class="form-group row col-md-7 offset-md-0 pt-3">
    <h4 for="exampleFormControlTextarea1"> <%=sugestao.getTitulo()%> </h4>
    <textarea class="form-control" placeholder="<%=sugestao.getDescricao()%>" id="exampleFormControlTextarea1" rows="10" readonly></textarea>
  </div>
<%} %>
</body>
</html>