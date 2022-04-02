<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.educacaointeligente.model.Aluno"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@page import="com.educacaointeligente.dao.AlunoDao"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
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
<title>Adicionar Nova Nota</title>
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
            	<h1 class="cabecario pl-5"> Nova Nota </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="notacon.jsp"> Notas </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Nova </li>
  </ol>
</nav>
   
<form action="ControllerNota" method="post">

<%
AlunoDao alunodao = new AlunoDao(); 
List<Aluno>ListaAluno = alunodao.getAll();
%>
<div class="row form-select col-md-3 offset-md-1 pt-5"> 
 <label>Aluno</label>
	<select name="alunoID" id="Aluno" class="form-control">
<%
  for(Aluno A:ListaAluno){
%>
  <option class="form-select-option" value="<%=A.getIdaluno()%>"><%=A.getNome()%></option>
<%} %>
</select>
</div>

<%
DisciplinaDao disciplinadao = new DisciplinaDao(); 
List<Disciplina>ListaDisciplina = disciplinadao.getAll();
%>
<div class="row form-select col-md-3 offset-md-1 pt-3"> 
 <label>Disciplina</label>
	<select name="disciplinaID" id="Disciplina" class="form-control">
<%
  for(Disciplina D:ListaDisciplina){
%>
  <option class="form-select-option" value="<%=D.getIddisciplina()%>"><%=D.getNome()%></option>
<%} %>
</select>
</div>

  <div class="form-group row col-md-3 offset-md-1 pt-3">
    <label >Nota</label>
    <input type="text" class="form-control" aria-describedby="Nota" placeholder="Ex.: 7.5" name= "nota">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Ano Letivo</label>
    <input type="text" class="form-control" aria-describedby="AnoLetivo" placeholder="Ex.: 2022" name= "anoletivo">
  </div>
  
    <div class="row form-select col-md-3 offset-md-1">
   	 <label>Bimestre</label>
 		<select name="bimestre" id="Bimestre" class="form-control">
  			<option class="form-select-option" value="<%=Bimestre.Bimestre_01.name()%>">1° Bimestre</option>
  			<option class="form-select-option" value="<%=Bimestre.Bimestre_02.name()%>">2° Bimestre</option>
  			<option class="form-select-option" value="<%=Bimestre.Bimestre_03.name()%>">3° Bimestre</option>
  			<option class="form-select-option" value="<%=Bimestre.Bimestre_04.name()%>">4° Bimestre</option>
  	</select>
  </div>
  
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="notacon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>