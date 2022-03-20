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
<title>Adicionar Nova Escola</title>
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
      <h1 class="cabecario">Nova Escola</h1>
   </div>
</div>

<form action="ControllerEscola" method="post">

  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label >CNPJ</label>
    <input type="text" class="form-control" aria-describedby="Cnpj" placeholder="Ex.: XX.XXX.XXX/XXXX-XX" name= cnpj>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Razão Social</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= nome>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Endereço</label>
    <input type="text" class="form-control" aria-describedby="Endereco" placeholder="Insira o endereco" name= endereco>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Telefone</label>
    <input type="text" class="form-control" aria-describedby="Telefone" placeholder="Ex.: (XX)XXXXX-XXXX" name= telefone>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Email</label>
    <input type="email" class="form-control" aria-describedby="Email" placeholder="Ex.: user@gmail.com" name= email>
  </div>
  
  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="home.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>