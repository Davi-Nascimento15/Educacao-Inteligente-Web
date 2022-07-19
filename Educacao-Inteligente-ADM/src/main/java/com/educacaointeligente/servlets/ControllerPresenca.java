package com.educacaointeligente.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.type.CharacterArrayClobType;

import com.educacaointeligente.dao.AlunoDao;
import com.educacaointeligente.dao.PresencaDao;
import com.educacaointeligente.model.Presenca;

@WebServlet("/ControllerPresenca")

public class ControllerPresenca extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("action").equals("del")) {
	    	int PresencaId = Integer.parseInt(request.getParameter("PresencaID"));
	    	PresencaDao presencaDao = new PresencaDao();
	    	Presenca delPresenca = presencaDao.get(PresencaId);
	    	presencaDao.delete(delPresenca);
	    	response.sendRedirect("presencacon.jsp?");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PresencaDao presencaDao=  new PresencaDao();
		int idPresenca=0;
		
		if(!(request.getParameter("PresencaID")==null)) {
			
			idPresenca = Integer.parseInt(request.getParameter("PresencaID"));
           
			Presenca presenca = presencaDao.get(idPresenca);
			presenca.setFalta(request.getParameter("falta").toString().charAt(0));
			presenca.setData(request.getParameter("data"));
			
			AlunoDao alunoDao = new AlunoDao();
			presenca.setAluno(alunoDao.get(Integer.parseInt(request.getParameter("aluno"))));
	
			presencaDao.update(presenca);
				
		}else 
		{	
			Presenca presenca = new Presenca();
			if(request.getParameter("falta").equals("V"))
		    	presenca.setFalta('1');
		    else
		    	presenca.setFalta('0');
		    presenca.setData(request.getParameter("data"));
			
			AlunoDao alunoDao = new AlunoDao();
			presenca.setAluno(alunoDao.get(Integer.parseInt(request.getParameter("aluno"))));
						
			presencaDao.save(presenca);	
		}
		response.sendRedirect("presencacon.jsp?");
	}
}
