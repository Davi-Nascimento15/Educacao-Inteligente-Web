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
<title>Cadastrar ano letivo</title>
</head>
<body>
<% 
   Usuario sessao = (Usuario)session.getAttribute("usuario");
   if(sessao==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Novo Ano Letivo </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="dialetivocon.jsp"> Anos Letivos </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Novo </li>
  </ol>
</nav>

 <form action="ControllerDiaLetivo" method="post">
 
  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Ano</label>
    <input type="number" class="form-control" aria-describedby="Ano" placeholder="Insira o ano" name= "ano">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Inicio Primeiro Semestre</label>
    <input type="date" class="form-control" aria-describedby="Inicio Primeiro Semestre" placeholder="Data Inicio 1º Semetre" name= "datainicioprimeirosemestre">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Final Primeiro Semestre</label>
    <input type="date" class="form-control" aria-describedby="Final Primeiro Semestre" placeholder="Data Final 1º Semetre" name= "datafinalprimeirosemestre">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Inicio Segundo Semestre</label>
    <input type="date" class="form-control" aria-describedby="Inicio Segundo Semestre" placeholder="Data Inicio 1º Semetre" name= "datainiciosegundosemestre">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Final Segundo Semestre</label>
    <input type="date" class="form-control" aria-describedby="Final Segundo Semestre" placeholder="Data Final 1º Semetre" name= "datafinalsegundosemestre">
  </div>
  
  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="dialetivocon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>