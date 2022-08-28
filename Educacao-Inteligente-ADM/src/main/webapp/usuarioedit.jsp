<%@page import="com.educacaointeligente.dao.EscolaDao"%>
<%@page import="com.educacaointeligente.model.Escola"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.Enum.TipoUsuario"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="Style.css" type="text/css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Modal -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
<title>Editar Usuário</title>
</head>
<body>
<% 
   Usuario user = (Usuario)session.getAttribute("usuario");
   if(user==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Editar Usuário </h1> 		
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
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="usuariocon.jsp"> Usuarios </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Editar </li>
  </ol>
</nav>

<% int UsuarioID = Integer.parseInt(request.getParameter("UsuarioID"));
   UsuarioDao usuarioDao =new UsuarioDao();
   Usuario usuario = usuarioDao.get(UsuarioID);
 %>
<form action="ControllerUsuario" method="post">
  	<input type="hidden" name="UsuarioID" value="<%=UsuarioID %>">
  	
  	<div class="form-group row col-md-3 offset-md-1 pt-5">
      <label>Matrícula</label>
    	<input type="number" class="form-control" aria-describedby="Matricula" placeholder="Insira a matrícula" name= "matricula" value="<%=usuario.getIdmatricula()%>">
    </div>
    
    <div class="form-group row col-md-3 offset-md-1">
      <label >Nome</label>
       <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= "nome" value="<%=usuario.getNome()%>">
    </div>
    
    <div class="form-group row col-md-3 offset-md-1">
      <label>Senha</label>
      <input type="password" class="form-control"  placeholder="Insira a senha" name= "senha" value="<%=usuario.getSenha()%>">
    </div> 

<%
   List<TipoUsuario>Tipoadd = Arrays.asList(TipoUsuario.values());
%>
  
  <div class="row form-select col-md-3 offset-md-1">
   <label>Tipo</label>
   	<select  name="Tipo" id="tipo" class="form-control">
   	<%for (int i = 0; i < Tipoadd.size(); i++){
   	   		if(Tipoadd.get(i).name().equals(usuario.getTipo().name())){%>
  				<option selected value="<%=Tipoadd.get(i).name()%>"><%=Tipoadd.get(i).name()%></option>
		<%}else{%>
 	    	<option value="<%=Tipoadd.get(i).name()%>"><%=Tipoadd.get(i).name()%></option>
     	<%}	
   		}%>     
   	</select>
	</div>
	
<%
EscolaDao escoladao = new EscolaDao(); 
List<Escola>ListaEscola = escoladao.getAll();
%>

<%if(user.getTipo().name().equals("SuperUsuario")){ %>
  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Escola</label>
   	<select  name="escolaID" id="Escola" class="form-control">
	<%
  	for(Escola E:ListaEscola){
  		if(E.getIdEscola()==usuario.getEscola().getIdEscola()){
	%>
  		<option selected value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}else{ %>
		<option value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}
   } %> 
 	</select>
  </div>
<%}else{ %>
   <input type="hidden" name="escolaID" value="<%=usuario.getEscola().getIdEscola()%>">
<%}%>
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
  	<button type="submit" class="btn btn-primary ">Salvar</button>
    <a href="usuariocon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
 </form>
</body>
</html>