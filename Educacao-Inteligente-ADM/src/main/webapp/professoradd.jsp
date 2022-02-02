<%@page import="com.educacaointeligente.Enum.TipoUsuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adicionar Novo Professor</title>
</head>
<body>
  <form action="ControllerUsuario" method="post">
 <label>Nome</label>
 <input type="text" name= nome>
 </br>
 
 <label>Endereço</label>
 <input type="text" name= endereco>
 </br>

 <label>Telefone</label>
 <input type="text" name= telefone>
 </br>
 
 <label>Formacao</label>
 <input type="text" name= formacao>
 </br>
 
 <input type="submit" value="Salvar">
 </form>
</body>
</html>