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

<% int AlunoID = Integer.parseInt(request.getParameter("AlunoID"));
   AlunoDao alunoDao =new AlunoDao();
   Aluno aluno = alunoDao.get(AlunoID);
 %>
<form action="ControllerAluno" method="post">
  <input type="hidden" name="AlunoID" value=<%=AlunoID %>>
 <label>Nome</label>
 <input type="text" name= nome value=<%=aluno.getNome()%>>
 </br>
 
 <label>Matricula</label>
 <input type="text" name= matricula value=<%=aluno.getMatricula()%>>
 </br>

 <label>Nome da Mãe</label>
 <input type="text" name= nomemae value=<%=aluno.getNomeMae()%>>
 </br>
 
 <label>Telefone</label>
 <input type="text" name= telefone value=<%=aluno.getTelefone()%>>
 </br>
 
  <label>Endereço</label>
 <input type="text" name= endereco value=<%=aluno.getEndereco()%>>
 </br>
 
  <label>Turma</label>
 <input type="text" name= turma value=<%=aluno.getTurma()%>>
 </br>
 
 <select name="turno" id="Turno">
  <option value="<%=Turno.Matutino.name()%>">Matutino</option>
  <option value="<%=Turno.Vespertino.name()%>">Vespertino</option>
  <option value="<%=Turno.Noturno.name()%>">Noturno</option>
</select>
 </br>
 
 <select name="ano" id="Ano">
  <option value="<%=Ano.primeiro.name()%>">1º ano</option>
  <option value="<%=Ano.segundo.name()%>">2º ano</option>
  <option value="<%=Ano.terceiro.name()%>">3º ano</option>
  <option value="<%=Ano.quarto.name()%>">4º ano</option>
  <option value="<%=Ano.quinto.name()%>">5º ano</option>
  <option value="<%=Ano.sexto.name()%>">6º ano</option>
  <option value="<%=Ano.setimo.name()%>">7º ano</option>
  <option value="<%=Ano.oitavo.name()%>">8º ano</option>
  <option value="<%=Ano.nono.name()%>">9º ano</option>
</select>
</br>

<%
UsuarioDao usuariodao = new UsuarioDao(); 
List<Usuario>ListaUsuario = usuariodao.getAll();
%>
</br>
<select name="usuarioID" id="Usuario">
<%
  for(Usuario U:ListaUsuario){
%>
  <option value="<%=U.getIdmatricula()%>"><%=U.getNome()%></option>
<%} %>
</select>
</br>

<%
TurmaDao turmadao = new TurmaDao(); 
List<Turma>ListaTurma = turmadao.getAll();
%>
</br>
<select name="turmaID" id="Turma">
<%
  for(Turma T:ListaTurma){
%>
  <option value="<%=T.getIdTurma()%>"><%=T.getNome()%></option>
<%} %>
</select>
</br>

<input type="submit" value="Salvar">
</form>
</body>
</html>