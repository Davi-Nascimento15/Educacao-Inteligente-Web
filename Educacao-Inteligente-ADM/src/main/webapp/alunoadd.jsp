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
<title>Adicionar Novo Aluno</title>
</head>
<body>
  <form action="ControllerAluno" method="post">
 <label>Matricula</label>
 <input type="text" name= matricula>
 </br>
 <label>Nome</label>
 <input type="text" name= nome>
 </br>
 <label>Nome da Mãe</label>
 <input type="text" name= nomemae>
 </br>
  <label>Telefone</label>
 <input type="text" name= telefone>
 </br>
  <label>Endereço</label>
 <input type="text" name= endereco>
 </br>

 <select name="turno" id="Turno">
  <option value="<%=Turno.Matutino.name()%>">Matutino</option>
  <option value="<%=Turno.Vespertino.name()%>">Vespertino</option>
  <option value="<%=Turno.Noturno.name()%>">Noturno</option>
</select>
 </br>
 <select name="ano" id="Ano">
  <option value="<%=Ano.primeiro.name()%>">1º ano </option>
  <option value="<%=Ano.segundo.name()%>">2º ano</option>
  <option value="<%=Ano.terceiro.name()%>">3º ano</option>
  <option value="<%=Ano.quarto.name()%>">4º ano</option>
  <option value="<%=Ano.quinto.name()%>">5º ano</option>
  <option value="<%=Ano.sexto.name()%>">6º ano</option>
  <option value="<%=Ano.setimo.name()%>">7º ano</option>
  <option value="<%=Ano.oitavo.name()%>">8º ano</option>
  <option value="<%=Ano.nono.name()%>">9º ano</option>
</select>

<%
UsuarioDao usuariodao = new UsuarioDao(); 
List<Usuario>ListaUsuario = usuariodao.getAll();
%>
</br>
<select name="usuarioID" id="Usuario">
<%
  for(Usuario U:ListaUsuario){
%>
  <option value="<%=U.getIdusuario()%>"><%=U.getNome()%></option>
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