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
 <input type="submit" value="Salvar">
 </form>
</body>
</html>