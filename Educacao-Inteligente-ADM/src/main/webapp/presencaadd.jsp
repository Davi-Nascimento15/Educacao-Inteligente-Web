<%@page import="com.educacaointeligente.model.Aluno"%>
<%@page import="com.educacaointeligente.dao.AlunoDao"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="com.educacaointeligente.model.Professor"%>
<%@page import="com.educacaointeligente.dao.ProfessorDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Turma"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@page import="com.educacaointeligente.dao.TurmaDao"%>
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
<title>Adicionar Nova Falta</title>
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
      <h1 class="cabecario">Nova Falta</h1>
   </div>
</div> 
  
<form action="ControllerPresenca" method="post">
  
  <div class="form-check row col-md-4 offset-md-1 pt-5 form-control-lg ml-39">
    <input class="form-check-input" type="checkbox" value="V" id="flexCheckChecked" name="falta"  checked>
    <label class="form-check-label" for="flexCheckChecked"> Faltou</label>
  </div>  
  
  <div class="form-group row col-md-3 offset-md-1 pt-3">
    <label>Data</label>
    <input type="date" class="form-control" aria-describedby="Matricula" placeholder="Insira a matrícula" name= "data">
  </div>
 
<%
AlunoDao alunodao = new AlunoDao(); 
List<Aluno>ListaAluno = alunodao.getAll();
%>

  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Aluno</label>
   	<select  name="aluno" id="Aluno" class="form-control">
	<%
  		for(Aluno A:ListaAluno){
	%>
  			<option value="<%=A.getIdaluno()%>"><%=A.getNome()%></option>
	<%} %>
  	</select>
  </div>

  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
    <a href="presencacon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>