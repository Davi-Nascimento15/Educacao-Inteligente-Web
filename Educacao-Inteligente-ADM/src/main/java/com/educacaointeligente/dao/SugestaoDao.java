package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import com.educacaointeligente.model.Sugestao;


public class SugestaoDao implements Dao<Sugestao> {
	private EntityManager em;
	
	public SugestaoDao(){
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
	public Sugestao getString(String id) {
		return em.find(Sugestao.class,id);
	}
		
	@Override
	public List<Sugestao> getAll() {
		return em.createQuery("From Sugestao",Sugestao.class).getResultList();
	}
	
	public List<Sugestao> getAllEscola(int id) {
		return em.createQuery("From Sugestao where escola_idEscola="+id,Sugestao.class).getResultList();
	}
	
	@Override
	public List<Sugestao> getAllWhere(int id) {
		
		return em.createQuery("From Sugestao Where sugestao_id="+id,Sugestao.class).getResultList();
	}
	
	@Override
	public void save (Sugestao objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(Sugestao objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(Sugestao objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<Sugestao> getAllNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sugestao> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Sugestao get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
