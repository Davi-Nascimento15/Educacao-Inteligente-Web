<%@page import="com.educacaointeligente.model.Professor"%>
<%@page import="com.educacaointeligente.dao.ProfessorDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.educacaointeligente.model.Aluno"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="com.educacaointeligente.model.Nota"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@page import="com.educacaointeligente.dao.AlunoDao"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="com.educacaointeligente.dao.NotaDao"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
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
	
<title>Editar Nota</title>
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
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Editar Nota </h1> 		
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
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Editar </li>
  </ol>
</nav>

<% int NotaID = Integer.parseInt(request.getParameter("NotaID"));
   NotaDao notaDao = new NotaDao();
   Nota nota = notaDao.get(NotaID);
 %>
 
<form action="ControllerNota" method="post">
	<input type="hidden" name="NotaID" value="<%=NotaID %>">

<%
AlunoDao alunodao = new AlunoDao(); 
List<Aluno>ListaAluno = new ArrayList<Aluno>();
if(usuario.getTipo().name().equals("Professor")){
	ListaAluno = alunodao.getAllWhereTurma(ListaDisciplina, usuario.getEscola().getIdEscola(), professorID.getIdprofessor());
}else if(usuario.getTipo().name().equals("Administrador")){
	ListaAluno= alunodao.getAllEscola(usuario.getEscola().getIdEscola());
}else{
	ListaAluno = alunodao.getAll();
}
%>
<div class="row form-select col-md-3 offset-md-1 pt-5"> 
 <label>Aluno</label>
	<select name="alunoID" id="Aluno" class="form-control">
<%
  for(Aluno A:ListaAluno){
	  if (nota.getAluno().getIdaluno()== A.getIdaluno()){
%>
  <option selected value="<%=A.getIdaluno()%>"><%=A.getNome()%></option>
  
	<%}
  			else{%>
  				<option value="<%=A.getIdaluno()%>"><%=A.getNome()%></option>
  			<%}
  			}%> 			
  	</select>
  </div>

<div class="row form-select col-md-3 offset-md-1 pt-3"> 
 <label>Disciplina</label>
	<select name="disciplinaID" id="Disciplina" class="form-control">
<%
  for(Disciplina D:ListaDisciplina){
	  if (nota.getDisciplina().getIddisciplina()== D.getIddisciplina()){
%>
  	<option selected value="<%=D.getIddisciplina()%>"><%=D.getNome()%></option>

	<%}
  			else{%>
  				<option value="<%=D.getIddisciplina()%>"><%=D.getNome()%></option>
  			<%}
  			}%> 			
  	</select>
  </div>

  <div class="form-group row col-md-3 offset-md-1 pt-3">
    <label >Nota</label>
    <input type="text" class="form-control" aria-describedby="Nota" placeholder="Ex.: 7.5" name= "nota" value="<%=nota.getNota()%>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" required>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Ano Letivo</label>
    <input type="text" class="form-control" aria-describedby="AnoLetivo" placeholder="Ex.: 2022" name= "anoletivo" value="<%=nota.getAnoLetivo()%>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" required>
  </div>
  
<%
   List<Bimestre>Bimestreadd = Arrays.asList(Bimestre.values());
%>
  
    <div class="row form-select col-md-3 offset-md-1">
   	 <label>Bimestre</label>
 		<select name="bimestre" id="Bimestre" class="form-control">
 		<%for (int i = 0; i < Bimestreadd.size(); i++){
   	   		if(Bimestreadd.get(i).name().equals(nota.getBimestre().name())){%>
  				<option selected value="<%=Bimestreadd.get(i).name()%>"><%=(i+1) + "� Bimestre" %></option>
		<%}else{%>
 	    	<option value="<%=Bimestreadd.get(i).name()%>"> <%=(i+1) + "� Bimestre" %></option>
     	<%}	
   		}%>     
   	</select>
   </div>
  
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
  	<button type="submit" class="btn btn-primary ">Salvar</button>
    <a href="notacon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
<%} %>
</form>
</body>
</html>