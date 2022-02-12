<%@page import="com.educacaointeligente.Enum.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adicionar Nova Turma</title>
</head>
<body>
  <form action="ControllerTurma" method="post">
 <label>Nome:</label>
 <input type="text" name= nome>
 </br>
 <label>Ano:</label>
<input type="number" name= ano>
 </br>
 <input type="submit" value="Salvar">
 </form>
</body>
</html>