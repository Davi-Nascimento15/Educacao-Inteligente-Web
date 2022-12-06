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
	
<title>Editar Notícia</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }else{
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
            	<h1 class="cabecario pl-5"> Editar Notícia </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="noticiacon.jsp"> Notícias </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Editar </li>
  </ol>
</nav>

<form action="ControllerNoticia" method="post">

  <input type="hidden" name="NoticiaID" value="<%=NoticiaID %>">

  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Título</label>
    <input type="text" class="form-control" aria-describedby="Titulo" placeholder="Insira o titulo" name= "titulo" maxlength="255" value="<%=noticia.getTitulo()%>" required>
  </div>
  
  <div class="form-group row col-md-8 offset-md-1 pt-3">
    <label for="exampleFormControlTextarea1">Descrição</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" name= "descricao" maxlength="2048" required> <%=noticia.getDescricao()%> </textarea>
  </div> 
  
<%
EscolaDao escoladao = new EscolaDao(); 
List<Escola>ListaEscola = escoladao.getAll();
%>

<%if(usuario.getTipo().name().equals("SuperUsuario")){ %>
  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Escola</label>
   	<select name="escolaID" id="Escola" class="form-control">
<%
  		for(Escola E:ListaEscola){
  			if(E.getIdEscola()==noticia.getEscola().getIdEscola()){
	%>
  			<option selected value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}else{%>
		<option value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}
}%>  	
	</select>
  </div>
<%}else{ %>
   <input type="hidden" name="escolaID" value="<%=usuario.getEscola().getIdEscola()%>">
<%}%>  
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
  	<button type="submit" class="btn btn-primary ">Salvar</button>
    <a href="noticiacon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
<%} %>
</form>
</body>
</html>