package com.educacaointeligente.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.educacaointeligente.Enum.TipoUsuario;
import com.educacaointeligente.dao.UsuarioDao;
import com.educacaointeligente.model.Usuario;


@WebServlet({"/ControllerUsuario","/controllerusuario"})
public class ControllerUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControllerUsuario() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	if(request.getParameter("action").equals("del")) {
	    	int UsuarioId = Integer.parseInt(request.getParameter("UsuarioID"));
	    	UsuarioDao usuarioDao = new UsuarioDao();
	    	Usuario delUsuario = usuarioDao.get(UsuarioId);
	    	usuarioDao.delete(delUsuario);
	    	response.sendRedirect("usuariocon.jsp?id="+request.getParameter("id")+"");
	}
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UsuarioDao usuarioDao=  new UsuarioDao();
		int idUsuario=0;
		
		if(!(request.getParameter("UsuarioID")==null)) {
			
			idUsuario = Integer.parseInt(request.getParameter("UsuarioID"));
           
			Usuario usuario = usuarioDao.get(idUsuario);
            
			usuario.setNome(request.getParameter("nome"));
			usuario.setSenha(request.getParameter("senha"));
			usuario.setTipo(TipoUsuario.valueOf(request.getParameter("Tipo")));
			
			usuarioDao.update(usuario);
				
		}else 
		{

			Usuario usuario = new Usuario();
			usuario.setNome(request.getParameter("nome"));
			usuario.setSenha(request.getParameter("senha"));
			usuario.setTipo(TipoUsuario.valueOf(request.getParameter("Tipo")));
						
			usuarioDao.save(usuario);	
		}
		response.sendRedirect("usuariocon.jsp?id="+request.getParameter("user")+"");
}
}
