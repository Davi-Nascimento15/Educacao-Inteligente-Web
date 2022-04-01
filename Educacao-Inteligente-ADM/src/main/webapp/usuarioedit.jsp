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
<title>Editar Usuário</title>
</head>
<body>
<% 
   Usuario user = (Usuario)session.getAttribute("usuario");
   if(user==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<div class="card cabecario">
  <div class="card-header">
      <h1 class="cabecario">Editar Usuário</h1>
   </div>
</div>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="home.jsp"> Home </a> </li>
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="usuariocon.jsp"> Usuarios </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Editar Usuario </li>
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

  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Salvar</button>
    <a href="usuariocon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
 </form>
</body>
</html>