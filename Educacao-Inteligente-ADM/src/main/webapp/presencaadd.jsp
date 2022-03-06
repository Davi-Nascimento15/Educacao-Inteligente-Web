<%@page import="com.educacaointeligente.model.Aluno"%>
<%@page import="com.educacaointeligente.dao.AlunoDao"%>
<%@page import="com.educacaointeligente.model.Disciplina"%>
<%@page import="com.educacaointeligente.dao.DisciplinaDao"%>
<%@page import="com.educacaointeligente.model.Professor"%>
<%@page import="com.educacaointeligente.dao.ProfessorDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Turma"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@page import="com.educacaointeligente.dao.TurmaDao"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adicionar Nova Falta</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

  <form action="ControllerPresenca" method="post">
 <label>Falta</label>
 <input type="checkbox" name= falta value=true>
 </br>
 <label>Data</label>
 <input type="date" name= data>
 </br>
<%
AlunoDao alunodao = new AlunoDao(); 
List<Aluno>ListaAluno = alunodao.getAll();
%>
</br>
<select name="aluno" id="Aluno">
<%
  for(Aluno A:ListaAluno){
%>
  <option value="<%=A.getIdaluno()%>"><%=A.getNome()%></option>
<%} %>
</select>
</br>
 <input type="submit" value="Salvar">
 </form>
</body>
</html>