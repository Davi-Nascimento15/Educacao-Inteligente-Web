<%@page import="com.educacaointeligente.dao.EscolaDao"%>
<%@page import="com.educacaointeligente.model.Escola"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Turma"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@page import="com.educacaointeligente.dao.TurmaDao"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1 "
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
<title>Adicionar Novo Aluno</title>
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
            	<h1 class="cabecario pl-5">Novo Aluno </h1> 		
            </ul>
          </div>
        </div>  
      </div>
      
        <form class="d-flex pl-5">
        	<a href="logout.jsp"> <img src="Sair.png" width="45" height="45"> </a>   
      	</form>
</nav>

<nav  class = "BarraEndereco" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="home.jsp"> Home </a> </li>
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="alunocon.jsp"> Alunos </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Novo </li>
  </ol>
</nav>

<form action="ControllerAluno" method="post">
 
  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Matr�cula</label>
    <input type="text" class="form-control" aria-describedby="Matricula" placeholder="Insira a matr�cula" name= "matricula" required maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Nome</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= "nome" required>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Nome da M�e</label>
    <input type="text" class="form-control" aria-describedby="NomeMae" placeholder="Insira o nome da m�e" name= "nomemae" required>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Telefone</label>
    <input type="text" class="form-control" aria-describedby="Telefone" placeholder="Ex.: Insira o telefone" name= "telefone" required  maxlength="15" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
  </div>
 
  <div class="form-group row col-md-3 offset-md-1">
    <label >Endere�o</label>
    <input type="text" class="form-control" aria-describedby="Endereco" placeholder="Insira o endereco" name= "endereco" required>
  </div>
   
  <div class="row form-select col-md-3 offset-md-1">
   <label>Turno</label>
   	<select  name="turno" id="Turno" class="form-control">
 	    <option value="<%=Turno.Matutino.name()%>">Matutino</option>
  		<option value="<%=Turno.Vespertino.name()%>">Vespertino</option>
        <option value="<%=Turno.Noturno.name()%>">Noturno</option>
   	</select>
   </div>

  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Ano</label>
   	<select  name="ano" id="Ano" class="form-control">
  		<option value="<%=Ano.primeiro.name()%>">1� ano </option>
  		<option value="<%=Ano.segundo.name()%>">2� ano</option>
  		<option value="<%=Ano.terceiro.name()%>">3� ano</option>
  		<option value="<%=Ano.quarto.name()%>">4� ano</option>
  		<option value="<%=Ano.quinto.name()%>">5� ano</option>
  		<option value="<%=Ano.sexto.name()%>">6� ano</option>
  		<option value="<%=Ano.setimo.name()%>">7� ano</option>
  		<option value="<%=Ano.oitavo.name()%>">8� ano</option>
  		<option value="<%=Ano.nono.name()%>">9� ano</option>
  	</select>
   </div>

<%
UsuarioDao usuariodao = new UsuarioDao(); 
List<Usuario>ListaUsuario = usuariodao.getAll();
%>

  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Usu�rio Respons�vel</label>
   	<select  name="usuarioID" id="Usuario" class="form-control">
	<%
  	for(Usuario U:ListaUsuario){
	%>
  		<option value="<%=U.getIdmatricula()%>"><%=U.getNome()%></option>
	<%} %>
  	</select>
  </div>

<%
TurmaDao turmadao = new TurmaDao(); 
List<Turma>ListaTurma = turmadao.getAll();
%>

  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Turma</label>
   	<select  name="turmaID" id="Turma" class="form-control">
	<%
  	for(Turma T:ListaTurma){
	%>
  		<option value="<%=T.getIdTurma()%>"><%=T.getNome()%></option>
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
   	<select  name="escolaID" id="Escola" class="form-control">
	<%
  	for(Escola E:ListaEscola){
	%>
  		<option value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%} %> 
 	</select>
  </div>
<%}else{ %>
   <input type="hidden" name="escolaID" value="<%=usuario.getEscola().getIdEscola()%>">
  <%} %>
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
     <a href="alunocon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
 <%} %>
 </form>
</body>
</html>