<%@page import="com.educacaointeligente.model.*"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@page import="com.educacaointeligente.dao.*"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Turma</title>
</head>
<body>
<% int TurmaID = Integer.parseInt(request.getParameter("TurmaID"));
   TurmaDao turmaDao = new TurmaDao();
   Turma turma = turmaDao.get(TurmaID);
 %>
<form action="ControllerTurma" method="post">
  <input type="hidden" name="TurmaID" value=<%=TurmaID %>>
 <label>Nome:</label>
 <input type="text" name= nome value=<%=turma.getNome()%>>
 </br>
 <label>Ano:</label>
 <input type="text" name= ano value=<%=turma.getAno()%>>
 </br>
 <input type="submit" value="Salvar">
</form>
</body>
</html>