package com.educacaointeligente.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.educacaointeligente.Enum.Bimestre;
import com.educacaointeligente.dao.AlunoDao;
import com.educacaointeligente.dao.DisciplinaDao;
import com.educacaointeligente.dao.NotaDao;
import com.educacaointeligente.model.Nota;

@WebServlet({"/ControllerNota","/controllernota"})
public class ControllerNota extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public ControllerNota() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("action").equals("del")) {
	    	int NotaId = Integer.parseInt(request.getParameter("NotaID"));
	    	
	    	NotaDao notaDao = new NotaDao();
	    	Nota delNota = notaDao.get(NotaId);
	    	notaDao.delete(delNota);
	    	response.sendRedirect("notacon.jsp?");
	}
}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NotaDao notaDao = new NotaDao();
		int idNota=0;
		
		if(!(request.getParameter("NotaID")==null)) {
			
			idNota = Integer.parseInt(request.getParameter("NotaID"));
           
			Nota nota = notaDao.get(idNota);
            
			nota.setNota((Float.parseFloat(request.getParameter("nota"))));
			nota.setAnoLetivo(Integer.parseInt(request.getParameter("anoletivo")));
			nota.setBimestre(Bimestre.valueOf(request.getParameter("bimestre")));
			
			AlunoDao alunoDao = new AlunoDao();
			nota.setAluno(alunoDao.get(Integer.parseInt(request.getParameter("alunoID"))));;
			
			DisciplinaDao disciplinaDao = new DisciplinaDao();
			nota.setDisciplina(disciplinaDao.get(Integer.parseInt(request.getParameter("disciplinaID"))));;
			
			notaDao.update(nota);						
				
		}else 
		{

			Nota nota = new Nota();
			
			nota.setNota((Float.parseFloat(request.getParameter("nota"))));
			nota.setAnoLetivo(Integer.parseInt(request.getParameter("anoletivo")));
			nota.setBimestre(Bimestre.valueOf(request.getParameter("bimestre")));
			
			AlunoDao alunoDao = new AlunoDao();
			nota.setAluno(alunoDao.get(Integer.parseInt(request.getParameter("alunoID"))));;
			
			DisciplinaDao disciplinaDao = new DisciplinaDao();
			nota.setDisciplina(disciplinaDao.get(Integer.parseInt(request.getParameter("disciplinaID"))));;
						
			notaDao.save(nota);	
		}
		
		response.sendRedirect("notacon.jsp?");
	}
}
