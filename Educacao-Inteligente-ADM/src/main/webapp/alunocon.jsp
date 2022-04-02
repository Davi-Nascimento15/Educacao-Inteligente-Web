<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Aluno"%>
<%@page import="com.educacaointeligente.dao.AlunoDao"%>
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

<title>Alunos</title>
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
            	<h1 class="cabecario pl-5">Alunos </h1> 		
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
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Alunos </li>
  </ol>
</nav>


<div class="col-lg-12 mb-3">
	 <a class="btn btn-primary ml-2" style="width: 10%" href="alunoadd.jsp">Novo</a>

	 <form action="alunocon.jsp" method="post">
	 <input name="pesquisa" type="text">
	 <button type="submit">Pesquisar</button>
	 </form>

</div>

<%
	  AlunoDao daoAluno = new AlunoDao();
      List<Aluno> ListadeAlunos;  
%>

<%if(request.getParameter("pesquisa")!=null)
	ListadeAlunos = daoAluno.getAllNome(request.getParameter("pesquisa"));
else
	ListadeAlunos = daoAluno.getAll();
%>

	<%
	if(!ListadeAlunos.isEmpty()){
	%>
<div class="mx-4">
	<table class="table">
		<thead class="thead-dark">
			<tr>
			    <th scope="col">Matr�cula</th>
				<th scope="col">Nome</th>
				<th scope="col">Nome da M�e</th>
				<th scope="col">Telefone</th>
				<th scope="col">Endere�o</th>
				<th scope="col">Turno</th>
				<th scope="col">Ano</th>
				<th scope="col">Turma</th>
				<th scope="col">Respons�vel</th>
				
				<!-- bug N�O MEXA -->
				<th scope="col">  </th>
			</tr>
		</thead>
		<tbody>
		<% for(Aluno A:ListadeAlunos){ %>
			<tr>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= A.getMatricula() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= A.getNome() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= A.getNomeMae() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= A.getTelefone() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= A.getEndereco() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= A.getTurno() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= A.getAno() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= A.getTurma().getNome()%></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= A.getUsuario().getNome()%></td>
			  
			  <td> <a class="btn btn-secondary btn-sm" href="alunoedit.jsp?AlunoID=<%=A.getIdaluno()%>">Editar</a>
			       <a class="btn btn-danger btn-sm" href="<%= request.getContextPath() %>/ControllerAluno?action=del&AlunoID=<%=A.getIdaluno()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>	
	<%}else{%>
	<p>N�o h� alunos cadastrados</p>
	<%}%>
</body>
</html>