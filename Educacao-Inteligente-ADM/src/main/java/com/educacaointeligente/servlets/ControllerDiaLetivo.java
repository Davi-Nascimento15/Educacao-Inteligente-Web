package com.educacaointeligente.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.educacaointeligente.Enum.TipoData;
import com.educacaointeligente.dao.DiaLetivoDao;
import com.educacaointeligente.dao.EscolaDao;
import com.educacaointeligente.model.DiaLetivo;
import com.educacaointeligente.model.Escola;

@WebServlet({"/ControllerDiaLetivo","/controllerDiaLetivo"})
public class ControllerDiaLetivo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public ControllerDiaLetivo() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getParameter("action").equals("del")) {
	    	DiaLetivoDao diaLetivoDao = new DiaLetivoDao();
	    	List<DiaLetivo> listano = diaLetivoDao.getAllWhereAnoEscola(Integer.parseInt(request.getParameter("AnoDiaLetivo")),Integer.parseInt(request.getParameter("EscolaID")));
				for(DiaLetivo D:listano) {
				DiaLetivo delDiaLetivo = diaLetivoDao.get(D.getId());
				diaLetivoDao.delete(delDiaLetivo);
			}
			response.sendRedirect("anoletivocon.jsp?");
		}
	}

	
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    DiaLetivoDao diaLetivoDao = new DiaLetivoDao();
	    boolean y= false;
	    y = request.getParameter("ano")!=""?false:true;
	    y = request.getParameter("datainicioprimeirosemestre")!=null?false:true;
	    y = request.getParameter("datafinalprimeirosemestre")!=null?false:true;
	    y = request.getParameter("datainiciosegundosemestre")!=null?false:true;
	    y = request.getParameter("datafinalsegundosemestre")!=null?false:true;
	    
	    if(y==false)
	    {
  
	    SimpleDateFormat formata = new SimpleDateFormat("yyyy-MM-dd");
	    Date ini_primeiro = new Date();
	    try {
			ini_primeiro = formata.parse(request.getParameter("datainicioprimeirosemestre"));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
	    Date fin_primeiro = new Date();
	    try {
			fin_primeiro = formata.parse(request.getParameter("datafinalprimeirosemestre"));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
	    Date ini_segundo = new Date();
	    try {
	    	ini_segundo = formata.parse(request.getParameter("datainiciosegundosemestre"));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
	    Date fin_segundo = new Date();
	    try {
	    	fin_segundo = formata.parse(request.getParameter("datafinalsegundosemestre"));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		boolean x = false;
		
		if(ini_primeiro.after(fin_primeiro) || fin_primeiro.after(ini_segundo))
			x=true;
		if(ini_segundo.after(fin_segundo))
			x=true;
		
		Date zz= new Date();
		
		try {
			zz = formata.parse(request.getParameter("ano")+"-01-01/");
		} catch (ParseException e2) {
			e2.printStackTrace();
		}
		
		List<DiaLetivo> lista = diaLetivoDao.getAllWhereAnoEscola(Integer.parseInt(request.getParameter("ano")), Integer.parseInt(request.getParameter("EscolaID")));
  	    if(!lista.isEmpty()&& request.getParameter("AnoDiaLetivo")==null) 
  	    	x=true;
  	    
		if(ini_primeiro.getYear()!=zz.getYear())
			x = true;
		if(ini_segundo.getYear()!=zz.getYear())
			x = true;
		if(fin_primeiro.getYear()!=zz.getYear())
			x = true;
		if(fin_segundo.getYear()!=zz.getYear())
			x = true;
	
	    if(x==false) {
	    	
	      if(!(request.getParameter("AnoDiaLetivo")==null)) {  
	    	  
			List<DiaLetivo> listano = diaLetivoDao.getAllWhereAno(Integer.parseInt(request.getParameter("AnoDiaLetivo")));
			EscolaDao escoladao = new EscolaDao();
			Escola escola = escoladao.get(Integer.parseInt(request.getParameter("EscolaID")));
			for(DiaLetivo D:listano) {
				DiaLetivo delDiaLetivo = diaLetivoDao.get(D.getId());
				diaLetivoDao.delete(delDiaLetivo);
			}
			
			String datainicioprimeiro = request.getParameter("datainicioprimeirosemestre");
			String datafinalprimeiro =  request.getParameter("datafinalprimeirosemestre");
			String datainiciosegundo =  request.getParameter("datainiciosegundosemestre");
			String datafinalsegundo =  request.getParameter("datafinalsegundosemestre");
			
			SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
			
			Date inicioprimeiro = new Date();
			try {
				inicioprimeiro = formato.parse(datainicioprimeiro);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
			Date Aux= new Date();
			
			try {
				Aux = formato.parse(request.getParameter("ano")+"-01-01/");
			} catch (ParseException e2) {
				e2.printStackTrace();
			}
			
			while(Aux.before(inicioprimeiro)) {
				DiaLetivo diaLetivo;
				if(Feriados(request.getParameter("ano"), formato.format(Aux))==1){
					diaLetivo = new DiaLetivo(formato.format(Aux),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);	
				}else{
					diaLetivo = new DiaLetivo(formato.format(Aux),TipoData.ferias, Integer.parseInt(request.getParameter("ano")),escola);
				}
				diaLetivoDao.save(diaLetivo);
				Calendar c1 = Calendar.getInstance();
				c1.setTime(Aux);
			    c1.add(Calendar.DATE, 1);
			    Aux = c1.getTime();
			}
			
			Date finalprimeiro = new Date();
			
			try {
				finalprimeiro = formato.parse(datafinalprimeiro);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
			while(inicioprimeiro.before(finalprimeiro)) {
				if(inicioprimeiro.getDay()==0||inicioprimeiro.getDay()==6) {
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(inicioprimeiro),TipoData.finaldesemana, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}else if(Feriados(request.getParameter("ano"), formato.format(inicioprimeiro))==1){
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(inicioprimeiro),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}
				else {
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(inicioprimeiro),TipoData.letivo, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}
				Calendar c = Calendar.getInstance();
				c.setTime(inicioprimeiro);
			    c.add(Calendar.DATE, 1);
			    inicioprimeiro = c.getTime();
			}
			
			if(inicioprimeiro.getDay()==0||inicioprimeiro.getDay()==6) {
				DiaLetivo diaLetivoaux1 = new DiaLetivo(formato.format(inicioprimeiro),TipoData.finaldesemana, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux1);
			}else if(Feriados(request.getParameter("ano"), formato.format(inicioprimeiro))==1){
				DiaLetivo diaLetivoaux1 = new DiaLetivo(formato.format(inicioprimeiro),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux1);
			}
			else{
				DiaLetivo diaLetivoaux1 = new DiaLetivo(formato.format(inicioprimeiro),TipoData.letivo, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux1);
			}
			
			Calendar c = Calendar.getInstance();
			c.setTime(inicioprimeiro);
		    c.add(Calendar.DATE, 1);
		    inicioprimeiro = c.getTime();
			
			Date iniciosegundo = new Date();
			try {
				iniciosegundo = formato.parse(datainiciosegundo);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			while(inicioprimeiro.before(iniciosegundo)) {
				if(Feriados(request.getParameter("ano"), formato.format(inicioprimeiro))==1){
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(inicioprimeiro),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}else {
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(inicioprimeiro),TipoData.ferias, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}
				Calendar c1 = Calendar.getInstance();
				c1.setTime(inicioprimeiro);
			    c1.add(Calendar.DATE, 1);
			    inicioprimeiro = c1.getTime();
			}
			
			Date finalsegundo = new Date();
			try {
				finalsegundo = formato.parse(datafinalsegundo);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			while(iniciosegundo.before(finalsegundo)) {
				if(iniciosegundo.getDay()==0||iniciosegundo.getDay()==6) {
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(iniciosegundo),TipoData.finaldesemana, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}else if(Feriados(request.getParameter("ano"), formato.format(iniciosegundo))==1){
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(iniciosegundo),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}else{
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(iniciosegundo),TipoData.letivo, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);	
				}
				Calendar c1 = Calendar.getInstance();
			    c1.setTime(iniciosegundo);
			    c1.add(Calendar.DATE, 1);
			    iniciosegundo = c1.getTime();		    
			}
			
			if(iniciosegundo.getDay()==0||iniciosegundo.getDay()==6) {
				DiaLetivo diaLetivoaux2 = new DiaLetivo(formato.format(iniciosegundo),TipoData.finaldesemana, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux2);
			} else if(Feriados(request.getParameter("ano"), formato.format(iniciosegundo))==1){
				DiaLetivo diaLetivoaux2 = new DiaLetivo(formato.format(iniciosegundo),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux2);
			}else {
				DiaLetivo diaLetivoaux2 = new DiaLetivo(formato.format(iniciosegundo),TipoData.letivo, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux2);	
			}
			
			
			try {
				int Ano =Integer.parseInt(request.getParameter("ano"))+1;
				Aux = formato.parse(Ano+"-01-01");
			} catch (ParseException e2) {
				e2.printStackTrace();
			}
			
			Calendar c_aux = Calendar.getInstance();
			c_aux.setTime(finalsegundo);
		    c_aux.add(Calendar.DATE, 1);
		    finalsegundo = c_aux.getTime();
		    
			while(finalsegundo.before(Aux)) {
				if(Feriados(request.getParameter("ano"), formato.format(finalsegundo))==1){
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(finalsegundo),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}else {
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(finalsegundo),TipoData.ferias, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}
				Calendar c1 = Calendar.getInstance();
				c1.setTime(finalsegundo);
			    c1.add(Calendar.DATE, 1);
			    finalsegundo = c1.getTime();
			}
			
			}else {		
		
			String datainicioprimeiro = request.getParameter("datainicioprimeirosemestre");
			String datafinalprimeiro =  request.getParameter("datafinalprimeirosemestre");
			String datainiciosegundo =  request.getParameter("datainiciosegundosemestre");
			String datafinalsegundo =  request.getParameter("datafinalsegundosemestre");
			
			EscolaDao escoladao = new EscolaDao();
			Escola escola = escoladao.get(Integer.parseInt(request.getParameter("EscolaID")));
		
			SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
			
			Date inicioprimeiro = new Date();
			try {
				inicioprimeiro = formato.parse(datainicioprimeiro);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
			Date Aux= new Date();
			
			try {
				Aux = formato.parse(request.getParameter("ano")+"-01-01/");
			} catch (ParseException e2) {
				e2.printStackTrace();
			}
			
			while(Aux.before(inicioprimeiro)) {
				DiaLetivo diaLetivo;
				if(Feriados(request.getParameter("ano"), formato.format(Aux))==1){
					diaLetivo = new DiaLetivo(formato.format(Aux),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);	
				}else{
					diaLetivo = new DiaLetivo(formato.format(Aux),TipoData.ferias, Integer.parseInt(request.getParameter("ano")),escola);
				}
				diaLetivoDao.save(diaLetivo);
				Calendar c1 = Calendar.getInstance();
				c1.setTime(Aux);
			    c1.add(Calendar.DATE, 1);
			    Aux = c1.getTime();
			}
			
			Date finalprimeiro = new Date();
			
			try {
				finalprimeiro = formato.parse(datafinalprimeiro);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
			while(inicioprimeiro.before(finalprimeiro)) {
				if(inicioprimeiro.getDay()==0||inicioprimeiro.getDay()==6) {
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(inicioprimeiro),TipoData.finaldesemana, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}else if(Feriados(request.getParameter("ano"), formato.format(inicioprimeiro))==1){
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(inicioprimeiro),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}
				else {
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(inicioprimeiro),TipoData.letivo, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}
				Calendar c = Calendar.getInstance();
				c.setTime(inicioprimeiro);
			    c.add(Calendar.DATE, 1);
			    inicioprimeiro = c.getTime();
			}
			
			if(inicioprimeiro.getDay()==0||inicioprimeiro.getDay()==6) {
				DiaLetivo diaLetivoaux1 = new DiaLetivo(formato.format(inicioprimeiro),TipoData.finaldesemana, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux1);
			}else if(Feriados(request.getParameter("ano"), formato.format(inicioprimeiro))==1){
				DiaLetivo diaLetivoaux1 = new DiaLetivo(formato.format(inicioprimeiro),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux1);
			}
			else{
				DiaLetivo diaLetivoaux1 = new DiaLetivo(formato.format(inicioprimeiro),TipoData.letivo, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux1);
			}
			
			Calendar c = Calendar.getInstance();
			c.setTime(inicioprimeiro);
		    c.add(Calendar.DATE, 1);
		    inicioprimeiro = c.getTime();
			
			Date iniciosegundo = new Date();
			try {
				iniciosegundo = formato.parse(datainiciosegundo);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			while(inicioprimeiro.before(iniciosegundo)) {
				if(Feriados(request.getParameter("ano"), formato.format(inicioprimeiro))==1){
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(inicioprimeiro),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}else {
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(inicioprimeiro),TipoData.ferias, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}
				Calendar c1 = Calendar.getInstance();
				c1.setTime(inicioprimeiro);
			    c1.add(Calendar.DATE, 1);
			    inicioprimeiro = c1.getTime();
			}
			
			Date finalsegundo = new Date();
			try {
				finalsegundo = formato.parse(datafinalsegundo);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			while(iniciosegundo.before(finalsegundo)) {
				if(iniciosegundo.getDay()==0||iniciosegundo.getDay()==6) {
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(iniciosegundo),TipoData.finaldesemana, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}else if(Feriados(request.getParameter("ano"), formato.format(iniciosegundo))==1){
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(iniciosegundo),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}else{
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(iniciosegundo),TipoData.letivo, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);	
				}
				Calendar c1 = Calendar.getInstance();
			    c1.setTime(iniciosegundo);
			    c1.add(Calendar.DATE, 1);
			    iniciosegundo = c1.getTime();		    
			}
			
			if(iniciosegundo.getDay()==0||iniciosegundo.getDay()==6) {
				DiaLetivo diaLetivoaux2 = new DiaLetivo(formato.format(iniciosegundo),TipoData.finaldesemana, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux2);
			} else if(Feriados(request.getParameter("ano"), formato.format(iniciosegundo))==1){
				DiaLetivo diaLetivoaux2 = new DiaLetivo(formato.format(iniciosegundo),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux2);
			}else {
				DiaLetivo diaLetivoaux2 = new DiaLetivo(formato.format(iniciosegundo),TipoData.letivo, Integer.parseInt(request.getParameter("ano")),escola);
				diaLetivoDao.save(diaLetivoaux2);	
			}
			
			Calendar c_aux = Calendar.getInstance();
			c_aux.setTime(finalsegundo);
		    c_aux.add(Calendar.DATE, 1);
		    finalsegundo = c_aux.getTime();
		    
			try {
				int Ano =Integer.parseInt(request.getParameter("ano"))+1;
				Aux = formato.parse(Ano+"-01-01");
			} catch (ParseException e2) {
				e2.printStackTrace();
			}
			
			while(finalsegundo.before(Aux)) {
				if(Feriados(request.getParameter("ano"), formato.format(finalsegundo))==1){
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(finalsegundo),TipoData.feriado, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}else {
					DiaLetivo diaLetivo = new DiaLetivo(formato.format(finalsegundo),TipoData.ferias, Integer.parseInt(request.getParameter("ano")),escola);
					diaLetivoDao.save(diaLetivo);
				}
				Calendar c1 = Calendar.getInstance();
				c1.setTime(finalsegundo);
			    c1.add(Calendar.DATE, 1);
			    finalsegundo = c1.getTime();
			}
		}
		response.sendRedirect("anoletivocon.jsp?");
	   }else {
		   response.sendRedirect("dialetivoErrors.jsp?");  
	   }
	  }else {
		   response.sendRedirect("dialetivoErrors.jsp?");  
	   }
	}
	
	static int Feriados(String ano,String data) {
		List<String>feriados = new ArrayList();
	    feriados.add(ano+"-01-01");
	    feriados.add(ano+"-03-08");
	    feriados.add(ano+"-04-21");
	    feriados.add(ano+"-05-01");
	    feriados.add(ano+"-09-07");
	    feriados.add(ano+"-10-12");
	    feriados.add(ano+"-11-02");
	    feriados.add(ano+"-12-25");
	    if(feriados.contains(data)) {
	       return 1;	
	    }else {
	    return 0;
	    }
	 }
}

