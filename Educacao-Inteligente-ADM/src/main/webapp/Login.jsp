<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="Style.css" type="text/css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Login</title>
</head>
<body>
<div class="sidenav">
         <div class="login-main-text">
            <h2>Educação Inteligente<br></h2>
            <img class="img" src="Luz.png" alt="some text" width=200 height=200 >
            <p class="text">Insira a matrícula e a senha fornecida pelo administrador para entrar</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form action="Login.jsp" method="post"> 
                  <div class="form-group"> 
                     <label>Matrícula</label>
                     <input type="number" class="form-control" placeholder="Matricula" name="Matricula">
                  </div>
                  <div class="form-group">
                     <label>Senha</label>
                     <input type="password" class="form-control" placeholder="Senha" name="Senha">
                  </div>
                  <button type="submit" class="btn btn-black">Entrar</button>
               </form>
            </div>
         </div>
      </div>
<%  
int auxMatricula=0;

if(request.getParameter("Matricula")!=null){
auxMatricula = Integer.parseInt(request.getParameter("Matricula"));
}
String auxSenha = request.getParameter("Senha");

UsuarioDao usuarioDao = new UsuarioDao();
Usuario usuario = usuarioDao.get(auxMatricula);
	if(auxMatricula!=0 && auxSenha!=null && usuario!=null && usuario.getSenha().equals(auxSenha))
	{
		session.setAttribute("usuario", usuario);
		response.sendRedirect("home.jsp");
	}	
%>
</body>
</html> 