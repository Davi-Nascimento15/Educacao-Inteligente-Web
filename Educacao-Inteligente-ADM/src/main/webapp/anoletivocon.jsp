<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.educacaointeligente.model.DiaLetivo"%>
<%@page import="com.educacaointeligente.dao.DiaLetivoDao"%>
<%@page import="com.educacaointeligente.model.Avisos"%>
<%@page import="com.educacaointeligente.dao.AvisosDao"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.mi//n.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"><link rel="stylesheet" href="Style.css" type="text/css">

<!-- Modal -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
<title>Anos letivos Cadastrados </title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }else{
%>

 <%
 Map<String, String> map = new HashMap<String, String>();
 DiaLetivoDao daodiaLetivo = new DiaLetivoDao();
 List<DiaLetivo> Listadeanoletivo;
 if(usuario.getTipo().name().equals("SuperUsuario")){
	 Listadeanoletivo = daodiaLetivo.getAll();
 }else{
	 Listadeanoletivo = daodiaLetivo.getAllWhereEscola(usuario.getEscola().getIdEscola());
}%>

<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5">Anos Letivos</h1> 		
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
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Anos Letivos </li>
  </ol>
</nav>


<div class="col-lg-12 mb-3">
	 <a class="btn btn-primary ml-2" style="width: 10%" href="dialetivoadd.jsp">Novo</a>
</div>
	
	<%
	if(!Listadeanoletivo.isEmpty()){
		
	%>
<div class="mx-4">
	<table class="table">
		<thead class="thead-dark">
			<tr>
			    <th scope="col">Ano</th>
				<th scope="col">Escola</th>
				<!-- bug NÃO MEXA -->
				<th scope="col">  </th>
			</tr>
		</thead>
		<tbody>
		<% for(DiaLetivo A:Listadeanoletivo){
			if(!map.containsKey(Integer.toString(A.getAno())+ A.getEscola().getNome())){
				map.put(Integer.toString(A.getAno())+ A.getEscola().getNome(),"");
			%>	
			<tr>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= A.getAno() %></td>
			  <td style="max-width: 18ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap"><%= A.getEscola().getNome() %></td>			  
			  <td><a class="btn btn-secondary btn-sm"  href="dialetivoedit.jsp?Ano=<%=A.getAno()%>">Editar</a>
			      <a class="btn btn-danger btn-sm"  href="<%= request.getContextPath() %>/ControllerDiaLetivo?action=del&AnoDiaLetivo=<%=A.getAno()%>&EscolaID=<%=A.getEscola().getIdEscola()%>">Excluir</a>
			  </td>
			</tr>
		<%} }%>
		</tbody>
	</table>
</div>

	<%}else{%>
	<p>Não há anos letivos cadastrados</p>
	<%}}%>
</body>
</html>