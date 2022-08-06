package com.educacaointeligente.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.educacaointeligente.Enum.Ano;
import com.educacaointeligente.Enum.Turno;
import com.educacaointeligente.dao.AlunoDao;
import com.educacaointeligente.dao.EscolaDao;
import com.educacaointeligente.dao.TurmaDao;
import com.educacaointeligente.dao.UsuarioDao;
import com.educacaointeligente.model.Aluno;

@WebServlet("/ControllerAluno")

public class ControllerAluno extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("action").equals("del")) {
	    	int AlunoId = Integer.parseInt(request.getParameter("AlunoID"));
	    	AlunoDao alunoDao = new AlunoDao();
	    	Aluno delAluno = alunoDao.get(AlunoId);
	    	alunoDao.delete(delAluno);
	    	response.sendRedirect("alunocon.jsp?");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AlunoDao alunoDao=  new AlunoDao();
		int idAluno=0;
		
		if(!(request.getParameter("AlunoID")==null)) {
			
			idAluno = Integer.parseInt(request.getParameter("AlunoID"));
           
			Aluno aluno = alunoDao.get(idAluno);
            
			aluno.setMatricula(Integer.parseInt(request.getParameter("matricula")));
			aluno.setNome(request.getParameter("nome"));
			aluno.setNomeMae(request.getParameter("nomemae"));
			aluno.setTelefone(request.getParameter("telefone"));
			aluno.setEndereco(request.getParameter("endereco"));
			aluno.setTurno(Turno.valueOf(request.getParameter("turno")));
			aluno.setAno(Ano.valueOf(request.getParameter("ano")));
			
			UsuarioDao usuarioDao = new UsuarioDao();
			aluno.setUsuario(usuarioDao.get(Integer.parseInt(request.getParameter("usuarioID"))));
			
			TurmaDao turmaDao = new TurmaDao();
			aluno.setTurma(turmaDao.get(Integer.parseInt(request.getParameter("turmaID"))));
			
			EscolaDao escolaDao = new EscolaDao();
			aluno.setEscola(escolaDao.get(Integer.parseInt(request.getParameter("escolaID"))));
			
			alunoDao.update(aluno);
		}
		else 
		{	
			Aluno aluno = new Aluno();
			
			aluno.setMatricula(Integer.parseInt(request.getParameter("matricula")));
			aluno.setNome(request.getParameter("nome"));
			aluno.setNomeMae(request.getParameter("nomemae"));
			aluno.setTelefone(request.getParameter("telefone"));
			aluno.setEndereco(request.getParameter("endereco"));
			aluno.setTurno(Turno.valueOf(request.getParameter("turno")));
			aluno.setAno(Ano.valueOf(request.getParameter("ano")));
			
			UsuarioDao usuarioDao = new UsuarioDao();
			aluno.setUsuario(usuarioDao.get(Integer.parseInt(request.getParameter("usuarioID"))));
			
			TurmaDao turmaDao = new TurmaDao();
			aluno.setTurma(turmaDao.get(Integer.parseInt(request.getParameter("turmaID"))));
			
			EscolaDao escolaDao = new EscolaDao();
			aluno.setEscola(escolaDao.get(Integer.parseInt(request.getParameter("escolaID"))));
						
			alunoDao.save(aluno);	
		}
		response.sendRedirect("alunocon.jsp?");
	}
}
