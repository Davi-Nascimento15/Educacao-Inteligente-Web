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

<title>Editar Aluno</title>
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
      <h1 class="cabecario">Editar Aluno</h1>
   </div>
</div>

<% int AlunoID = Integer.parseInt(request.getParameter("AlunoID"));
   AlunoDao alunoDao =new AlunoDao();
   Aluno aluno = alunoDao.get(AlunoID);
 %>
 
<form action="ControllerAluno" method="post">
 <input type="hidden" name="AlunoID" value="<%=AlunoID %>">
 
   <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Matrícula</label>
    <input type="number" class="form-control" aria-describedby="Matricula" placeholder="Insira a matrícula" name= "matricula" value="<%=aluno.getMatricula()%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Nome</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= "nome" value="<%=aluno.getNome()%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Nome da Mãe</label>
    <input type="text" class="form-control" aria-describedby="NomeMae" placeholder="Insira o nome da mãe" name= "nomemae" value="<%=aluno.getNomeMae()%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Telefone</label>
    <input type="text" class="form-control" aria-describedby="Telefone" placeholder="Ex.: (XX)XXXXX-XXXX" name= "telefone" value="<%=aluno.getTelefone()%>">
  </div>
 
  <div class="form-group row col-md-3 offset-md-1">
    <label >Endereço</label>
    <input type="text" class="form-control" aria-describedby="Endereco" placeholder="Insira o endereco" name= "endereco" value="<%=aluno.getEndereco()%>">
  </div>
  
<%
   List<Turno>Turnoadd = Arrays.asList(Turno.values());
%>
 
  <div class="row form-select col-md-3 offset-md-1">
   <label>Turno</label>
   	<select  name="turno" id="Turno" class="form-control">
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
   	<select  name="ano" id="Ano" class="form-control">
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
   	<select  name="usuarioID" id="Usuario" class="form-control">
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
   	<select  name="turmaID" id="Turma" class="form-control">
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
     
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
  	<button type="submit" class="btn btn-primary ">Salvar</button>
    <a href="alunocon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
 </form>
</body>
</html>