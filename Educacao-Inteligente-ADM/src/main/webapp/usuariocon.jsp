<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"><link rel="stylesheet" href="Style.css" type="text/css">


<title> Usuários</title>
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
      <h1 class="cabecario">Usuários</h1>
   </div>
</div>
     <%
	  UsuarioDao daoUsuario = new UsuarioDao();
      List<Usuario> ListadeUsuarios = daoUsuario.getAll();
	%>
	
	<%
	if(!ListadeUsuarios.isEmpty()){
	%>
	<table class="table">
		<thead>
			<tr>
												   
				<th scope="col">Matrícula</th>
				<th scope="col">Nome</th>
				<th scope="col">Senha</th>
				<th scope="col">Tipo</th>
				
				<!-- bug NÃO MEXA -->
				<th scope="col">  </th>
			</tr>
		</thead>
		<tbody>
		<% for(Usuario U:ListadeUsuarios){ %>
			<tr>
			  <td><%= U.getIdmatricula()%>
			  <td><%= U.getNome() %></td>
			  <td><%= U.getSenha() %></td>
			  <td><%= U.getTipo() %></td>
				<td>
			  	  <a class="btn btn-secondary" href="usuarioedit.jsp?UsuarioID=<%=U.getIdmatricula()%>">Editar</a>
			      <a class="btn btn-danger" href="<%= request.getContextPath() %>/ControllerUsuario?action=del&UsuarioID=<%=U.getIdmatricula()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	
	<div class="col-lg-12" style="text-align: left;">
	  <a class="btn btn-secondary" style="width: 5%" href="home.jsp">Home</a>
	  <a class="btn btn-primary" style="width: 10%" href="usuarioadd.jsp">Novo</a>
	</div>

	<%}else{%>
	<p>Não há usuarios cadastrados</p>
	<%}%>
</body>
</html>