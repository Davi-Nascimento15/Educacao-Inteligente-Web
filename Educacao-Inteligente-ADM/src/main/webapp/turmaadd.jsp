<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@page import="com.educacaointeligente.model.Escola"%>
<%@page import="com.educacaointeligente.dao.EscolaDao"%>
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
 <%
DisciplinaDao disciplinadao = new DisciplinaDao(); 
List<Disciplina>Lista = disciplinadao.getAll();
%>
</br>
<select name="disciplina" id="Disciplina">
<%
  for(Disciplina D:Lista){
%>
  <option value="<%=D.getIddisciplina()%>"><%=D.getNome()%></option>
<%} %>
</select>
</br>

<%
EscolaDao escoladao = new EscolaDao(); 
List<Escola>ListaEscola = escoladao.getAll();
%>
</br>
<select name="escolaID" id="Escola">
<%
  for(Escola E:ListaEscola){
%>
  <option value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
<%} %>
</select>
</br>

 <input type="submit" value="Salvar">
 </form>

</body>
</html>