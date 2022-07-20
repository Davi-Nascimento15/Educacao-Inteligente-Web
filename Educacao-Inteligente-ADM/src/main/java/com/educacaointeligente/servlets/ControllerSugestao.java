package com.educacaointeligente.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.educacaointeligente.dao.SugestaoDao;
import com.educacaointeligente.model.Sugestao;

@WebServlet({"/ControllerSugestao","/controllersugestao"})
public class ControllerSugestao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllerSugestao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("action").equals("del")) {
	    	String SugestaoId = (request.getParameter("SugestaoID"));
	    	SugestaoDao sugestaoDao = new SugestaoDao();
	    	Sugestao delSugestao = sugestaoDao.getString(SugestaoId);
	    	sugestaoDao.delete(delSugestao);
	    	response.sendRedirect("sugestaocon.jsp?id="+request.getParameter("id")+"");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
