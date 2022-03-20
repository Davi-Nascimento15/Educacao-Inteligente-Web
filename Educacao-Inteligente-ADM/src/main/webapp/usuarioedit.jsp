<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.Enum.TipoUsuario"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="Style.css" type="text/css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Editar Usu�rio</title>
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
      <h1 class="cabecario">Editar Usu�rio</h1>
   </div>
</div>

<% int UsuarioID = Integer.parseInt(request.getParameter("UsuarioID"));
   UsuarioDao usuarioDao =new UsuarioDao();
   Usuario usuario = usuarioDao.get(UsuarioID);
 %>
<form action="ControllerUsuario" method="post">
  	<input type="hidden" name="UsuarioID" value=<%=UsuarioID %>>
  	
  	<div class="form-group row col-md-3 offset-md-1 pt-5">
      <label>Matr�cula</label>
    	<input type="number" class="form-control" aria-describedby="Matricula" placeholder="Insira a matr�cula" name= matricula value=<%=usuario.getIdmatricula()%>>
    </div>
    
    <div class="form-group row col-md-3 offset-md-1">
      <label >Nome</label>
       <input type="text" class="form-control" aria-describedby="Nome" placeholder="Insira o nome" name= nome value=<%=usuario.getNome()%>>
    </div>
    
    <div class="form-group row col-md-3 offset-md-1">
      <label>Senha</label>
      <input type="password" class="form-control"  placeholder="Insira a senha" name= senha value=<%=usuario.getSenha()%>>
    </div> 
  
  <div class="row form-select col-md-3 offset-md-1">
   <label>Tipo</label>
   	<select  name="Tipo" id="tipo" class="form-control">
    	<option class="form-select-option" value="<%=TipoUsuario.Admin.name()%>">Administrador</option>
  		<option class="form-select-option" value="<%=TipoUsuario.User.name()%>">Usu�rio</option>
  		<option class="form-select-option" value="<%=TipoUsuario.Prof.name()%>">Professor</option>
  	</select>
  </div>
  
  <div class="col-md-3 offset-md-1 pt-4">
  	<button type="submit" class="btn btn-primary ">Salvar</button>
    <a href="usuariocon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
 </form>
</body>
</html>