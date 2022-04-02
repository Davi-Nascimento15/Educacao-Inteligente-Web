package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class ModeloDao implements Dao<Object> {
	private EntityManager em;
    
    public ModeloDao(){
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
	public Object get(int id) {	
		return em.find(Object.class,id);
	}

	@Override
	public List<Object> getAll() {
		return em.createQuery("From 'Classe'",Object.class).getResultList();
	}
	
	@Override
	public List<Object> getAllWhere(String A) {
		
		return em.createQuery("From Objeto Where usuario_id="+A,Object.class).getResultList();
	}
	
	@Override
	public void save (Object objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Object objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Object objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Object> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}


}

