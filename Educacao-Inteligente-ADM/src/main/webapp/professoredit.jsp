<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.model.Professor"%>
<%@page import="com.educacaointeligente.dao.ProfessorDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>

<% int ProfessorID = Integer.parseInt(request.getParameter("ProfessorID"));
   ProfessorDao professorDao = new ProfessorDao();
   Professor professor = professorDao.get(ProfessorID);
 %>
<form action="ControllerProfessor" method="post">

 <input type="hidden" name="ProfessorID" value=<%=ProfessorID %>>
 
 <label>Nome</label>
 <input type="text" name= nome value=<%=professor.getNome()%>>
 </br>
 
 <label>Endere�o</label>
 <input type="text" name= endereco value=<%=professor.getEndereco()%>>
 </br>
 
 <label>Telefone</label>
 <input type="text" name= telefone value=<%=professor.getTelefone()%>>
 </br>
 
  <label>Email</label>
 <input type="email" name= email value=<%=professor.getEmail()%>>
 </br
 
 <label>Forma��o</label>
 <input type="text" name= formacao value=<%=professor.getFormacao()%>>
 </br>
 
 <input type="submit" value="Salvar">
 </form>
</body>
</html>