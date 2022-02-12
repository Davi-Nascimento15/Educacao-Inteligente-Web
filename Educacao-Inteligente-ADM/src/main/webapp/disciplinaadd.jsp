<%@page import="com.educacaointeligente.model.Professor"%>
<%@page import="com.educacaointeligente.dao.ProfessorDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adicionar Nova Disciplina</title>
</head>
<body>
  <form action="ControllerDisciplina" method="post">
 <label>Nome</label>
 <input type="text" name= nome>
 </br>
  <label>Descrição </label>
 <input type="text" name= descricao>
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