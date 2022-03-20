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
<title>Adicionar Novo Aluno</title>
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
      <h1 class="cabecario">Novo Aluno</h1>
   </div>
</div> 

<form action="ControllerAluno" method="post">
 
  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Matrícula</label>
    <input type="number" class="form-control" aria-describedby="Matricula" placeholder="Insira a matrícula" name= matricula>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Nome</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= nome>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Nome da Mãe</label>
    <input type="text" class="form-control" aria-describedby="NomeMae" placeholder="Insira o nome da mãe" name= nomemae>
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Telefone</label>
    <input type="text" class="form-control" aria-describedby="Telefone" placeholder="Ex.: (XX)XXXXX-XXXX" name= telefone>
  </div>
 
  <div class="form-group row col-md-3 offset-md-1">
    <label >Endereço</label>
    <input type="text" class="form-control" aria-describedby="Endereco" placeholder="Insira o endereco" name= endereco>
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
  		<option value="<%=Ano.primeiro.name()%>">1º ano </option>
  		<option value="<%=Ano.segundo.name()%>">2º ano</option>
  		<option value="<%=Ano.terceiro.name()%>">3º ano</option>
  		<option value="<%=Ano.quarto.name()%>">4º ano</option>
  		<option value="<%=Ano.quinto.name()%>">5º ano</option>
  		<option value="<%=Ano.sexto.name()%>">6º ano</option>
  		<option value="<%=Ano.setimo.name()%>">7º ano</option>
  		<option value="<%=Ano.oitavo.name()%>">8º ano</option>
  		<option value="<%=Ano.nono.name()%>">9º ano</option>
  	</select>
   </div>

<%
UsuarioDao usuariodao = new UsuarioDao(); 
List<Usuario>ListaUsuario = usuariodao.getAll();
%>

  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Usuário Responsável</label>
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
     
  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Adicionar</button>
     <a href="alunocon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
 </form>
</body>
</html>