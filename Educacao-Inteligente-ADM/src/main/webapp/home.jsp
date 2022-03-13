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
       
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>

<div class="card">
  <div class="card-header">
   <h1 class="text- col-md-11 offset-md-5">Educação Inteligênte
   <a href="logout.jsp" class="bi bi-person"> Sair</a>
   </h1>
  </div> 
</div>

<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<div class="container-fluid d-flex flex-wrap">

<div class="col text-center">  
	<div class="card" style="width: 20rem;">
	 	<img src="Usuario.png" alt="Imagem de capa do card" width="268" height="180">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Usuários</h3>
	        <p class="card-text">....</p>
    		<a href="usuariocon.jsp" class="btn btn-primary">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center">  
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="https://cdn-icons.flaticon.com/png/512/1665/premium/1665680.png?token=exp=1638307707~hmac=39812a4e2e42d9e6990646b101df8ce3" alt="Imagem de capa do card">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Alunos</h3>
	        <p class="card-text">....</p>
    		<a href="alunocon.jsp" class="btn btn-primary">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center">  
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="https://cdn-icons.flaticon.com/png/512/1665/premium/1665680.png?token=exp=1638307707~hmac=39812a4e2e42d9e6990646b101df8ce3" alt="Imagem de capa do card">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Professores</h3>
	        <p class="card-text">....</p>
    		<a href="professorcon.jsp" class="btn btn-primary">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center">  
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="https://cdn-icons.flaticon.com/png/512/1665/premium/1665680.png?token=exp=1638307707~hmac=39812a4e2e42d9e6990646b101df8ce3" alt="Imagem de capa do card">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Disciplinas</h3>
	        <p class="card-text">....</p>
    		<a href="disciplinacon.jsp" class="btn btn-primary">Acessar</a>
  		</div>
   	</div>
</div>

<div class="col text-center">  
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="https://cdn-icons.flaticon.com/png/512/1665/premium/1665680.png?token=exp=1638307707~hmac=39812a4e2e42d9e6990646b101df8ce3" alt="Imagem de capa do card">
      	<div class="card-body">
	    	<h3 class="card-title">Gerenciar Turmas</h3>
	        <p class="card-text">....</p>
    		<a href="turmacon.jsp" class="btn btn-primary">Acessar</a>
  		</div>
   	</div>
</div>
   	
</body>
</html>