<%@page import="com.educacaointeligente.model.Escola"%>
<%@page import="com.educacaointeligente.dao.EscolaDao"%>
<%@page import="com.google.protobuf.TextFormat.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.educacaointeligente.Enum.TipoData"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.model.DiaLetivo"%>
<%@page import="com.educacaointeligente.dao.DiaLetivoDao"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.Enum.TipoUsuario"%>
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
<title>Editar ano letivo</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }else{
%>
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Ano Letivo </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="anoletivocon.jsp"> Anos Letivos </a> </li>
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="dialetivoadd.jsp"> Novo Ano Letivo </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Erro </li>
  </ol>
</nav>
<div style="text-align: center; color: red;">
<h1 >Ano letivo já cadastrado e/ou período informado inválido!</h1>
</div>
<div style="text-align: center; padding: 50px;">
    <a href="anoletivocon.jsp" class="btn btn-danger">Voltar</a>
</div>
  <%} %>
</form>
</body>
</html>