<%@page import="java.util.ArrayList"%>
<%@page import="com.educacaointeligente.model.Professor"%>
<%@page import="com.educacaointeligente.dao.ProfessorDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.educacaointeligente.model.Aluno"%>
<%@page import="com.educacaointeligente.model.Nota"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@page import="com.educacaointeligente.dao.AlunoDao"%>
<%@page import="com.educacaointeligente.dao.NotaDao"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="com.educacaointeligente.Enum.*"%>
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

<!-- Modal -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<title>Adicionar Nova Nota</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }else{
   
   ProfessorDao professordao = new ProfessorDao();
   Professor professorID = new Professor();
   
   if(usuario.getTipo().name().equals("Professor")){ 
	   professorID = professordao.getAllUsuarioProfessor(usuario.getIdmatricula());
    }
   
   DisciplinaDao disciplinadao = new DisciplinaDao(); 
   List<Disciplina>ListaDisciplina = new ArrayList<Disciplina>();
   if(usuario.getTipo().name().equals("SuperUsuario")){
	 	ListaDisciplina = disciplinadao.getAll();
   }
   else if(usuario.getTipo().name().equals("Professor")){
	   ListaDisciplina = disciplinadao.getAllWhereProfessor(professorID.getIdprofessor());
   }else{
	   ListaDisciplina = disciplinadao.getAllWhereEscola(usuario.getEscola().getIdEscola());
   }
   
	NotaDao daoNota = new NotaDao();
	List<Nota> ListaNotas = new ArrayList<Nota>();
   	if(usuario.getTipo().name().equals("Professor")){
	 ListaNotas = daoNota.getAllWhereNota(ListaDisciplina);
	}else if(usuario.getTipo().name().equals("Administrador")){
	 ListaNotas = daoNota.getAllWhereNota(ListaDisciplina);
	}else{
	 ListaNotas = daoNota.getAll();
	}
%>

<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Notas </h1> 		
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
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Notas </li>
  </ol>
</nav>
	
<div class="col-lg-12 mb-3">
	 <a class="btn btn-primary ml-2" style="width: 10%" href="notaadd.jsp">Nova</a>
</div>

	<%
	if(!ListaNotas.isEmpty()){
	%>
<div class="mx-4">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Aluno</th>
				<th scope="col">Disciplina</th>
				<th scope="col">Bimestre</th>
				<th scope="col">Nota</th>
				<th scope="col">Turma</th>
				<th scope="col">Ano</th>
				
				<!-- bug NÃO MEXA -->
				<th scope="col">  </th>
			</tr>
		</thead>
		<tbody>
		<% for(Nota N:ListaNotas){ %>
			<tr>
			<td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= N.getAluno().getNome()%></td>
			<td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= N.getDisciplina().getNome()%></td>
			<td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= N.getBimestre()%></td>
			<td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= N.getNota()%></td>
			<td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= N.getAluno().getTurma().getNome()%></td>
			<td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= N.getAnoLetivo()%></td>
			  <td><a class="btn btn-secondary btn-sm" href="notaedit.jsp?NotaID=<%=N.getIdNota()%>">Editar</a>
			      <a class="btn btn-danger btn-sm" href="<%= request.getContextPath() %>/ControllerNota?action=del&NotaID=<%=N.getIdNota()%>">Excluir</a>
			  </td>
			</tr> 
		<%} %>
		</tbody>
	</table>
</div>
	
	<%}else{%>
	<p>Não há notas cadastradas!</p>
	<%}}%>

</body>
</html>