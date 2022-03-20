<%@page import="com.educacaointeligente.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
       crossorigin="anonymous">  
<link rel="stylesheet" href="Style.css" type="text/css">
  
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body class="corpo">

<div class="card cabecario">
  <div class="card-header">
      <h1 class="cabecario">Educação Inteligênte</h1>
   </div>
  </div> 
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<div class="container-fluid d-flex flex-wrap">

<div class="col text-center espaco">  
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Usuario.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Usuários</h3>
	        <p class="card-text">....</p>
	        <a href="usuariocon.jsp" class="btn btn-black" style="text-decoration:none hover:{color: #fff}">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center espaco">  
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Aluno.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Alunos</h3>
	        <p class="card-text">....</p>
    		<a href="alunocon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center espaco">   
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Professor.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Professores</h3>
	        <p class="card-text">....</p>
    		<a href="professorcon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center espaco">    
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Disciplina.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Disciplinas</h3>
	        <p class="card-text">....</p>
    		<a href="disciplinacon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center espaco">   
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Turma.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Turmas</h3>
	        <p class="card-text">....</p>
    		<a href="turmacon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center espaco">   
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Nota.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Notas</h3>
	        <p class="card-text">....</p>
    		<a href="notacon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center espaco">   
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Aviso.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Avisos</h3>
	        <p class="card-text">....</p>
    		<a href="avisoscon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center espaco">    
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Presenca.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Faltas</h3>
	        <p class="card-text">....</p>
    		<a href="presencacon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center espaco">   
	<div class="card" style="width: 20rem;">
	 <img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Escola.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Escolas</h3>
	        <p class="card-text">....</p>
    		<a href="escolacon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>
   	
</body>
</html>