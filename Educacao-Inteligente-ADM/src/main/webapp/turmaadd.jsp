<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@page import="com.educacaointeligente.model.Escola"%>
<%@page import="com.educacaointeligente.dao.EscolaDao"%>
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
	
Adicionar Novo Professor
<title>Adicionar Nova Turma</title>
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
            	<h1 class="cabecario pl-5"> Nova Turma </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="turmacon.jsp"> Turmas </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Nova</li>
  </ol>
</nav>

<form action="ControllerTurma" method="post">
  
  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Nome</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= "nome">
  </div>
    
  <%LocalDate data = LocalDate.now(); %>
  <div class="form-group row col-md-3 offset-md-1">
    <label >Ano Letivo</label>
    <input type="text" class="form-control" aria-describedby="Ano" placeholder="Ex.: 2022" name= "ano" value="<%=data.getYear()%>">
  </div>
  
 <%
DisciplinaDao disciplinadao = new DisciplinaDao(); 
List<Disciplina>Lista = disciplinadao.getAll();
%>

  <div class="row form-select col-md-3 offset-md-1 pt-3">
   		<label>Disciplinas</label>
   </div> 
   
  <div class="offset-md-1 ml-9">
  	<%for(Disciplina D:Lista){%>
  	<div class="form-check ml-3 ">
	    <input class="form-check-input" type="checkbox" value=<%=D.getIddisciplina()%> id="flexCheckChecked" name="<%=D.getNome()%>">
    	<label class="form-check-label" for="flexCheckChecked"><%=D.getNome()%></label>
    </div>
  	<%}%>
 </div>
<%
EscolaDao escoladao = new EscolaDao(); 
List<Escola>ListaEscola = escoladao.getAll();
%>

<%if(usuario.getTipo().name().equals("SuperUsuario")){ %>
  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Escola</label>
   	<select name="escolaID" id="Escola" class="form-control">
	<%
  		for(Escola E:ListaEscola){
	%>
  			<option value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%} %>
	</select>
  </div>
<%}else{ %>
   <input type="hidden" name="escolaID" value="<%=usuario.getEscola().getIdEscola()%>">
<%}%>
  <div class="col-md-3 offset-md-1 pt-5">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="professorcon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
 </form>
 
</body>
</html>