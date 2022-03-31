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
<title>Editar Aluno</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

<% int PresencaID = Integer.parseInt(request.getParameter("PresencaID"));
   PresencaDao presencaDao = new PresencaDao();
   Presenca presenca = presencaDao.get(PresencaID);
 %>
<form action="ControllerPresenca" method="post">
  <input type="hidden" name="PresencaID" value="<%=PresencaID %>">
 <label>Falta</label>
 <input type="checkbox" name= falta value="<%=presenca.isFalta()%>">
 </br>
 
 <label>Data</label>
 <input type="date" name= data value="<%=presenca.getData()%>">
 </br>
<%
AlunoDao alunodao = new AlunoDao(); 
List<Aluno>ListaAluno = alunodao.getAll();
%>
</br>
<select name="aluno" id="Aluno">
<%
  for(Aluno A:ListaAluno){
	  if(A.getIdaluno()==presenca.getAluno().getIdaluno()){
%>
  <option selected value="<%=A.getIdaluno()%>"><%=A.getNome()%></option>
<%}else{ %>
  <option value="<%=A.getIdaluno()%>"><%=A.getNome()%></option>
<%  }
  } %>
</select>
</br>
<input type="submit" value="Salvar">
</form>
</body>
</html>