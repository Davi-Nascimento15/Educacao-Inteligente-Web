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
	<a href="presencaadd.jsp">Nova Falta</a>
	
	<%
	if(!ListadePresenca.isEmpty()){
	%>
	<table>
		<thead>
			<tr>
			    <th>Falta</th>
				<th>Data</th>
				<th>Aluno</th>
			</tr>
		</thead>
		<tbody>
		<% for(Presenca P:ListadePresenca){ %>
			<tr>
			  <td><%= P.isFalta()%></td>
			  <td><%= P.getData()%></td>
			  <td><%= P.getAluno().getNome()%></td>
			  <td>
			      <a href="<%= request.getContextPath() %>/ControllerPresenca?action=del&PresencaID=<%=P.getIdPresenca()%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%}else{%>
	<p>Não há faltas cadastradas</p>
	<%}%>
</body>
</html>