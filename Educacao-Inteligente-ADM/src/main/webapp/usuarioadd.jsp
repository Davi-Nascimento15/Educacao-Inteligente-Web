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
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<div class="card cabecario">
  <div class="card-header">
      <h1 class="cabecario">Novo Usuário</h1>
   </div>
</div> 
 
 <form action="ControllerUsuario" method="post">
 
  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Matrícula</label>
    <input type="number" class="form-control" aria-describedby="Matricula" placeholder="Insira a matrícula" name= matricula>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Nome</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= nome>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label>Senha</label>
    <input type="password" class="form-control"  placeholder="Insira a senha" name= senha>
  </div>
 
  <div class="row form-select col-md-3 offset-md-1">
   <label>Tipo</label>
   	<select  name="Tipo" id="tipo" class="form-control">
    	<option class="form-select-option" value="<%=TipoUsuario.Admin.name()%>">Administrador</option>
  		<option class="form-select-option" value="<%=TipoUsuario.User.name()%>">Usuario</option>
  		<option class="form-select-option" value="<%=TipoUsuario.Prof.name()%>">Professor</option>
  	</select>
  </div>
  
  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="home.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>