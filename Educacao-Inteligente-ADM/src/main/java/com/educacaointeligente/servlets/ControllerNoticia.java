package com.educacaointeligente.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.educacaointeligente.dao.EscolaDao;
import com.educacaointeligente.dao.NoticiaDao;
import com.educacaointeligente.model.Noticia;


@WebServlet("/ControllerNoticia")
public class ControllerNoticia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllerNoticia() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("action").equals("del")) {
	    	int NoticiaId = Integer.parseInt(request.getParameter("NoticiaID"));
	    	NoticiaDao noticiaDao = new NoticiaDao();
	    	Noticia delNoticia = noticiaDao.get(NoticiaId);
	    	noticiaDao.delete(delNoticia);
	    	response.sendRedirect("noticiacon.jsp?");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NoticiaDao noticiaDao = new NoticiaDao();
		int idNoticia=0;
		
		if(!(request.getParameter("NoticiaID")==null)) {
			
			idNoticia = Integer.parseInt(request.getParameter("NoticiaID"));
			Noticia noticia = noticiaDao.get(idNoticia);
			noticia.setTitulo(request.getParameter("titulo"));
			noticia.setDescricao(request.getParameter("descricao"));
			
			EscolaDao escolaDao = new EscolaDao();
			noticia.setEscola(escolaDao.get(Integer.parseInt(request.getParameter("escolaID"))));
			
			noticiaDao.update(noticia);
		}else 
		{	
			Noticia noticia = new Noticia();
			noticia.setTitulo(request.getParameter("titulo"));
			noticia.setDescricao(request.getParameter("descricao"));
			
			Date dataHoraAtual = new Date();
			String data = new SimpleDateFormat("dd/MM/yyyy").format(dataHoraAtual);
			noticia.setDataGeracao(data);
			
			EscolaDao escolaDao = new EscolaDao();
			noticia.setEscola(escolaDao.get(Integer.parseInt(request.getParameter("escolaID"))));
			
			noticiaDao.save(noticia);	
		}
		response.sendRedirect("noticiacon.jsp?");
	}
}
