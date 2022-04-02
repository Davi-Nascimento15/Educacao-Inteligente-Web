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
<title>Editar Escola</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<% int EscolaID = Integer.parseInt(request.getParameter("EscolaID"));
   EscolaDao escolaDao = new EscolaDao();
   Escola escola = escolaDao.get(EscolaID);
 %>
 
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Editar Escola </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="escolacon.jsp"> Escolas </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Editar </li>
  </ol>
</nav>

<form action="ControllerEscola" method="post">
  <input type="hidden" name="EscolaID" value="<%=EscolaID %>">
  
    <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label >CNPJ</label>
    <input type="text" class="form-control" aria-describedby="Cnpj" placeholder="Ex.: XX.XXX.XXX/XXXX-XX" name= "cnpj" value="<%=escola.getCnpj()%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Razão Social</label>
    <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= "nome" value="<%=escola.getNome()%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Endereço</label>
    <input type="text" class="form-control" aria-describedby="Endereco" placeholder="Insira o endereco" name="endereco" value="<%=escola.getEndereco()%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Telefone</label>
    <input type="text" class="form-control" aria-describedby="Telefone" placeholder="Ex.: (XX)XXXXX-XXXX" name= "telefone" value="<%=escola.getTelefone()%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Email</label>
    <input type="email" class="form-control" aria-describedby="Email" placeholder="Ex.: user@gmail.com" name= "email" value="<%=escola.getEmail()%>">
  </div>
  
  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Salvar</button>
    <a href="escolacon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>