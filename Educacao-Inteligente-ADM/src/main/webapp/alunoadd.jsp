<%@page import="com.educacaointeligente.Enum.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adicionar Novo Aluno</title>
</head>
<body>
  <form action="ControllerAluno" method="post">
 <label>Matricula</label>
 <input type="text" name= matricula>
 </br>
 <label>Nome</label>
 <input type="text" name= nome>
 </br>
 <label>Nome da M�e</label>
 <input type="text" name= nomemae>
 </br>
  <label>Telefone</label>
 <input type="text" name= telefone>
 </br>
  <label>Endere�o</label>
 <input type="text" name= endereco>
 </br>
  <label>Turma</label>
 <input type="text" name= turma>
 </br>
 <select name="turno" id="Turno">
  <option value="<%=Turno.Matutino.name()%>">Matutino</option>
  <option value="<%=Turno.Vespertino.name()%>">Vespertino</option>
  <option value="<%=Turno.Noturno.name()%>">Noturno</option>
</select>
 </br>
 <select name="ano" id="Ano">
  <option value="<%=Ano.primeiro.name()%>">1� ano</option>
  <option value="<%=Ano.segundo.name()%>">2� ano</option>
  <option value="<%=Ano.terceiro.name()%>">3� ano</option>
  <option value="<%=Ano.quarto.name()%>">4� ano</option>
  <option value="<%=Ano.quinto.name()%>">5� ano</option>
  <option value="<%=Ano.sexto.name()%>">6� ano</option>
  <option value="<%=Ano.setimo.name()%>">7� ano</option>
  <option value="<%=Ano.oitavo.name()%>">8� ano</option>
  <option value="<%=Ano.nono.name()%>">9� ano</option>
</select>
 <input type="submit" value="Salvar">
 </form>
</body>
</html>