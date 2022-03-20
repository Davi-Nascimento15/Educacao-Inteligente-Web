<%@page import="com.educacaointeligente.model.Usuario"%>
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
<title>Adicionar Nova Turma</title>
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
      <h1 class="cabecario">Nova Turma</h1>
   </div>
</div> 

<form action="ControllerTurma" method="post">
  
  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Nome</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= nome>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label>Ano</label>
    <input type="number" class="form-control" aria-describedby="Ano" placeholder="Insira o ano" name= ano>
  </div>
  
 <%
DisciplinaDao disciplinadao = new DisciplinaDao(); 
List<Disciplina>Lista = disciplinadao.getAll();
%>

  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Disciplinas</label>
   	<select name="disciplina" id="Disciplina" class="form-control">
	<%
  		for(Disciplina D:Lista){
	%>
  		<option value="<%=D.getIddisciplina()%>"><%=D.getNome()%></option>
	<%} %>  	
	</select>
  </div>
  
<%
EscolaDao escoladao = new EscolaDao(); 
List<Escola>ListaEscola = escoladao.getAll();
%>

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

  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="turmacon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
 </form>
 
</body>
</html>