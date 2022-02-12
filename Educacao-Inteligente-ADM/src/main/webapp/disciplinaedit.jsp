<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
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
  
 <input type="submit" value="Salvar">
 
</form>
</body>
</html>