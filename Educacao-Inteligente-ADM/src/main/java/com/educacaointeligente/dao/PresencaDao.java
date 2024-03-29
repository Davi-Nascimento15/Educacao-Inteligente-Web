package com.educacaointeligente.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.Presenca;
import com.educacaointeligente.model.Professor;

public class PresencaDao implements Dao<Presenca> {
	private EntityManager em;
    
    public PresencaDao(){
    	em = JPAUtil.getEntityManagerFactory().createEntityManager();
    }
   
    private void ExecuteInsideTrasaction(Consumer<EntityManager>action) {
        EntityTransaction tx = em.getTransaction();
        try {
        	tx.begin();
        	action.accept(em);
        	tx.commit();
        }catch(RuntimeException e) {
        	tx.rollback();
        	throw e;
        }
    }
    
	@Override
	public Presenca get(int id) {	
		return em.find(Presenca.class,id);
	}

	@Override
	public List<Presenca> getAll() {
		return em.createQuery("From Presenca",Presenca.class).getResultList();
	}
	
	@Override
	public List<Presenca> getAllWhere(int id) {
		
		return em.createQuery("From Presenca Where idPresenca="+id,Presenca.class).getResultList();
	}
	
	public List<Presenca> getAllWhereProfessor(int id) {
		
		return em.createQuery("From Presenca Where professor_idprofessor="+id,Presenca.class).getResultList();
	}
	
	public List<Presenca>getAllWherePresenca(List<Professor>professor) {
        List<Presenca> presenca = new ArrayList<Presenca>();
        for(Professor P:professor) {
        	List<Presenca> aux = new ArrayList<Presenca>();
        	aux= em.createQuery("From Presenca Where professor_idprofessor="+P.getIdprofessor(),Presenca.class).getResultList();
            presenca.addAll(aux);
        }
		return presenca;
	}
	
	@Override
	public void save (Presenca objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Presenca objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Presenca objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Presenca> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Presenca> getAllNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Presenca getString(String id) {
		// TODO Auto-generated method stub
		return null;
	}
}

