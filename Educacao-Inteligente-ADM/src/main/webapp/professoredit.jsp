<%@page import="com.educacaointeligente.model.Professor"%>
<%@page import="com.educacaointeligente.dao.ProfessorDao"%>
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
<% int ProfessorID = Integer.parseInt(request.getParameter("ProfessorID"));
   ProfessorDao professorDao = new ProfessorDao();
   Professor professor = professorDao.get(ProfessorID);
 %>
<form action="ControllerProfessor" method="post">

 <input type="hidden" name="ProfessorID" value=<%=ProfessorID %>>
 
 <label>Nome</label>
 <input type="text" name= nome value=<%=professor.getNome()%>>
 </br>
 
 <label>Endereço</label>
 <input type="text" name= endereco value=<%=professor.getEndereco()%>>
 </br>
 
 <label>Telefone</label>
 <input type="text" name= telefone value=<%=professor.getTelefone()%>>
 </br>
 
 <label>Formação</label>
 <input type="text" name= formacao value=<%=professor.getFormacao()%>>
 </br>
 
 <input type="submit" value="Salvar">
 </form>
</body>
</html>