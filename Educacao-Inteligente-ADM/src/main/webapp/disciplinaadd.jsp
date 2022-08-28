<%@page import="java.util.ArrayList"%>
<%@page import="com.educacaointeligente.dao.EscolaDao"%>
<%@page import="com.educacaointeligente.model.Escola"%>
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

<!-- Modal -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<title>Adicionar Nova Disciplina</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
   
   ProfessorDao professordao = new ProfessorDao();
   Professor professorID = new Professor();
   
   if(usuario.getTipo().name().equals("Professor")){ 
	   professorID = professordao.getAllUsuarioProfessor(usuario.getIdmatricula());
    }
%>
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5">Nova Disciplina </h1> 		
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
List<Professor>ListaProfessor = new ArrayList<Professor>(); 
 if(usuario.getTipo().name().equals("SuperUsuario")){
   ListaProfessor = professordao.getAll();
 }else if(usuario.getTipo().name().equals("Administrador")){
   ListaProfessor = professordao.getAllWhereEscola(usuario.getEscola().getIdEscola());
 }
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
<%
EscolaDao escoladao = new EscolaDao(); 
List<Escola>ListaEscola = escoladao.getAll();
%>

<%if(usuario.getTipo().name().equals("SuperUsuario")){ %>
  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Escola</label>
   	<select  name="EscolaID" id="Escola" class="form-control">
	<%
  	for(Escola E:ListaEscola){
	%>
  		<option value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%} %> 
 	</select>
  </div>
<%}else{ %>
   <input type="hidden" name="EscolaID" value="<%=usuario.getEscola().getIdEscola()%>">
  <%} %>
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="disciplinacon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>