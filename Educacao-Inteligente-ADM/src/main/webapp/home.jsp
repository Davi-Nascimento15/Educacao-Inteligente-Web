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

<nav class="navbar navbar-expand-lg  barra">
    <div class="container">
        <div class="row col-md-12 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            </ul>
          </div>
        </div>
      </div>
 
      <form class="d-flex">
        <a href="logout.jsp"> <img src="Sair.png" width="45" height="45"> </a>   
      </form>
</nav>

<nav class="navbar navbar-expand-lg  barra">
    <div class="container">
        <div class="row col-md-12 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario">Educação Inteligente  </h1>
            		<img src="Luz.png" width="200" height="200">   		
            </ul>
          </div>
        </div>
      </div>
</nav>

<% 
   Usuario sessao = (Usuario)session.getAttribute("usuario");
   if(sessao==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<div class="container-fluid d-flex flex-wrap">
<%if((sessao.getTipo().name().equals("Administrador"))||((sessao.getTipo().name().equals("SuperUsuario")))){ %>
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
<%} %>
<%if((sessao.getTipo().name().equals("Administrador"))||((sessao.getTipo().name().equals("SuperUsuario")))){ %>
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
<%} %>
<%if((sessao.getTipo().name().equals("Administrador"))||((sessao.getTipo().name().equals("SuperUsuario")))){ %>
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
<%} %>
<%if((sessao.getTipo().name().equals("Administrador"))||((sessao.getTipo().name().equals("SuperUsuario")))){ %>
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
<%} %>
<%if((sessao.getTipo().name().equals("Administrador"))||((sessao.getTipo().name().equals("SuperUsuario")))){ %>
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
<%} %>
<%if(!sessao.getTipo().name().equals("Usuario")){ %>
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
<%} %>
<%if(!sessao.getTipo().name().equals("Usuario")){ %>
<div class="col text-center espaco">   
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Avisos.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Avisos</h3>
	        <p class="card-text">....</p>
    		<a href="avisoscon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>
<%} %>
<%if(!sessao.getTipo().name().equals("Usuario")){ %>
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
<%} %>
<%if((sessao.getTipo().name().equals("Administrador"))||((sessao.getTipo().name().equals("SuperUsuario")))){ %>
<div class="col text-center espaco">  
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Ideia.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Sugestões</h3>
	        <p class="card-text">....</p>
    		<a href="sugestaocon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>
<%} %>
<%if((sessao.getTipo().name().equals("Administrador"))||((sessao.getTipo().name().equals("SuperUsuario")))){ %>
<div class="col text-center espaco">  
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Feed.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Notícias</h3>
	        <p class="card-text">....</p>
    		<a href="noticiacon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>
<%} %>
<%if((sessao.getTipo().name().equals("Administrador"))||((sessao.getTipo().name().equals("SuperUsuario")))){ %>
<div class="col text-center espaco">  
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Feed.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Anos Letivos</h3>
	        <p class="card-text">....</p>
    		<a href="anoletivocon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>
<%} %>
<%if(sessao.getTipo().name().equals("SuperUsuario")){ %>
<div class="col text-center espaco" style="margin-bottom: 1%">   
	<div class="card" style="width: 20rem;">
	 <img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Escola.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Escolas</h3>
	        <p class="card-text">....</p>
    		<a href="escolacon.jsp" class="btn btn-black">Acessar</a>
  		</div>
   	</div>
</div>
<%} %>

</div>
<%if(sessao.getTipo().name().equals("Usuario")){ %>
<div class="col text-center espaco">   
	<div class="card" style="width: 20rem;">
	 <img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="Escola.png" width="180" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Atenção</h3>
	        <p class="card-text">Prezado pai e/ou responsável, para acessar os dados do seu filho, baixe o aplicativo disponível na Google Play</p>
    		<a href="" class="btn btn-danger">Link para o  Aplicativo</a>
  		</div>
   	</div>
</div>
<%} %>

</body>
</html>