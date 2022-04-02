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
<title>Adicionar Novo Usuario</title>
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
            	<h1 class="cabecario pl-5"> Novo Usuário </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="usuariocon.jsp"> Usuarios </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Novo </li>
  </ol>
</nav>

 <form action="ControllerUsuario" method="post">
 
  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Matrícula</label>
    <input type="number" class="form-control" aria-describedby="Matricula" placeholder="Insira a matrícula" name= "matricula">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Nome</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= "nome">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label>Senha</label>
    <input type="password" class="form-control"  placeholder="Insira a senha" name= "senha">
  </div>
 
  <div class="row form-select col-md-3 offset-md-1">
   <label>Tipo</label>
   	<select  name="Tipo" id="tipo" class="form-control">
   		<%if (sessao.getTipo().name().equals("SuperUsuario")){%>
    	<option class="form-select-option" value="<%=TipoUsuario.Administrador.name()%>">Administrador</option>
  	<%} %>
  		<option class="form-select-option" value="<%=TipoUsuario.Usuario.name()%>">Usuário</option>
  		<option class="form-select-option" value="<%=TipoUsuario.Professor.name()%>">Professor</option>
  		<%if (sessao.getTipo().name().equals("SuperUsuario")){%>
  		<option class="form-select-option" value="<%=TipoUsuario.SuperUsuario.name()%>">Super Usuário</option>
  	<%} %>
  	</select>
  </div>
  
  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="usuariocon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>