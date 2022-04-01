<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Professor"%>
<%@page import="com.educacaointeligente.dao.ProfessorDao"%>
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
<title>Adicionar Nova Disciplina</title>
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
      <h1 class="cabecario">Nova Disciplina</h1>
   </div>
</div>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="home.jsp"> Home </a> </li>
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="disciplinacon.jsp"> Disciplinas </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Nova </li>
  </ol>
</nav>

<form action="ControllerDisciplina" method="post">

  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label >Nome</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name="nome">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Descri��o</label>
    <input type="text" class="form-control" aria-describedby="Descricao" placeholder="Insira a descricao" name="descricao">
  </div>
 
 <%
ProfessorDao professordao = new ProfessorDao(); 
List<Professor>ListaProfessor = professordao.getAll();
%>
<div class="row form-select col-md-3 offset-md-1">
 <label>Professor</label>
   <select name="professorID" id="Professor" class="form-control">
<%
  for(Professor P:ListaProfessor){
%>
  <option class="form-select-option" value="<%=P.getIdprofessor()%>"><%=P.getNome()%></option>

<%} %>
</select>
</div>

  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="disciplinacon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>