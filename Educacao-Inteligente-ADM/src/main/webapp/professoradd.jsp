<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
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
<title>Adicionar Novo Professor</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Novo Professor </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="professorcon.jsp"> Professores </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Novo</li>
  </ol>
</nav>

<form action="ControllerProfessor" method="post">

  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label >Nome</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= "nome">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Endere�o</label>
    <input type="text" class="form-control" aria-describedby="Endereco" placeholder="Insira o endereco" name= "endereco">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Telefone</label>
    <input type="text" class="form-control" aria-describedby="Telefone" placeholder="Ex.: (XX)XXXXX-XXXX" name= "telefone">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Email</label>
    <input type="email" class="form-control" aria-describedby="Email" placeholder="Ex.: user@gmail.com" name= "email">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Forma��o</label>
    <input type="text" class="form-control" aria-describedby="Formacao" placeholder="Insira a formacao" name= "formacao">
  </div>
  
<%
UsuarioDao usuariodao = new UsuarioDao(); 
List<Usuario>ListaUsuario = usuariodao.getAllWhereProfessor(2);
%>

  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Usu�rio</label>
   	<select  name="UsuarioID" id="Usuario" class="form-control">
	<%
  		for(Usuario A:ListaUsuario){
	%>
  		<option value="<%=A.getIdmatricula()%>"><%=A.getNome()%></option>
	<%} %>
  	</select>
  </div>
    
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="professorcon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>