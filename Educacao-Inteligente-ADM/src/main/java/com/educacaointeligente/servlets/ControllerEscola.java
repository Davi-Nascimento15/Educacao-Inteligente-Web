package com.educacaointeligente.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.educacaointeligente.dao.EscolaDao;
import com.educacaointeligente.model.Escola;

@WebServlet("/ControllerEscola")

public class ControllerEscola extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("action").equals("del")) {
	    	int EscolaId = Integer.parseInt(request.getParameter("EscolaID"));
	    	EscolaDao escolaDao = new EscolaDao();
	    	Escola delAluno = escolaDao.get(EscolaId);
	    	escolaDao.delete(delAluno);
	    	response.sendRedirect("escolacon.jsp?");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		EscolaDao escolaDao=  new EscolaDao();
		int idEscola=0;
		
		if(!(request.getParameter("EscolaID")==null)) {
			
			idEscola = Integer.parseInt(request.getParameter("EscolaID"));
			Escola escola = escolaDao.get(idEscola);
			escola.setCnpj(request.getParameter("cnpj"));
			escola.setNome(request.getParameter("nome"));
			escola.setEmail(request.getParameter("email"));
			escola.setTelefone(request.getParameter("telefone"));
            escola.setEndereco(request.getParameter("endereco"));		
			escolaDao.update(escola);
				
		}else 
		{	
			Escola escola = new Escola();
			escola.setCnpj(request.getParameter("cnpj"));
			escola.setNome(request.getParameter("nome"));
			escola.setEmail(request.getParameter("email"));
			escola.setTelefone(request.getParameter("telefone"));
            escola.setEndereco(request.getParameter("endereco"));		
				
			escolaDao.save(escola);	
		}
		response.sendRedirect("escolacon.jsp?");
	}
}
