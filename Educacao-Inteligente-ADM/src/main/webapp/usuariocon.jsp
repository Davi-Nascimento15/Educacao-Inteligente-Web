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
   Usuario sessao = (Usuario)session.getAttribute("usuario");
   if(sessao==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<div class="card cabecario">
  <div class="card-header">
      <h1 class="cabecario">Usuários</h1>
   </div>
</div>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="home.jsp"> Home </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Usuarios </li>
  </ol>
</nav>


<div class="col-lg-12 mb-3">
	 <a class="btn btn-primary ml-2" style="width: 10%" href="usuarioadd.jsp">Novo</a>
</div>

     <%
	  UsuarioDao daoUsuario = new UsuarioDao();
      List<Usuario> ListadeUsuarios = daoUsuario.getAll();
	%>
	
	<%
	if(!ListadeUsuarios.isEmpty()){
	%>
	
<div class="mx-4">
	<table class="table">
		<thead class="thead-dark">
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
		<%if(U.getTipo().name().equals("SuperUsuario")&&(sessao.getTipo().name().equals("SuperUsuario"))){%>
			<tr>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= U.getIdmatricula()%>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= U.getNome() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= U.getSenha() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= U.getTipo() %></td>
				<td>
			  	  <a class="btn btn-secondary" href="usuarioedit.jsp?UsuarioID=<%=U.getIdmatricula()%>">Editar</a>
			      <a class="btn btn-danger" href="<%= request.getContextPath() %>/ControllerUsuario?action=del&UsuarioID=<%=U.getIdmatricula()%>">Excluir</a>
			  </td>
			</tr>
			<%}else if(!U.getTipo().name().equals("SuperUsuario")){ %>
			<tr>
			  <td><%= U.getIdmatricula()%>
			  <td><%= U.getNome() %></td>
			  <td><%= U.getSenha() %></td>
			  <td><%= U.getTipo() %></td>
				<td>
			  	  <a class="btn btn-secondary btn-sm" href="usuarioedit.jsp?UsuarioID=<%=U.getIdmatricula()%>">Editar</a>
			      <a class="btn btn-danger btn-sm" href="<%= request.getContextPath() %>/ControllerUsuario?action=del&UsuarioID=<%=U.getIdmatricula()%>">Excluir</a>
			  </td>
			</tr>
			<%} %>
		<%} %>
		</tbody>
	</table>
</div>

	<%}else{%>
	<p>Não há usuarios cadastrados</p>
	<%}%>
</body>
</html>