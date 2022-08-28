<%@page import="com.educacaointeligente.model.Escola"%>
<%@page import="com.educacaointeligente.dao.EscolaDao"%>
<%@page import="com.google.protobuf.TextFormat.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.educacaointeligente.Enum.TipoData"%>
<%@page import="java.util.List"%>
<%@page import="com.educacaointeligente.model.DiaLetivo"%>
<%@page import="com.educacaointeligente.dao.DiaLetivoDao"%>
<%@page import="com.educacaointeligente.model.Usuario"%>
<%@page import="com.educacaointeligente.Enum.TipoUsuario"%>
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

<!-- Modal -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<title>Editar ano letivo</title>
</head>
<body>
<% 
   Usuario usuario = (Usuario)session.getAttribute("usuario");
   if(usuario==null){
	   response.sendRedirect("Login.jsp");
   }
%>
<nav class="navbar navbar-expand-lg barra">
    <div class="container">
        <div class="row col-md-12 pl-5 justify-content-md-center">
          <div class="col-md-auto">
            <ul class="nav mr-auto">
            	<h1 class="cabecario pl-5"> Editar Ano Letivo </h1> 		
            </ul>
          </div>
        </div>  
      </div>
      
        <form class="d-flex pl-5">
        	<a href="logout.jsp"> <img src="Sair.png" width="45" height="45"> </a>   
      	</form>
</nav>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="home.jsp"> Home </a> </li>
    <li class="breadcrumb-item" aria-current="page"> <a style="font-style:italic" href="dialetivocon.jsp"> Anos Letivos </a> </li>
    <li class="breadcrumb-item active" aria-current="page" style="font-style:italic"> Editar </li>
  </ol>
</nav>

<% int DiaLetivoAno = Integer.parseInt(request.getParameter("Ano"));
   DiaLetivoDao diaLetivoDao =new DiaLetivoDao();
   List<DiaLetivo> diaLetivo = diaLetivoDao.getAllWhereAno(DiaLetivoAno);
   String inicioPrimeiro="";
   String inicioSegundo="";
   String finalPrimeiro="";
   String finalsegundo="";
   int c=0;
   
	SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
	
	Date data = new Date();
	
   for(DiaLetivo D:diaLetivo){
	   if(D.getTipo()==TipoData.letivo && c==0){
		   inicioPrimeiro=D.getData();
		   c++;
	   }
	   if(D.getTipo()==TipoData.ferias && c==1){
		   Calendar c1 = Calendar.getInstance();
			data = formato.parse(D.getData());
			c1.setTime(data);
		    c1.add(Calendar.DATE, -1);
		    data = c1.getTime();
		    finalPrimeiro = formato.format(data);
		    c++;
	   }
	   if(D.getTipo()==TipoData.letivo && c==2){
		   inicioSegundo=D.getData();
		   c++;
	   }
	   if(D.getTipo()==TipoData.ferias && c==3){
		   Calendar c1 = Calendar.getInstance();
			 data = formato.parse(D.getData());
			c1.setTime(data);
		    c1.add(Calendar.DATE, -1);
		    data = c1.getTime();
		    finalsegundo = formato.format(data);
		    c++;
	   }
   }
 %>
 <form action="ControllerDiaLetivo" method="post">
  <input type="hidden" name="AnoDiaLetivo" value="<%=request.getParameter("Ano") %>">
  <div class="form-group row col-md-3 offset-md-1 pt-5">
    <label>Ano Letivo</label>
    <input type="number" class="form-control" aria-describedby="Ano" placeholder="Insira o ano" name= "ano" value="<%=request.getParameter("Ano")%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Inicio Primeiro Semestre</label>
    <input type="date" class="form-control" aria-describedby="Inicio Primeiro Semestre" placeholder="Data Inicio 1º Semetre" name= "datainicioprimeirosemestre" value="<%=inicioPrimeiro%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Final Primeiro Semestre</label>
    <input type="date" class="form-control" aria-describedby="Final Primeiro Semestre" placeholder="Data Final 1º Semetre" name= "datafinalprimeirosemestre" value="<%=finalPrimeiro%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Inicio Segundo Semestre</label>
    <input type="date" class="form-control" aria-describedby="Inicio Segundo Semestre" placeholder="Data Inicio 1º Semetre" name= "datainiciosegundosemestre" value="<%=inicioSegundo%>">
  </div>
  
  <div class="form-group row col-md-3 offset-md-1">
    <label >Final Segundo Semestre</label>
    <input type="date" class="form-control" aria-describedby="Final Segundo Semestre" placeholder="Data Final 1º Semetre" name= "datafinalsegundosemestre" value="<%=finalsegundo%>">
  </div>
  
  <%
EscolaDao escoladao = new EscolaDao(); 
List<Escola>ListaEscola = escoladao.getAll();
%>

<%if(usuario.getTipo().name().equals("SuperUsuario")){ %>
  <div class="row form-select col-md-3 offset-md-1 pt-3">
   <label>Escola</label>
   	<select name="EscolaID" id="Escola" class="form-control">
	<%
  		for(Escola E:ListaEscola){
  			if(E.getIdEscola()== diaLetivo.get(0).getEscola().getIdEscola()){
	%>
  			<option selected value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}else{%>
		<option value="<%=E.getIdEscola()%>"><%=E.getNome()%></option>
	<%}
  	} %>  	
	</select>
  </div>
<%}else{ %>
   <input type="hidden" name="EscolaID" value="<%=usuario.getEscola().getIdEscola()%>">
<%}%>
  <div class="col-md-3 offset-md-1 pt-4 pb-5">
  	<button type="submit" class="btn btn-primary ">Salvar</button>
    <a href="anoletivocon.jsp" class="btn btn-danger">Cancelar</a>
  </div>
  
</form>
</body>
</html>