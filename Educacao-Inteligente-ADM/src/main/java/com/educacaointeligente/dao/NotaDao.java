package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.Nota;

public class NotaDao implements Dao<Nota> {
	private EntityManager em;
    
    public NotaDao(){
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
	public Nota get(int id) {	
		return em.find(Nota.class,id);
	}

	@Override
	public List<Nota> getAll() {
		return em.createQuery("From Nota",Nota.class).getResultList();
	}
	
	@Override
	public List<Nota> getAllWhere(int id) {
		
		return em.createQuery("From Nota Where nota_id="+id,Nota.class).getResultList();
	}
	
	@Override
	public void save (Nota objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Nota objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Nota objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Nota> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Nota> getAllNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}
}

