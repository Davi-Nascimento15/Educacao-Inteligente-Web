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
<title>Editar Not�cia</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<% int NoticiaID = Integer.parseInt(request.getParameter("NoticiaID"));
   NoticiaDao noticiaDao = new NoticiaDao();
   Noticia noticia = noticiaDao.get(NoticiaID);
%>

<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Editar Not�cia </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="turmacon.jsp"> Not�cias </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Editar </li>
  </ol>
</nav>

<form action="ControllerNoticia" method="post">

  <input type="hidden" name="NoticiaID" value="<%=NoticiaID %>">

  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>T�tulo</label>
    <input type="text" class="form-control" aria-describedby="Titulo" placeholder="Insira o titulo" name= "titulo" value="<%=noticia.getTitulo()%>">
  </div>
  
  <div class="form-group row col-md-8 offset-md-1 pt-5">
    <label>Descri��o</label>
    <input type="text" class="form-control" aria-describedby="Descricao" placeholder="Insira a descri��o" name= "descricao" value="<%=noticia.getDescricao()%>">
  </div>
  
  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Salvar</button>
    <a href="noticiacon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>