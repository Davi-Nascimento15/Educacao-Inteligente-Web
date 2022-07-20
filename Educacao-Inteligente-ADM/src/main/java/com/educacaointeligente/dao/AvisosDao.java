package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.Avisos;

public class AvisosDao implements Dao<Avisos> {
	private EntityManager em;
    
    public AvisosDao(){
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
	public Avisos get(int id) {	
		return em.find(Avisos.class,id);
	}

	@Override
	public List<Avisos> getAll() {
		return em.createQuery("From Avisos",Avisos.class).getResultList();
	}
	
	@Override
	public List<Avisos> getAllWhere(int id) {
		
		return em.createQuery("From Avisos Where idavisos="+id,Avisos.class).getResultList();
	}
	
	@Override
	public void save (Avisos objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Avisos objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Avisos objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Avisos> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Avisos> getAllNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Avisos getString(String id) {
		// TODO Auto-generated method stub
		return null;
	}
}

