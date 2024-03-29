package com.educacaointeligente.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.educacaointeligente.dao.DisciplinaDao;
import com.educacaointeligente.dao.EscolaDao;
import com.educacaointeligente.dao.TurmaDao;
import com.educacaointeligente.model.Disciplina;
import com.educacaointeligente.model.Turma;

@WebServlet("/ControllerTurma")

public class ControllerTurma extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("action").equals("del")) {
	    	int TurmaId = Integer.parseInt(request.getParameter("TurmaID"));
	    	TurmaDao turmaDao = new TurmaDao();
	    	Turma delTurma = turmaDao.get(TurmaId);
	    	turmaDao.delete(delTurma);
	    	response.sendRedirect("turmacon.jsp?");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		TurmaDao turmaDao=  new TurmaDao();
		int idTurma=0;
		 
		if(!(request.getParameter("TurmaID")==null)) {
			
			idTurma = Integer.parseInt(request.getParameter("TurmaID"));
			Turma turma = turmaDao.get(idTurma);
			turma.setAno(Integer.parseInt(request.getParameter("ano")));
			turma.setNome(request.getParameter("nome"));
			
			DisciplinaDao disciplinaDao = new DisciplinaDao();
			List<Disciplina> disciplinas = disciplinaDao.getAll();
			List<Disciplina> disciplinaTurma = new ArrayList<Disciplina>();
			for(Disciplina D: disciplinas) {
				String Aux= D.getNome(); 
				if(!(request.getParameter(Aux)==null)){
					if(request.getParameter(Aux).equals(Integer.toString(D.getIddisciplina()))){
						disciplinaTurma.add(D);
					}
				}
			}
			turma.setListadisciplina(disciplinaTurma);
			
			EscolaDao escolaDao = new EscolaDao();
			turma.setEscola(escolaDao.get(Integer.parseInt(request.getParameter("escolaID"))));
			
			turmaDao.update(turma);
				
		}else 
		{	
			Turma turma = new Turma();
			
			turma.setAno(Integer.parseInt(request.getParameter("ano")));
			turma.setNome(request.getParameter("nome"));
			
			DisciplinaDao disciplinaDao = new DisciplinaDao();
			List<Disciplina> disciplinas = disciplinaDao.getAll();
			List<Disciplina> disciplinaTurma = new ArrayList<Disciplina>();
			for(Disciplina D: disciplinas) {
				String Aux= D.getNome();
				if(!(request.getParameter(Aux)==null)){
					if(request.getParameter(Aux).equals(Integer.toString(D.getIddisciplina()))){
						disciplinaTurma.add(D);
					}
				}
			}
			turma.setListadisciplina(disciplinaTurma);
			EscolaDao escolaDao = new EscolaDao();
			turma.setEscola(escolaDao.get(Integer.parseInt(request.getParameter("escolaID"))));
			
			turmaDao.save(turma);	
		}
		response.sendRedirect("turmacon.jsp?");
	}
}
