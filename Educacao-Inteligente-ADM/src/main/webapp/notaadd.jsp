<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.educacaointeligente.model.Aluno"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@page import="com.educacaointeligente.dao.AlunoDao"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adicionar Nova Nota</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

<form action="ControllerNota" method="post">

<%
AlunoDao alunodao = new AlunoDao(); 
List<Aluno>ListaAluno = alunodao.getAll();
%>
</br>
<select name="alunoID" id="Aluno">
<%
  for(Aluno A:ListaAluno){
%>
  <option value="<%=A.getIdaluno()%>"><%=A.getNome()%></option>
<%} %>
</select>
</br>

<%
DisciplinaDao disciplinadao = new DisciplinaDao(); 
List<Disciplina>ListaDisciplina = disciplinadao.getAll();
%>
</br>
<select name="disciplinaID" id="Disciplina">
<%
  for(Disciplina D:ListaDisciplina){
%>
  <option value="<%=D.getIddisciplina()%>"><%=D.getNome()%></option>
<%} %>
</select>
</br>

 <label>Nota</label>
 <input type="text" name=nota>
 </br>
 <label>Ano Letivo</label>
 <input type="text" name= anoletivo>
 </br>

 <select name="bimestre" id="Bimestre">
  <option value="<%=Bimestre.Bimestre_01.name()%>">1° Bimestre</option>
  <option value="<%=Bimestre.Bimestre_02.name()%>">2° Bimestre</option>

 <input type="submit" value="Salvar">
 </form>
</body>
</html>