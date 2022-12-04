package com.educacaointeligente.dao;

import java.util.List;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.educacaointeligente.model.DiaLetivo;

public class DiaLetivoDao implements Dao<DiaLetivo> {
	private EntityManager em;
    
    public DiaLetivoDao(){
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
	public DiaLetivo get(int id) {	
		return em.find(DiaLetivo.class,id);
	}

	@Override
	public List<DiaLetivo> getAll() {
		return em.createQuery("From DiaLetivo",DiaLetivo.class).getResultList();
	}
	
	public List<DiaLetivo> getAllWhereEscola(int id) {
		
		return em.createQuery("From DiaLetivo Where escola_idEscola="+id,DiaLetivo.class).getResultList();
	}
	@Override
	public List<DiaLetivo> getAllWhere(int id) {
		
		return em.createQuery("From DiaLetivo Where id="+id,DiaLetivo.class).getResultList();
	}
	
	public List<DiaLetivo> getAllWhereAno(int ano) {
		
		return em.createQuery("From DiaLetivo Where ano="+ano,DiaLetivo.class).getResultList();
	}

	public List<DiaLetivo> getAllWhereAnoEscola(int ano, int escolaid) {
		
		return em.createQuery("From DiaLetivo Where ano="+ano+" and escola_idEscola="+escolaid,DiaLetivo.class).getResultList();
	}

	@Override
	public void save (DiaLetivo objeto) {
		ExecuteInsideTrasaction(em->em.persist(objeto));
	}

	@Override
	public void update(DiaLetivo objeto) {
		ExecuteInsideTrasaction(em->em.merge(objeto));
	}

	@Override
	public void delete(DiaLetivo objeto) {
		ExecuteInsideTrasaction(em->em.remove(objeto));
	}

	@Override
	public List<DiaLetivo> getNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<DiaLetivo> getAllNome(String objeto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DiaLetivo getString(String id) {
		// TODO Auto-generated method stub
		return null;
	}
}

