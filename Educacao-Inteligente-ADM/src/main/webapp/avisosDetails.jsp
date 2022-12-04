<%@page import="java.util.ArrayList"%>
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

<!-- Modal -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<title>Detalhes do Aviso</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }else{
   
   ProfessorDao professordao = new ProfessorDao();
   Professor professorID = new Professor();
   
   if(usuario.getTipo().name().equals("Professor")){ 
	   professorID = professordao.getAllUsuarioProfessor(usuario.getIdmatricula());
    }
%>

<% int AvisoID = Integer.parseInt(request.getParameter("AvisoID"));
   AvisosDao avisosDao =new AvisosDao();
   Avisos aviso = avisosDao.get(AvisoID);
 %>
 
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5">Detalhes do Aviso </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="avisoscon.jsp"> Avisos </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Detalhes </li>
  </ol>
</nav>

<form action="ControllerAvisos" method="post">
  <input type="hidden" name="AvisoID" value="<%=AvisoID %>">
  
  <div class="row form-select col-md-3 offset-md-1">
   <label>Tipo</label>
   	<select  name="tipo" id="tipo" class="form-control" readonly="readonly" tabindex="-1" aria-disabled="true">
 	    <option value="<%=TipoAviso.aviso.name()%>">Aviso</option>
  		<option value="<%=TipoAviso.tarefa.name()%>">Tarefa</option>
        <option value="<%=TipoAviso.prova.name()%>">Prova</option>
   	</select>
   </div>
 
  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Descrição</label>
    <input type="text" class="form-control" aria-describedby="Descricao" placeholder="Insira a descrição do aviso" name= "descricao" value="<%=aviso.getDescricao()%>" readonly>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Observação</label>
    <input type="text" class="form-control" aria-describedby="Observacao" placeholder="Insira observações do aviso" name= "observacao" value="<%=aviso.getObservacao()%>" readonly>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label>Data de Entrega</label>
    <input type="date" class="form-control" aria-describedby="Data" placeholder="Insira a data" name="dataentrega" value="<%=aviso.getDataEntrega()%>" readonly>
  </div>

<%
TurmaDao turmadao = new TurmaDao(); 
List<Turma>ListaTurma = new ArrayList<Turma>();
if(usuario.getTipo().name().equals("SuperUsuario")){
	ListaTurma = turmadao.getAll();
}else{
 	ListaTurma = turmadao.getAllEscola(usuario.getEscola().getIdEscola());
}%>

<div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Turma</label>
   	<select  name="turma" id="Turma" class="form-control" readonly="readonly" tabindex="-1" aria-disabled="true">
	<%
  		for(Turma T:ListaTurma){
  			if (aviso.getTurma().getIdTurma()== T.getIdTurma()){
	%>
  		<option selected value="<%=T.getIdTurma()%>"><%=T.getNome()%></option>
  	<%}
  			else{%>
  				<option value="<%=T.getIdTurma()%>"><%=T.getNome()%></option>
  			<%}
  			}%> 			
  	</select>
  </div>
<%
List<Professor>ListaProfessor = new ArrayList<Professor>();
if(!usuario.getTipo().name().equals("Professor")){
	
	if(usuario.getTipo().name().equals("Administrador")){
		ListaProfessor = professordao.getAllWhereEscola(usuario.getEscola().getIdEscola());
	}else{
		ListaProfessor = professordao.getAll();
	}
%>

<div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Professor</label>
   	<select  name="professor" id="Professor" class="form-control" readonly="readonly" tabindex="-1" aria-disabled="true">
	<%
  		for(Professor P:ListaProfessor){
  			if (aviso.getProfessor().getIdprofessor()== P.getIdprofessor()){
	%>
  		<option selected value="<%=P.getIdprofessor()%>"><%=P.getNome()%></option>
	<%}
  			else{%>
  				<option value="<%=P.getIdprofessor()%>"><%=P.getNome()%></option>
  			<%}
  			}%> 			
  	</select>
  </div>
<%
}else{
%>
   <input type="hidden" name="professor" value="<%=professorID.getIdprofessor()%>"> 	
<%}
DisciplinaDao disciplinadao = new DisciplinaDao(); 
List<Disciplina>ListaDisciplina = new ArrayList<Disciplina>();
if(usuario.getTipo().name().equals("SuperUsuario")){
	ListaDisciplina = disciplinadao.getAll();
}
else if(usuario.getTipo().name().equals("Professor")){
	ListaDisciplina = disciplinadao.getAllWhereProfessor(professorID.getIdprofessor());
}else{
	ListaDisciplina = disciplinadao.getAllWhereEscola(usuario.getEscola().getIdEscola());
}

%>
<div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Disciplina</label>
   	<select name="disciplina" id="Disciplina" class="form-control" readonly="readonly" tabindex="-1" aria-disabled="true">
	<%
  		for(Disciplina D:ListaDisciplina){
  			if (aviso.getDisciplina().getIddisciplina()== D.getIddisciplina()){
	%>
  		<option selected value="<%=D.getIddisciplina()%>"><%=D.getNome()%></option>
	<%}
  			else{%>
  				<option value="<%=D.getIddisciplina()%>"><%=D.getNome()%></option>
  			<%}
  			}%> 			
  	</select>
  </div>

<%
EscolaDao escoladao = new EscolaDao(); 
List<Escola>ListaEscola = escoladao.getAll();
%>

<%if(usuario.getTipo().name().equals("SuperUsuario")){ %>
  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Escola</label>
   	<select name="escolaID" id="Escola" class="form-control" readonly="readonly" tabindex="-1" aria-disabled="true">
	<%
  		for(Escola E:ListaEscola){
  			if(E.getIdEscola()==aviso.getEscola().getIdEscola()){
	%>
  			<option selected value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}else{%>
		<option value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}
  	} %>  	
	</select>
  </div>
<%}else{ %>
   <input type="hidden" name="escolaID" value="<%=usuario.getEscola().getIdEscola()%>" readonly>
<%}%>
 
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
     <a href="avisoscon.jsp" class="btn btn-danger">Voltar</a>
  </div>
 <%} %>
</form>
</body>
</html>