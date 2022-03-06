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
<title>Editar Aviso</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

<% int AvisoID = Integer.parseInt(request.getParameter("AvisoID"));
   AvisosDao avisosDao =new AvisosDao();
   Avisos aviso = avisosDao.get(AvisoID);
 %>
<form action="ControllerAvisos" method="post">
  <input type="hidden" name="AvisoID" value=<%=AvisoID %>>
 <label>Descrição</label>
 <input type="text" name= nome value=<%=aviso.getDescricao()%>>
 </br> 
 <label>Data de Entrega</label>
 <input type="date" name= dataentrega value=<%=aviso.getDataEntrega()%>>
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