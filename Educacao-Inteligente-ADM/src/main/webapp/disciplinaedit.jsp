<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="com.educacaointeligente.model.Professor"%>
<%@page import="com.educacaointeligente.dao.ProfessorDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

<% int DisciplinaID = Integer.parseInt(request.getParameter("DisciplinaID"));
   DisciplinaDao disciplinaDao = new DisciplinaDao();
   Disciplina disciplina = disciplinaDao.get(DisciplinaID);
%>
<form action="ControllerDisciplina" method="post">

 <input type="hidden" name="DisciplinaID" value=<%=DisciplinaID %>>
 
 <label>Nome</label>
 	<input type="text" name=nome value=<%=disciplina.getNome() %>>
 </br>
 
  <label>Descrição</label>
 	<input type="text" name=descricao value=<%=disciplina.getDescricao() %>>
 </br>

<%
ProfessorDao professordao = new ProfessorDao(); 
List<Professor>ListaProfessor = professordao.getAll();
%>
</br>
<select name="professorID" id="Professor">
<%
  for(Professor P:ListaProfessor){
%>
  <option value="<%=P.getIdprofessor()%>"><%=P.getNome()%></option>
<%} %>
</select>
</br>

 <input type="submit" value="Salvar">
 
</form>
</body>
</html>