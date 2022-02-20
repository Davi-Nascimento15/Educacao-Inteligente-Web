package com.educacaointeligente.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.educacaointeligente.dao.DisciplinaDao;
import com.educacaointeligente.dao.ProfessorDao;
import com.educacaointeligente.model.Disciplina;

@WebServlet({"/ControllerDisciplina","/controllerdisciplina"})
public class ControllerDisciplina extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public ControllerDisciplina() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("action").equals("del")) {
	    	int DisciplinaId = Integer.parseInt(request.getParameter("DisciplinaID"));
	    	DisciplinaDao disciplinaDao = new DisciplinaDao();
	    	Disciplina delDisciplina = disciplinaDao.get(DisciplinaId);
	    	disciplinaDao.delete(delDisciplina);
	    	response.sendRedirect("disciplinacon.jsp?");
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DisciplinaDao disciplinaDao = new DisciplinaDao();
		int idDisciplina=0;
		
		if(!(request.getParameter("DisciplinaID")==null)) {
			
			idDisciplina = Integer.parseInt(request.getParameter("DisciplinaID"));
           
			Disciplina disciplina = disciplinaDao.get(idDisciplina);
            
			disciplina.setNome(request.getParameter("nome"));
			disciplina.setDescricao(request.getParameter("descricao"));
			
			ProfessorDao professorDao = new ProfessorDao();
			disciplina.setProfessor(professorDao.get(Integer.parseInt(request.getParameter("professorID"))));
			
			disciplinaDao.update(disciplina);						
				
		}else 
		{

			Disciplina disciplina = new Disciplina();
			disciplina.setNome(request.getParameter("nome"));
			disciplina.setDescricao(request.getParameter("descricao"));
			
			ProfessorDao professorDao = new ProfessorDao();
			disciplina.setProfessor(professorDao.get(Integer.parseInt(request.getParameter("professorID"))));
			
			disciplinaDao.save(disciplina);
		}
		
		response.sendRedirect("disciplinacon.jsp?");
	}
}
