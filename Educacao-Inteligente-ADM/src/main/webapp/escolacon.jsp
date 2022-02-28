<%@page import="com.educacaointeligente.model.*"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Escolas Cadastradas</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

     <%
	  EscolaDao daoEscola = new EscolaDao();
      List<Escola> ListadeEscolas = daoEscola.getAll();
	%>
	<a href="escolaadd.jsp">Nova Escola</a>
	
	<%
	if(!ListadeEscolas.isEmpty()){
	%>
	<table>
		<thead>
			<tr>
			    <th>CNPJ</th>
				<th>Nome</th>
				<th>Endereço</th>
				<th>Telefone</th>
				<th>E-mail</th>
			</tr>
		</thead>
		<tbody>
		<% for(Escola E:ListadeEscolas){ %>
			<tr>
			  <td><%= E.getCnpj() %></td>
			  <td><%= E.getNome() %></td>
			  <td><%= E.getEndereco() %></td>
			  <td><%= E.getTelefone() %></td>
			  <td><%= E.getEmail() %></td>
			  <td><a href="escolaedit.jsp?EscolaID=<%=E.getIdEscola()%>">Editar</a>
			      <a href="<%= request.getContextPath() %>/ControllerEscola?action=del&EscolaID=<%=E.getIdEscola()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%}else{%>
	<p>Não há escolas cadastradas!</p>
	<%}%>
</body>
</html>