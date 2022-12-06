<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.Enum.*"%>
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
<title>Adicionar Nova Escola</title>
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
            	<h1 class="cabecario pl-5"> Nova Escola </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="escolacon.jsp"> Escolas </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Nova </li>
  </ol>
</nav>

<form action="ControllerEscola" method="post">

  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label >CNPJ</label>
    <input type="text" class="form-control" aria-describedby="Cnpj" placeholder="Ex.: XX.XXX.XXX/XXXX-XX" name= "cnpj"  required>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Razão Social</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= "nome"  required>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Endereço</label>
    <input type="text" class="form-control" aria-describedby="Endereco" placeholder="Insira o endereco" name= "endereco"  required>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Telefone</label>
    <input type="text" class="form-control" aria-describedby="Telefone" placeholder="Insira o telefone" name= "telefone" maxlength="15" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"  required>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Email</label>
    <input type="email" class="form-control" aria-describedby="Email" placeholder="Ex.: user@gmail.com" name= "email"  required>
  </div>
  
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="escolacon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
<%} %>  
</form>
</body>
</html>