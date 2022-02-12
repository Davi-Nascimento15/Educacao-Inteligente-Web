package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.Turma;

public class TurmaDao implements Dao<Turma> {
	private EntityManager em;
    
    public TurmaDao(){
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
	public Turma get(int id) {	
		return em.find(Turma.class,id);
	}

	@Override
	public List<Turma> getAll() {
		return em.createQuery("From Turma",Turma.class).getResultList();
	}
	
	@Override
	public List<Turma> getAllWhere(int id) {
		
		return em.createQuery("From Turma Where idTurma="+id,Turma.class).getResultList();
	}
	
	@Override
	public void save (Turma objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Turma objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Turma objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}
}