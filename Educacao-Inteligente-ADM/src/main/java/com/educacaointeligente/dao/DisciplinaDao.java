package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.Disciplina;

public class DisciplinaDao implements Dao<Disciplina> {
	private EntityManager em;
    
    public DisciplinaDao(){
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
	public Disciplina get(int id) {	
		return em.find(Disciplina.class,id);
	}

	@Override
	public List<Disciplina> getAll() {
		return em.createQuery("From Disciplina",Disciplina.class).getResultList();
	}
	
	@Override
	public List<Disciplina> getAllWhere(String A) {
		
		return em.createQuery("From Disciplina Where iddisciplina="+A,Disciplina.class).getResultList();
	}
	
	@Override
	public void save (Disciplina objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Disciplina objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Disciplina objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Disciplina> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}
}

