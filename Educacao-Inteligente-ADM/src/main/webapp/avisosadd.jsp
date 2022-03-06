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
<title>Adicionar Novo Aviso</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

  <form action="ControllerAvisos" method="post">
 <label>Descrição</label>
 <input type="text" name= descricao>
 </br>
 <label>Data de Entrega</label>
 <input type="date" name= dataentrega>
 </br>
<%
TurmaDao turmadao = new TurmaDao(); 
List<Turma>ListaTurma = turmadao.getAll();
%>
</br>
<select name="turma" id="Turma">
<%
  for(Turma T:ListaTurma){
%>
  <option value="<%=T.getIdTurma()%>"><%=T.getNome()%></option>
<%} %>
</select>
</br>
<%
ProfessorDao professordao = new ProfessorDao(); 
List<Professor>ListaProfessor = professordao.getAll();
%>
</br>
<select name="professor" id="Professor">
<%
  for(Professor P:ListaProfessor){
%>
  <option value="<%=P.getIdprofessor()%>"><%=P.getNome()%></option>
<%} %>
</select>
</br>
<%
DisciplinaDao disciplinadao = new DisciplinaDao(); 
List<Disciplina>ListaDisciplina = disciplinadao.getAll();
%>
</br>
<select name="disciplina" id="Disciplina">
<%
  for(Disciplina D:ListaDisciplina){
%>
  <option value="<%=D.getIddisciplina()%>"><%=D.getNome()%></option>
<%} %>
</select>
</br>
 <input type="submit" value="Salvar">
 </form>
</body>
</html>