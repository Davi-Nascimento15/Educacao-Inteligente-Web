package com.educacaointeligente.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.educacaointeligente.Enum.TipoAviso;
import com.educacaointeligente.dao.AvisosDao;
import com.educacaointeligente.dao.DisciplinaDao;
import com.educacaointeligente.dao.ProfessorDao;
import com.educacaointeligente.dao.TurmaDao;
import com.educacaointeligente.model.Avisos;
import com.educacaointeligente.model.Disciplina;
import com.educacaointeligente.model.Professor;
import com.educacaointeligente.model.Turma;

@WebServlet({"/ControllerAvisos","/controlleravisos"})
public class ControllerAvisos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public ControllerAvisos() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("action").equals("del")) {
	    	int AvisoId = Integer.parseInt(request.getParameter("AvisoID"));
	    	AvisosDao avisosDao = new AvisosDao();
	    	Avisos delAvisos = avisosDao.get(AvisoId);
	    	avisosDao.delete(delAvisos);
	    	response.sendRedirect("avisoscon.jsp?");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AvisosDao avisosDao = new AvisosDao();
		int idAviso=0;
		
		if(!(request.getParameter("AvisoID")==null)) {
			
			idAviso = Integer.parseInt(request.getParameter("AvisoID"));
           
			Avisos aviso = avisosDao.get(idAviso);
            
			aviso.setDescricao(request.getParameter("descricao"));
			Date dataHoraAtual = new Date();
			String data = new SimpleDateFormat("dd/MM/yyyy").format(dataHoraAtual);
			aviso.setDataGeracao(data);
			
			aviso.setDataEntrega(request.getParameter("dataentrega"));
			aviso.setTipoaviso(TipoAviso.valueOf(request.getParameter("tipo")));
			TurmaDao turmaDao = new TurmaDao();
			Turma turma = turmaDao.get(Integer.parseInt(request.getParameter("turma")));
			aviso.setTurma(turma);
			
			ProfessorDao professorDao = new ProfessorDao();
			Professor professor = professorDao.get(Integer.parseInt(request.getParameter("professor")));
			aviso.setProfessor(professor);
			
			DisciplinaDao disciplinaDao = new DisciplinaDao();
			Disciplina disciplina = disciplinaDao.get(Integer.parseInt(request.getParameter("disciplina")));
			aviso.setDisciplina(disciplina);
			
			avisosDao.update(aviso);
				
		}else 
		{
			Avisos aviso = new Avisos();
			
			aviso.setDescricao(request.getParameter("descricao"));
			Date dataHoraAtual = new Date();
			String data = new SimpleDateFormat("dd/MM/yyyy").format(dataHoraAtual);
			aviso.setDataGeracao(data);
			
			aviso.setDataEntrega(request.getParameter("dataentrega"));
			aviso.setTipoaviso(TipoAviso.valueOf(request.getParameter("tipo")));
			TurmaDao turmaDao = new TurmaDao();
			Turma turma = turmaDao.get(Integer.parseInt(request.getParameter("turma")));
			aviso.setTurma(turma);
			
			ProfessorDao professorDao = new ProfessorDao();
			Professor professor = professorDao.get(Integer.parseInt(request.getParameter("professor")));
			aviso.setProfessor(professor);
			
			DisciplinaDao disciplinaDao = new DisciplinaDao();
			Disciplina disciplina = disciplinaDao.get(Integer.parseInt(request.getParameter("disciplina")));
			aviso.setDisciplina(disciplina);
						
			avisosDao.save(aviso);
		}
		
		response.sendRedirect("avisoscon.jsp?");
	}
}
