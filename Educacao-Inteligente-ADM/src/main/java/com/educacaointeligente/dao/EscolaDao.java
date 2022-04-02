package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.Escola;

public class EscolaDao implements Dao<Escola> {
	private EntityManager em;
    
    public EscolaDao(){
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
	public Escola get(int id) {	
		return em.find(Escola.class,id);
	}

	@Override
	public List<Escola> getAll() {
		return em.createQuery("From Escola",Escola.class).getResultList();
	}
	
	@Override
	public List<Escola> getAllWhere(int id) {
		
		return em.createQuery("From Escola Where idEscola="+id,Escola.class).getResultList();
	}
	
	@Override
	public void save (Escola objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Escola objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Escola objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Escola> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Escola> getAllNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}

}
