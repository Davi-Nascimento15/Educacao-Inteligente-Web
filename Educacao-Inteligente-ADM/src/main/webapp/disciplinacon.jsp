<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="java.util.List"%>
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

<title>Disciplina Cadastrados</title>
</head>
<body>

<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Disciplinas </h1> 		
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
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Disciplinas </li>
  </ol>
</nav>


<div class="col-lg-12 mb-3">
	 <a class="btn btn-primary ml-2" style="width: 10%" href="disciplinaadd.jsp">Novo</a>
</div>

     <%
	  DisciplinaDao daoDisciplina = new DisciplinaDao();
      List<Disciplina>ListadeDisciplina = daoDisciplina.getAll();
      int EscolaID = usuario.getEscola().getIdEscola(); 
	%>
<%if(request.getParameter("pesquisa")!=null && request.getParameter("pesquisa")!="")
	//ListadeDisciplina = daoDisciplina.getAllNome(request.getParameter("pesquisa"));

    if(usuario.getTipo().name().equals("SuperUsuario")){
		ListadeDisciplina = daoDisciplina.getAll();
  	}
  	else{
		ListadeDisciplina = daoDisciplina.getAllWhereEscola(EscolaID);
}    
%>
	<%
	if(!ListadeDisciplina.isEmpty()){
	%>
	
<div class="mx-4">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th  scope="col">Nome</th>
				<th scope="col">Descrição</th>
				<th scope="col">Professor</th>
				
				<!-- bug NÃO MEXA -->
				<th scope="col">  </th>
				
			</tr>
		</thead>
		<tbody>
		<% for(Disciplina D:ListadeDisciplina){ %>
			<tr>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= D.getNome() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= D.getDescricao() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= D.getProfessor().getNome() %></td>
			  <td><a class="btn btn-secondary btn-sm" href="disciplinaedit.jsp?DisciplinaID=<%=D.getIddisciplina()%>">Editar</a>
			      <a class="btn btn-danger btn-sm" href="<%= request.getContextPath() %>/ControllerDisciplina?action=del&DisciplinaID=<%=D.getIddisciplina()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>
	
	<%}else{%>
	<p>Não há disciplinas cadastradas</p>
	<%}%>
</body>
</html>