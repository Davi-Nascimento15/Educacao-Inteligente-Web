<%@page import="com.educacaointeligente.model.*"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@page import="com.educacaointeligente.dao.*"%>
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
<title>Editar Aviso</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

<% int AvisoID = Integer.parseInt(request.getParameter("AvisoID"));
   AvisosDao avisosDao =new AvisosDao();
   Avisos aviso = avisosDao.get(AvisoID);
 %>
 
 <div class="card cabecario">
  <div class="card-header">
      <h1 class="cabecario">Editar Aviso</h1>
   </div>
</div>

<form action="ControllerAvisos" method="post">
  <input type="hidden" name="AvisoID" value=<%=AvisoID %>>
  
    <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Descrição</label>
    <input type="text" class="form-control" aria-describedby="Descricao" placeholder="Insira a descrição do aviso" name= descricao value=<%=aviso.getDescricao()%>>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label>Data de Entrega</label>
    <input type="date" class="form-control" aria-describedby="Data" placeholder="Insira a data" name= dataentrega value=<%=aviso.getDataEntrega()%>>
  </div>

<%
TurmaDao turmadao = new TurmaDao(); 
List<Turma>ListaTurma = turmadao.getAll();
%>

<div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Turma</label>
   	<select  name="turma" id="Turma" class="form-control">
	<%
  		for(Turma T:ListaTurma){
	%>
  		<option value="<%=T.getIdTurma()%>"><%=T.getNome()%></option>
	<%} %>
  	</select>
  </div>

<%
ProfessorDao professordao = new ProfessorDao(); 
List<Professor>ListaProfessor = professordao.getAll();
%>

<div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Professor</label>
   	<select  name="professor" id="Professor" class="form-control">
	<%
  		for(Professor P:ListaProfessor){
	%>
  		<option value="<%=P.getIdprofessor()%>"><%=P.getNome()%></option>
	<%} %>
  	</select>
  </div>

<%
DisciplinaDao disciplinadao = new DisciplinaDao(); 
List<Disciplina>ListaDisciplina = disciplinadao.getAll();
%>

<div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Disciplina</label>
   	<select name="disciplina" id="Disciplina" class="form-control">
	<%
  		for(Disciplina D:ListaDisciplina){
	%>
  		<option value="<%=D.getIddisciplina()%>"><%=D.getNome()%></option>
	<%} %>
  	</select>
  </div>
  
	<div class="col-md-3 offset-md-1 pt-4">
  		<button type="submit" class="btn btn-primary ">Salvar</button>
    	<a href="avisoscon.jsp" class="btn btn-danger">Cancelar</a>
   </div>
   
</form>
</body>
</html>