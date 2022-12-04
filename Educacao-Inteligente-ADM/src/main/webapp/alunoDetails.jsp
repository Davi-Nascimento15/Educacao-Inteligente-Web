<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
<title>Detalhes do Aluno</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }else{
%>
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5">Detalhes do Aluno </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="alunocon.jsp"> Alunos </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Detalhes </li>
  </ol>
</nav>
<% int AlunoID = Integer.parseInt(request.getParameter("AlunoID"));
   AlunoDao alunoDao =new AlunoDao();
   Aluno aluno = alunoDao.get(AlunoID);
 %>
 
<form action="ControllerAluno" method="post">
 <input type="hidden" name="AlunoID" value="<%=AlunoID %>">
 
   <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Matrícula</label>
    <input type="number" class="form-control" aria-describedby="Matricula" placeholder="Insira a matrícula" name= "matricula" value="<%=aluno.getMatricula()%>" readonly>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Nome</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= "nome" value="<%=aluno.getNome()%>" readonly>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Nome da Mãe</label>
    <input type="text" class="form-control" aria-describedby="NomeMae" placeholder="Insira o nome da mãe" name= "nomemae" value="<%=aluno.getNomeMae()%>" readonly>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Telefone</label>
    <input type="text" class="form-control" aria-describedby="Telefone" placeholder="Ex.: (XX)XXXXX-XXXX" name= "telefone" value="<%=aluno.getTelefone()%>" readonly>
  </div>
 
  <div class="form-group row col-md-3 offset-md-1">
    <label >Endereço</label>
    <input type="text" class="form-control" aria-describedby="Endereco" placeholder="Insira o endereco" name= "endereco" value="<%=aluno.getEndereco()%>" readonly>
  </div>
  
<%
   List<Turno>Turnoadd = Arrays.asList(Turno.values());
%>
 
  <div class="row form-select col-md-3 offset-md-1">
   <label>Turno</label>
   	<select  name="turno" id="Turno" class="form-control" readonly="readonly" tabindex="-1" aria-disabled="true">
   	   <%for (int i = 0; i < Turnoadd.size(); i++){
   	   if(Turnoadd.get(i).name().equals(aluno.getTurno().name())){%>
   	    	<option selected value="<%=Turnoadd.get(i).name()%>"><%=Turnoadd.get(i).name()%></option>
 	    <%}else{%>
 	    <option value="<%=Turnoadd.get(i).name()%>"><%=Turnoadd.get(i).name()%></option>
     <%}
   } %>     
   	</select>
   </div>

<%
   List<Ano>Anoadd = Arrays.asList(Ano.values());
%>
  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Ano</label>
   	<select  name="ano" id="Ano" class="form-control" readonly="readonly" tabindex="-1" aria-disabled="true">
     <%for (int i = 0; i < Anoadd.size(); i++){
   	   if(Anoadd.get(i).name().equals(aluno.getAno().name())){%>
   	    	<option selected value="<%=Anoadd.get(i).name()%>"><%=Anoadd.get(i).name()%></option>
 	    <%}else{%>
 	    <option value="<%=Anoadd.get(i).name()%>"><%=Anoadd.get(i).name()%></option>
     <%}
   } %>	</select>
   </div>

<%
UsuarioDao usuariodao = new UsuarioDao(); 
List<Usuario>ListaUsuario = usuariodao.getAll();
%>

  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Usuário Responsável</label>
   	<select  name="usuarioID" id="Usuario" class="form-control" readonly="readonly" tabindex="-1" aria-disabled="true">
	<%
  	for(Usuario U:ListaUsuario){
	 if(U.getIdmatricula()==aluno.getUsuario().getIdmatricula()){
	%>
  		<option selected value="<%=U.getIdmatricula()%>"><%=U.getNome()%></option>
	<%}else{%>
		<option value="<%=U.getIdmatricula()%>"><%=U.getNome()%></option>
	<%}
  } %>
  	</select>
  </div>
<%
TurmaDao turmadao = new TurmaDao(); 
List<Turma>ListaTurma = turmadao.getAll();
%>

  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Turma</label>
   	<select  name="turmaID" id="Turma" class="form-control" readonly="readonly" tabindex="-1" aria-disabled="true">
	<%
  	for(Turma T:ListaTurma){
  		if(T.getIdTurma()==aluno.getTurma().getIdTurma()){
	%>
  		<option selected value="<%=T.getIdTurma()%>"><%=T.getNome()%></option>
	<%}else{ %>
		<option value="<%=T.getIdTurma()%>"><%=T.getNome()%></option>
	<%}
   } %> 
 	</select>
  </div>
<%
EscolaDao escoladao = new EscolaDao(); 
List<Escola>ListaEscola = escoladao.getAll();
%>

<%if(usuario.getTipo().name().equals("SuperUsuario")){ %>
  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Escola</label>
   	<select  name="escolaID" id="Escola" class="form-control" readonly="readonly" tabindex="-1" aria-disabled="true">
	<%
  	for(Escola E:ListaEscola){
  		if(E.getIdEscola()==aluno.getEscola().getIdEscola()){
	%>
  		<option selected value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}else{ %>
		<option value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}
   } %> 
 	</select>
  </div>
<%}else{ %>
   <input type="hidden" name="escolaID" value="<%=usuario.getEscola().getIdEscola()%>" readonly>
<%}%> 
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
    <a href="alunocon.jsp" class="btn btn-danger">Voltar</a>
    <%} %>
  </div>
 </form>
</body>
</html>