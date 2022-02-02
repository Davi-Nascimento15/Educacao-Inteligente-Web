package com.educacaointeligente.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.educacaointeligente.dao.ProfessorDao;
import com.educacaointeligente.model.Professor;

@WebServlet({"/ControllerProfessor","/controllerprofessor"})
public class ControllerProfessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public ControllerProfessor() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("action").equals("del")) {
	    	int ProfessorId = Integer.parseInt(request.getParameter("ProfessorID"));
	    	ProfessorDao professorDao = new ProfessorDao();
	    	Professor delProfessor = professorDao.get(ProfessorId);
	    	professorDao.delete(delProfessor);
	    	response.sendRedirect("professorcon.jsp?");
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProfessorDao professorDao = new ProfessorDao();
		int idProfessor=0;
		
		if(!(request.getParameter("ProfessorID")==null)) {
			
			idProfessor = Integer.parseInt(request.getParameter("ProfessorID"));
           
			Professor professor = professorDao.get(idProfessor);
            
			professor.setNome(request.getParameter("nome"));
			professor.setFormacao(request.getParameter("formacao"));
			professor.setEndereco(request.getParameter("endereco"));
			professor.setTelefone(request.getParameter("telefone"));
						
			professorDao.update(professor);
				
		}else 
		{

			Professor professor = new Professor();
			professor.setNome(request.getParameter("nome"));
			professor.setFormacao(request.getParameter("formacao"));
			professor.setEndereco(request.getParameter("endereco"));
			professor.setTelefone(request.getParameter("telefone"));
						
			professorDao.save(professor);
		}
		
		response.sendRedirect("professorcon.jsp?");
}
	}
