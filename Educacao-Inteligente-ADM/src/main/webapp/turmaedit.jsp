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
<title>Editar Turma</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<% int TurmaID = Integer.parseInt(request.getParameter("TurmaID"));
   TurmaDao turmaDao = new TurmaDao();
   Turma turma = turmaDao.get(TurmaID);
 %>
 
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Editar Turma </h1> 		
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
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Editar </li>
  </ol>
</nav>
 
<form action="ControllerTurma" method="post">

  <input type="hidden" name="TurmaID" value="<%=TurmaID %>">

 <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Nome</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= "nome" value="<%=turma.getNome()%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label>Ano</label>
    <input type="number" class="form-control" aria-describedby="Ano" placeholder="Insira o ano" name="ano" value="<%=turma.getAno()%>">
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
  			if(E.getIdEscola()==turma.getEscola().getIdEscola()){
	%>
  			<option selected value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}else{%>
		<option value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}
  	} %>
  	
	</select>
  </div>

  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Salvar</button>
    <a href="turmacon.jsp" class="btn btn-danger">Cancelar</a>
  </div>

</form>
</body>
</html>