<%@page import="com.educacaointeligente.model.*"%>
<%@page import="com.educacaointeligente.Enum.*"%>
<%@page import="com.educacaointeligente.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Falta</title>
</head>
<body>
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="home.jsp"> Home </a> </li>
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="presencacon.jsp"> Faltas </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Editar </li>
  </ol>
</nav>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
   
   ProfessorDao professordao = new ProfessorDao();
   Professor professorID = new Professor();
   
   if(usuario.getTipo().name().equals("Professor")){ 
	   professorID = professordao.getAllUsuarioProfessor(usuario.getIdmatricula());
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
DisciplinaDao disciplinadao = new DisciplinaDao(); 
List<Disciplina>ListaDisciplina = new ArrayList<Disciplina>();
    		
if(usuario.getTipo().name().equals("SuperUsuario")){
	ListaDisciplina = disciplinadao.getAll();
}
else if(usuario.getTipo().name().equals("Professor")){
	ListaDisciplina = disciplinadao.getAllWhereProfessor(professorID.getIdprofessor());
}else{
	ListaDisciplina = disciplinadao.getAllWhereEscola(usuario.getEscola().getIdEscola());
}

AlunoDao alunodao = new AlunoDao(); 
List<Aluno>ListaAluno = new ArrayList <Aluno>();
if(usuario.getTipo().name().equals("Professor")){
	ListaAluno = alunodao.getAllWhereTurma(ListaDisciplina, usuario.getEscola().getIdEscola(), professorID.getIdprofessor());
}else if(usuario.getTipo().name().equals("Administrador")){
	ListaAluno= alunodao.getAllEscola(usuario.getEscola().getIdEscola());
}else{
	ListaAluno = alunodao.getAll();
}
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
<%}
  }%>
</select>
</br>

<%
List<Professor> ListaProfessor = new ArrayList<Professor>();

if(usuario.getTipo().name().equals("SuperUsuario")){
	ListaProfessor = professordao.getAll();
}else if(usuario.getTipo().name().equals("Administrador")){
	ListaProfessor = professordao.getAllWhereEscola(usuario.getEscola().getIdEscola());
}
%>

<%if((usuario.getTipo().name().equals("Administrador"))||((usuario.getTipo().name().equals("SuperUsuario")))){ %>
  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Professor</label>
   	<select name="professor" id="Professor" class="form-control">
	<%
  		for(Professor P:ListaProfessor){
  			if(P.getIdprofessor()==presenca.getProfessor().getIdprofessor()){
	%>
  			<option value="<%=P.getIdprofessor()%>"><%=P.getNome()%></option>
			<%}%>
	<%}%>
	</select>
  </div>
<%}else{%>
   <input type="hidden" name="professor" value="<%=professorID%>">
<%}%>


<input type="submit" value="Salvar">
</form>
</body>
</html>