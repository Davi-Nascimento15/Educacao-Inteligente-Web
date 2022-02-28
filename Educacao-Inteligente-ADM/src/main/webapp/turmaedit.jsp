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
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
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