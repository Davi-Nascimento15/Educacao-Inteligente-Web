<%@page import="com.educacaointeligente.model.Presenca"%>
<%@page import="com.educacaointeligente.dao.PresencaDao"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"><link rel="stylesheet" href="Style.css" type="text/css">

<title>Faltas Cadastrados</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp"); 
   }
%>
     <%
	  PresencaDao daoPresenca = new PresencaDao();
      List<Presenca> ListadePresenca = daoPresenca.getAll();
	%>
<div class="card cabecario">
  <div class="card-header">
      <h1 class="cabecario">Faltas</h1>
   </div>
</div>
	
	<%
	if(!ListadePresenca.isEmpty()){
	%>
	<table class="table">
		<thead>
			<tr>
			    <th scope="col">Falta</th>
				<th scope="col">Data</th>
				<th scope="col">Aluno</th>
				
				<!-- bug N�O MEXA -->
				<th scope="col">  </th>
			</tr>
		</thead>
		<tbody>
		<% for(Presenca P:ListadePresenca){ %>
			<tr>
			  <td><%= P.isFalta()%></td>
			  <td><%= P.getData()%></td>
			  <td><%= P.getAluno().getNome()%></td>
			  <td>
			      <a class="btn btn-danger" href="<%= request.getContextPath() %>/ControllerPresenca?action=del&PresencaID=<%=P.getIdPresenca()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%}else{%>
	<p>N�o h� faltas cadastradas</p>
	<%}%>
	<div class="col-lg-12" style="text-align: left;">
	  <a class="btn btn-secondary" style="width: 5%" href="home.jsp">Home</a>
	  <a class="btn btn-primary" style="width: 10%" href="presencaadd.jsp">Novo</a>
	</div>
</body>
</html>